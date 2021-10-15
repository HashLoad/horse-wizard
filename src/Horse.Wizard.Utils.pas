unit Horse.Wizard.Utils;

interface

uses System.SysUtils, System.Classes, ToolsAPI, Vcl.Dialogs;

function UnitEditor: IOTASourceEditor;
function EditorAsString: string;
function EditorAsStringList: TStringList;

implementation

function EditorAsStringList: TStringList;
begin
  Result := TStringList.Create;
  try
    Result.Text := EditorAsString;
  except
    Result.Free;
    raise;
  end;
end;

function EditorAsString: string;
const
  iBufferSize: Integer = 1024;
var
  LEditReader: IOTAEditReader;
  LRead: Integer;
  LPosition: Integer;
  LStringBuffer: AnsiString;
begin
  Result := EmptyStr;
  LEditReader := UnitEditor.CreateReader;
  try
    LPosition := 0;
    repeat
      SetLength(LStringBuffer, iBufferSize);
      LRead := LEditReader.GetText(LPosition, PAnsiChar(LStringBuffer), iBufferSize);
      SetLength(LStringBuffer, LRead);
      Result := Result + string(LStringBuffer);
      Inc(LPosition, LRead);
    until LRead < iBufferSize;
  finally
    LEditReader := nil;
  end;
end;

function UnitEditor: IOTASourceEditor;
var
  LModule: IOTAModule;
  I: Integer;
begin
  LModule := (BorlandIDEServices as IOTAModuleServices).CurrentModule;
  for I := 0 to Pred(LModule.ModuleFileCount) do
  begin
    if LModule.ModuleFileEditors[I].QueryInterface(IOTASourceEditor, Result) = S_OK then
      Break;
  end;
end;

end.
