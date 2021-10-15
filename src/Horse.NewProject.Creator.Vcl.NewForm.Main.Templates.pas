unit Horse.NewProject.Creator.Vcl.NewForm.Main.Templates;

interface

resourcestring
  sHorseVCLMainFormPAS =
    'unit %0:s;' + sLineBreak +
    '' + sLineBreak +
    'interface' + sLineBreak +
    '' + sLineBreak +
    'uses' + sLineBreak +
    '  Winapi.Windows,' + sLineBreak +
    '  System.Variants,' + sLineBreak +
    '  System.Classes,' + sLineBreak +
    '  System.SysUtils,' + sLineBreak +
    '  Vcl.Graphics,' + sLineBreak +
    '  Vcl.Controls,' + sLineBreak +
    '  Vcl.Forms,' + sLineBreak +
    '  Vcl.Dialogs,' + sLineBreak +
    '  Vcl.StdCtrls,' + sLineBreak +
    '  Vcl.Buttons;' + sLineBreak +
    '' + sLineBreak +
    'type' + sLineBreak +
    '  TFrmMain = class(TForm)' + sLineBreak +
    '    btnStop: TBitBtn;' + sLineBreak +
    '    btnStart: TBitBtn;' + sLineBreak +
    '    Label1: TLabel;' + sLineBreak +
    '    edtPort: TEdit;' + sLineBreak +
    '    procedure btnStopClick(Sender: TObject);' + sLineBreak +
    '    procedure FormClose(Sender: TObject; var Action: TCloseAction);' + sLineBreak +
    '    procedure btnStartClick(Sender: TObject);' + sLineBreak +
    '  private' + sLineBreak +
    '    procedure Status;' + sLineBreak +
    '    procedure Start;' + sLineBreak +
    '    procedure Stop;' + sLineBreak +
    '  end;' + sLineBreak +
    '' + sLineBreak +
    'var' + sLineBreak +
    '  FrmMain: TFrmMain;' + sLineBreak +
    '' + sLineBreak +
    'implementation' + sLineBreak +
    '' + sLineBreak +
    'uses Horse;' + sLineBreak +
    '' + sLineBreak +
    '{$R *.dfm}' + sLineBreak +
    '' + sLineBreak +
    'procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);' + sLineBreak +
    'begin' + sLineBreak +
    '  if THorse.IsRunning then' + sLineBreak +
    '    Stop;' + sLineBreak +
    'end;' + sLineBreak +
    '' + sLineBreak +
    'procedure TFrmMain.Start;' + sLineBreak +
    'begin' + sLineBreak +
    '  THorse.Get(''ping'',' + sLineBreak +
    '    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)' + sLineBreak +
    '    begin' + sLineBreak +
    '      Res.Send(''pong'');' + sLineBreak +
    '    end);' + sLineBreak +
    '' + sLineBreak +
    '  THorse.Listen(StrToInt(edtPort.Text));' + sLineBreak +
    'end;' + sLineBreak +
    '' + sLineBreak +
    'procedure TFrmMain.Status;' + sLineBreak +
    'begin' + sLineBreak +
    '  btnStop.Enabled := THorse.IsRunning;' + sLineBreak +
    '  btnStart.Enabled := not THorse.IsRunning;' + sLineBreak +
    '  edtPort.Enabled := not THorse.IsRunning;' + sLineBreak +
    'end;' + sLineBreak +
    '' + sLineBreak +
    'procedure TFrmMain.Stop;' + sLineBreak +
    'begin' + sLineBreak +
    '  THorse.StopListen;' + sLineBreak +
    'end;' + sLineBreak +
    '' + sLineBreak +
    'procedure TFrmMain.btnStartClick(Sender: TObject);' + sLineBreak +
    'begin' + sLineBreak +
    '  Start;' + sLineBreak +
    '  Status;' + sLineBreak +
    'end;' + sLineBreak +
    '' + sLineBreak +
    'procedure TFrmMain.btnStopClick(Sender: TObject);' + sLineBreak +
    'begin' + sLineBreak +
    '  Stop;' + sLineBreak +
    '  Status;' + sLineBreak +
    'end;' + sLineBreak +
    '' + sLineBreak +
    'end.';

  sHorseVCLMainFormDFM =
    'object FrmMain: TFrmMain' + sLineBreak +
    '  Left = 0' + sLineBreak +
    '  Top = 0' + sLineBreak +
    '  BorderIcons = [biSystemMenu]' + sLineBreak +
    '  BorderStyle = bsSingle' + sLineBreak +
    '  Caption = ''Main'' ' + sLineBreak +
    '  ClientHeight = 82' + sLineBreak +
    '  ClientWidth = 201' + sLineBreak +
    '  Color = clBtnFace' + sLineBreak +
    '  Font.Charset = DEFAULT_CHARSET' + sLineBreak +
    '  Font.Color = clWindowText' + sLineBreak +
    '  Font.Height = -11' + sLineBreak +
    '  Font.Name = ''Tahoma'' ' + sLineBreak +
    '  Font.Style = []' + sLineBreak +
    '  OldCreateOrder = False' + sLineBreak +
    '  Position = poScreenCenter' + sLineBreak +
    '  OnClose = FormClose' + sLineBreak +
    '  PixelsPerInch = 96' + sLineBreak +
    '  TextHeight = 13' + sLineBreak +
    '  object Label1: TLabel' + sLineBreak +
    '    Left = 8' + sLineBreak +
    '    Top = 19' + sLineBreak +
    '    Width = 24' + sLineBreak +
    '    Height = 13' + sLineBreak +
    '    Caption = ''Port:'' ' + sLineBreak +
    '  end' + sLineBreak +
    '  object btnStop: TBitBtn' + sLineBreak +
    '    Left = 104' + sLineBreak +
    '    Top = 50' + sLineBreak +
    '    Width = 90' + sLineBreak +
    '    Height = 25' + sLineBreak +
    '    Caption = ''Stop'' ' + sLineBreak +
    '    Enabled = False' + sLineBreak +
    '    TabOrder = 0' + sLineBreak +
    '    OnClick = btnStopClick' + sLineBreak +
    '  end' + sLineBreak +
    '  object btnStart: TBitBtn' + sLineBreak +
    '    Left = 8' + sLineBreak +
    '    Top = 50' + sLineBreak +
    '    Width = 90' + sLineBreak +
    '    Height = 25' + sLineBreak +
    '    Caption = ''Start'' ' + sLineBreak +
    '    TabOrder = 1' + sLineBreak +
    '    OnClick = btnStartClick' + sLineBreak +
    '  end' + sLineBreak +
    '  object edtPort: TEdit' + sLineBreak +
    '    Left = 38' + sLineBreak +
    '    Top = 16' + sLineBreak +
    '    Width = 156' + sLineBreak +
    '    Height = 21' + sLineBreak +
    '    NumbersOnly = True' + sLineBreak +
    '    TabOrder = 2' + sLineBreak +
    '    Text = ''%0:s'' ' + sLineBreak +
    '  end' + sLineBreak +
    'end';

implementation

end.
