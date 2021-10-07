unit Horse.NewProject.Templates;

interface

resourcestring
  sHorseDPRApache =
    'library %0:s;' + sLineBreak +
    '' + sLineBreak +
    '(*' + sLineBreak +
    ' httpd.conf entries:' + sLineBreak +
    ' LoadModule apache_horse_module modules/%0:s.dll' + sLineBreak +
    ' <Location /apache_horse>' + sLineBreak +
    '    SetHandler apache_horse_module-handle' + sLineBreak +
    ' </Location>' + sLineBreak +
    ' To use the feature:' + sLineBreak +
    ' http://localhost/apache_horse/ping' + sLineBreak +
    ' These entries assume that the output directory for this project is the apache/modules directory.' + sLineBreak +
    ' httpd.conf entries should be different if the project is changed in these ways:' + sLineBreak +
    '   1. The TApacheModuleData variable name is changed.' + sLineBreak +
    '   2. The project is renamed.' + sLineBreak +
    '   3. The output directory is not the apache/modules directory.' + sLineBreak +
    '   4. The dynamic library extension depends on a platform. Use .dll on Windows and .so on Linux.' + sLineBreak +
    '*)' + sLineBreak +
    '' + sLineBreak +
    '// Declare exported variable so that Apache can access this module.' + sLineBreak +
    '' + sLineBreak +
    'uses' + sLineBreak +
    '  Horse,' + sLineBreak +
    '  Web.HTTPD24Impl;' + sLineBreak +
    '' + sLineBreak +
    'var' + sLineBreak +
    '  ApacheModuleData: TApacheModuleData;' + sLineBreak +
    '' + sLineBreak +
    'exports' + sLineBreak +
    '  ApacheModuleData name ''apache_horse_module'';' + sLineBreak +
    '' + sLineBreak +
    'begin' + sLineBreak +
    '  THorse.DefaultModule := @ApacheModuleData;' + sLineBreak +
    '  THorse.HandlerName := ''apache_horse_module-handle'';' + sLineBreak +
    '' + sLineBreak +
    '  THorse.Get(''/ping'',' + sLineBreak +
    '    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)' + sLineBreak +
    '    begin' + sLineBreak +
    '      Res.Send(''pong'');' + sLineBreak +
    '    end);' + sLineBreak +
    '' + sLineBreak +
    '  THorse.Listen;' + sLineBreak +
    'end.';

  sHorseDPRCGI =
    'program %0:s;' + sLineBreak +
    '' + sLineBreak +
    '{$APPTYPE CONSOLE}' + sLineBreak +
    '' + sLineBreak +
    'uses' + sLineBreak +
    '  Horse;' + sLineBreak +
    '' + sLineBreak +
    'begin' + sLineBreak +
    '  THorse.Get(''/ping'',' + sLineBreak +
    '    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)' + sLineBreak +
    '    begin' + sLineBreak +
    '      Res.Send(''pong'');' + sLineBreak +
    '    end);' + sLineBreak +
    '' + sLineBreak +
    '  THorse.Listen;' + sLineBreak +
    'end.';

  sHorseDPRConsole =
    'program %0:s;' + sLineBreak +
    '' + sLineBreak +
    '{$APPTYPE CONSOLE}' + sLineBreak +
    '' + sLineBreak +
    'uses' + sLineBreak +
    '  Horse,' + sLineBreak +
    '  System.SysUtils;' + sLineBreak +
    '' + sLineBreak +
    'begin' + sLineBreak +
    '  THorse.Get(''/ping'',' + sLineBreak +
    '    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)' + sLineBreak +
    '    begin' + sLineBreak +
    '      Res.Send(''pong'');' + sLineBreak +
    '    end);' + sLineBreak +
    '' + sLineBreak +
    '  THorse.Listen(%1:s, ' + sLineBreak +
    '    procedure (Horse: THorse)' + sLineBreak +
    '    begin' + sLineBreak +
    '      Writeln(''Server is runing on port '' + IntToStr(Horse.Port));' + sLineBreak +
    '    end);' + sLineBreak +
    'end.';

  sHorseDPRISAPI =
    'library %0:s;' + sLineBreak +
    '' + sLineBreak +
    'uses' + sLineBreak +
    '  Horse;' + sLineBreak +
    '' + sLineBreak +
    'begin' + sLineBreak +
    '  THorse.Get(''/ping'',' + sLineBreak +
    '    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)' + sLineBreak +
    '    begin' + sLineBreak +
    '      Res.Send(''pong'');' + sLineBreak +
    '    end);' + sLineBreak +
    '' + sLineBreak +
    '  THorse.Listen;' + sLineBreak +
    'end.';

  sHorseDPRVCL =
    'program %0:s;' + sLineBreak +
    '' + sLineBreak +
    'uses' + sLineBreak +
    '  Vcl.Forms;' + sLineBreak +
    '' + sLineBreak +
    'begin' + sLineBreak +
    '  Application.Initialize;' + sLineBreak +
    '  Application.MainFormOnTaskbar := True;' + sLineBreak +
    '  Application.Run;' + sLineBreak +
    'end.';

  sHorseDPRWinSvc =
    'program %0:s;' + sLineBreak +
    '' + sLineBreak +
    'uses' + sLineBreak +
    '  Vcl.Forms,' + sLineBreak +
    '  Vcl.SvcMgr;' + sLineBreak +
    '' + sLineBreak +
    'begin' + sLineBreak +
    '  if not Application.DelayInitialize or Application.Installing then' + sLineBreak +
    '    Application.Initialize;' + sLineBreak +
    '  Application.Run;' + sLineBreak +
    'end.';

implementation

end.
