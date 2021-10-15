unit Horse.NewProject.Wizard;

interface

uses Horse.NewProject, Horse.NewProject.View, Horse.Middlewares, System.Generics.Collections, ToolsAPI, Winapi.Windows,
  Vcl.Controls;

type
  THorseNewProjectWizard = class(TNotifierObject, IOTAWizard, IOTAProjectWizard, IOTARepositoryWizard)
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
  LForm: THorseViewsNewProject;
  LMiddlewares: TList<IHorseMiddleware>;
begin
  LForm := THorseViewsNewProject.Create(nil);
  try
    LForm.ShowModal;
    if LForm.ModalResult = mrOK then
    begin
      LMiddlewares := LForm.GetMiddlewares;
      try
        THorseNewProject.UseBoss(LForm.UseBoss);
        THorseNewProject.Port(LForm.Port);
        THorseNewProject.Framework(LForm.HorseFramework);
        THorseNewProject.&Platform(LForm.HorsePlatform);
        THorseNewProject.Middlewares(LMiddlewares);
        THorseNewProject.Execute;
      finally
        LMiddlewares.Free;
      end;
    end;
  finally
    LForm.Free;
  end;
end;

function THorseNewProjectWizard.GetAuthor: string;
begin
  Result := 'Horse - https://github.com/HashLoad/horse';
end;

function THorseNewProjectWizard.GetComment: string;
begin
  Result := 'Create a new Horse Project';
end;

function THorseNewProjectWizard.GetGlyph: Cardinal;
begin
  Result := LoadIcon(HInstance, 'HashloadIcon');
end;

function THorseNewProjectWizard.GetIDString: string;
begin
  Result := Self.ClassName;
end;

function THorseNewProjectWizard.GetName: string;
begin
  Result := 'Horse Project';
end;

function THorseNewProjectWizard.GetPage: string;
begin
  Result := 'Horse';
end;

function THorseNewProjectWizard.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

class function THorseNewProjectWizard.New: IOTAWizard;
begin
  Result := Self.Create;
end;

end.
