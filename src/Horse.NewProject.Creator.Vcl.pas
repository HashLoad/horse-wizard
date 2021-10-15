unit Horse.NewProject.Creator.Vcl;

interface

uses
  Horse.NewProject.Creator,
  Horse.NewProject.Creator.Vcl.NewForm.Main,
  ToolsAPI;

type THorseNewProjectCreatorVcl = class(THorseNewProjectCreator, IOTACreator,
                                                                 IOTAProjectCreator,
                                                                 IOTAProjectCreator80,
                                                                 IOTAProjectCreator160,
                                                                 IOTAProjectCreator190)
  protected
    procedure SetInitialOptions(const NewProject: IOTAProject); override;
end;

implementation

{ THorseNewProjectCreatorVcl }

procedure THorseNewProjectCreatorVcl.SetInitialOptions(const NewProject: IOTAProject);
begin
  inherited;
  THorseNewProjectVclNewFormMain.New(FPort);
end;

end.
