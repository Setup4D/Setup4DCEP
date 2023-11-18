unit Setup4D.CEP.Searech.IBGE;

{$I Setup4DCEPLanguage.inc}

interface

uses
  Setup4D.CEP.Interf,

  ACBrIBGE,

  System.Classes;


type
  TSetup4DCEPSearechIBGE = class(TInterfacedObject, ISetup4DCEPSearechIBGE)
  private
    [weak]
    FParent: ISetup4DCEPSearech;
    FConfiguration: ISetup4DCEPConfiguration;
    FACBrIBGE: TACBrIBGE;
    FFilter: ISetup4DCEPFilter;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Inicia a configuração para execução do IBGE.
    /// </summary>
    {$ELSE}
    /// <summary>
    /// Starts the configuration for IBGE execution.
    /// </summary>
    {$ENDIF}
    procedure StartConfiguration;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Configuração inicial do proxy para execução do IBGE.
    /// </summary>
    {$ELSE}
    /// <summary>
    /// Initial proxy configuration for IBGE execution.
    /// </summary>
    {$ENDIF}
    procedure StartConfigurationProxy;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Configuração inicial do cache para execução do IBGE.
    /// </summary>
    {$ELSE}
    /// <summary>
    /// Initial cache configuration for IBGE execution.
    /// </summary>
    {$ENDIF}
    procedure StartConfigurationCache;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Configuração para sensibilidade de caracteres na pesquisa.
    /// </summary>
    {$ELSE}
    /// <summary>
    /// Character sensitivity configuration in the search.
    /// </summary>
    {$ENDIF}
    procedure StartConfigurationCaseSensitive;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Configuração do servidor web para pesquisa.
    /// </summary>
    {$ELSE}
    /// <summary>
    /// Web server configuration for searching.
    /// </summary>
    {$ENDIF}
    procedure StartConfigurationWebService;
 protected

    function Reconfiguration: ISetup4DCEPSearechIBGE;

    function Code : ISetup4DCEPSearechIBGE;
    function State : ISetup4DCEPSearechIBGE;
    function City : ISetup4DCEPSearechIBGE;

    function Component : TComponent;

    function Finish: ISetup4DCEPSearech;

    Constructor Create(const AValue: ISetup4DCEPSearech;
      Const AConfiguration: ISetup4DCEPConfiguration;
      Const ASearch: ISetup4DCEPFilter); overload;
  public

    Destructor Destroy; override;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Cria uma nova instância de execução do IBGE.
    /// </summary>
    /// <param name="AValue">
    /// A instância pai.
    /// </param>
    /// <param name="AConfiguration">
    /// A instância de configuração.
    /// </param>
    /// <param name="ASearch">
    /// A instância de pesquisa.
    /// </param>
    /// <returns>
    /// A nova instância de execução do IBGE.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Creates a new instance of IBGE execution.
    /// </summary>
    /// <param name="AValue">
    /// The parent instance.
    /// </param>
    /// <param name="AConfiguration">
    /// The configuration instance.
    /// </param>
    /// <param name="ASearch">
    /// The search instance.
    /// </param>
    /// <returns>
    /// The new instance of IBGE execution.
    /// </returns>
    {$ENDIF}
    class function New(const AValue: ISetup4DCEPSearech;
      Const AConfiguration: ISetup4DCEPConfiguration;
      Const ASearch: ISetup4DCEPFilter): ISetup4DCEPSearechIBGE; overload;
  end;

implementation

uses
  System.SysUtils;

function TSetup4DCEPSearechIBGE.Component: TComponent;
begin
  Result := TComponent(FACBrIBGE);
end;

constructor TSetup4DCEPSearechIBGE.Create(const AValue: ISetup4DCEPSearech;
  Const AConfiguration: ISetup4DCEPConfiguration;
  Const ASearch: ISetup4DCEPFilter);
begin
  FParent := AValue;
  FConfiguration := AConfiguration;
  FFilter := ASearch;
  StartConfiguration;
end;

destructor TSetup4DCEPSearechIBGE.Destroy;
begin
  if Assigned(FACBrIBGE) then
    FACBrIBGE.DisposeOf;

  inherited;
end;

