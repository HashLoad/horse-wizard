unit Horse.Wizard.Types;

interface

uses System.SysUtils, Horse.NewProject.Templates, ToolsAPI;

type
  THorsePlatform = (hpWin32, hpWin64, hpLinux64);
  THorseFramework = (hfApache, hfCGI, hfConsole, hfDaemon, hfIsapi, hfVcl, hfWinSvc);

  THorsePlatformHelper = record helper for THorsePlatform
  public
    procedure FromString(const AValue: string);
    function ToString: string;
  end;

  THorseFrameworkHelper = record helper for THorseFramework
  public
    procedure FromString(const AValue: string);
    function ToString: string;
    function ProjectType: string;
    function Define: string;
    function DprContent: string;
  end;

implementation

{ THorsePlatformHelper }

procedure THorsePlatformHelper.FromString(const AValue: string);
var
  LValue: string;
begin
  Self := hpWin32;
  LValue := AValue.ToLower.Replace(' ', '');
  if LValue.Equals('windows64') then
    Self := hpWin64;
  if LValue.Contains('linux') then
    Self := hpLinux64;
end;

function THorsePlatformHelper.ToString: string;
begin
  case Self of
    hpWin32:
      Result := 'Win32';
    hpWin64:
      Result := 'Win64';
    hpLinux64:
      Result := 'Linux64';
  end;
end;

{ THorseFrameworkHelper }

function THorseFrameworkHelper.Define: string;
begin
  case Self of
    hfApache:
      Result := 'HORSE_APACHE';
    hfCGI:
      Result := 'HORSE_CGI';
    hfConsole:
      Result := 'HORSE_CONSOLE';
    hfDaemon:
      Result := 'HORSE_DAEMON';
    hfIsapi:
      Result := 'HORSE_ISAPI';
    hfVcl:
      Result := 'HORSE_VCL';
    hfWinSvc:
      Result := 'HORSE_VCL';
  end;
end;

function THorseFrameworkHelper.DprContent: string;
begin
  case Self of
    hfApache:
      Result := sHorseDPRApache;
    hfCGI:
      Result := sHorseDPRCGI;
    hfConsole:
      Result := sHorseDPRConsole;
    hfDaemon:
      Result := sHorseDPRConsole;
    hfIsapi:
      Result := sHorseDPRISAPI;
    hfVcl:
      Result := sHorseDPRVCL;
    hfWinSvc:
      Result := sHorseDPRWinSvc;
  end;
end;

procedure THorseFrameworkHelper.FromString(const AValue: string);
var
  LValue: string;
begin
  Self := hfConsole;
  LValue := AValue.ToLower.Replace(' ', '');
  if LValue.Equals('apache') then
    Self := hfApache;
  if LValue.Equals('cgi') then
    Self := hfCGI;
  if LValue.Equals('daemon') then
    Self := hfDaemon;
  if LValue.Equals('isapi') then
    Self := hfIsapi;
  if LValue.Equals('vcl') then
    Self := hfVcl;
  if (LValue.Equals('winservice')) or (LValue.Equals('winsvc')) then
    Self := hfWinSvc;
end;

function THorseFrameworkHelper.ProjectType: string;
begin
  case Self of
    hfApache:
      Result := sLibrary;
    hfCGI:
      Result := sConsole;
    hfConsole:
      Result := sConsole;
    hfDaemon:
      Result := sConsole;
    hfIsapi:
      Result := sLibrary;
    hfVcl:
      Result := sApplication;
    hfWinSvc:
      Result := sApplication;
  end;
end;

function THorseFrameworkHelper.ToString: string;
begin
  case Self of
    hfApache:
      Result := sFrameworkTypeNone;
    hfCGI:
      Result := sFrameworkTypeNone;
    hfConsole:
      Result := sFrameworkTypeNone;
    hfDaemon:
      Result := sFrameworkTypeNone;
    hfIsapi:
      Result := sFrameworkTypeNone;
    hfVcl:
      Result := sFrameworkTypeVCL;
    hfWinSvc:
      Result := sFrameworkTypeVCL;
  end;
end;

end.
