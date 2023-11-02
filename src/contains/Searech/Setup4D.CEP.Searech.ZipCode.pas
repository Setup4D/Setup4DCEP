unit Setup4D.CEP.Searech.ZipCode;

{$I Setup4DCEPLanguage.inc}

interface

uses
  ACBrCEP,

  Setup4D.CEP.Interf,

  System.Classes;

type
  TSetup4DCEPSearechZipCode = class(TInterfacedObject, ISetup4DCEPSearechZipCode)
  private
    [weak]
    FParent : ISetup4DCEPSearech;
    FConfiguration : ISetup4DCEPConfiguration;
    FFilter: ISetup4DCEPFilter;
    FACBrCEP: TACBrCEP;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Inicia a configuração para execução do CEP.
    /// </summary>
    {$ELSE}
    /// <summary>
    /// Starts the configuration for CEP execution.
    /// </summary>
    {$ENDIF}
    procedure StartConfiguration;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Configuração inicial do proxy para execução do CEP.
    /// </summary>
    {$ELSE}
    /// <summary>
    /// Initial proxy configuration for CEP execution.
    /// </summary>
    {$ENDIF}
    procedure StartConfigurationProxy;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Configuração inicial do Web Service para execução do CEP.
    /// </summary>
    {$ELSE}
    /// <summary>
    /// Initial Web Service configuration for CEP execution.
    /// </summary>
    {$ENDIF}
    procedure StartConfigurationWebService;
  protected

    function Reconfiguration: ISetup4DCEPSearechZipCode;

    function Code : ISetup4DCEPSearechZipCode;
    function Address : ISetup4DCEPSearechZipCode;

    function Component : TComponent;

    function Finish: ISetup4DCEPSearech;

    Constructor Create(const AValue: ISetup4DCEPSearech;
      Const AConfiguration: ISetup4DCEPConfiguration;
      Const ASearch: ISetup4DCEPFilter); overload;

  public

    Destructor Destroy; override;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Cria uma nova instância de execução do CEP.
    /// </summary>
    /// <param name="AValue">
    /// A instância pai ISetup4DCEPSearech.
    /// </param>
    /// <param name="AConfiguration">
    /// A instância de configuração, ISetup4DCEPConfiguration.
    /// </param>
    /// <param name="ASearch">
    /// A instância de pesquisa, ISetup4DCEPFilter.
    /// </param>
    /// <returns>
    /// A nova instância de execução do CEP.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Creates a new instance of ZIP Code execution.
    /// </summary>
    /// <param name="AValue">
    /// The parent instance (ISetup4DCEPSearech).
    /// </param>
    /// <param name="AConfiguration">
    /// The configuration instance (ISetup4DCEPConfiguration).
    /// </param>
    /// <param name="ASearch">
    /// The search instance (ISetup4DCEPFilter).
    /// </param>
    /// <returns>
    /// The new instance of ZIP Code execution.
    /// </returns>
    {$ENDIF}
    class function New(const AValue: ISetup4DCEPSearech;
      Const AConfiguration: ISetup4DCEPConfiguration;
      Const ASearch: ISetup4DCEPFilter): ISetup4DCEPSearechZipCode; overload;
  end;

implementation

uses
  System.SysUtils;

function TSetup4DCEPSearechZipCode.Component: TComponent;
begin
  Result := TComponent(FACBrCEP);
end;

constructor TSetup4DCEPSearechZipCode.Create(const AValue: ISetup4DCEPSearech;
  const AConfiguration: ISetup4DCEPConfiguration;
  const ASearch: ISetup4DCEPFilter);
begin
  FParent := AValue;
  FConfiguration := AConfiguration;
  FFilter := ASearch;

  StartConfiguration;
end;

destructor TSetup4DCEPSearechZipCode.Destroy;
begin
  FACBrCEP.DisposeOf;

  inherited;
end;

