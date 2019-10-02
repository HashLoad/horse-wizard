unit Horse.Boss.Initializer;

interface

uses
  ToolsAPI, System.Classes;

type
  THorseBossInitializer = class
  private
    FProject: IOTAProject;
    FModules: TStringList;

    function GetDependencies: string;
    procedure RunBossInstall;
  public
    constructor Create(AProject: IOTAProject; AModules: TStringList);
    procedure Generate;
  end;

implementation

uses
  System.SysUtils, System.IOUtils, DosCommand, Horse.Boss.View;
const
  HORSE_MODULE = 'github.com/HashLoad/horse';

  BOSS_COMMAND = 'boss install';
  BOSS_MODULE_DEFAULT = '"%s": ">0.0.0"';
  BOSS_NAME = 'boss.json';
  BOSS_BASE = '{' + sLineBreak +
              '  "name": "%s",' + sLineBreak +
              '  "description": "",' + sLineBreak +
              '  "version": "1.0.0",' + sLineBreak +
              '  "homepage": "",' + sLineBreak +
              '  "mainsrc": "./",' + sLineBreak +
              '  "projects": [],' + sLineBreak +
              '  "dependencies": {' + sLineBreak +
              '    %s' +
              '  }' +
              '}';


{ THorseBossInitializer }

constructor THorseBossInitializer.Create(AProject: IOTAProject; AModules: TStringList);
begin
  FProject := AProject;
  FModules := AModules;
end;

procedure THorseBossInitializer.Generate;
var
  LContent: string;
  LName: string;
  LFile: TStringList;
begin
  LName := ExtractFileName(TPath.GetFileNameWithoutExtension(FProject.FileName));
  LContent := Format(BOSS_BASE, [LName, GetDependencies]);

  LFile := TStringList.Create();
  try
    LFile.Text := LContent;
    LFile.SaveToFile(TPath.Combine(ExtractFilePath(FProject.FileName), BOSS_NAME));
  finally
    LFile.DisposeOf;
  end;

  RunBossInstall;
end;

function THorseBossInitializer.GetDependencies: string;
var
  LList: string;
  LModules: string;
begin
  LList := EmptyStr;

  for LModules in FModules do
  begin
    LList := LList + Format(BOSS_MODULE_DEFAULT, [LModules]) + ',' + sLineBreak;
  end;

  LList := LList + Format(BOSS_MODULE_DEFAULT, [HORSE_MODULE]);

  Result := LList;
end;

procedure THorseBossInitializer.RunBossInstall;
var
  LDosCommand: TDosCommand;
  LBossView: TFormBossView;
begin
  LDosCommand := TDosCommand.Create(nil);
  LBossView := TFormBossView.Create(nil);
  LDosCommand.OnNewLine := procedure(ASender: TObject; const ANewLine: string; AOutputType: TOutputType)
    begin
      LBossView.AppendText(ANewLine);
    end;

  LDosCommand.OnTerminated := procedure(ASender: TObject)
    begin
      LDosCommand.Free;
      TThread.Queue(nil,
      procedure
      begin
        LBossView.Close;
        LBossView.Free;
      end);
    end;

  LDosCommand.InputToOutput := False;
  LDosCommand.CurrentDir := ExtractFilePath(FProject.FileName);
  LDosCommand.CommandLine := BOSS_COMMAND;
  LDosCommand.Execute;
  LBossView.Show;
end;

end.
