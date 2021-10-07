unit Horse.Wizard.Utils;

interface

uses
  System.SysUtils,
  System.Classes,
  ToolsAPI,
  Vcl.Dialogs;

function UnitEditor: IOTASourceEditor;
function EditorAsString: string;
function EditorAsStringList: TStringList;

implementation

function EditorAsStringList: TStringList;
begin
  result := TStringList.Create;
  try
    result.Text := EditorAsString;
  except
    Result.Free;
    raise;
  end;
end;

function EditorAsString: string;
Const
  iBufferSize : Integer = 1024;
var
  Reader : IOTAEditReader;
  iRead : Integer;
  iPosition : Integer;
  strBuffer : AnsiString;
begin
  Result := '';
  Reader := UnitEditor.CreateReader;
  Try
    iPosition := 0;
    Repeat
      SetLength(strBuffer, iBufferSize);
      iRead := Reader.GetText(iPosition, PAnsiChar(strBuffer), iBufferSize);
      SetLength(strBuffer, iRead);
      Result := Result + String(strBuffer);
      Inc(iPosition, iRead);
    Until iRead < iBufferSize;
  Finally
    Reader := Nil;
  End;
end;

function UnitEditor: IOTASourceEditor;
var
  module: IOTAModule;
  i: Integer;
begin
  module := (BorlandIDEServices as IOTAModuleServices).CurrentModule;
  for i := 0 to Pred(module.ModuleFileCount) do
  begin
    if module.ModuleFileEditors[i].QueryInterface(IOTASourceEditor, result) = S_OK then
      Break;
  end;
end;

end.
