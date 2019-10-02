unit Horse.Boss.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormBossView = class(TForm)
    MemoOut: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AppendText(AText: string);
  end;

var
  FormBossView: TFormBossView;

implementation

{$R *.dfm}

{ TFormBossView }

procedure TFormBossView.AppendText(AText: string);
begin
  TThread.Synchronize(nil,
  procedure
  begin
    MemoOut.Lines.Append(AText);
  end);
end;

end.
