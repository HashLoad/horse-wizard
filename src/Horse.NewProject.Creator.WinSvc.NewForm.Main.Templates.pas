unit Horse.NewProject.Creator.WinSvc.NewForm.Main.Templates;

interface

resourcestring
  sHorseWinSvcMainFormPAS =
    'unit %0:s;' + sLineBreak +
    '' + sLineBreak +
    'interface' + sLineBreak +
    '' + sLineBreak +
    'uses' + sLineBreak +
    '  Winapi.Windows,' + sLineBreak +
    '  Winapi.Messages,' + sLineBreak +
    '  System.SysUtils,' + sLineBreak +
    '  System.Classes,' + sLineBreak +
    '  Vcl.Graphics,' + sLineBreak +
    '  Vcl.Controls,' + sLineBreak +
    '  Vcl.SvcMgr,' + sLineBreak +
    '  Vcl.Dialogs;' + sLineBreak +
    '' + sLineBreak +
    'type' + sLineBreak +
    '  TMainService = class(TService)' + sLineBreak +
    '    procedure ServiceCreate(Sender: TObject);' + sLineBreak +
    '    procedure ServiceStart(Sender: TService; var Started: Boolean);' + sLineBreak +
    '    procedure ServiceStop(Sender: TService; var Stopped: Boolean);' + sLineBreak +
    '  public' + sLineBreak +
    '    function GetServiceController: TServiceController; override;' + sLineBreak +
    '  end;' + sLineBreak +
    '' + sLineBreak +
    'var' + sLineBreak +
    '  MainService: TMainService;' + sLineBreak +
    '' + sLineBreak +
    'implementation' + sLineBreak +
    '' + sLineBreak +
    'uses' + sLineBreak +
    '  Horse;' + sLineBreak +
    '' + sLineBreak +
    '{$R *.dfm}' + sLineBreak +
    '' + sLineBreak +
    'procedure ServiceController(CtrlCode: DWord); stdcall;' + sLineBreak +
    'begin' + sLineBreak +
    '  MainService.Controller(CtrlCode);' + sLineBreak +
    'end;' + sLineBreak +
    '' + sLineBreak +
    'function TMainService.GetServiceController: TServiceController;' + sLineBreak +
    'begin' + sLineBreak +
    '  Result := ServiceController;' + sLineBreak +
    'end;' + sLineBreak +
    '' + sLineBreak +
    'procedure TMainService.ServiceCreate(Sender: TObject);' + sLineBreak +
    'begin' + sLineBreak +
    '  THorse.Get(''ping'',' + sLineBreak +
    '    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)' + sLineBreak +
    '    begin' + sLineBreak +
    '      Res.Send(''pong'');' + sLineBreak +
    '    end);' + sLineBreak +
    'end;' + sLineBreak +
    '' + sLineBreak +
    'procedure TMainService.ServiceStart(Sender: TService; var Started: Boolean);' + sLineBreak +
    'begin' + sLineBreak +
    '  THorse.Listen(%1:s);' + sLineBreak +
    '  Started := True;' + sLineBreak +
    'end;' + sLineBreak +
    '' + sLineBreak +
    'procedure TMainService.ServiceStop(Sender: TService; var Stopped: Boolean);' + sLineBreak +
    'begin' + sLineBreak +
    '  THorse.StopListen;' + sLineBreak +
    '  Stopped := True;' + sLineBreak +
    'end;' + sLineBreak +
    '' + sLineBreak +
    'end.';

  sHorseWinSvcMainFormDFM =
    'object MainService: TMainService' + sLineBreak +
    '  OldCreateOrder = False' + sLineBreak +
    '  OnCreate = ServiceCreate' + sLineBreak +
    '  DisplayName = ''MainService'' ' + sLineBreak +
    '  StartType = stManual' + sLineBreak +
    '  OnStart = ServiceStart' + sLineBreak +
    '  OnStop = ServiceStop' + sLineBreak +
    '  Height = 150' + sLineBreak +
    '  Width = 215' + sLineBreak +
    'end';

implementation

end.
