unit Horse.NewController.Creator;

interface

uses
  ToolsAPI,
  Horse.CodeGen.SourceFile,
  Horse.NewController.Model,
  Vcl.Dialogs,
  System.SysUtils;

type THorseNewControllerCreator = class(TNotifierObject, IOTACreator,
                                                         IOTAModuleCreator)
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
    function NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
    function NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
    function NewImplSource(const ModuleIdent: string; const FormIdent: string; const AncestorIdent: string): IOTAFile;
    procedure FormCreated(const FormEditor: IOTAFormEditor);

  public
    constructor create(AModel: THorseNewControllerModel);
    class function New(AModel: THorseNewControllerModel): IOTACreator;
end;

implementation

{ THorseNewControllerCreator }

constructor THorseNewControllerCreator.create(AModel: THorseNewControllerModel);
begin
  FModel := AModel;
end;

procedure THorseNewControllerCreator.FormCreated(const FormEditor: IOTAFormEditor);
begin
end;

function THorseNewControllerCreator.GetAncestorName: string;
begin
  result := EmptyStr;
end;

function THorseNewControllerCreator.GetCreatorType: string;
begin
  Result := sUnit;
end;

function THorseNewControllerCreator.GetExisting: Boolean;
begin
  result := False;
end;

function THorseNewControllerCreator.GetFileSystem: string;
begin
  result := EmptyStr;
end;

function THorseNewControllerCreator.GetFormName: string;
begin
  result := EmptyStr;
end;

function THorseNewControllerCreator.GetImplFileName: string;
begin
  result := EmptyStr;
end;

function THorseNewControllerCreator.GetIntfFileName: string;
begin
  result := EmptyStr;
end;

function THorseNewControllerCreator.GetMainForm: Boolean;
begin
  result := False;
end;

function THorseNewControllerCreator.GetOwner: IOTAModule;
begin
  result := nil;
end;

function THorseNewControllerCreator.GetShowForm: Boolean;
begin
  result := False;
end;

function THorseNewControllerCreator.GetShowSource: Boolean;
begin
  result := True;
end;

function THorseNewControllerCreator.GetUnnamed: Boolean;
begin
  result := True;
end;

class function THorseNewControllerCreator.New(AModel: THorseNewControllerModel): IOTACreator;
begin
  result := Self.create(AModel);
end;

function THorseNewControllerCreator.NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
begin
  result := nil;
end;

function THorseNewControllerCreator.NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
var
  LUnitIdent: String;
  LClassName: String;
  LFileName: String;
begin
  (BorlandIDEServices as IOTAModuleServices)
    .GetNewModuleAndClassName('', LUnitIdent, LClassName, LFileName);
  result := TSourceFile.New(FModel.UnitContent(LUnitIdent), []);
end;

function THorseNewControllerCreator.NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
begin
  result := nil;
end;

end.
