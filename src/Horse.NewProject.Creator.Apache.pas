unit Horse.NewProject.Creator.Apache;

interface

uses Horse.NewProject.Creator, Horse.Wizard.Types, System.SysUtils, DCCStrs, ToolsAPI;

type
  THorseNewProjectCreatorApache = class(THorseNewProjectCreator, IOTACreator, IOTAProjectCreator, IOTAProjectCreator80,
    IOTAProjectCreator160, IOTAProjectCreator190)
  protected
    procedure SetInitialOptions(const ANewProject: IOTAProject); override;
  end;

implementation

{ THorseNewProjectCreatorApache }

procedure THorseNewProjectCreatorApache.SetInitialOptions(const ANewProject: IOTAProject);
var
  LBuild: IOTABuildConfiguration;
begin
  inherited;
  if FPlatform = hpLinux64 then
  begin
    LBuild := (ANewProject.ProjectOptions as IOTAProjectOptionsConfigurations).BaseConfiguration;
    LBuild.SetValue(sAllowUndefined, 'true');
  end;
end;

end.
