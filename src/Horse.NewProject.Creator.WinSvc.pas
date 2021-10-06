unit Horse.NewProject.Creator.WinSvc;

interface

uses
  Horse.NewProject.Creator,
  Horse.NewProject.Creator.WinSvc.NewForm.Main,
  ToolsAPI;

type THorseNewProjectCreatorWinSvc = class(THorseNewProjectCreator, IOTACreator,
                                                                    IOTAProjectCreator,
                                                                    IOTAProjectCreator80,
                                                                    IOTAProjectCreator160,
                                                                    IOTAProjectCreator190)
  protected
    procedure SetInitialOptions(const NewProject: IOTAProject); override;
end;

implementation

{ THorseNewProjectCreatorWinSvc }

procedure THorseNewProjectCreatorWinSvc.SetInitialOptions(const NewProject: IOTAProject);
begin
  inherited;
  THorseNewProjectWinSvcNewFormMain.New(FPort);
end;

end.