function TSetup4DCEPSearechZipCode.Address: ISetup4DCEPSearechZipCode;
begin
  Result := Self;
  try
    if FFilter.ZipCode.Address.Types.Trim.IsEmpty then
      {$IFDEF HAS_PORTUGUES}
      raise Exception.Create('Nenhuma Tipo foi informado.');
      {$ELSE}
      raise Exception.Create('No Type has been provided.');
      {$ENDIF}

    if FFilter.ZipCode.Address.Street.Trim.IsEmpty then
      {$IFDEF HAS_PORTUGUES}
      raise Exception.Create('Nenhuma Rua foi informado.');
      {$ELSE}
      raise Exception.Create('No Street has been provided.');
      {$ENDIF}

    if FFilter.ZipCode.Address.City.Trim.IsEmpty then
      {$IFDEF HAS_PORTUGUES}
      raise Exception.Create('Nenhuma Cidade foi informado.');
      {$ELSE}
      raise Exception.Create('No City has been provided.');
      {$ENDIF}

    if FFilter.ZipCode.Address.District.Trim.IsEmpty then
      {$IFDEF HAS_PORTUGUES}
      raise Exception.Create('Nenhuma Bairro foi informado.');
      {$ELSE}
      raise Exception.Create('No District has been provided.');
      {$ENDIF}

    if FFilter.ZipCode.Address.StateAbbreviated.Trim.IsEmpty then
      {$IFDEF HAS_PORTUGUES}
      raise Exception.Create('Nenhuma UF foi informado.');
      {$ELSE}
      raise Exception.Create('No State has been provided.');
      {$ENDIF}

    var LTotal : Integer;

    LTotal := FACBrCEP.BuscarPorLogradouro(FFilter.ZipCode.Address.City,
                                           FFilter.ZipCode.Address.Types,
                                           FFilter.ZipCode.Address.Street,
                                           FFilter.ZipCode.Address.StateAbbreviated,
                                           FFilter.ZipCode.Address.District);

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
    else if E.Message.Contains('não implementa o método') then
      {$IFDEF HAS_PORTUGUES}
      raise EConvertError.Create('Método não implementado nesta API')
      {$ELSE}
      raise EConvertError.Create('Method not implemented in this API.')
      {$ENDIF}
    else if E.Message.Contains('400 Bad Request') then
      {$IFDEF HAS_PORTUGUES}
      raise EConvertError.Create('O método não está implementado nesta API. Portanto, não é possível processar a informação')
      {$ELSE}
      raise EConvertError.Create('The method is not implemented in this API. Therefore, it''s not possible to process the information.')
      {$ENDIF}
    else if E.Message.Contains('não encontrada') then
      {$IFDEF HAS_PORTUGUES}
      raise EConvertError.Create('Dados não localizados na base de dados da API')
      {$ELSE}
      raise EConvertError.Create('Data not found in the API''s database.')
      {$ENDIF}
    else
      raise EConvertError.Create(E.Message);
  end;
end;

function TSetup4DCEPSearechZipCode.Code: ISetup4DCEPSearechZipCode;
begin
  Result := Self;
  try
    if FFilter.ZipCode.Key.Value.Trim.IsEmpty then
      {$IFDEF HAS_PORTUGUES}
      raise Exception.Create('Nenhum CEP foi informado.');
      {$ELSE}
      raise Exception.Create('No ZIP Code has been provided.');
      {$ENDIF}

    if not (FFilter.ZipCode.Key.Value.Trim.Length = 8) then
      {$IFDEF HAS_PORTUGUES}
      raise Exception.Create('O CEP informado, "' + FFilter.ZipCode.Key.Value + '", é inválido.');
      {$ELSE}
      raise Exception.Create('The provided ZIP code, "' + FFilter.ZipCode.Key.Value + '", is invalid.');
      {$ENDIF}


    var LTotal : Int64;
    LTotal := FACBrCEP.BuscarPorCEP(FFilter.ZipCode.Key.Value);

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
    else if E.Message.Contains('400 Bad Request') then
      {$IFDEF HAS_PORTUGUES}
      raise EConvertError.Create('O método não está implementado nesta API. Portanto, não é possível processar a informação')
      {$ELSE}
      raise EConvertError.Create('The method is not implemented in this API. Therefore, it''s not possible to process the information.')
      {$ENDIF}
    else
      raise EConvertError.Create(E.Message);
  end;
