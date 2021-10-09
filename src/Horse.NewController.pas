unit Horse.NewController;

interface

uses
  ToolsAPI,
  Horse.Wizard.Utils,
  Horse.NewController.Model,
  Horse.NewController.View,
  Horse.NewController.Creator,
  System.Classes,
  System.SysUtils,
  Vcl.Controls;

type THorseNewController = class

  private
    class procedure RegisterController(AController: THorseNewControllerModel; AModule: IOTAModule);

  public
    class procedure CreateController;
end;

implementation

class procedure THorseNewController.CreateController;
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

class procedure THorseNewController.RegisterController(AController: THorseNewControllerModel; AModule: IOTAModule);
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
