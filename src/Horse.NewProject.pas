unit Horse.NewProject;

interface

uses
  ToolsAPI,
  System.Generics.Collections,
  Horse.Boss.Initializer,
  Horse.Middlewares,
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
                            AMiddlewares: TList<IHorseMiddleware>;
                            APort: Integer);

end;

implementation

{ THorseNewProject }

class procedure THorseNewProject.Execute(APlatform: THorsePlatform; AFramework: THorseFramework; AMiddlewares: TList<IHorseMiddleware>; APort: Integer);
var
  creator: IOTACreator;
  project: IOTAProject;
  boss: THorseBossInitializer;
begin
  creator := GetCreator(APlatform, AFramework, APort);
  (BorlandIDEServices as IOTAModuleServices).CreateModule(creator);

  project := GetActiveProject;
  if project.Save(True, True) then
  begin
    boss := THorseBossInitializer.Create(project, AMiddlewares);
    try
      boss.Generate;
      boss.Wait;
    finally
      boss.Free;
    end;
  end;
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
