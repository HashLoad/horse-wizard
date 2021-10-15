unit Horse.NewProject.Creator.WinSvc.NewForm.Main;

interface

uses
  ToolsAPI,
  Horse.CodeGen.SourceFile,
  Horse.NewProject.Creator.WinSvc.NewForm.Main.Templates,
  System.SysUtils;

type THorseNewProjectWinSvcNewFormMain = class(TNotifierObject, IOTACreator,
                                                                IOTAModuleCreator)

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
      unique one.  (C++ header) }
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
    function NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
    { Create and return the Implementation source for this module. (C++ .cpp
      file or Delphi unit) }
    function NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
    { Create and return the Interface (C++ header) source for this module }
    function NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
    { Called when the new form/datamodule/custom module is created }
    procedure FormCreated(const FormEditor: IOTAFormEditor);

  public
    constructor create(Port: Integer);
    class function New(Port: Integer): IOTACreator;
end;

implementation

{ THorseNewProjectWinSvcNewFormMain }

constructor THorseNewProjectWinSvcNewFormMain.create(Port: Integer);
begin
  FPort := Port;
  (BorlandIDEServices as IOTAModuleServices).CreateModule(Self);
end;

procedure THorseNewProjectWinSvcNewFormMain.FormCreated(const FormEditor: IOTAFormEditor);
begin
end;

function THorseNewProjectWinSvcNewFormMain.GetAncestorName: string;
begin
  result := 'TForm';
end;

function THorseNewProjectWinSvcNewFormMain.GetCreatorType: string;
begin
  result := sForm;
end;

function THorseNewProjectWinSvcNewFormMain.GetExisting: Boolean;
begin
  result := False;
end;

function THorseNewProjectWinSvcNewFormMain.GetFileSystem: string;
begin
  result := EmptyStr;
end;

function THorseNewProjectWinSvcNewFormMain.GetFormName: string;
begin
  result := EmptyStr;
end;

function THorseNewProjectWinSvcNewFormMain.GetImplFileName: string;
begin
  result := EmptyStr;
end;

function THorseNewProjectWinSvcNewFormMain.GetIntfFileName: string;
begin
  result := EmptyStr;
end;

function THorseNewProjectWinSvcNewFormMain.GetMainForm: Boolean;
begin
  result := True;
end;

function THorseNewProjectWinSvcNewFormMain.GetOwner: IOTAModule;
begin
  result := GetActiveProject;
end;

function THorseNewProjectWinSvcNewFormMain.GetShowForm: Boolean;
begin
  result := True;
end;

function THorseNewProjectWinSvcNewFormMain.GetShowSource: Boolean;
begin
  result := True;
end;

function THorseNewProjectWinSvcNewFormMain.GetUnnamed: Boolean;
begin
  result := True;
end;

class function THorseNewProjectWinSvcNewFormMain.New(Port: Integer): IOTACreator;
begin
  result := Self.create(Port);
end;

function THorseNewProjectWinSvcNewFormMain.NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
begin
  result := TSourceFile.Create(sHorseWinSvcMainFormDFM, []);
end;

function THorseNewProjectWinSvcNewFormMain.NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
begin
  result := TSourceFile.Create(sHorseWinSvcMainFormPAS, [ModuleIdent, FPort.ToString]);
end;

function THorseNewProjectWinSvcNewFormMain.NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
begin
  result := nil;
end;

end.
