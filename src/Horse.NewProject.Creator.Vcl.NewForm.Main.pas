unit Horse.NewProject.Creator.Vcl.NewForm.Main;

interface

uses ToolsAPI, Horse.CodeGen.SourceFile, Horse.NewProject.Creator.Vcl.NewForm.Main.Templates, System.SysUtils;

type
  THorseNewProjectVclNewFormMain = class(TNotifierObject, IOTACreator, IOTAModuleCreator)
  protected
    FPort: Integer;
    function GetCreatorType: string;
    function GetExisting: Boolean;
    function GetFileSystem: string;
    function GetOwner: IOTAModule;
    function GetUnnamed: Boolean;
    function GetAncestorName: string;
    { Return the implementation filename, or blank to have the IDE create a new
      unique one. (C++ .cpp file or Delphi unit) NOTE: If a value is returned then it *must* be a
      fully qualified filename. This also applies to GetIntfFileName and
      GetAdditionalFileName on the IOTAAdditionalFilesModuleCreator interface. }
    function GetImplFileName: string;
    { Return the interface filename, or blank to have the IDE create a new
      unique one. (C++ header) }
    function GetIntfFileName: string;
    { Return the form name }
    function GetFormName: string;
    { Return True to Make this module the main form of the given Owner/Project }
    function GetMainForm: Boolean;
    { Return True to show the form }
    function GetShowForm: Boolean;
    { Return True to show the source }
    function GetShowSource: Boolean;
    { Create and return the Form resource for this new module if applicable }
    function NewFormFile(const AFormIdent, AAncestorIdent: string): IOTAFile;
    { Create and return the Implementation source for this module. (C++ .cpp
      file or Delphi unit) }
    function NewImplSource(const AModuleIdent, AFormIdent, AAncestorIdent: string): IOTAFile;
    { Create and return the Interface (C++ header) source for this module }
    function NewIntfSource(const AModuleIdent, AFormIdent, AAncestorIdent: string): IOTAFile;
    { Called when the new form/datamodule/custom module is created }
    procedure FormCreated(const AFormEditor: IOTAFormEditor);
  public
    constructor Create(const APort: Integer);
    class function New(const APort: Integer): IOTACreator;
  end;

implementation

{ THorseNewProjectVclNewFormMain }

constructor THorseNewProjectVclNewFormMain.create(const APort: Integer);
begin
  FPort := APort;
  (BorlandIDEServices as IOTAModuleServices).CreateModule(Self);
end;

procedure THorseNewProjectVclNewFormMain.FormCreated(const AFormEditor: IOTAFormEditor);
begin

end;

function THorseNewProjectVclNewFormMain.GetAncestorName: string;
begin
  Result := 'TForm';
end;

function THorseNewProjectVclNewFormMain.GetCreatorType: string;
begin
  Result := sForm;
end;

function THorseNewProjectVclNewFormMain.GetExisting: Boolean;
begin
  Result := False;
end;

function THorseNewProjectVclNewFormMain.GetFileSystem: string;
begin
  Result := EmptyStr;
end;

function THorseNewProjectVclNewFormMain.GetFormName: string;
begin
  Result := EmptyStr;
end;

function THorseNewProjectVclNewFormMain.GetImplFileName: string;
begin
  Result := EmptyStr;
end;

function THorseNewProjectVclNewFormMain.GetIntfFileName: string;
begin
  Result := EmptyStr;
end;

function THorseNewProjectVclNewFormMain.GetMainForm: Boolean;
begin
  Result := True;
end;

function THorseNewProjectVclNewFormMain.GetOwner: IOTAModule;
begin
  Result := GetActiveProject;
end;

function THorseNewProjectVclNewFormMain.GetShowForm: Boolean;
begin
  Result := True;
end;

function THorseNewProjectVclNewFormMain.GetShowSource: Boolean;
begin
  Result := True;
end;

function THorseNewProjectVclNewFormMain.GetUnnamed: Boolean;
begin
  Result := True;
end;

class function THorseNewProjectVclNewFormMain.New(const APort: Integer): IOTACreator;
begin
  Result := Self.create(APort);
end;

function THorseNewProjectVclNewFormMain.NewFormFile(const AFormIdent, AAncestorIdent: string): IOTAFile;
begin
  Result := TSourceFile.Create(sHorseVCLMainFormDFM, [FPort.ToString]);
end;

function THorseNewProjectVclNewFormMain.NewImplSource(const AModuleIdent, AFormIdent, AAncestorIdent: string): IOTAFile;
begin
  Result := TSourceFile.Create(sHorseVCLMainFormPAS, [AModuleIdent]);
end;

function THorseNewProjectVclNewFormMain.NewIntfSource(const AModuleIdent, AFormIdent, AAncestorIdent: string): IOTAFile;
begin
  Result := nil;
end;

end.
