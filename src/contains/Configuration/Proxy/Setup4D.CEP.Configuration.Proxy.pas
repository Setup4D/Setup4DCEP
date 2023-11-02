unit Setup4D.CEP.Configuration.Proxy;

{$I Setup4DCEPLanguage.inc}

interface
uses
  Setup4D.CEP.Interf;

type
  TSetup4DCepConfigurationProxy = class(TInterfacedObject, ISetup4DCEPConfigurationProxy)
  private
    [weak]
    FParent : ISetup4DCEPConfiguration;
    FHost : string;
    FPort : integer;
    FUser : string;
    FPassword : string;
  protected
  
    function Host(Const AValue: string) : ISetup4DCEPConfigurationProxy; overload;
    function Port(Const AValue: string) : ISetup4DCEPConfigurationProxy; overload;
    function Port(Const AValue: integer) : ISetup4DCEPConfigurationProxy; overload;
    function User(Const AValue: string) : ISetup4DCEPConfigurationProxy; overload;
    function Password(Const AValue: string) : ISetup4DCEPConfigurationProxy; overload;

    function Host : string; overload;
    function Port : integer; overload;
    function PortInStr : string; overload;
    function User : string; overload;
    function Password : string; overload;

    function Finish: ISetup4DCEPConfiguration;


    Constructor Create(Const AValue: ISetup4DCEPConfiguration); overload;
  public
    Destructor Destroy; override;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Cria uma nova instância da interface `ISetup4DCEPConfigurationProxy`.
    /// </summary>
    /// <param name="AValue">
    /// A instância da interface `ISetup4DCEPConfiguration` que contém configurações relacionadas a um servidor proxy.
    /// </param>
    /// <returns>
    /// Uma nova instância da interface `ISetup4DCEPConfigurationProxy` associada à instância `AValue` da interface `ISetup4DCEPConfiguration`.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Creates a new instance of the `ISetup4DCEPConfigurationProxy` interface.
    /// </summary>
    /// <param name="AValue">
    /// The `ISetup4DCEPConfiguration` interface instance containing configurations related to a proxy server.
    /// </param>
    /// <returns>
    /// A new instance of the `ISetup4DCEPConfigurationProxy` interface associated with the `AValue` instance of the `ISetup4DCEPConfiguration` interface.
    /// </returns>
    {$ENDIF}
    class function New(Const AValue: ISetup4DCEPConfiguration): ISetup4DCEPConfigurationProxy; overload;
  end;

implementation

uses
  System.SysUtils;

constructor TSetup4DCepConfigurationProxy.Create(
  Const AValue: ISetup4DCEPConfiguration);
begin
  FParent := AValue;
end;

destructor TSetup4DCepConfigurationProxy.Destroy;
begin

  inherited;
end;

function TSetup4DCepConfigurationProxy.Finish: ISetup4DCEPConfiguration;
begin
  Result := FParent;
end;

function TSetup4DCepConfigurationProxy.Host: string;
begin
  Result := FHost;  
end;

function TSetup4DCepConfigurationProxy.Host(
  const AValue: string): ISetup4DCEPConfigurationProxy;
begin
  Result := Self;
  FHost := AValue;
end;

class function TSetup4DCepConfigurationProxy.New(
  Const AValue: ISetup4DCEPConfiguration): ISetup4DCEPConfigurationProxy;
begin
  Result := Self.Create(AValue);
end;

function TSetup4DCepConfigurationProxy.Password(
  const AValue: string): ISetup4DCEPConfigurationProxy;
begin
  Result := Self;
  FPassword := AValue;
end;

function TSetup4DCepConfigurationProxy.Password: string;
begin
  Result := FPassword;
end;

function TSetup4DCepConfigurationProxy.Port: integer;
begin
  Result := FPort;
end;

function TSetup4DCepConfigurationProxy.PortInStr: string;
begin
  Result := FPort.ToString;
end;

function TSetup4DCepConfigurationProxy.Port(
  const AValue: integer): ISetup4DCEPConfigurationProxy;
begin
  Result := Self;
  FPort := AValue;
end;

function TSetup4DCepConfigurationProxy.Port(
  const AValue: string): ISetup4DCEPConfigurationProxy;
begin
  Result := Self;
  try
    if AValue.Trim.IsEmpty then
      FPort := 0
    else
      FPort := AValue.ToInteger;
  except
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A porta informada não corresponde a um número');
    {$ELSE}
    raise EConvertError.Create('The port provided does not correspond to a number.');
    {$ENDIF}
  end;
end;

function TSetup4DCepConfigurationProxy.User(
  const AValue: string): ISetup4DCEPConfigurationProxy;
begin
  Result := Self;
  FUser := AValue;
end;

function TSetup4DCepConfigurationProxy.User: string;
begin
  Result := FUser;
end;

end.
