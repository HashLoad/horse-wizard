unit Horse.NewProject.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  THorseViewsNewProject = class(TForm)
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
    { Public declarations }
  end;

var
  HorseViewsNewProject: THorseViewsNewProject;

implementation

{$R *.dfm}

end.
