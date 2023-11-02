unit Setup4D.CEP.Sample.Comum.Controller;

interface

uses
  System.IniFiles;

type
  iController = interface;
  iProxy = interface;
  iWebService = interface;
  iCEP = interface;
  iIBGE = interface;

  iController = interface
    ['{689CF22E-5871-44A7-A0D2-84E270882774}']
    function Pasta(Const AValue: string): iController;
    function GravarINI: iController;
    function LerINI : iController;
    function Proxy : iProxy;
    function WebService : iWebService;
    function CEP : iCEP;
    function IBGE : iIBGE;

  end;

  iProxy = interface
    ['{B8EA0ED7-84E6-4A8F-833B-3120B22E981B}']

    function User(Const AValue : string): iProxy; overload;
    function Pass(Const AValue : string): iProxy; overload;
    function Host(Const AValue : string): iProxy; overload;
    function Port(Const AValue : string): iProxy; overload;
    function Port(Const AValue : Integer): iProxy; overload;

    function User: string; overload;
    function Pass: string; overload;
    function Host: string; overload;
    function PortInStr: string; overload;
    function Port: Integer; overload;

    function Finish : iController;
  end;

  iWebService = interface
    ['{98C42107-0BCC-49B9-A2C0-2A797964D6F8}']

    function users(Const AValue : string): iWebService; overload;
    function PassW(Const AValue : string): iWebService; overload;
    function Chave(Const AValue : string): iWebService; overload;
    function TimeOut(Const AValue : Integer): iWebService; overload;
    function TimeOut(Const AValue : string): iWebService; overload;
    function ParseText(Const AValue : Boolean): iWebService; overload;
    function Index(Const AValue : Integer): iWebService; overload;

    function users: string; overload;
    function PassW: string; overload;
    function Chave: string; overload;
    function TimeOut: Integer; overload;
    function TimeOutInStr: string; overload;
    function Index: Integer; overload;
    function ParseText: Boolean; overload;

    function Finish : iController;
  end;

  iCEP = interface
    ['{7EC95ED0-5145-452C-B74F-D86C5B489979}']

    function ForcarIBGE(Const AValue: Boolean) : iCEP; overload;
    function ForcarIBGE : Boolean; overload;

    function Finish : iController;
  end;

  iIBGE = interface
    ['{1F0F9457-6889-43D5-889B-CAD242503E2F}']

    function CaseSensitive(Const AValue: Boolean) : iIBGE; overload;
    function NomeCache(Const AValue: string): iIBGE; overload;
    function ValidadeCache(Const AValue: Integer): iIBGE; overload;
    function ValidadeCache(Const AValue: string): iIBGE; overload;

    function CaseSensitive : Boolean; overload;
    function NomeCache : string; overload;
    function ValidadeCacheInStr : string; overload;
    function ValidadeCache : Integer; overload;

    function Finish : iController;
  end;


  TController = class(TInterfacedObject, iController, iProxy, iWebService, iCEP, iIBGE)
  private
    FINI : TIniFile;

    FUserProxy: string;
    FPassProxy: string;
    FHostProxy: string;
    FPortProxy: Integer;

    FUserWebService: string;
    FPassWebService: string;
    FChaveWebService: string;
    FTimeOutWebService: Integer;
    FParseTextWebService: Boolean;
    FIndexWebService: Integer;

    FForcarIBGE : Boolean;

    FCaseSensitive : Boolean;
    FNomeCache : string;
    FValidadeCache : Integer;

  protected
    function Pasta(Const AValue: string): iController;
    function GravarINI: iController;
    function LerINI : iController;

    function Proxy : iProxy;
    function User(Const AValue : string): iProxy; overload;
    function Pass(Const AValue : string): iProxy; overload;
    function Host(Const AValue : string): iProxy; overload;
    function Port(Const AValue : string): iProxy; overload;
    function Port(Const AValue : Integer): iProxy; overload;

    function User: string; overload;
    function Pass: string; overload;
    function Host: string; overload;
    function PortInStr: string; overload;
    function Port: Integer; overload;

    function WebService : iWebService;
    function users(Const AValue : string): iWebService; overload;
    function PassW(Const AValue : string): iWebService; overload;
    function Chave(Const AValue : string): iWebService; overload;
    function TimeOut(Const AValue : Integer): iWebService; overload;
    function TimeOut(Const AValue : string): iWebService; overload;
    function ParseText(Const AValue : Boolean): iWebService; overload;
    function Index(Const AValue : Integer): iWebService; overload;

    function users: string; overload;
    function PassW: string; overload;
    function Chave: string; overload;
    function TimeOut: Integer; overload;
    function TimeOutInStr: string; overload;
    function Index: Integer; overload;
    function ParseText: Boolean; overload;

    function CEP : iCEP;
    function ForcarIBGE(Const AValue: Boolean) : iCEP; overload;
    function ForcarIBGE : Boolean; overload;

    function IBGE : iIBGE;
    function CaseSensitive(Const AValue: Boolean) : iIBGE; overload;
    function NomeCache(Const AValue: string): iIBGE; overload;
    function ValidadeCache(Const AValue: Integer): iIBGE; overload;
    function ValidadeCache(Const AValue: string): iIBGE; overload;

    function CaseSensitive : Boolean; overload;
    function NomeCache : string; overload;
    function ValidadeCacheInStr : string; overload;
    function ValidadeCache : Integer; overload;
    function Finish : iController;

  public
    Constructor Create;
    Destructor Destroy; override;
    class function New: iController;
  end;

