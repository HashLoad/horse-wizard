unit Horse.NewController;

interface

uses ToolsAPI, Horse.Wizard.Utils, Horse.NewController.Model, Horse.NewController.View, Horse.NewController.Creator,
  System.Classes, System.SysUtils, Vcl.Controls;

type
  THorseNewController = class
  private
    class procedure RegisterController(const AController: THorseNewControllerModel; const AModule: IOTAModule);
  public
    class procedure CreateController;
  end;

implementation

class procedure THorseNewController.CreateController;
var
  LForm: THorseViewsNewController;
  LController: THorseNewControllerModel;
  LCreator: IOTACreator;
  LModule: IOTAModule;
begin
  LForm := THorseViewsNewController.Create(nil);
  try
    LForm.ShowModal;
    if LForm.ModalResult = mrOK then
    begin
      LController := LForm.GetController;
      try
        LCreator := THorseNewControllerCreator.New(LController);
        LModule := (BorlandIDEServices as IOTAModuleServices).CreateModule(LCreator);
        RegisterController(LController, LModule);
      finally
        LController.Free;
      end;
    end;
  finally
    LForm.Free;
  end;
end;

class procedure THorseNewController.RegisterController(const AController: THorseNewControllerModel; const AModule: IOTAModule);
var
  LEditorList: TStringList;
  I: Integer;
  LListenPosition: Integer;
  LEditView: IOTAEditView;
begin
  LListenPosition := 0;
  GetActiveProject.ShowFilename(GetActiveProject.FileName);

  LEditorList := EditorAsStringList;
  try
    LEditView := (BorlandIDEServices as IOTAEditorServices).TopView;
    for I := 0 to Pred(LEditorList.Count) do
    begin
      if LEditorList[I].Trim.ToLower.StartsWith('thorse.listen') then
      begin
        LListenPosition := I;
        Break;
      end;
    end;

    if LListenPosition > 0 then
    begin
      LEditView.Buffer.EditPosition.GotoLine(LListenPosition + 1);
      LEditView.Buffer.EditPosition.Tab(1);
      LEditView.Buffer.EditPosition.InsertText(AController.ControllerName + 'Registry;' + Chr(13));
    end;

    AModule.Show;
  finally
    LEditorList.Free;
  end;
end;

end.
