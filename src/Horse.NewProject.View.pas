unit Horse.NewProject.View;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Horse.Wizard.Types,
  Horse.Middlewares, System.Generics.Collections;

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
    { Public declarations }
    function Port: Integer;
    function HorseFramework: THorseFramework;
    function HorsePlatform: THorsePlatform;
    function GetMiddlewares: TList<IHorseMiddleware>;
    function UseBoss: Boolean;
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
  Result := TList<IHorseMiddleware>.Create;
  try
    if chkHorseCORS.Checked then
      Result.Add(THorseMiddlewareCORS.New);

    if chkHorseCompression.Checked then
      Result.Add(THorseMiddlewareCompression.New);

    if chkJhonson.Checked then
      Result.Add(THorseMiddlewareJohnson.New);

    if chkHorseOctetStream.Checked then
      Result.Add(THorseMiddlewareOctetStream.New);

    if chkHorseJWT.Checked then
      Result.Add(THorseMiddlewareJWT.New);

    if chkHandleException.Checked then
      Result.Add(THorseMiddlewareHandleException.New);

    if chkLogger.Checked then
      Result.Add(THorseMiddlewareLogger.New);

    if chkHorseBasicAuth.Checked then
      Result.Add(THorseMiddlewareBasicAuth.New);
  except
    Result.Free;
    raise;
  end;
end;

function THorseViewsNewProject.HorseFramework: THorseFramework;
begin
  Result.FromString(edtFramework.Text);
end;

function THorseViewsNewProject.HorsePlatform: THorsePlatform;
begin
  Result.FromString(edtTarget.Text);
end;

function THorseViewsNewProject.Port: Integer;
begin
  Result := StrToIntDef(edtPort.Text, 9000);
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
  begin
    edtFramework.Items.Delete(3);
    edtFramework.ItemIndex := 2;
  end
  else
  begin
    edtFramework.Items.Delete(6);
    edtFramework.Items.Delete(5);
    edtFramework.Items.Delete(4);
    edtFramework.Items.Delete(1);
    edtFramework.ItemIndex := 1;
  end;
end;

function THorseViewsNewProject.UseBoss: Boolean;
begin
  Result := chkUseBoss.Checked;
end;

end.
