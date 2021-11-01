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
  '' + sLineBreak;

  Result := Result +
    'procedure Registry;' + sLineBreak +
    '' + sLineBreak +
    'implementation' + sLineBreak +
    '' + sLineBreak;

  if Self.Get then
  begin
    Result := Result +
      'procedure DoGet%0:s(Req: THorseRequest; Res: THorseResponse; Next: TProc);' + sLineBreak +
      'begin' + sLineBreak +
      '' + sLineBreak +
      'end;' + sLineBreak +
      '' + sLineBreak;
  end;

  if Self.GetById then
  begin
    Result := Result +
      'procedure DoGetById%0:s(Req: THorseRequest; Res: THorseResponse; Next: TProc);' + sLineBreak +
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
      'procedure DoPost%0:s(Req: THorseRequest; Res: THorseResponse; Next: TProc);' + sLineBreak +
      'begin' + sLineBreak +
      '' + sLineBreak +
      'end;' + sLineBreak +
      '' + sLineBreak;
  end;

  if Self.Put then
  begin
    Result := Result +
      'procedure DoPut%0:s(Req: THorseRequest; Res: THorseResponse; Next: TProc);' + sLineBreak +
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
    'procedure DoDelete%0:s(Req: THorseRequest; Res: THorseResponse; Next: TProc);' + sLineBreak +
    'var' + sLineBreak +
    '  id: string;' + sLineBreak +
    'begin' + sLineBreak +
    '  id := Req.Params[''id''];' + sLineBreak +
    '' + sLineBreak +
    'end;' + sLineBreak +
    '' + sLineBreak;
  end;

  Result := result +
    'procedure Registry;' + sLineBreak +
    'begin' + sLineBreak +
    '  THorse' + sLineBreak;

  if Self.Get then
    Result := Result + '    .Get(''%1:s'', DoGet%0:s)' + sLineBreak;

  if Self.Post then
    Result := Result + '    .Post(''%1:s'', DoPost%0:s)' + sLineBreak;

  if Self.GetById then
    Result := Result + '    .Get(''%1:s/:id'', DoGetById%0:s)' + sLineBreak;

  if Self.Put then
    Result := Result + '    .Put(''%1:s/:id'', DoPut%0:s)' + sLineBreak;

  if Self.Delete then
    Result := Result + '    .Delete(''%1:s/:id'', DoDelete%0:s)' + sLineBreak;

  Result := Result +
    'end;' + sLineBreak +
    '' + sLineBreak;

  Result := Result + 'end.';
  Result := Format(Result, [ControllerName, Route, AUnitName]);
end;

end.
