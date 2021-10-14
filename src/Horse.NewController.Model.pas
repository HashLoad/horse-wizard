unit Horse.NewController.Model;

interface

uses
  System.SysUtils;

type THorseNewControllerModel = class
  private
    Froute: String;
    FGET: Boolean;
    FGETID: Boolean;
    FPOST: Boolean;
    FPUT: Boolean;
    FDELETE: Boolean;
    FcontrollerName: String;

  public
    property controllerName: String read FcontrollerName write FcontrollerName;
    property route: String read Froute write Froute;
    property GET: Boolean read FGET write FGET;
    property GETID: Boolean read FGETID write FGETID;
    property POST: Boolean read FPOST write FPOST;
    property PUT: Boolean read FPUT write FPUT;
    property DELETE: Boolean read FDELETE write FDELETE;

    function UnitContent(AUnitName: String): string;
end;

implementation

{ THorseNewControllerModel }

function THorseNewControllerModel.UnitContent(AUnitName: String): string;
begin
  result :=
  'unit %2:s;' + sLineBreak +
  '' + sLineBreak +
  'interface' + sLineBreak +
  '' + sLineBreak +
  'uses' + sLineBreak +
  '  Horse;' + sLineBreak +
  '' + sLineBreak +
  'const' + sLineBreak +
  '  ROUTE = ''%1:s'';' + sLineBreak +
  '  ROUTE_ID = ''%1:s/:id'';' + sLineBreak +
  '' + sLineBreak;

  if Self.GET then
    result := result +
      'procedure %0:sGET(Req: THorseRequest; Res: THorseResponse; Next: TProc);' + sLineBreak;

  if Self.GETID then
    result := result +
      'procedure %0:sGET_ID(Req: THorseRequest; Res: THorseResponse; Next: TProc);' + sLineBreak;

  if Self.POST then
    result := result +
      'procedure %0:sPOST(Req: THorseRequest; Res: THorseResponse; Next: TProc);' + sLineBreak;

  if Self.PUT then
    result := result +
      'procedure %0:sPUT(Req: THorseRequest; Res: THorseResponse; Next: TProc);' + sLineBreak;

  if Self.DELETE then
    result := result +
      'procedure %0:sDELETE(Req: THorseRequest; Res: THorseResponse; Next: TProc);' + sLineBreak;

  result := result +
  '' + sLineBreak +
  'procedure %0:sRegistry;' + sLineBreak +
  '' + sLineBreak +
  'implementation' + sLineBreak +
  '' + sLineBreak +
  'procedure %0:sRegistry;' + sLineBreak +
  'begin' + sLineBreak +
  '  THorse' + sLineBreak;

  if Self.GET then
    result := result +
  '    .Get(ROUTE, %0:sGET)' + sLineBreak;

  if Self.POST then
    result := result +
  '    .Post(ROUTE, %0:sPOST)' + sLineBreak;

  if Self.GETID then
    result := result +
  '    .Get(ROUTE_ID, %0:sGET_ID)' + sLineBreak;

  if Self.PUT then
    result := result +
  '    .Put(ROUTE_ID, %0:sPUT)' + sLineBreak;

  if Self.DELETE then
    result := result +
  '    .Delete(ROUTE_ID, %0:sDELETE)' + sLineBreak;

  result := result +
  'end;' + sLineBreak +
  '' + sLineBreak;

  if Self.GET then
  begin
    result := result +
      'procedure %0:sGET(Req: THorseRequest; Res: THorseResponse; Next: TProc);' + sLineBreak +
      'begin' + sLineBreak +
      '' + sLineBreak +
      'end;' + sLineBreak +
      '' + sLineBreak;
  end;

  if Self.GETID then
  begin
    result := result +
      'procedure %0:sGET_ID(Req: THorseRequest; Res: THorseResponse; Next: TProc);' + sLineBreak +
      'var' + sLineBreak +
      '  id: string;' + sLineBreak +
      'begin' + sLineBreak +
      '  id := Req.Params[''id''];' + sLineBreak +
      '' + sLineBreak +
      'end;' + sLineBreak +
      '' + sLineBreak;
  end;

  if Self.POST then
  begin
    result := result +
      'procedure %0:sPOST(Req: THorseRequest; Res: THorseResponse; Next: TProc);' + sLineBreak +
      'begin' + sLineBreak +
      '' + sLineBreak +
      'end;' + sLineBreak +
      '' + sLineBreak;
  end;

  if Self.PUT then
  begin
    result := result +
      'procedure %0:sPUT(Req: THorseRequest; Res: THorseResponse; Next: TProc);' + sLineBreak +
      'var' + sLineBreak +
      '  id: string;' + sLineBreak +
      'begin' + sLineBreak +
      '  id := Req.Params[''id''];' + sLineBreak +
      '' + sLineBreak +
      'end;' + sLineBreak +
      '' + sLineBreak;
  end;

  if Self.DELETE then
  begin
    result := result +
    'procedure %0:sDELETE(Req: THorseRequest; Res: THorseResponse; Next: TProc);' + sLineBreak +
    'var' + sLineBreak +
    '  id: string;' + sLineBreak +
    'begin' + sLineBreak +
    '  id := Req.Params[''id''];' + sLineBreak +
    '' + sLineBreak +
    'end;' + sLineBreak +
    '' + sLineBreak;
  end;

  result := result + 'end.';
  result := Format(result, [controllerName, route, AUnitName]);
end;

end.
