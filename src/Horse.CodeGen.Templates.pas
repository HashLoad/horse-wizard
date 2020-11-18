unit Horse.CodeGen.Templates;

interface

resourcestring
  sHorseDPR =
    'program %0:s;' + sLineBreak + sLineBreak +
    '{$APPTYPE CONSOLE}' + sLineBreak + sLineBreak +
    'uses Horse;' + sLineBreak + sLineBreak +
    'begin' + sLineBreak +
    '  THorse.Get(''/ping'',' + sLineBreak +
    '    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)' + sLineBreak +
    '    begin' + sLineBreak +
    '      Res.Send(''pong'');' + sLineBreak +
    '    end);' + sLineBreak + sLineBreak +
    '  THorse.Listen(9000);' + sLineBreak +
    'end.' + sLineBreak;

implementation

end.
