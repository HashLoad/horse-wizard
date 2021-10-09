unit Horse.NewController.Wizard;

interface

uses
  Horse.NewController.Model,
  Horse.NewController.View,
  Horse.NewController.Creator,
  Horse.Wizard.Utils,
  System.SysUtils,
  System.Classes,
  ToolsAPI,
  Winapi.Windows,
  Vcl.Dialogs,
  Vcl.Controls;

type THorseNewControllerWizard = class(TNotifierObject, IOTAWizard,
                                                        IOTAProjectWizard,
                                                        IOTARepositoryWizard)

  private
    procedure RegisterController(AController: THorseNewControllerModel; AModule: IOTAModule);

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
  module: IOTAModule;
begin
  form := THorseViewsNewController.Create(nil);
  try
    form.ShowModal;
    if form.ModalResult = mrOK then
    begin
      controller := form.GetController;
      try
        creator := THorseNewControllerCreator.New(controller);
        module := (BorlandIDEServices as IOTAModuleServices).CreateModule(creator);
        RegisterController(controller, module);
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

procedure THorseNewControllerWizard.RegisterController(AController: THorseNewControllerModel; AModule: IOTAModule);
var
  editorList: TStringList;
  i: Integer;
  listenPosition: Integer;
  editView: IOTAEditView;
begin
  GetActiveProject.ShowFilename(GetActiveProject.FileName);

  editorList := EditorAsStringList;
  try
    editView := (BorlandIDEServices as IOTAEditorServices).TopView;
    for i := 0 to Pred(editorList.Count) do
    begin
      if editorList[i].Trim.ToLower.StartsWith('thorse.listen') then
      begin
        listenPosition := i;
        Break;
      end;
    end;

    if listenPosition > 0 then
    begin
      editView.Buffer.EditPosition.GotoLine(listenPosition + 1);
      editView.Buffer.EditPosition.Tab(1);
      editView.Buffer.EditPosition
        .InsertText(AController.controllerName + 'Registry;' + Chr(13));
    end;

    AModule.Show;
  finally
    editorList.Free;
  end;
end;

end.
