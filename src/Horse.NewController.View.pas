unit Horse.NewController.View;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, Horse.NewController.Model;

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
  public
    { Public declarations }
    function GetController: THorseNewControllerModel;
  end;

var
  HorseViewsNewController: THorseViewsNewController;

implementation

{$R *.dfm}

{ THorseViewsNewController }

procedure THorseViewsNewController.edtControllerNameChange(Sender: TObject);
begin
  edtRoute.Text := edtControllerName.Text;
end;

function THorseViewsNewController.GetController: THorseNewControllerModel;
begin
  Result := THorseNewControllerModel.Create;
  try
    Result.ControllerName := edtControllerName.Text;
    Result.Route := edtRoute.Text;
    Result.Get := chkGET.Checked;
    Result.GetById := chkGETID.Checked;
    Result.Post := chkPOST.Checked;
    Result.Delete := chkDELETE.Checked;
    Result.Put := chkPUT.Checked;
  except
    Result.Free;
    raise;
  end;
end;

end.