function TSetup4DCEPSearechIBGE.City: ISetup4DCEPSearechIBGE;
begin
  Result := Self;
  try
    if FFilter.IBGE.Address.StateAbbreviated.Trim.IsEmpty then
      {$IFDEF HAS_PORTUGUES}
      raise Exception.Create('Nenhuma UF foi informado.');
      {$ELSE}
      raise Exception.Create('No State has been provided.');
      {$ENDIF}

    if FFilter.IBGE.Address.City.Trim.IsEmpty then
      {$IFDEF HAS_PORTUGUES}
      raise Exception.Create('Nenhuma Cidade foi informado.');
      {$ELSE}
      raise Exception.Create('No City has been provided.');
      {$ENDIF}

    var LTotal : Integer;
    LTotal := FACBrIBGE.BuscarPorNome(FFilter.IBGE.Address.City, FFilter.IBGE.Address.StateAbbreviated);

   if LTotal < 1 then
      {$IFDEF HAS_PORTUGUES}
      raise Exception.Create('Nenhum dado foi encontrado.');
      {$ELSE}
      raise Exception.Create('No data was found.');
      {$ENDIF}

  except on E: Exception do
    if E.Message.Contains('Error loading OpenSSL lib') then
      {$IFDEF HAS_PORTUGUES}
      raise EConvertError.Create('As DLLs da OpenSSL estão ausentes no computador.')
      {$ELSE}
      raise EConvertError.Create('The OpenSSL DLLs are missing on the computer.')
      {$ENDIF}
    else if E.Message.Contains('Código do Município deve ser informado') then
      {$IFDEF HAS_PORTUGUES}
      raise EConvertError.Create(E.Message)
      {$ELSE}
      raise EConvertError.Create('The Municipality code must be provided.')
      {$ENDIF}
    else if E.Message.Contains('400 Bad Request') then
      {$IFDEF HAS_PORTUGUES}
      raise EConvertError.Create('Não é possível processar a informação')
      {$ELSE}
      raise EConvertError.Create('it''s not possible to process the information.')
      {$ENDIF}
    else
      raise EConvertError.Create(E.Message);
  end;
end;

function TSetup4DCEPSearechIBGE.Code: ISetup4DCEPSearechIBGE;
begin
  Result := Self;
  try
    if FFilter.IBGE.Key.Value.Trim.IsEmpty then
      {$IFDEF HAS_PORTUGUES}
      raise Exception.Create('Nenhum código foi informado.');
      {$ELSE}
      raise Exception.Create('No code has been provided.');
      {$ENDIF}

    var LTotal : Integer;
    LTotal :=  FACBrIBGE.BuscarPorCodigo(StrToIntDef(FFilter.IBGE.Key.Value, 0));

    if LTotal < 1 then
      {$IFDEF HAS_PORTUGUES}
      raise Exception.Create('Nenhum dado foi encontrado.');
      {$ELSE}
      raise Exception.Create('No data was found.');
      {$ENDIF}

  except on E: Exception do
    if E.Message.Contains('Error loading OpenSSL lib') then
      {$IFDEF HAS_PORTUGUES}
      raise EConvertError.Create('As DLLs da OpenSSL estão ausentes no computador.')
      {$ELSE}
      raise EConvertError.Create('The OpenSSL DLLs are missing on the computer.')
      {$ENDIF}
    else if E.Message.Contains('Código do Município deve ser informado') then
      {$IFDEF HAS_PORTUGUES}
      raise EConvertError.Create(E.Message)
      {$ELSE}
      raise EConvertError.Create('The Municipality code must be provided.')
      {$ENDIF}
    else if E.Message.Contains('400 Bad Request') then
      {$IFDEF HAS_PORTUGUES}
      raise EConvertError.Create('Não é possível processar a informação')
      {$ELSE}
      raise EConvertError.Create('it''s not possible to process the information.')
      {$ENDIF}
    else
      raise EConvertError.Create(E.Message);
  end;
end;

