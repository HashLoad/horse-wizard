unit Horse.Boss.Initializer;

interface

uses ToolsAPI, Horse.Middlewares, System.Generics.Collections, System.Classes,
  Horse.Views.Boss, DosCommand;

type
  THorseBossInitializer = class
  private
    FProject: IOTAProject;
    FModules: TList<IHorseMiddleware>;
    FLocked: Boolean;
    LBossView  : TFrmBoss;
    LDosCommand: TDosCommand;

    function GetDependencies: string;
    procedure RunBossInstall;
    procedure ReloadProject;
    procedure OnNewLineEvent(ASender: TObject; const ANewLine: string;
      AOutputType: TOutputType);
    procedure OnTerminatedEvent(ASender: TObject);
  public
    constructor Create(const AProject: IOTAProject; const AModules: TList<IHorseMiddleware>);
    procedure Generate;
    procedure Wait;
  end;

implementation

uses System.SysUtils, System.IOUtils, Vcl.Forms;

const
  HORSE_MODULE = 'github.com/HashLoad/horse';
  BOSS_COMMAND = 'boss install';
  BOSS_MODULE_DEFAULT = '"%s": ">0.0.0"';
  BOSS_NAME = 'boss.json';
  BOSS_BASE =
    '{' + sLineBreak +
    '  "name": "%s",' + sLineBreak +
    '  "description": "",' + sLineBreak +
    '  "version": "1.0.0",' + sLineBreak +
    '  "homepage": "",' + sLineBreak +
    '  "mainsrc": "./",' + sLineBreak +
    '  "projects": [],' + sLineBreak +
    '  "dependencies": {' + sLineBreak +
    '    %s' + sLineBreak +
    '  }' + sLineBreak +
    '}';

{ THorseBossInitializer }

constructor THorseBossInitializer.Create(const AProject: IOTAProject; const AModules: TList<IHorseMiddleware>);
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
  FLocked := True;
  LName := ExtractFileName(TPath.GetFileNameWithoutExtension(FProject.FileName));
  LContent := Format(BOSS_BASE, [LName, GetDependencies]);

  LFile := TStringList.Create();
  try
    LFile.Text := LContent;
    LFile.SaveToFile(TPath.Combine(ExtractFilePath(FProject.FileName), BOSS_NAME));
  finally
    LFile.Free;
  end;

  RunBossInstall;
end;

function THorseBossInitializer.GetDependencies: string;
var
  LList: string;
  I: Integer;
begin
  LList := EmptyStr;

  for I := 0 to Pred(FModules.Count) do
    LList := LList + Format(BOSS_MODULE_DEFAULT, [FModules[I].Url]) + ',' + sLineBreak;

  LList := LList + Format(BOSS_MODULE_DEFAULT, [HORSE_MODULE]);
  Result := LList;
end;

procedure THorseBossInitializer.ReloadProject;
begin
  FProject.Refresh(False);
end;

procedure THorseBossInitializer.OnNewLineEvent(ASender: TObject; const ANewLine: string; AOutputType: TOutputType);
begin
  LBossView.AppendText(ANewLine);
end;

procedure THorseBossInitializer.OnTerminatedEvent(ASender: TObject);
begin
  LDosCommand.Free;

  TThread.Queue(nil,
    procedure
    begin
      LBossView.Close;
      LBossView.Free;
    end);
  ReloadProject;
  FLocked := False;
end;

procedure THorseBossInitializer.RunBossInstall;
begin
  LDosCommand := TDosCommand.Create(nil);
  LBossView   := TFrmBoss.Create(nil);

  LDosCommand.OnNewLine    := OnNewLineEvent;
  LDosCommand.OnTerminated := OnTerminatedEvent;

  LDosCommand.InputToOutput := False;
  LDosCommand.CurrentDir    := ExtractFilePath(FProject.FileName);
  LDosCommand.CommandLine   := BOSS_COMMAND;
  LDosCommand.Execute;
  LBossView.Show;
end;

procedure THorseBossInitializer.Wait;
begin
  while FLocked do
    Application.ProcessMessages;
end;

end.
