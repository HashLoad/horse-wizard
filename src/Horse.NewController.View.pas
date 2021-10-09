unit Horse.NewController.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Horse.NewController.Model;

type
  THorseViewsNewController = class(TForm)
    imgHeader: TImage;
    Label3: TLabel;
    edtControllerName: TEdit;
    Button2: TButton;
    Button1: TButton;
    lblMiddlewares: TLabel;
    chkGET: TCheckBox;
    chkGETID: TCheckBox;
    chkPOST: TCheckBox;
    chkPUT: TCheckBox;
    chkDELETE: TCheckBox;
    edtRoute: TEdit;
    Label1: TLabel;
    procedure edtControllerNameChange(Sender: TObject);
  private
    { Private declarations }
  public
    function GetController: THorseNewControllerModel;

    { Public declarations }
  end;

var
  HorseViewsNewController: THorseViewsNewController;

implementation

{$R *.dfm}

{ THorseViewsNewController }

procedure THorseViewsNewController.edtControllerNameChange(Sender: TObject);
begin
  if edtRoute.Text = EmptyStr then
    edtRoute.Text := edtControllerName.Text;
end;

function THorseViewsNewController.GetController: THorseNewControllerModel;
begin
  result := THorseNewControllerModel.Create;
  try
    result.controllerName := edtControllerName.Text;
    result.route := edtRoute.Text;
    result.GET := chkGET.Checked;
    result.GETID := chkGETID.Checked;
    result.POST := chkPOST.Checked;
    result.DELETE := chkDELETE.Checked;
    result.PUT := chkPUT.Checked;
  except
    result.Free;
    raise;
  end;
end;

end.