function TSetup4DCEPSearechIBGE.State: ISetup4DCEPSearechIBGE;
begin
  Result := Self;
  try
    if FFilter.IBGE.Address.StateAbbreviated.Trim.IsEmpty then
      {$IFDEF HAS_PORTUGUES}
      raise Exception.Create('Nenhuma UF foi informado.');
      {$ELSE}
      raise Exception.Create('No State has been provided.');
      {$ENDIF}

    var LTotal : Integer;
    LTotal := FACBrIBGE.BuscarPorUF(FFilter.IBGE.Address.StateAbbreviated);

    if LTotal < 1 then
      {$IFDEF HAS_PORTUGUES}
      raise Exception.Create('Nenhum dado foi encontrado.');
      {$ELSE}
      raise Exception.Create('No data was found.');
      {$ENDIF}

  except on E: Exception do
    if E.Message.Contains('Error loading OpenSSL lib') then
      {$IFDEF HAS_PORTUGUES}
      raise EConvertError.Create('As DLLs da OpenSSL estão ausentes no computador.')
      {$ELSE}
      raise EConvertError.Create('The OpenSSL DLLs are missing on the computer.')
      {$ENDIF}
    else if E.Message.Contains('Código do Município deve ser informado') then
      {$IFDEF HAS_PORTUGUES}
      raise EConvertError.Create(E.Message)
      {$ELSE}
      raise EConvertError.Create('The Municipality code must be provided.')
      {$ENDIF}
    else if E.Message.Contains('400 Bad Request') then
      {$IFDEF HAS_PORTUGUES}
      raise EConvertError.Create('Não é possível processar a informação')
      {$ELSE}
      raise EConvertError.Create('it''s not possible to process the information.')
      {$ENDIF}
    else
      raise EConvertError.Create(E.Message);
  end;

end;

function TSetup4DCEPSearechIBGE.Finish: ISetup4DCEPSearech;
begin
  Result := FParent;
end;

procedure TSetup4DCEPSearechIBGE.StartConfiguration;
begin
  FACBrIBGE := TACBrIBGE.Create(nil);

  StartConfigurationProxy;
  StartConfigurationWebService;
  StartConfigurationCache;
  StartConfigurationCaseSensitive;
end;

procedure TSetup4DCEPSearechIBGE.StartConfigurationCache;
begin
  FACBrIBGE.CacheArquivo := FConfiguration.WebService.IBGE.CacheName;
  FACBrIBGE.CacheDiasValidade := FConfiguration.WebService.IBGE.CacheValidity;
end;

procedure TSetup4DCEPSearechIBGE.StartConfigurationCaseSensitive;
begin
  FACBrIBGE.IgnorarCaixaEAcentos := not FConfiguration.WebService.IBGE.CaseSensitive;
end;

procedure TSetup4DCEPSearechIBGE.StartConfigurationWebService;
begin
  FACBrIBGE.ParseText := FConfiguration.WebService.ParseText;
  FACBrIBGE.TimeOut := FConfiguration.WebService.TimeOut;
end;

procedure TSetup4DCEPSearechIBGE.StartConfigurationProxy;
begin
  if FConfiguration = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe de configuração não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('The configuration class has not been instantiated.');
    {$ENDIF}

  if FFilter = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe de pesquisa não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('The search class has not been instantiated.');
    {$ENDIF}

  FACBrIBGE.ProxyHost := FConfiguration.Proxy.Host;
  FACBrIBGE.ProxyUser := FConfiguration.Proxy.User;
  FACBrIBGE.ProxyPass := FConfiguration.Proxy.Password;

  if FConfiguration.Proxy.Port > 0 then
    FACBrIBGE.ProxyPort := FConfiguration.Proxy.PortInStr;
end;

class function TSetup4DCEPSearechIBGE.New(const AValue: ISetup4DCEPSearech;
  Const AConfiguration: ISetup4DCEPConfiguration;
  Const ASearch: ISetup4DCEPFilter): ISetup4DCEPSearechIBGE;
begin
  Result := Self.Create(AValue, AConfiguration, ASearch);
end;

function TSetup4DCEPSearechIBGE.Reconfiguration: ISetup4DCEPSearechIBGE;
begin
  Result := Self;
  StartConfigurationProxy;
  StartConfigurationWebService;
  StartConfigurationCache;
  StartConfigurationCaseSensitive;
end;

end.
