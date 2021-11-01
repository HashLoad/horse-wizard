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

        LModule.FileName := Format('%sControllers.%s.pas',
                                [ExtractFilePath(GetActiveProject.FileName),
                                 LController.ControllerName]);

        if LModule.Save(True, True) then
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
  LUnitName: String;
begin
  LListenPosition := 0;
  GetActiveProject.ShowFilename(GetActiveProject.FileName);
  LUnitName := ChangeFileExt(ExtractFileName(AModule.FileName), EmptyStr);

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
      LEditView.Buffer.EditPosition.InsertText(LUnitName + '.Registry;' + Chr(13));
    end;

    AModule.Show;
  finally
    LEditorList.Free;
  end;
end;

end.
