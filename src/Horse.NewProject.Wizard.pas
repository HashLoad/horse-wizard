unit Horse.NewProject.Wizard;

interface

uses
  Horse.NewProject,
  Horse.NewProject.View,
  Horse.Middlewares,
  System.Generics.Collections,
  ToolsAPI,
  Winapi.Windows,
  Vcl.Controls;

type THorseNewProjectWizard = class(TNotifierObject, IOTAWizard,
                                                     IOTAProjectWizard,
                                                     IOTARepositoryWizard)

  protected
    // IOTAWizard
    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;
    procedure Execute;

    // IOTARepositoryWizard
    function GetAuthor: string;
    function GetComment: string;
    function GetPage: string;
    function GetGlyph: Cardinal;

  public
    class function New: IOTAWizard;
end;

implementation

{ THorseNewProjectWizard }

procedure THorseNewProjectWizard.Execute;
var
  form: THorseViewsNewProject;
  middlewares: TList<IHorseMiddleware>;
begin
  form := THorseViewsNewProject.Create(nil);
  try
    form.ShowModal;
    if form.ModalResult = mrOK then
    begin
      middlewares := form.GetMiddlewares;
      try
        THorseNewProject.Execute(form.HorsePlatform,
                                 form.HorseFramework,
                                 middlewares,
                                 form.Port);
      finally
        middlewares.Free;
      end;
    end;
  finally
    form.Free;
  end;
end;

function THorseNewProjectWizard.GetAuthor: string;
begin
  result := 'Horse - https://github.com/HashLoad/horse';
end;

function THorseNewProjectWizard.GetComment: string;
begin
  result := 'Create a new Horse Project';
end;

function THorseNewProjectWizard.GetGlyph: Cardinal;
begin
  result := LoadIcon(HInstance, 'HashloadIcon');
end;

function THorseNewProjectWizard.GetIDString: string;
begin
  result := Self.ClassName;
end;

function THorseNewProjectWizard.GetName: string;
begin
  result := 'Horse Project';
end;

function THorseNewProjectWizard.GetPage: string;
begin
  result := 'Horse';
end;

function THorseNewProjectWizard.GetState: TWizardState;
begin
  result := [wsEnabled];
end;

class function THorseNewProjectWizard.New: IOTAWizard;
begin
  result := Self.Create;
end;

end.
