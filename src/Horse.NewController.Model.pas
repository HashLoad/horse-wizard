unit Horse.NewController.Model;

interface

uses System.SysUtils;

type THorseNewControllerModel = class
  private
    FRoute: string;
    FGet: Boolean;
    FGetById: Boolean;
    FPost: Boolean;
    FPut: Boolean;
    FDelete: Boolean;
    FControllerName: string;
  public
    property ControllerName: string read FControllerName write FControllerName;
    property Route: string read FRoute write FRoute;
    property Get: Boolean read FGet write FGet;
    property GetById: Boolean read FGetById write FGetById;
    property Post: Boolean read FPost write FPost;
    property Put: Boolean read FPut write FPut;
    property Delete: Boolean read FDelete write FDelete;
    function UnitContent(const AUnitName: string): string;
end;

implementation

{ THorseNewControllerModel }

function THorseNewControllerModel.UnitContent(const AUnitName: string): string;
begin
  Result :=
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

  if Self.Get then
    Result := Result +
      'procedure %0:sGet(Req: THorseRequest; Res: THorseResponse; Next: TProc);' + sLineBreak;

  if Self.GetById then
    Result := Result +
      'procedure %0:sGetById(Req: THorseRequest; Res: THorseResponse; Next: TProc);' + sLineBreak;

  if Self.Post then
    Result := Result +
      'procedure %0:sPost(Req: THorseRequest; Res: THorseResponse; Next: TProc);' + sLineBreak;

  if Self.Put then
    Result := Result +
      'procedure %0:sPut(Req: THorseRequest; Res: THorseResponse; Next: TProc);' + sLineBreak;

  if Self.Delete then
    Result := Result +
      'procedure %0:sDelete(Req: THorseRequest; Res: THorseResponse; Next: TProc);' + sLineBreak;

  Result := Result +
    '' + sLineBreak +
    'procedure %0:sRegistry;' + sLineBreak +
    '' + sLineBreak +
    'implementation' + sLineBreak +
    '' + sLineBreak +
    'procedure %0:sRegistry;' + sLineBreak +
    'begin' + sLineBreak +
    '  THorse' + sLineBreak;

  if Self.Get then
    Result := Result + '    .Get(ROUTE, %0:sGet)' + sLineBreak;

  if Self.Post then
    Result := Result + '    .Post(ROUTE, %0:sPost)' + sLineBreak;

  if Self.GetById then
    Result := Result + '    .Get(ROUTE_ID, %0:sGetById)' + sLineBreak;

  if Self.Put then
    Result := Result + '    .Put(ROUTE_ID, %0:sPut)' + sLineBreak;

  if Self.Delete then
    Result := Result + '    .Delete(ROUTE_ID, %0:sDelete)' + sLineBreak;

  Result := Result +
    'end;' + sLineBreak +
    '' + sLineBreak;

  if Self.Get then
  begin
    Result := Result +
      'procedure %0:sGet(Req: THorseRequest; Res: THorseResponse; Next: TProc);' + sLineBreak +
      'begin' + sLineBreak +
      '' + sLineBreak +
      'end;' + sLineBreak +
      '' + sLineBreak;
  end;

  if Self.GetById then
  begin
    Result := Result +
      'procedure %0:sGetById(Req: THorseRequest; Res: THorseResponse; Next: TProc);' + sLineBreak +
      'var' + sLineBreak +
      '  id: string;' + sLineBreak +
      'begin' + sLineBreak +
      '  id := Req.Params[''id''];' + sLineBreak +
      '' + sLineBreak +
      'end;' + sLineBreak +
      '' + sLineBreak;
  end;

  if Self.Post then
  begin
    Result := Result +
      'procedure %0:sPost(Req: THorseRequest; Res: THorseResponse; Next: TProc);' + sLineBreak +
      'begin' + sLineBreak +
      '' + sLineBreak +
      'end;' + sLineBreak +
      '' + sLineBreak;
  end;

  if Self.Put then
  begin
    Result := Result +
      'procedure %0:sPut(Req: THorseRequest; Res: THorseResponse; Next: TProc);' + sLineBreak +
      'var' + sLineBreak +
      '  id: string;' + sLineBreak +
      'begin' + sLineBreak +
      '  id := Req.Params[''id''];' + sLineBreak +
      '' + sLineBreak +
      'end;' + sLineBreak +
      '' + sLineBreak;
  end;

  if Self.Delete then
  begin
    Result := Result +
    'procedure %0:sDelete(Req: THorseRequest; Res: THorseResponse; Next: TProc);' + sLineBreak +
    'var' + sLineBreak +
    '  id: string;' + sLineBreak +
    'begin' + sLineBreak +
    '  id := Req.Params[''id''];' + sLineBreak +
    '' + sLineBreak +
    'end;' + sLineBreak +
    '' + sLineBreak;
  end;

  Result := Result + 'end.';
  Result := Format(Result, [ControllerName, Route, AUnitName]);
end;

end.