implementation

uses
  System.SysUtils;

function TController.Chave(const AValue: string): iWebService;
begin
  Result := Self;
  FChaveWebService := AValue;
end;

function TController.CaseSensitive(const AValue: Boolean): iIBGE;
begin
  Result := Self;
  FCaseSensitive := AValue;
end;

function TController.CaseSensitive: Boolean;
begin
  Result := FCaseSensitive;
end;

function TController.CEP: iCEP;
begin
  Result := Self;
end;

function TController.Chave: string;
begin
  Result := FChaveWebService;
end;

constructor TController.Create;
begin

end;

destructor TController.Destroy;
begin
  if Assigned(FINI) then
    FINI.Free;

  inherited;
end;

function TController.NomeCache(const AValue: string): iIBGE;
begin
  Result := Self;
  FNomeCache := AValue;
end;

function TController.NomeCache: string;
begin
  Result := FNomeCache;
end;

function TController.ValidadeCache: Integer;
begin
  Result := FValidadeCache;
end;

function TController.ValidadeCache(const AValue: Integer): iIBGE;
begin
  Result := Self;
  FValidadeCache := AValue;
end;

function TController.ValidadeCache(const AValue: string): iIBGE;
begin
  Result := Self;

  if AValue.Trim.IsEmpty then
  begin
    FValidadeCache := 0;
    Exit;
  end;

  FValidadeCache := AValue.ToInteger;
end;

function TController.ValidadeCacheInStr: string;
begin
  Result := FValidadeCache.ToString;
end;

function TController.Finish: iController;
begin
  Result := Self;
end;

function TController.ForcarIBGE: Boolean;
begin
  Result := FForcarIBGE;
end;

function TController.ForcarIBGE(const AValue: Boolean): iCEP;
begin
  Result := Self;
  FForcarIBGE := AValue;
end;

function TController.GravarINI: iController;
begin
  Result := Self;

  if not Assigned(FINI) then
    FINI := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');

  FINI.WriteString('CONFIGURACAO_WEBSERVICE', 'Usuario', FUserWebService);
  FINI.WriteString('CONFIGURACAO_WEBSERVICE', 'Senha', FPassWebService);
  FINI.WriteString('CONFIGURACAO_WEBSERVICE', 'Chave', FChaveWebService);
  FINI.WriteInteger('CONFIGURACAO_WEBSERVICE', 'TimeOut', FTimeOutWebService);
  FINI.WriteBool('CONFIGURACAO_WEBSERVICE', 'ParseText', FParseTextWebService);
  FINI.WriteInteger('CONFIGURACAO_WEBSERVICE', 'Index', FIndexWebService);

  FINI.WriteString('CONFIGURACAO_PROXY', 'Host', FHostProxy);
  FINI.WriteInteger('CONFIGURACAO_PROXY', 'Porta', FPortProxy);
  FINI.WriteString('CONFIGURACAO_PROXY', 'Usuario', FUserProxy);
  FINI.WriteString('CONFIGURACAO_PROXY', 'Senha', FPassProxy);

  FINI.WriteBool('CONFIGURACAO_CEP', 'ForcarIBGE', FForcarIBGE);

  FINI.WriteBool('CONFIGURACAO_IBGE', 'CaseSensitive', FCaseSensitive);
  FINI.WriteString('CONFIGURACAO_IBGE', 'NomeCache', FNomeCache);
  FINI.WriteInteger('CONFIGURACAO_IBGE', 'ValidadeCache', FValidadeCache);

end;

function TController.Host: string;
begin
  Result := FHostProxy;
end;

function TController.Index(const AValue: Integer): iWebService;
begin
  Result := Self;
  FIndexWebService := AValue;
end;

