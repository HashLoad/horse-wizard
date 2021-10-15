unit Horse.NewProject.Creator.Apache;

interface

uses
  Horse.NewProject.Creator,
  Horse.Wizard.Types,
  System.SysUtils,
  DCCStrs,
  ToolsAPI;

type THorseNewProjectCreatorApache = class(THorseNewProjectCreator, IOTACreator,
                                                                    IOTAProjectCreator,
                                                                    IOTAProjectCreator80,
                                                                    IOTAProjectCreator160,
                                                                    IOTAProjectCreator190)
  protected
    procedure SetInitialOptions(const NewProject: IOTAProject); override;
end;

implementation

{ THorseNewProjectCreatorApache }

procedure THorseNewProjectCreatorApache.SetInitialOptions(const NewProject: IOTAProject);
var
  build: IOTABuildConfiguration;
begin
  inherited;
  if FPlatform = hpLinux64 then
  begin
    build := (NewProject.ProjectOptions as IOTAProjectOptionsConfigurations).BaseConfiguration;
    build.SetValue(sAllowUndefined, 'true');
  end;
end;

end.
