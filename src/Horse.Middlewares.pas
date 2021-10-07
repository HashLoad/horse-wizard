unit Horse.Middlewares;

interface

type
  IHorseMiddleware = interface
    ['{095E9FE2-785D-4296-84DE-BF7B0D1B44E8}']
    function Name: string;
    function Url: string;
  end;

  THorseMiddlewareBasicAuth = class(TInterfacedObject, IHorseMiddleware)
  public
    function Name: string;
    function Url: string;
    class function New: IHorseMiddleware;
  end;

  THorseMiddlewareCompression = class(TInterfacedObject, IHorseMiddleware)
  public
    function Name: string;
    function Url: string;
    class function New: IHorseMiddleware;
  end;

  THorseMiddlewareCORS = class(TInterfacedObject, IHorseMiddleware)
  public
    function Name: string;
    function Url: string;
    class function New: IHorseMiddleware;
  end;

  THorseMiddlewareHandleException = class(TInterfacedObject, IHorseMiddleware)
  public
    function Name: string;
    function Url: string;
    class function New: IHorseMiddleware;
  end;

  THorseMiddlewareJohnson = class(TInterfacedObject, IHorseMiddleware)
  public
    function Name: string;
    function Url: string;
    class function New: IHorseMiddleware;
  end;

  THorseMiddlewareJWT = class(TInterfacedObject, IHorseMiddleware)
  public
    function Name: string;
    function Url: string;
    class function New: IHorseMiddleware;
  end;

  THorseMiddlewareLogger = class(TInterfacedObject, IHorseMiddleware)
  public
    function Name: string;
    function Url: string;
    class function New: IHorseMiddleware;
  end;

  THorseMiddlewareOctetStream = class(TInterfacedObject, IHorseMiddleware)
  public
    function Name: string;
    function Url: string;
    class function New: IHorseMiddleware;
  end;



implementation

{ THorseMiddlewareJohnson }

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
