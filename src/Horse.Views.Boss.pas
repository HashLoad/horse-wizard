unit Horse.Views.Boss;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrmBoss = class(TForm)
    MemoOut: TMemo;
  public
    procedure AppendText(const AText: string);
  end;

implementation

{$R *.dfm}

procedure TFrmBoss.AppendText(const AText: string);
begin
  TThread.Synchronize(nil,
  procedure
  begin
    MemoOut.Lines.Append(AText);
  end);
end;

end.
