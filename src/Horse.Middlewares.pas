unit Horse.Middlewares;

interface

type
  IHorseMiddleware = interface
    ['{095E9FE2-785D-4296-84DE-BF7B0D1B44E8}']
    function Name: string;
    function Url: string;
    function &Uses: String;
    function Declaration: string;
  end;

  THorseMiddlewareBasicAuth = class(TInterfacedObject, IHorseMiddleware)
  public
    function Name: string;
    function Url: string;
    function &Uses: String;
    function Declaration: string;
    class function New: IHorseMiddleware;
  end;

  THorseMiddlewareCompression = class(TInterfacedObject, IHorseMiddleware)
  public
    function Name: string;
    function Url: string;
    function &Uses: String;
    function Declaration: string;
    class function New: IHorseMiddleware;
  end;

  THorseMiddlewareCORS = class(TInterfacedObject, IHorseMiddleware)
  public
    function Name: string;
    function Url: string;
    function &Uses: String;
    function Declaration: string;
    class function New: IHorseMiddleware;
  end;

  THorseMiddlewareHandleException = class(TInterfacedObject, IHorseMiddleware)
  public
    function Name: string;
    function Url: string;
    function &Uses: String;
    function Declaration: string;
    class function New: IHorseMiddleware;
  end;

  THorseMiddlewareJohnson = class(TInterfacedObject, IHorseMiddleware)
  public
    function Name: string;
    function Url: string;
    function &Uses: String;
    function Declaration: string;
    class function New: IHorseMiddleware;
  end;

  THorseMiddlewareJWT = class(TInterfacedObject, IHorseMiddleware)
  public
    function Name: string;
    function Url: string;
    function &Uses: String;
    function Declaration: string;
    class function New: IHorseMiddleware;
  end;

  THorseMiddlewareLogger = class(TInterfacedObject, IHorseMiddleware)
  public
    function Name: string;
    function Url: string;
    function &Uses: String;
    function Declaration: string;
    class function New: IHorseMiddleware;
  end;

  THorseMiddlewareOctetStream = class(TInterfacedObject, IHorseMiddleware)
  public
    function Name: string;
    function Url: string;
    function &Uses: String;
    function Declaration: string;
    class function New: IHorseMiddleware;
  end;



implementation

{ THorseMiddlewareJohnson }

function THorseMiddlewareJohnson.&Uses: String;
begin
  result := 'Horse.Jhonson';
end;

function THorseMiddlewareJohnson.Declaration: string;
begin
  result := 'Use(Jhonson())';
end;

function THorseMiddlewareJohnson.Name: string;
begin
  result := 'Jhonson';
end;

class function THorseMiddlewareJohnson.New: IHorseMiddleware;
begin
  result := Self.Create;
end;

function THorseMiddlewareJohnson.Url: string;
begin
  result := 'github.com/HashLoad/jhonson';
end;

{ THorseMiddlewareCORS }

function THorseMiddlewareCORS.&Uses: String;
begin
  result := 'Horse.CORS';
end;

function THorseMiddlewareCORS.Declaration: string;
begin
  result := 'Use(CORS)';
end;

function THorseMiddlewareCORS.Name: string;
begin
  result := 'CORS';
end;

class function THorseMiddlewareCORS.New: IHorseMiddleware;
begin
  result := Self.Create;
end;

function THorseMiddlewareCORS.Url: string;
begin
  result := 'github.com/HashLoad/horse-cors';
end;

{ THorseMiddlewareOctetStream }

function THorseMiddlewareOctetStream.&Uses: String;
begin
  result := 'Horse.OctetStream';
end;

function THorseMiddlewareOctetStream.Declaration: string;
begin
  Result := 'Use(OctetStream)';
end;

function THorseMiddlewareOctetStream.Name: string;
begin
  result := 'Horse-Octet-Stream';
end;

class function THorseMiddlewareOctetStream.New: IHorseMiddleware;
begin
  Result := Self.Create;
end;

function THorseMiddlewareOctetStream.Url: string;
begin
  result := 'github.com/HashLoad/horse-octet-stream';
end;

{ THorseMiddlewareJWT }

function THorseMiddlewareJWT.&Uses: String;
begin
  result := 'Horse.JWT';
end;

function THorseMiddlewareJWT.Declaration: string;
begin
  result := 'Use(HorseJWT(''MY-PASSWORD''))';
end;

function THorseMiddlewareJWT.Name: string;
begin
  result := 'Horse-JWT';
end;

class function THorseMiddlewareJWT.New: IHorseMiddleware;
begin
  result := Self.Create;
end;

function THorseMiddlewareJWT.Url: string;
begin
  result := 'github.com/HashLoad/horse-jwt';
end;

{ THorseMiddlewareBasicAuth }

function THorseMiddlewareBasicAuth.&Uses: String;
begin
  Result := 'Horse.BasicAuthentication';
end;

function THorseMiddlewareBasicAuth.Declaration: string;
begin
  result := 'Use(HorseBasicAuthentication(' + Chr(13) +
            '  function(const AUsername, APassword: string): Boolean' + Chr(13) +
            'begin ' + Chr(13) +
            ' Result := AUsername.Equals(''user'') and APassword.Equals(''password'');' + Chr(13) +
            'end))';
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

function THorseMiddlewareCompression.&Uses: String;
begin
  result := 'Horse.Compression';
end;

function THorseMiddlewareCompression.Declaration: string;
begin
  result := 'Use(Compression()) // Must come before Jhonson middleware';
end;

function THorseMiddlewareCompression.Name: string;
begin
  result := 'Horse-Compression';
end;

class function THorseMiddlewareCompression.New: IHorseMiddleware;
begin
  result := Self.Create;
end;

function THorseMiddlewareCompression.Url: string;
begin
  result := 'github.com/HashLoad/horse-compression';
end;

{ THorseMiddlewareHandleException }

function THorseMiddlewareHandleException.&Uses: String;
begin
  result := 'Horse.HandleException';
end;

function THorseMiddlewareHandleException.Declaration: string;
begin
  result := 'Use(HandleException)';
end;

function THorseMiddlewareHandleException.Name: string;
begin
  result := 'Handle-Exception';
end;

class function THorseMiddlewareHandleException.New: IHorseMiddleware;
begin
  result := Self.Create;
end;

function THorseMiddlewareHandleException.Url: string;
begin
  result := 'github.com/HashLoad/handle-exception';
end;

{ THorseMiddlewareLogger }

function THorseMiddlewareLogger.&Uses: String;
begin
  result := 'Horse.Logger';
end;

function THorseMiddlewareLogger.Declaration: string;
begin
  result := 'Use( THorseLoggerManager.HorseCallback() )';
end;

function THorseMiddlewareLogger.Name: string;
begin
  result := 'Horse-Logger';
end;

class function THorseMiddlewareLogger.New: IHorseMiddleware;
begin
  result := Self.Create;
end;

function THorseMiddlewareLogger.Url: string;
begin
  result := 'github.com/HashLoad/horse-logger';
end;

end.
