unit Horse.Middlewares;

interface

type
  IHorseMiddleware = interface
    ['{095E9FE2-785D-4296-84DE-BF7B0D1B44E8}']
    function Name: string;
    function Url: string;
    function &Uses: string;
    function Declaration: string;
  end;

  THorseMiddlewareBasicAuth = class(TInterfacedObject, IHorseMiddleware)
  public
    function Name: string;
    function Url: string;
    function &Uses: string;
    function Declaration: string;
    class function New: IHorseMiddleware;
  end;

  THorseMiddlewareCompression = class(TInterfacedObject, IHorseMiddleware)
  public
    function Name: string;
    function Url: string;
    function &Uses: string;
    function Declaration: string;
    class function New: IHorseMiddleware;
  end;

  THorseMiddlewareCORS = class(TInterfacedObject, IHorseMiddleware)
  public
    function Name: string;
    function Url: string;
    function &Uses: string;
    function Declaration: string;
    class function New: IHorseMiddleware;
  end;

  THorseMiddlewareHandleException = class(TInterfacedObject, IHorseMiddleware)
  public
    function Name: string;
    function Url: string;
    function &Uses: string;
    function Declaration: string;
    class function New: IHorseMiddleware;
  end;

  THorseMiddlewareJohnson = class(TInterfacedObject, IHorseMiddleware)
  public
    function Name: string;
    function Url: string;
    function &Uses: string;
    function Declaration: string;
    class function New: IHorseMiddleware;
  end;

  THorseMiddlewareJWT = class(TInterfacedObject, IHorseMiddleware)
  public
    function Name: string;
    function Url: string;
    function &Uses: string;
    function Declaration: string;
    class function New: IHorseMiddleware;
  end;

  THorseMiddlewareLogger = class(TInterfacedObject, IHorseMiddleware)
  public
    function Name: string;
    function Url: string;
    function &Uses: string;
    function Declaration: string;
    class function New: IHorseMiddleware;
  end;

  THorseMiddlewareOctetStream = class(TInterfacedObject, IHorseMiddleware)
  public
    function Name: string;
    function Url: string;
    function &Uses: string;
    function Declaration: string;
    class function New: IHorseMiddleware;
  end;

implementation

{ THorseMiddlewareJohnson }

function THorseMiddlewareJohnson.&Uses: string;
begin
  Result := 'Horse.Jhonson';
end;

function THorseMiddlewareJohnson.Declaration: string;
begin
  Result := 'Use(Jhonson())';
end;

function THorseMiddlewareJohnson.Name: string;
begin
  Result := 'Jhonson';
end;

class function THorseMiddlewareJohnson.New: IHorseMiddleware;
begin
  Result := Self.Create;
end;

function THorseMiddlewareJohnson.Url: string;
begin
  Result := 'github.com/HashLoad/jhonson';
end;

{ THorseMiddlewareCORS }

function THorseMiddlewareCORS.&Uses: string;
begin
  Result := 'Horse.CORS';
end;

function THorseMiddlewareCORS.Declaration: string;
begin
  Result := 'Use(CORS)';
end;

function THorseMiddlewareCORS.Name: string;
begin
  Result := 'CORS';
end;

class function THorseMiddlewareCORS.New: IHorseMiddleware;
begin
  Result := Self.Create;
end;

function THorseMiddlewareCORS.Url: string;
begin
  Result := 'github.com/HashLoad/horse-cors';
end;

{ THorseMiddlewareOctetStream }

function THorseMiddlewareOctetStream.&Uses: string;
begin
  Result := 'Horse.OctetStream';
end;

function THorseMiddlewareOctetStream.Declaration: string;
begin
  Result := 'Use(OctetStream)';
end;

function THorseMiddlewareOctetStream.Name: string;
begin
  Result := 'Horse-Octet-Stream';
end;

class function THorseMiddlewareOctetStream.New: IHorseMiddleware;
begin
  Result := Self.Create;
end;

function THorseMiddlewareOctetStream.Url: string;
begin
  Result := 'github.com/HashLoad/horse-octet-stream';
end;

{ THorseMiddlewareJWT }

function THorseMiddlewareJWT.&Uses: string;
begin
  Result := 'Horse.JWT';
end;

function THorseMiddlewareJWT.Declaration: string;
begin
  Result := 'Use(HorseJWT(''MY-PASSWORD''))';
end;

function THorseMiddlewareJWT.Name: string;
begin
  Result := 'Horse-JWT';
end;

class function THorseMiddlewareJWT.New: IHorseMiddleware;
begin
  Result := Self.Create;
end;

function THorseMiddlewareJWT.Url: string;
begin
  Result := 'github.com/HashLoad/horse-jwt';
end;

{ THorseMiddlewareBasicAuth }

function THorseMiddlewareBasicAuth.&Uses: string;
begin
  Result := 'Horse.BasicAuthentication';
end;

function THorseMiddlewareBasicAuth.Declaration: string;
begin
  Result :=
    'Use(HorseBasicAuthentication(' + Chr(13) +
    '  function(const AUsername, APassword: string): Boolean' + Chr(13) +
    '  begin ' + Chr(13) +
    '    Result := AUsername.Equals(''user'') and APassword.Equals(''password'');' + Chr(13) +
    '  end))';
end;

function THorseMiddlewareBasicAuth.Name: string;
begin
  Result := 'Basic-Auth';
end;

class function THorseMiddlewareBasicAuth.New: IHorseMiddleware;
begin
  Result := Self.Create;
end;

function THorseMiddlewareBasicAuth.Url: string;
begin
  Result := 'github.com/HashLoad/horse-basic-auth';
end;

{ THorseMiddlewareCompression }

function THorseMiddlewareCompression.&Uses: string;
begin
  Result := 'Horse.Compression';
end;

function THorseMiddlewareCompression.Declaration: string;
begin
  Result := 'Use(Compression()) // Must come before Jhonson middleware';
end;

function THorseMiddlewareCompression.Name: string;
begin
  Result := 'Horse-Compression';
end;

class function THorseMiddlewareCompression.New: IHorseMiddleware;
begin
  Result := Self.Create;
end;

function THorseMiddlewareCompression.Url: string;
begin
  Result := 'github.com/HashLoad/horse-compression';
end;

{ THorseMiddlewareHandleException }

function THorseMiddlewareHandleException.&Uses: string;
begin
  Result := 'Horse.HandleException';
end;

function THorseMiddlewareHandleException.Declaration: string;
begin
  Result := 'Use(HandleException)';
end;

function THorseMiddlewareHandleException.Name: string;
begin
  Result := 'Handle-Exception';
end;

class function THorseMiddlewareHandleException.New: IHorseMiddleware;
begin
  Result := Self.Create;
end;

function THorseMiddlewareHandleException.Url: string;
begin
  Result := 'github.com/HashLoad/handle-exception';
end;

{ THorseMiddlewareLogger }

function THorseMiddlewareLogger.&Uses: string;
begin
  Result := 'Horse.Logger';
end;

function THorseMiddlewareLogger.Declaration: string;
begin
  Result := 'Use(THorseLoggerManager.HorseCallback())';
end;

function THorseMiddlewareLogger.Name: string;
begin
  Result := 'Horse-Logger';
end;

class function THorseMiddlewareLogger.New: IHorseMiddleware;
begin
  Result := Self.Create;
end;

function THorseMiddlewareLogger.Url: string;
begin
  Result := 'github.com/HashLoad/horse-logger';
end;

end.
