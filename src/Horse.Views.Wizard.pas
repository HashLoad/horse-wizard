unit Horse.Views.Wizard;

interface

uses WinAPI.Windows, WinAPI.Messages, WinAPI.ShellAPI, System.SysUtils, System.Variants, System.Classes, VCL.Graphics,
  VCL.Controls, VCL.Forms, VCL.Dialogs, VCL.StdCtrls, VCL.Imaging.pngimage, VCL.ExtCtrls;

type
  TFrmNewProject = class(TForm)
    pnlContent: TPanel;
    chkAddToProjectGroup: TCheckBox;
    imgHeader: TImage;
    Image1: TImage;
    lblMiddlewares: TLabel;
    chkJhonson: TCheckBox;
    chkHorseCORS: TCheckBox;
    chkHorseOctetStream: TCheckBox;
    chkHorseJWT: TCheckBox;
    chkHorseBasicAuth: TCheckBox;
    chkHorseCompression: TCheckBox;
    chkHandleException: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    chkLogger: TCheckBox;
  private
    function GetAddToProjectGroup: Boolean;
    function GetMiddlewareList: TStringList;
  public
    property AddToProjectGroup: Boolean read GetAddToProjectGroup;
    property MiddlewareList: TStringList read GetMiddlewareList;
  end;

implementation

{$R *.dfm}

function TFrmNewProject.GetAddToProjectGroup: Boolean;
begin
  Result := chkAddToProjectGroup.Checked;
end;

function TFrmNewProject.GetMiddlewareList: TStringList;
var
  LList: TStringList;
begin
  LList := TStringList.Create;

  if chkJhonson.Checked then
    LList.Add('github.com/HashLoad/jhonson');

  if chkHorseCORS.Checked then
    LList.Add('github.com/HashLoad/horse-cors');

  if chkHorseOctetStream.Checked then
    LList.Add('github.com/HashLoad/horse-octet-stream');

  if chkHorseJWT.Checked then
    LList.Add('github.com/HashLoad/horse-jwt');

  if chkHorseBasicAuth.Checked then
    LList.Add('github.com/HashLoad/horse-basic-auth');

  if chkHorseCompression.Checked then
    LList.Add('github.com/HashLoad/horse-compression');

  if chkHandleException.Checked then
    LList.Add('github.com/HashLoad/handle-exception');

  if chkLogger.Checked then
    LList.Add('github.com/HashLoad/horse-logger');

  Result := LList;
end;

end.
