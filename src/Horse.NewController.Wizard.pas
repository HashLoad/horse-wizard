unit Horse.NewController.Wizard;

interface

uses
  Horse.NewController.Model,
  Horse.NewController.View,
  Horse.NewController.Creator,
  ToolsAPI,
  Winapi.Windows,
  Vcl.Controls;

type THorseNewControllerWizard = class(TNotifierObject, IOTAWizard,
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

{ THorseNewControllerWizard }

procedure THorseNewControllerWizard.Execute;
var
  form: THorseViewsNewController;
  controller: THorseNewControllerModel;
  creator: IOTACreator;
begin
  form := THorseViewsNewController.Create(nil);
  try
    form.ShowModal;
    if form.ModalResult = mrOK then
    begin
      controller := form.GetController;
      try
        creator := THorseNewControllerCreator.New(controller);
        (BorlandIDEServices as IOTAModuleServices).CreateModule(creator);
      finally
        controller.Free;
      end;
    end;
  finally
    form.Free;
  end;
end;

function THorseNewControllerWizard.GetAuthor: string;
begin
  result := 'Horse - https://github.com/HashLoad/horse';
end;

function THorseNewControllerWizard.GetComment: string;
begin
  result := 'Create a new Horse Controller';
end;

function THorseNewControllerWizard.GetGlyph: Cardinal;
begin
  result := LoadIcon(HInstance, 'HashloadIcon');
end;

function THorseNewControllerWizard.GetIDString: string;
begin
  result := Self.ClassName;
end;

function THorseNewControllerWizard.GetName: string;
begin
  result := 'Horse Controller';
end;

function THorseNewControllerWizard.GetPage: string;
begin
  result := 'Horse';
end;

function THorseNewControllerWizard.GetState: TWizardState;
begin
  result := [wsEnabled];
end;

class function THorseNewControllerWizard.New: IOTAWizard;
begin
  result := Self.Create;
end;

end.
