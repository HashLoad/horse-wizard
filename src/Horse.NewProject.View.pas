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
    chkUseBoss: TCheckBox;
    procedure edtTargetChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure SetFrameworks;

  public
    function Port: Integer;
    function HorseFramework: THorseFramework;
    function HorsePlatform: THorsePlatform;
    function GetMiddlewares: TList<IHorseMiddleware>;
    function UseBoss: Boolean;
    { Public declarations }
  end;

var
  HorseViewsNewProject: THorseViewsNewProject;

implementation

{$R *.dfm}

{ THorseViewsNewProject }

procedure THorseViewsNewProject.edtTargetChange(Sender: TObject);
begin
  SetFrameworks;
end;

procedure THorseViewsNewProject.FormCreate(Sender: TObject);
begin
  SetFrameworks;
end;

function THorseViewsNewProject.GetMiddlewares: TList<IHorseMiddleware>;
begin
  result := TList<IHorseMiddleware>.create;
  try
    if chkHorseCORS.Checked then
      result.Add(THorseMiddlewareCORS.New);

    if chkHorseCompression.Checked then
      result.Add(THorseMiddlewareCompression.New);

    if chkJhonson.Checked then
      result.Add(THorseMiddlewareJohnson.New);

    if chkHorseOctetStream.Checked then
      result.Add(THorseMiddlewareOctetStream.New);

    if chkHorseJWT.Checked then
      result.Add(THorseMiddlewareJWT.New);

    if chkHandleException.Checked then
      result.Add(THorseMiddlewareHandleException.New);

    if chkLogger.Checked then
      result.Add(THorseMiddlewareLogger.New);

    if chkHorseBasicAuth.Checked then
      result.Add(THorseMiddlewareBasicAuth.New);
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

procedure THorseViewsNewProject.SetFrameworks;
begin
  edtFramework.Clear;
  edtFramework.Items.Add('Apache');
  edtFramework.Items.Add('CGI');
  edtFramework.Items.Add('Console');
  edtFramework.Items.Add('Daemon');
  edtFramework.Items.Add('Isapi');
  edtFramework.Items.Add('Vcl');
  edtFramework.Items.Add('WinService');

  if edtTarget.Text = 'Windows' then
    edtFramework.Items.Delete(3)
  else
  begin
    edtFramework.Items.Delete(6);
    edtFramework.Items.Delete(5);
    edtFramework.Items.Delete(4);
  end;

  edtFramework.ItemIndex := 2;
end;

function THorseViewsNewProject.UseBoss: Boolean;
begin
  result := chkUseBoss.Checked;
end;

end.
