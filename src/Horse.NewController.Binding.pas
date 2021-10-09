unit Horse.NewController.Binding;

interface

uses
  ToolsAPI,
  Horse.NewController,
  System.SysUtils,
  System.Classes,
  Vcl.Dialogs,
  Vcl.Menus;

type THorseNewControllerBinding = class(TNotifierObject, IOTAKeyboardBinding)

  private
    procedure Execute(const Context: IOTAKeyContext; KeyCode: TShortcut; var BindingResult: TKeyBindingResult);

  protected
    function GetBindingType : TBindingType;
    function GetDisplayName : string;
    function GetName        : string;
    procedure BindKeyboard(const BindingServices: IOTAKeyBindingServices);

  public
    class function New: IOTAKeyboardBinding;
end;

var
  IndexNewControllerBinding : Integer = -1;

procedure RegisterNewControllerBinding;

implementation

procedure RegisterNewControllerBinding;
begin
  IndexNewControllerBinding := (BorlandIDEServices as IOTAKeyboardServices)
    .AddKeyboardBinding(THorseNewControllerBinding.New);
end;

{ THorseNewControllerBinding }

procedure THorseNewControllerBinding.BindKeyboard(const BindingServices: IOTAKeyBindingServices);
begin
  BindingServices.AddKeyBinding([TextToShortCut('Ctrl+Shift+H')], Execute, nil);
end;

procedure THorseNewControllerBinding.Execute(const Context: IOTAKeyContext; KeyCode: TShortcut; var BindingResult: TKeyBindingResult);
begin
  BindingResult := krHandled;

  THorseNewController.CreateController;
end;

function THorseNewControllerBinding.GetBindingType: TBindingType;
begin
  result := btPartial;
end;

function THorseNewControllerBinding.GetDisplayName: string;
begin
  result := Self.ClassName;
end;

function THorseNewControllerBinding.GetName: string;
begin
  result := Self.ClassName;
end;

class function THorseNewControllerBinding.New: IOTAKeyboardBinding;
begin
  result := Self.Create;
end;

initialization

finalization
  (BorlandIDEServices as IOTAKeyboardServices)
    .RemoveKeyboardBinding(IndexNewControllerBinding);

end.
