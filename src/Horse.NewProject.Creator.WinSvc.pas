unit Horse.NewProject.Creator.WinSvc;

interface

uses Horse.NewProject.Creator, Horse.NewProject.Creator.WinSvc.NewForm.Main, ToolsAPI;

type
  THorseNewProjectCreatorWinSvc = class(THorseNewProjectCreator, IOTACreator,
                                                                 IOTAProjectCreator80,
                                                                 IOTAProjectCreator160,
                                                                 {$IF CompilerVersion >= 32.0}
                                                                 IOTAProjectCreator190,
                                                                 {$ENDIF}
                                                                 IOTAProjectCreator)
  protected
    procedure SetInitialOptions(const ANewProject: IOTAProject); override;
  end;

implementation

{ THorseNewProjectCreatorWinSvc }

procedure THorseNewProjectCreatorWinSvc.SetInitialOptions(const ANewProject: IOTAProject);
begin
  inherited;
  THorseNewProjectWinSvcNewFormMain.New(FPort);
end;

end.
