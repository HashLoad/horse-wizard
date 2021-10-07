unit Horse.NewProject.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls,
  Horse.Wizard.Types,
  Horse.Middlewares,
  System.Generics.Collections;

type
  THorseViewsNewProject = class(TForm)
    imgHeader: TImage;
    Label1: TLabel;
    edtTarget: TComboBox;
    edtFramework: TComboBox;
    Label2: TLabel;
    Button2: TButton;
    Button1: TButton;
    Label3: TLabel;
    edtPort: TEdit;
    chkJhonson: TCheckBox;
    chkHorseCORS: TCheckBox;
    chkHorseOctetStream: TCheckBox;
    chkHorseJWT: TCheckBox;
    lblMiddlewares: TLabel;
    chkHorseBasicAuth: TCheckBox;
    chkHorseCompression: TCheckBox;
    chkHandleException: TCheckBox;
    chkLogger: TCheckBox;
  private
    { Private declarations }
  public
    function Port: Integer;
    function HorseFramework: THorseFramework;
    function HorsePlatform: THorsePlatform;
    function GetMiddlewares: TList<IHorseMiddleware>;
    { Public declarations }
  end;

var
  HorseViewsNewProject: THorseViewsNewProject;

implementation

{$R *.dfm}

{ THorseViewsNewProject }

function THorseViewsNewProject.GetMiddlewares: TList<IHorseMiddleware>;
begin
  result := TList<IHorseMiddleware>.create;
  try
    if chkJhonson.Checked then
      result.Add(THorseMiddlewareJohnson.New);

    if chkHorseCORS.Checked then
      result.Add(THorseMiddlewareCORS.New);

    if chkHorseOctetStream.Checked then
      result.Add(THorseMiddlewareOctetStream.New);

    if chkHorseJWT.Checked then
      result.Add(THorseMiddlewareJWT.New);

    if chkHorseBasicAuth.Checked then
      result.Add(THorseMiddlewareBasicAuth.New);

    if chkHorseCompression.Checked then
      result.Add(THorseMiddlewareCompression.New);

    if chkHandleException.Checked then
      result.Add(THorseMiddlewareHandleException.New);

    if chkLogger.Checked then
      result.Add(THorseMiddlewareLogger.New);
  except
    result.free;
    raise;
  end;
end;

function THorseViewsNewProject.HorseFramework: THorseFramework;
begin
  result.FromString(edtFramework.Text);
end;

function THorseViewsNewProject.HorsePlatform: THorsePlatform;
begin
  result.FromString(edtTarget.Text);
end;

function THorseViewsNewProject.Port: Integer;
begin
  result := StrToIntDef(edtPort.Text, 9000);
end;

end.