function TController.IBGE: iIBGE;
begin
  Result := Self;
end;

function TController.Index: Integer;
begin
  Result := FIndexWebService;
end;

function TController.LerINI: iController;
begin
  Result := Self;

  if not Assigned(FINI) then
    FINI := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');


  FUserWebService := FINI.ReadString('CONFIGURACAO_WEBSERVICE', 'Usuario', EmptyStr);
  FPassWebService := FINI.ReadString('CONFIGURACAO_WEBSERVICE', 'Senha', EmptyStr);
  FChaveWebService := FINI.ReadString('CONFIGURACAO_WEBSERVICE', 'Chave', EmptyStr);
  FTimeOutWebService := FINI.ReadInteger('CONFIGURACAO_WEBSERVICE', 'TimeOut', 0);
  FParseTextWebService := FINI.ReadBool('CONFIGURACAO_WEBSERVICE', 'ParseText', True);
  FIndexWebService := FINI.ReadInteger('CONFIGURACAO_WEBSERVICE', 'Index', 0);

  FHostProxy := FINI.ReadString('CONFIGURACAO_PROXY', 'Host', EmptyStr);
  FPortProxy := FINI.ReadInteger('CONFIGURACAO_PROXY', 'Porta', 0);
  FUserProxy := FINI.ReadString('CONFIGURACAO_PROXY', 'Usuario', EmptyStr);
  FPassProxy := FINI.ReadString('CONFIGURACAO_PROXY', 'Senha', EmptyStr);

  FForcarIBGE := FINI.ReadBool('CONFIGURACAO_CEP', 'ForcarIBGE', True);

  FCaseSensitive := FINI.ReadBool('CONFIGURACAO_IBGE', 'CaseSensitive', False);
  FNomeCache := FINI.ReadString('CONFIGURACAO_IBGE', 'NomeCache', EmptyStr);
  FValidadeCache := FINI.ReadInteger('CONFIGURACAO_IBGE', 'ValidadeCache', 0);

end;

function TController.Host(const AValue: string): iProxy;
begin
  Result := Self;
  FHostProxy := AValue;
end;

class function TController.New: iController;
begin
  Result:= Self.Create;
end;

function TController.ParseText(const AValue: Boolean): iWebService;
begin
  Result := Self;
  FParseTextWebService := AValue;
end;

function TController.ParseText: Boolean;
begin
  Result := FParseTextWebService;
end;

function TController.Pass: string;
begin
  Result := FPassProxy;
end;

function TController.PassW: string;
begin
  Result := FPassWebService;
end;

function TController.PassW(const AValue: string): iWebService;
begin
  Result := Self;
  FPassWebService := AValue;
end;

function TController.Pass(const AValue: string): iProxy;
begin
  Result := Self;
  FPassProxy := AValue;
end;

function TController.Pasta(const AValue: string): iController;
begin
  Result := Self;

  if Assigned(FINI) then
    FINI.Free;

  FINI := TIniFile.Create(AValue);
end;

function TController.Port: Integer;
begin
  Result := FPortProxy;
end;

function TController.Port(const AValue: Integer): iProxy;
begin
  Result := Self;
  FPortProxy := AValue;
end;

function TController.Port(const AValue: string): iProxy;
begin
  Result := Self;

  if AValue.Trim.IsEmpty then
  begin
    FPortProxy := 0;
    Exit;
  end;

  FPortProxy := AValue.ToInteger;
end;

function TController.PortInStr: string;
begin
  Result := FPortProxy.ToString;
end;

function TController.Proxy: iProxy;
begin
  Result := Self;
end;

function TController.TimeOut: Integer;
begin
   Result := FTimeOutWebService;
end;

function TController.TimeOutInStr: string;
begin
  Result := FTimeOutWebService.ToString;
end;

function TController.TimeOut(const AValue: string): iWebService;
begin
  Result := Self;

  if AValue.Trim.IsEmpty then
  begin
    FTimeOutWebService := 0;
    Exit;
  end;

  FTimeOutWebService := AValue.ToInteger;
end;

function TController.TimeOut(const AValue: Integer): iWebService;
begin
  Result := Self;
  FTimeOutWebService := AValue;
end;

function TController.User: string;
begin
  Result := FUserProxy;
end;

function TController.users: string;
begin
  Result := FUserWebService;
end;

function TController.users(const AValue: string): iWebService;
begin
  Result := Self;
  FUserWebService := AValue;
end;

function TController.WebService: iWebService;
begin
  Result := Self;
end;

function TController.User(const AValue: string): iProxy;
begin
  Result := Self;
  FUserProxy := AValue;
end;

end.