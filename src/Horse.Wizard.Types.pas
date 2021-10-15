unit Horse.Wizard.Types;

interface

uses
  System.SysUtils,
  Horse.NewProject.Templates,
  ToolsAPI;

type
  THorsePlatform = (hpWin32, hpWin64, hpLinux64);

  THorseFramework = (hfApache,
                     hfCGI,
                     hfConsole,
                     hfDaemon,
                     hfIsapi,
                     hfVcl,
                     hfWinSvc);

  THorsePlatformHelper = record helper for THorsePlatform
  public
    procedure FromString(const Value: String);
    function toString: String;
  end;

  THorseFrameworkHelper = record helper for THorseFramework
  public
    procedure FromString(const Value: String);
    function toString: String;
    function ProjectType: string;
    function Define: string;
    function DprContent: string;
  end;


implementation

{ THorsePlatformHelper }

procedure THorsePlatformHelper.FromString(const Value: String);
var
  LValue: String;
begin
  Self := hpWin32;
  LValue := Value.ToLower.Replace(' ', '');

  if LValue.Equals('windows64') then
    Self := hpWin64;

  if LValue.Contains('linux') then
    Self := hpLinux64;
end;

function THorsePlatformHelper.toString: String;
begin
  case Self of
    hpWin32: result := 'Win32';
    hpWin64: result := 'Win64';
    hpLinux64: result := 'Linux64';
  end;
end;

{ THorseFrameworkHelper }

function THorseFrameworkHelper.Define: string;
begin
  case Self of
    hfApache: result := 'HORSE_APACHE';
    hfCGI: result := 'HORSE_CGI';
    hfConsole: result := 'HORSE_CONSOLE';
    hfDaemon: result := 'HORSE_DAEMON';
    hfIsapi: result := 'HORSE_ISAPI';
    hfVcl: result := 'HORSE_VCL';
    hfWinSvc: result := 'HORSE_VCL';
  end;
end;

function THorseFrameworkHelper.DprContent: string;
begin
  case Self of
    hfApache: result := sHorseDPRApache;
    hfCGI: result := sHorseDPRCGI;
    hfConsole: result := sHorseDPRConsole;
    hfDaemon: result := sHorseDPRConsole;
    hfIsapi: result := sHorseDPRISAPI;
    hfVcl: result := sHorseDPRVCL;
    hfWinSvc: result := sHorseDPRWinSvc;
  end;
end;

procedure THorseFrameworkHelper.FromString(const Value: String);
var
  LValue: String;
begin
  Self := hfConsole;
  LValue := Value.ToLower.Replace(' ', '');

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
    hfApache: result := sLibrary;
    hfCGI: result := sConsole;
    hfConsole: result := sConsole;
    hfDaemon: result := sConsole;
    hfIsapi: result := sLibrary;
    hfVcl: result := sApplication;
    hfWinSvc: result := sApplication;
  end;
end;

function THorseFrameworkHelper.toString: String;
begin
  case Self of
    hfApache: result := sFrameworkTypeNone;
    hfCGI: result := sFrameworkTypeNone;
    hfConsole: result := sFrameworkTypeNone;
    hfDaemon: result := sFrameworkTypeNone;
    hfIsapi: result := sFrameworkTypeNone;
    hfVcl: result := sFrameworkTypeVCL;
    hfWinSvc: result := sFrameworkTypeVCL;
  end;
end;

end.
