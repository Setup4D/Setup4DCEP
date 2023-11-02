unit Setup4D.CEP.Configuration.WebService.IBGE;

 {$I Setup4DCEPLanguage.inc}

interface

uses
  Setup4D.CEP.Interf;

type
  TSetup4DCepConfigurationWebServiceIBGE = class(TInterfacedObject, ISetup4DCEPConfigurationWebServiceIBGE)
  private
    [weak]
    FParent : ISetup4DCEPConfigurationWebService;
    FCacheName : string;
    FCacheValidity : Integer;
    FCaseSensitive : Boolean;

  protected

    function CacheName(Const AValue: string): ISetup4DCEPConfigurationWebServiceIBGE; overload;
    function CacheName: string; overload;

    function CacheValidity (Const AValue: Integer) : ISetup4DCEPConfigurationWebServiceIBGE; overload;
    function CacheValidity (Const AValue: string) : ISetup4DCEPConfigurationWebServiceIBGE; overload;
    function CacheValidity : Integer; overload;
    function CacheValidityInStr : string; overload;

    function CacheClear : ISetup4DCEPConfigurationWebServiceIBGE;

    function CaseSensitive(Const AValue: Boolean) : ISetup4DCEPConfigurationWebServiceIBGE;  overload;
    function CaseSensitive : Boolean;  overload;

    function Finish: ISetup4DCEPConfigurationWebService;

    Constructor Create(const AValue: ISetup4DCEPConfigurationWebService); overload;
  public

    Destructor Destroy; override;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Cria uma nova instância de configurações relacionadas ao serviço web de consulta de CEP para códigos IBGE.
    /// </summary>
    /// <remarks>
    /// Esta instância é usada para configurar opções específicas para consultas de CEP com códigos IBGE.
    /// </remarks>
    /// <returns>
    /// A interface para configuração do serviço web de consulta de CEP para códigos IBGE.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Creates a new instance of settings related to the web service for ZIP code lookup with IBGE codes.
    /// </summary>
    /// <remarks>
    /// This instance is used to configure specific options for ZIP code lookup with IBGE codes.
    /// </remarks>
    /// <returns>
    /// The interface for configuring the web service for ZIP code lookup with IBGE codes.
    /// </returns}
    {$ENDIF}
    class function New(const AValue: ISetup4DCEPConfigurationWebService): ISetup4DCEPConfigurationWebServiceIBGE; overload;
  end;

implementation
uses
  System.SysUtils;

function TSetup4DCepConfigurationWebServiceIBGE.CacheName(
  const AValue: string): ISetup4DCEPConfigurationWebServiceIBGE;
begin
  Result := Self;
  FCacheName := AValue;
end;

function TSetup4DCepConfigurationWebServiceIBGE.CacheClear: ISetup4DCEPConfigurationWebServiceIBGE;
begin
  Result := Self;

  if FileExists(FCacheName) then
    DeleteFile(FCacheName);
end;

function TSetup4DCepConfigurationWebServiceIBGE.CacheName: string;
begin
  Result := FCacheName;
end;

function TSetup4DCepConfigurationWebServiceIBGE.CacheValidity: Integer;
begin
  Result := FCacheValidity;
end;

function TSetup4DCepConfigurationWebServiceIBGE.CacheValidity(
  const AValue: string): ISetup4DCEPConfigurationWebServiceIBGE;
begin
  Result := Self;

  try
    if AValue.Trim.IsEmpty then
      FCacheValidity := 0
    else
      FCacheValidity := AValue.ToInteger;
  except
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A porta informada não corresponde a um número');
    {$ELSE}
    raise EConvertError.Create('The port provided does not correspond to a number.');
    {$ENDIF}
  end;

end;

function TSetup4DCepConfigurationWebServiceIBGE.CacheValidity(
  const AValue: Integer): ISetup4DCEPConfigurationWebServiceIBGE;
begin
  Result := Self;
  FCacheValidity := AValue;
end;

function TSetup4DCepConfigurationWebServiceIBGE.CacheValidityInStr: string;
begin
  Result := FCacheValidity.ToString;
end;

function TSetup4DCepConfigurationWebServiceIBGE.CaseSensitive: Boolean;
begin
  Result := FCaseSensitive;
end;

function TSetup4DCepConfigurationWebServiceIBGE.CaseSensitive(
  const AValue: Boolean): ISetup4DCEPConfigurationWebServiceIBGE;
begin
  Result := Self;
  FCaseSensitive := AValue;
end;

constructor TSetup4DCepConfigurationWebServiceIBGE.Create(const AValue: ISetup4DCEPConfigurationWebService);
begin
  FParent := AValue;
  FCacheName := 'Setup4DCacheWSIBGE.txt';
  FCacheValidity := 0;
  FCaseSensitive := False;
end;

destructor TSetup4DCepConfigurationWebServiceIBGE.Destroy;
begin

  inherited;
end;

function TSetup4DCepConfigurationWebServiceIBGE.Finish: ISetup4DCEPConfigurationWebService;
begin
  Result := FParent;
end;

class function TSetup4DCepConfigurationWebServiceIBGE.New(const AValue: ISetup4DCEPConfigurationWebService): ISetup4DCEPConfigurationWebServiceIBGE;
begin
  Result:= Self.Create(AValue);
end;

end.
