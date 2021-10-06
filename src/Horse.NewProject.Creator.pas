unit Horse.NewProject.Creator;

interface

uses
  DCCStrs,
  Horse.Wizard.Types,
  Horse.CodeGen.SourceFile,
  ToolsAPI,
  System.SysUtils;

type THorseNewProjectCreator = class(TNotifierObject, IOTACreator,
                                                      IOTAProjectCreator,
                                                      IOTAProjectCreator80,
                                                      IOTAProjectCreator160,
                                                      IOTAProjectCreator190)

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
    function NewOptionSource(const ProjectName: string): IOTAFile;
    procedure NewProjectResource(const Project: IOTAProject);
    procedure NewDefaultProjectModule(const Project: IOTAProject);
    { Create and return the Project source file }
    function NewProjectSource(const ProjectName: string): IOTAFile;

    function GetProjectPersonality: string;

    function GetFrameworkType: string;
    function GetPlatforms: TArray<string>;
    function GetSupportedPlatforms: TArray<string>;
    function GetPreferredPlatform: string;

    procedure SetInitialOptions(const NewProject: IOTAProject); virtual;

  public
    constructor create(APlatform: THorsePlatform; AFramework: THorseFramework; APort: Integer);
    class function New(APlatform: THorsePlatform; AFramework: THorseFramework; APort: Integer): IOTACreator;

end;

implementation

{ THorseNewProjectCreator }

constructor THorseNewProjectCreator.create(APlatform: THorsePlatform; AFramework: THorseFramework; APort: Integer);
begin
  FPlatform := APlatform;
  FFramework := AFramework;
  FPort := APort;
end;

function THorseNewProjectCreator.GetCreatorType: string;
begin
  result := FFramework.ProjectType;
end;

function THorseNewProjectCreator.GetExisting: Boolean;
begin
  Result := False;
end;

function THorseNewProjectCreator.GetFileName: string;
begin
  result := EmptyStr;
end;

function THorseNewProjectCreator.GetFileSystem: string;
begin
  result := EmptyStr;
end;

function THorseNewProjectCreator.GetFrameworkType: string;
begin
  result := FFramework.toString;
end;

function THorseNewProjectCreator.GetOptionFileName: string;
begin
  result := EmptyStr;
end;

function THorseNewProjectCreator.GetOwner: IOTAModule;
begin
  result := (BorlandIDEServices as IOTAModuleServices).MainProjectGroup;
end;

function THorseNewProjectCreator.GetPlatforms: TArray<string>;
begin
  result := [GetPreferredPlatform];
end;

function THorseNewProjectCreator.GetPreferredPlatform: string;
begin
  Result := FPlatform.toString;
end;

function THorseNewProjectCreator.GetProjectPersonality: string;
begin
  result := sDelphiPersonality;
end;

function THorseNewProjectCreator.GetShowSource: Boolean;
begin
  result := True;
end;

function THorseNewProjectCreator.GetSupportedPlatforms: TArray<string>;
begin
  Result := [GetPreferredPlatform];
end;

function THorseNewProjectCreator.GetUnnamed: Boolean;
begin
  result := True;
end;

class function THorseNewProjectCreator.New(APlatform: THorsePlatform; AFramework: THorseFramework; APort: Integer): IOTACreator;
begin
  result := Self.create(APlatform, AFramework, APort);
end;

procedure THorseNewProjectCreator.NewDefaultModule;
begin
end;

procedure THorseNewProjectCreator.NewDefaultProjectModule(const Project: IOTAProject);
begin
end;

function THorseNewProjectCreator.NewOptionSource(const ProjectName: string): IOTAFile;
begin
  result := nil;
end;

procedure THorseNewProjectCreator.NewProjectResource(const Project: IOTAProject);
begin
end;

function THorseNewProjectCreator.NewProjectSource(const ProjectName: string): IOTAFile;
begin
  result := TSourceFile.Create(FFramework.DprContent, [ProjectName, FPort.ToString]);
end;

procedure THorseNewProjectCreator.SetInitialOptions(const NewProject: IOTAProject);
var
  build: IOTABuildConfiguration;
begin
  build := (NewProject.ProjectOptions as IOTAProjectOptionsConfigurations).BaseConfiguration;
  build.SetValue(sDefine, FFramework.Define);
end;

end.