end;

function TSetup4DCEPSearechZipCode.Finish: ISetup4DCEPSearech;
begin
  Result := FParent;
end;

function TSetup4DCEPSearechZipCode.Reconfiguration: ISetup4DCEPSearechZipCode;
begin
  Result := Self;
  StartConfigurationProxy;
  StartConfigurationWebService;
end;

procedure TSetup4DCEPSearechZipCode.StartConfiguration;
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

  FACBrCEP:= TACBrCEP.Create(Nil);

  StartConfigurationProxy;
  StartConfigurationWebService;
end;

procedure TSetup4DCEPSearechZipCode.StartConfigurationProxy;
begin
  FACBrCEP.ProxyHost := FConfiguration.Proxy.Host;
  FACBrCEP.ProxyUser := FConfiguration.Proxy.User;
  FACBrCEP.ProxyPass := FConfiguration.Proxy.Password;

  if FConfiguration.Proxy.Port > 0 then
    FACBrCEP.ProxyPort := FConfiguration.Proxy.PortInStr;
end;

procedure TSetup4DCEPSearechZipCode.StartConfigurationWebService;
begin
  FACBrCEP.ChaveAcesso := FConfiguration.WebService.ZipCode.Key;
  FACBrCEP.Usuario := FConfiguration.WebService.ZipCode.User;
  FACBrCEP.Senha := FConfiguration.WebService.ZipCode.Password;
  FACBrCEP.TimeOut := FConfiguration.WebService.TimeOut;
  FACBrCEP.PesquisarIBGE := FConfiguration.WebService.ZipCode.ReturnIBGE;
  FACBrCEP.ParseText := FConfiguration.WebService.ParseText;

  case FConfiguration.WebService.ZipCode.Index of
    1: FACBrCEP.WebService := TACBrCEPWebService.wsBuscarCep;
    2: FACBrCEP.WebService := TACBrCEPWebService.wsCepLivre;
    3: FACBrCEP.WebService := TACBrCEPWebService.wsRepublicaVirtual;
    4: FACBrCEP.WebService := TACBrCEPWebService.wsBases4you;
    5: FACBrCEP.WebService := TACBrCEPWebService.wsRNSolucoes;
    6: FACBrCEP.WebService := TACBrCEPWebService.wsKingHost;
    7: FACBrCEP.WebService := TACBrCEPWebService.wsByJG;
    8: FACBrCEP.WebService := TACBrCEPWebService.wsCorreios;
    9: FACBrCEP.WebService := TACBrCEPWebService.wsDevMedia;
    10: FACBrCEP.WebService := TACBrCEPWebService.wsViaCep;
    11: FACBrCEP.WebService := TACBrCEPWebService.wsCorreiosSIGEP;
    12: FACBrCEP.WebService := TACBrCEPWebService.wsCepAberto;
    13: FACBrCEP.WebService := TACBrCEPWebService.wsWSCep;
    14: FACBrCEP.WebService := TACBrCEPWebService.wsOpenCep;
    15: FACBrCEP.WebService := TACBrCEPWebService.wsBrasilAPI;
  else
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('O Web Service informado não está disponível ou não existe.');
    {$ELSE}
    raise EConvertError.Create('The provided Web Service is not available or does not exist.');
    {$ENDIF}
  end;

end;

class function TSetup4DCEPSearechZipCode.New(const AValue: ISetup4DCEPSearech;
  const AConfiguration: ISetup4DCEPConfiguration;
  const ASearch: ISetup4DCEPFilter): ISetup4DCEPSearechZipCode;
begin
  Result := Self.Create(AValue, AConfiguration, ASearch);
end;

end.
