unit Horse.NewProject.Creator;

interface

uses DCCStrs, Horse.Wizard.Types, Horse.CodeGen.SourceFile, ToolsAPI, System.SysUtils;

type
  THorseNewProjectCreator = class(TNotifierObject, IOTACreator,
                                                   IOTAProjectCreator80,
                                                   IOTAProjectCreator160,
                                                   {$IF CompilerVersion >= 32.0}
                                                   IOTAProjectCreator190,
                                                   {$ENDIF}
                                                   IOTAProjectCreator)
  protected
    FPlatform: THorsePlatform;
    FFramework: THorseFramework;
    FPort: Integer;

    // IOTACreator
    function GetCreatorType: string;
    function GetExisting: Boolean;
    function GetFileSystem: string;
    function GetOwner: IOTAModule;
    function GetUnnamed: Boolean;

    // IOTAProjectCreator
    function GetFileName: string;
    function GetOptionFileName: string;
    function GetShowSource: Boolean;
    procedure NewDefaultModule;
    function NewOptionSource(const AProjectName: string): IOTAFile;
    procedure NewProjectResource(const AProject: IOTAProject);
    procedure NewDefaultProjectModule(const AProject: IOTAProject);

    { Create and return the Project source file }
    function NewProjectSource(const AProjectName: string): IOTAFile;

    function GetProjectPersonality: string;
    function GetFrameworkType: string;
    function GetPlatforms: TArray<string>;
    function GetSupportedPlatforms: TArray<string>;
    function GetPreferredPlatform: string;
    procedure SetInitialOptions(const ANewProject: IOTAProject); virtual;
  public
    constructor Create(const APlatform: THorsePlatform; const AFramework: THorseFramework; const APort: Integer);
    class function New(const APlatform: THorsePlatform; const AFramework: THorseFramework; const APort: Integer): IOTACreator;
  end;

implementation

{ THorseNewProjectCreator }

constructor THorseNewProjectCreator.Create(const APlatform: THorsePlatform; const AFramework: THorseFramework; const APort: Integer);
begin
  FPlatform := APlatform;
  FFramework := AFramework;
  FPort := APort;
end;

function THorseNewProjectCreator.GetCreatorType: string;
begin
  Result := FFramework.ProjectType;
end;

function THorseNewProjectCreator.GetExisting: Boolean;
begin
  Result := False;
end;

function THorseNewProjectCreator.GetFileName: string;
begin
  Result := EmptyStr;
end;

function THorseNewProjectCreator.GetFileSystem: string;
begin
  Result := EmptyStr;
end;

function THorseNewProjectCreator.GetFrameworkType: string;
begin
  Result := FFramework.ToString;
end;

function THorseNewProjectCreator.GetOptionFileName: string;
begin
  Result := EmptyStr;
end;

function THorseNewProjectCreator.GetOwner: IOTAModule;
begin
  Result := (BorlandIDEServices as IOTAModuleServices).MainProjectGroup;
end;

function THorseNewProjectCreator.GetPlatforms: TArray<string>;
begin
  Result := [GetPreferredPlatform];
end;

function THorseNewProjectCreator.GetPreferredPlatform: string;
begin
  Result := FPlatform.ToString;
end;

function THorseNewProjectCreator.GetProjectPersonality: string;
begin
  Result := sDelphiPersonality;
end;

function THorseNewProjectCreator.GetShowSource: Boolean;
begin
  Result := True;
end;

function THorseNewProjectCreator.GetSupportedPlatforms: TArray<string>;
begin
  Result := [GetPreferredPlatform];
end;

function THorseNewProjectCreator.GetUnnamed: Boolean;
begin
  Result := True;
end;

class function THorseNewProjectCreator.New(const APlatform: THorsePlatform; const AFramework: THorseFramework; const APort: Integer): IOTACreator;
begin
  Result := Self.create(APlatform, AFramework, APort);
end;

procedure THorseNewProjectCreator.NewDefaultModule;
begin

end;

procedure THorseNewProjectCreator.NewDefaultProjectModule(const AProject: IOTAProject);
begin

end;

function THorseNewProjectCreator.NewOptionSource(const AProjectName: string): IOTAFile;
begin
  Result := nil;
end;

procedure THorseNewProjectCreator.NewProjectResource(const AProject: IOTAProject);
begin

end;

function THorseNewProjectCreator.NewProjectSource(const AProjectName: string): IOTAFile;
begin
  Result := TSourceFile.Create(FFramework.DprContent, [AProjectName, FPort.ToString]);
end;

procedure THorseNewProjectCreator.SetInitialOptions(const ANewProject: IOTAProject);
var
  LBuild: IOTABuildConfiguration;
begin
  LBuild := (ANewProject.ProjectOptions as IOTAProjectOptionsConfigurations).BaseConfiguration;
  LBuild.SetValue(sDefine, FFramework.Define);
end;

end.
