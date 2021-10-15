unit Horse.NewProject.Creator.WinSvc.NewForm.Main;

interface

uses ToolsAPI, Horse.CodeGen.SourceFile, Horse.NewProject.Creator.WinSvc.NewForm.Main.Templates, System.SysUtils;

type
  THorseNewProjectWinSvcNewFormMain = class(TNotifierObject, IOTACreator, IOTAModuleCreator)
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
      fully qualified filename.  This also applies to GetIntfFileName and
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

{ THorseNewProjectWinSvcNewFormMain }

constructor THorseNewProjectWinSvcNewFormMain.Create(const APort: Integer);
begin
  FPort := APort;
  (BorlandIDEServices as IOTAModuleServices).CreateModule(Self);
end;

procedure THorseNewProjectWinSvcNewFormMain.FormCreated(const AFormEditor: IOTAFormEditor);
begin

end;

function THorseNewProjectWinSvcNewFormMain.GetAncestorName: string;
begin
  Result := 'TForm';
end;

function THorseNewProjectWinSvcNewFormMain.GetCreatorType: string;
begin
  Result := sForm;
end;

function THorseNewProjectWinSvcNewFormMain.GetExisting: Boolean;
begin
  Result := False;
end;

function THorseNewProjectWinSvcNewFormMain.GetFileSystem: string;
begin
  Result := EmptyStr;
end;

function THorseNewProjectWinSvcNewFormMain.GetFormName: string;
begin
  Result := EmptyStr;
end;

function THorseNewProjectWinSvcNewFormMain.GetImplFileName: string;
begin
  Result := EmptyStr;
end;

function THorseNewProjectWinSvcNewFormMain.GetIntfFileName: string;
begin
  Result := EmptyStr;
end;

function THorseNewProjectWinSvcNewFormMain.GetMainForm: Boolean;
begin
  Result := True;
end;

function THorseNewProjectWinSvcNewFormMain.GetOwner: IOTAModule;
begin
  Result := GetActiveProject;
end;

function THorseNewProjectWinSvcNewFormMain.GetShowForm: Boolean;
begin
  Result := True;
end;

function THorseNewProjectWinSvcNewFormMain.GetShowSource: Boolean;
begin
  Result := True;
end;

function THorseNewProjectWinSvcNewFormMain.GetUnnamed: Boolean;
begin
  Result := True;
end;

class function THorseNewProjectWinSvcNewFormMain.New(const APort: Integer): IOTACreator;
begin
  Result := Self.create(APort);
end;

function THorseNewProjectWinSvcNewFormMain.NewFormFile(const AFormIdent, AAncestorIdent: string): IOTAFile;
begin
  Result := TSourceFile.Create(sHorseWinSvcMainFormDFM, []);
end;

function THorseNewProjectWinSvcNewFormMain.NewImplSource(const AModuleIdent, AFormIdent, AAncestorIdent: string): IOTAFile;
begin
  Result := TSourceFile.Create(sHorseWinSvcMainFormPAS, [AModuleIdent, FPort.ToString]);
end;

function THorseNewProjectWinSvcNewFormMain.NewIntfSource(const AModuleIdent, AFormIdent, AAncestorIdent: string): IOTAFile;
begin
  Result := nil;
end;

end.
