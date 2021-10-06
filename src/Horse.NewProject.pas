unit Horse.NewProject;

interface

uses
  ToolsAPI,
  Horse.Wizard.Types,
  Horse.NewProject.Creator,
  Horse.NewProject.Creator.Vcl,
  Horse.NewProject.Creator.WinSvc;

type THorseNewProject = class

  private
    class function GetCreator(APlatform: THorsePlatform; AFramework: THorseFramework; APort: Integer): IOTACreator;

  public
    class procedure Execute(APlatform: THorsePlatform;
                            AFramework: THorseFramework;
                            APort: Integer);

end;

implementation

{ THorseNewProject }

class procedure THorseNewProject.Execute(APlatform: THorsePlatform; AFramework: THorseFramework; APort: Integer);
var
  creator: IOTACreator;
begin
  creator := GetCreator(APlatform, AFramework, APort);
  (BorlandIDEServices as IOTAModuleServices).CreateModule(creator);
end;

class function THorseNewProject.GetCreator(APlatform: THorsePlatform; AFramework: THorseFramework; APort: Integer): IOTACreator;
begin
  if AFramework = hfVcl then
    result := THorseNewProjectCreatorVcl.New(APlatform, AFramework, APort)
  else
  if AFramework = hfWinSvc then
    result := THorseNewProjectCreatorWinSvc.New(APlatform, AFramework, APort)
  else
    result := THorseNewProjectCreator.New(APlatform, AFramework, APort);
end;

end.
