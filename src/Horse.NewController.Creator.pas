unit Horse.NewController.Creator;

interface

uses ToolsAPI, Horse.CodeGen.SourceFile, Horse.NewController.Model, Vcl.Dialogs, System.SysUtils;

type
  THorseNewControllerCreator = class(TNotifierObject, IOTACreator, IOTAModuleCreator)
  private
    FModel: THorseNewControllerModel;
  protected
    // IOTACreator
    function GetCreatorType: string;
    function GetExisting: Boolean;
    function GetFileSystem: string;
    function GetOwner: IOTAModule;
    function GetUnnamed: Boolean;

    // IOTAModuleCreator
    function GetAncestorName: string;
    function GetImplFileName: string;
    function GetIntfFileName: string;
    function GetFormName: string;
    function GetMainForm: Boolean;
    function GetShowForm: Boolean;
    function GetShowSource: Boolean;
    function NewFormFile(const AFormIdent, AAncestorIdent: string): IOTAFile;
    function NewIntfSource(const AModuleIdent, AFormIdent, AAncestorIdent: string): IOTAFile;
    function NewImplSource(const AModuleIdent, AFormIdent, AAncestorIdent: string): IOTAFile;
    procedure FormCreated(const AFormEditor: IOTAFormEditor);
  public
    constructor Create(const AModel: THorseNewControllerModel);
    class function New(const AModel: THorseNewControllerModel): IOTACreator;
  end;

implementation

{ THorseNewControllerCreator }

constructor THorseNewControllerCreator.Create(const AModel: THorseNewControllerModel);
begin
  FModel := AModel;
end;

procedure THorseNewControllerCreator.FormCreated(const AFormEditor: IOTAFormEditor);
begin

end;

function THorseNewControllerCreator.GetAncestorName: string;
begin
  Result := EmptyStr;
end;

function THorseNewControllerCreator.GetCreatorType: string;
begin
  Result := sUnit;
end;

function THorseNewControllerCreator.GetExisting: Boolean;
begin
  Result := False;
end;

function THorseNewControllerCreator.GetFileSystem: string;
begin
  Result := EmptyStr;
end;

function THorseNewControllerCreator.GetFormName: string;
begin
  Result := EmptyStr;
end;

function THorseNewControllerCreator.GetImplFileName: string;
begin
  Result := EmptyStr;
end;

function THorseNewControllerCreator.GetIntfFileName: string;
begin
  Result := EmptyStr;
end;

function THorseNewControllerCreator.GetMainForm: Boolean;
begin
  Result := False;
end;

function THorseNewControllerCreator.GetOwner: IOTAModule;
begin
  Result := GetActiveProject;
end;

function THorseNewControllerCreator.GetShowForm: Boolean;
begin
  Result := False;
end;

function THorseNewControllerCreator.GetShowSource: Boolean;
begin
  Result := True;
end;

function THorseNewControllerCreator.GetUnnamed: Boolean;
begin
  Result := True;
end;

class function THorseNewControllerCreator.New(const AModel: THorseNewControllerModel): IOTACreator;
begin
  Result := Self.Create(AModel);
end;

function THorseNewControllerCreator.NewFormFile(const AFormIdent, AAncestorIdent: string): IOTAFile;
begin
  Result := nil;
end;

function THorseNewControllerCreator.NewImplSource(const AModuleIdent, AFormIdent, AAncestorIdent: string): IOTAFile;
var
  LUnitIdent: string;
  LClassName: string;
  LFileName: string;
begin
  (BorlandIDEServices as IOTAModuleServices).GetNewModuleAndClassName('', LUnitIdent, LClassName, LFileName);
  Result := TSourceFile.New(FModel.UnitContent(LUnitIdent), []);
end;

function THorseNewControllerCreator.NewIntfSource(const AModuleIdent, AFormIdent, AAncestorIdent: string): IOTAFile;
begin
  Result := nil;
end;

end.
