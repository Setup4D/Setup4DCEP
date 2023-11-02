unit Setup4D.CEP.Interf;

{$I Setup4DCEPLanguage.inc}

interface

uses
  Setup4D.Utility.Enum,

  System.Classes,
  System.JSON;

type
  ISetup4DCEP = interface;
  ISetup4DCEPConfiguration = interface;
  ISetup4DCEPConfigurationWebService = interface;
  ISetup4DCEPConfigurationWebServiceZIPCode = interface;
  ISetup4DCEPConfigurationWebServiceIBGE = interface;
  ISetup4DCEPConfigurationProxy = interface;
  ISetup4DCEPFilter = interface;
  ISetup4DCEPFilterZipCode = interface;
  ISetup4DCEPFilterZipCodeKey = interface;
  ISetup4DCEPFilterZipCodeAddress = interface;
  ISetup4DCEPFilterIBGE = interface;
  ISetup4DCEPFilterIBGEKey = interface;
  ISetup4DCEPFilterIBGEAddress = interface;
  ISetup4DCEPSearech = interface;
  ISetup4DCEPSearechZipCode = interface;
  ISetup4DCEPSearechIBGE = interface;
  ISetup4DCEPResult = interface;
  ISetup4DCEPResultZipCode = interface;
  iSetup4DCEPResultZipCodeDisplay = interface;
  ISetup4DCEPResultIBGE = interface;
  iSetup4DCEPResultIBGEDisplay = interface;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Interface que define a utilização do framework de pesquisa de CEP.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Interface defining the utilization of the ZIP code lookup framework.
  /// </summary>
  {$ENDIF}
  ISetup4DCEP = interface
    ['{523CC036-5158-4DB3-AA84-D7981A40CA6A}']

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define a configuração de pesquisa de CEP.
    /// </summary>
    /// <returns>
    /// Interface de configuração.
    /// </returns>
    /// <remarks>
    /// Este método configura o web service de pesquisa do cep.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Specifies the configuration for ZIP code lookup.
    /// </summary>
    /// <remarks>
    /// This method configures the ZIP code lookup web service.
    /// </remarks>
    {$ENDIF}
    function Configuration : ISetup4DCEPConfiguration;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define o filtro.
    /// </summary>
    /// <returns>
    /// Interface de pesquisa.
    /// </returns>
    /// <remarks>
    /// Este método configura a pesquisa do cep e do IBGE.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Specifies the Filter.
    /// </summary>
    /// <returns>
    /// Filter interface.
    /// </returns>
    /// <remarks>
    /// This method configures the ZIP code and IBGE code lookup.
    /// </remarks>
    {$ENDIF}
    function Filter : ISetup4DCEPFilter;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Especifica módulo a ser pesquisado.
    /// </summary>
    /// <returns>
    /// Interface de execução do módulo.
    /// </returns>
    /// <remarks>
    /// Este método executa o módulo de para pesquisa do IBGE ou CEP.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Specifies the module to be searech.
    /// </summary>
    /// <returns>
    /// Interface for module execution.
    /// </returns>
    /// <remarks>
    /// This method executes the module for IBGE or ZIP code lookup.
    /// </remarks>
    {$ENDIF}
    function Searech : ISetup4DCEPSearech;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Especifica o formato do resultado a ser exibido.
    /// </summary>
    /// <returns>
    /// Interface de resultado.
    /// </returns>
    /// <remarks>
    /// Este método retorna o resultado da pesquisa do cep e do IBGE.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Specifies the format of the displayed result.
    /// </summary>
    /// <returns>
    /// result interface.
    /// </returns>
    /// <remarks>
    /// This method returns the result of the ZIP code and IBGE code lookup.
    /// </remarks>
    {$ENDIF}
    function Result : ISetup4DCEPResult;

  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Interface que define a configuração do framework de pesquisa de CEP.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Interface defining the configuration of the ZIP code lookup framework.
  /// </summary>
  {$ENDIF}
  ISetup4DCEPConfiguration = interface
    ['{FCAE9FB8-E627-4315-A04F-6A4A2328FC4C}']

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define a configuração do web service
    /// </summary>
    /// <returns>
    /// Interface de configuração do web service.
    /// </returns>
    /// <remarks>
    /// Este método configura o web service de pesquisa do CEP.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Specifies the configuration of the web service.
    /// </summary>
    /// <returns>
    /// Web service configuration interface.
    /// </returns>
    /// <remarks>
    /// This method configures the ZIP code lookup web service.
    /// </remarks>
    {$ENDIF}
    function WebService:ISetup4DCEPConfigurationWebService;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define a configuração do proxy
    /// </summary>
    /// <returns>
    /// Interface de configuração do proxy.
    /// </returns>
    /// <remarks>
    /// Este método configura o proxy de pesquisa do CEP.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Specifies the configuration of the proxy.
    /// </summary>
    /// <returns>
    /// Proxy configuration interface.
    /// </returns>
    /// <remarks>
    /// This method configures the ZIP code lookup proxy.
    /// </remarks>
    {$ENDIF}
    function Proxy:ISetup4DCEPConfigurationProxy;


    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Conclui a configuração do framework de pesquisa de CEP.
    /// </summary>
    /// <returns>
    /// Uma interface do framework de pesquisa de CEP.
    /// </returns>
    /// <remarks>
    /// Este método finaliza a configuração do framework de pesquisa de CEP.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Finalizes the configuration of the ZIP code lookup framework.
    /// </summary>
    /// <returns>
    /// An interface for the ZIP code lookup framework.
    /// </returns>
    /// <remarks>
    /// This method completes the configuration of the ZIP code lookup framework.
    /// </remarks>
    {$ENDIF}
    function Finish: ISetup4DCEP;
  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Interface que define a pesquisa do framework de pesquisa de CEP.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Interface defining the search functionality of the ZIP code lookup framework.
  /// </summary>
  {$ENDIF}
  ISetup4DCEPFilter  = interface
    ['{1595A250-BAE8-4397-9D85-BC856D12B07F}']

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define a pesquisa por CEP
    /// </summary>
    /// <returns>
    /// Interface de pesquisa do CEP
    /// </returns>
    /// <remarks>
    /// Este método configura a pesquisa pelo CEP.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Specifies the ZIP code lookup.
    /// </summary>
    /// <returns>
    /// ZIP code lookup interface.
    /// </returns>
    /// <remarks>
    /// This method configures the ZIP code lookup.
    /// </remarks>
    {$ENDIF}
    function ZipCode:ISetup4DCEPFilterZipCode;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define a pesquisa por IBGE
    /// </summary>
    /// <returns>
    /// Interface de pesquisa do IBGE
    /// </returns>
    /// <remarks>
    /// Este método configura a pesquisa pelo IBGE.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Specifies the IBGE lookup.
    /// </summary>
    /// <returns>
    /// IBGE lookup interface.
    /// </returns>
    /// <remarks>
    /// This method configures the IBGE lookup.
    /// </remarks>
    {$ENDIF}
    function IBGE:ISetup4DCEPFilterIBGE;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Limpa os critérios de pesquisa de CEP, redefinindo todas as configurações anteriores.
    /// </summary>
    /// <returns>
    /// A interface que permite configurar os critérios de pesquisa de CEP.
    /// </returns>
    /// <remarks>
    /// Esta função remove todos os critérios de pesquisa previamente definidos, permitindo iniciar uma nova consulta.
    /// Use esta função para redefinir qualquer configuração anterior e iniciar uma nova pesquisa de CEP com um estado limpo.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Clears the CEP search criteria, resetting all previous settings.
    /// </summary>
    /// <returns>
    /// The interface that allows you to configure CEP search criteria.
    /// </returns>
    /// <remarks>
    /// This function removes all previously defined search criteria, allowing you to start a new query.
    /// Use this function to reset any previous configuration and initiate a new CEP search with a clean slate.
    /// </remarks>
    {$ENDIF}
    function Clear: ISetup4DCEPFilter;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Conclui a pesquisa do framework de pesquisa de CEP.
    /// </summary>
    /// <returns>
    /// Uma interface do framework de pesquisa de CEP.
    /// </returns>
    /// <remarks>
    /// Este método finaliza a pesquisa do framework de pesquisa de CEP.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Completes the search within the ZIP code lookup framework.
    /// </summary>
    /// <returns>
    /// An interface for the ZIP code lookup framework.
    /// </returns>
    /// <remarks>
    /// This method concludes the search within the ZIP code lookup framework.
    /// </remarks>
    {$ENDIF}
    function Finish: ISetup4DCEP;
  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Interface que define a pesquisa do framework de pesquisa de CEP.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Interface defining the search functionality of the ZIP code lookup framework.
  /// </summary>
  {$ENDIF}
  ISetup4DCEPFilterZipCode  = interface
    ['{1595A250-BAE8-4397-9D85-BC856D12B07F}']

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define a pesquisa pelo CEP
    /// </summary>
    /// <returns>
    /// Interface de pesquisa do CEP pelo código
    /// </returns>
    /// <remarks>
    /// Este método configura a pesquisa pelo CEP filtrando o código.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Specifies the ZIP code search.
    /// </summary>
    /// <returns>
    /// ZIP code lookup interface by code.
    /// </returns>
    /// <remarks>
    /// This method configures the ZIP code lookup with code filtering.
    /// </remarks>
    {$ENDIF}
    function Key:ISetup4DCEPFilterZipCodeKey;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define a pesquisa pelo Endereço
    /// </summary>
    /// <returns>
    /// Interface de pesquisa do CEP pelo endereçp
    /// </returns>
    /// <remarks>
    /// Este método configura a pesquisa pelo CEP filtrando o endereço.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Specifies the address search.
    /// </summary>
    /// <returns>
    /// ZIP code lookup interface by address.
    /// </returns>
    /// <remarks>
    /// This method configures the ZIP code lookup with address filtering.
    /// </remarks>
    {$ENDIF}
    function Address:ISetup4DCEPFilterZipCodeAddress;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Conclui a pesquisa do framework de pesquisa de CEP.
    /// </summary>
    /// <returns>
    /// Uma interface do framework de pesquisa de CEP.
    /// </returns>
    /// <remarks>
    /// Este método finaliza a pesquisa do framework de pesquisa de CEP.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Completes the search within the ZIP code lookup framework.
    /// </summary>
    /// <returns>
    /// An interface for the ZIP code lookup framework.
    /// </returns>
    /// <remarks>
    /// This method concludes the search within the ZIP code lookup framework.
    /// </remarks>
    {$ENDIF}
    function Finish: ISetup4DCEPFilter;
  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Interface que define a pesquisa do código do IBGE no framework de pesquisa de CEP.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Interface defining the IBGE code search within the ZIP code lookup framework.
  /// </summary>
  {$ENDIF}
  ISetup4DCEPFilterIBGE  = interface
    ['{02F31375-DE5E-4A76-A0D6-EFA69DDC663E}']

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define a pesquisa do IBGE pelo código
    /// </summary>
    /// <returns>
    /// Interface de pesquisa do IBGE pelo código
    /// </returns>
    /// </returns>
    /// <remarks>
    /// Este método configura a pesquisa do IBGE filtrando o código.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Specifies the IBGE code lookup by code.
    /// </summary>
    /// <returns>
    /// IBGE lookup interface by code.
    /// </returns>
    /// <remarks>
    /// This method configures the IBGE code lookup with code filtering.
    /// </remarks>
    {$ENDIF}
    function Key: ISetup4DCEPFilterIBGEKey;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define a pesquisa do IBGE pelo endereço
    /// </summary>
    /// <returns>
    /// Interface de pesquisa do IBGE pelo endereço
    /// </returns>
    /// <remarks>
    /// Este método configura a pesquisa do IBGE filtrando o endereço.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Specifies the IBGE code lookup by address.
    /// </summary>
    /// <returns>
    /// IBGE lookup interface by address.
    /// </returns>
    /// <remarks>
    /// This method configures the IBGE code lookup with address filtering.
    /// </remarks>
    {$ENDIF}
    function Address: ISetup4DCEPFilterIBGEAddress;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Conclui a pesquisa do código do IBGE do framework de pesquisa de CEP.
    /// </summary>
    /// <returns>
    /// Uma interface do framework de pesquisa de CEP.
    /// </returns>
    /// <remarks>
    /// Este método finaliza a pesquisa do código do IBGE do framework de pesquisa de CEP.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Finalizes the IBGE code lookup within the ZIP code lookup framework.
    /// </summary>
    /// <returns>
    /// An interface for the ZIP code lookup framework.
    /// </returns>
    /// <remarks>
    /// This method concludes the IBGE code lookup within the ZIP code lookup framework.
    /// </remarks>
    {$ENDIF}
    function Finish: ISetup4DCEPFilter;
  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Interface que executa o módulo de pesquisa do IBGE ou CEP
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Interface that executes the module for IBGE or ZIP code lookup.
  /// </summary>
  {$ENDIF}
  ISetup4DCEPSearech  = interface
    ['{D3D12C06-CA44-4A45-AA0A-99B085D05FDC}']

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Executa a pesquisa do CEP
    /// </summary>
    /// <returns>
    /// Interface que executa a pesquisa do CEP
    /// </returns>
    /// </returns>
    /// <remarks>
    /// Este método executa a pesquisa do CEP.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Executes the ZIP code lookup.
    /// </summary>
    /// <returns>
    /// Interface for executing the ZIP code lookup.
    /// </returns>
    /// <remarks>
    /// This method performs the ZIP code lookup.
    /// </remarks>
    {$ENDIF}
    function ZipCode: ISetup4DCEPSearechZipCode;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Executa a pesquisa do IBGE
    /// </summary>
    /// <returns>
    /// Interface que executa a pesquisa do IBGE
    /// </returns>
    /// </returns>
    /// <remarks>
    /// Este método executa a pesquisa do IBGE.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Executes the IBGE lookup.
    /// </summary>
    /// <returns>
    /// Interface for executing the IBGE lookup.
    /// </returns>
    /// <remarks>
    /// This method performs the IBGE lookup.
    /// </remarks>
    {$ENDIF}
    function IBGE: ISetup4DCEPSearechIBGE;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Finaliza a execução do módulo de pesquisa do CEP ou IBGE.
    /// </summary>
    /// <returns>
    /// Uma interface do método que executa a pesquisa do CEP ou do IBGE.
    /// </returns>
    /// <remarks>
    /// Este método finaliza a execução da pesquisa do CEP ou CNPJ.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Finalizes the execution of the ZIP code or IBGE code lookup module.
    /// </summary>
    /// <returns>
    /// An interface for the method that performs ZIP code or IBGE code lookup.
    /// </returns>
    /// <remarks>
    /// This method concludes the execution of the ZIP code or CNPJ (IBGE) lookup.
    /// </remarks>
    {$ENDIF}
    function Finish: ISetup4DCEP;
  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Interface que retorna o resultado da pesquisa de CEP realizada pelo framework.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Interface that returns the result of the ZIP code lookup performed by the framework.
  /// </summary>
  {$ENDIF}
  ISetup4DCEPResult  = interface
    ['{079D97FA-77D5-452F-80A4-407C97209542}']

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Retorna o resultado da pesquisa do CEP
    /// </summary>
    /// <returns>
    /// Interface do resultado da pesquisa do CEP
    /// </returns>
    /// </returns>
    /// <remarks>
    /// Este método retorna o resultado referente a pesquisa do CEP.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Returns the result of the ZIP code lookup.
    /// </summary>
    /// <returns>
    /// Interface for the result of the ZIP code lookup.
    /// </returns>
    /// <remarks>
    /// This method returns the result of the ZIP code lookup.
    /// </remarks>
    {$ENDIF}
    function ZIPCode: ISetup4DCEPResultZipCode;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Retorna o resultado da pesquisa do IBGE
    /// </summary>
    /// <returns>
    /// Interface do resultado da pesquisa do IBGE
    /// </returns>
    /// <remarks>
    /// Este método retorna o resultado referente a pesquisa do IBGE.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Returns the result of the IBGE lookup.
    /// </summary>
    /// <returns>
    /// Interface for the result of the IBGE lookup.
    /// </returns>
    /// </returns>
    /// <remarks>
    /// This method returns the result of the IBGE lookup.
    /// </remarks>
    {$ENDIF}
    function IBGE: ISetup4DCEPResultIBGE;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Finaliza o resultado da pesquisa do framework de CEP.
    /// </summary>
    /// <returns>
    /// Uma interface do framework de pesquisa de CEP.
    /// </returns>
    /// <remarks>
    /// Este método conclui o resultado obtido pela pesquisa de CEP.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Finalizes the result of the ZIP code lookup framework.
    /// </summary>
    /// <returns>
    /// An interface for the ZIP code lookup framework.
    /// </returns>
    /// <remarks>
    /// This method concludes the result obtained from the ZIP code lookup.
    /// </remarks>
    {$ENDIF}
    function Finish: ISetup4DCEP;
  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Interface que configura o Web Service do framework.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Interface for configuring the framework's web service.
  /// </summary>
  {$ENDIF}
  ISetup4DCEPConfigurationWebService = interface
    ['{837B9623-AF5A-40CE-A6C3-F8E044F11349}']

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Configurações para a pesquisa de CEP.
    /// </summary>
    /// <returns>A interface de configuração de CEP.</returns>
    {$ELSE}
    /// <summary>
    /// Settings for zip code search
    /// </summary>
    /// <returns>
    /// The zip code configuration interface.
    /// </returns>
    {$ENDIF}
    function ZipCode: ISetup4DCEPConfigurationWebServiceZIPCode;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Configurações para a pesquisa de IBGE.
    /// </summary>
    /// <returns>A interface de configuração de IBGE.</returns>
    {$ELSE}
    /// <summary>
    /// Settings for IBGE search.
    /// </summary>
    /// <returns>
    /// The IBGE configuration interface.
    /// </returns>
    {$ENDIF}
    function IBGE: ISetup4DCEPConfigurationWebServiceIBGE;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define o valor de timeout para a configuração do serviço web usando uma representação em string.
    /// </summary>
    /// <param name="AValue">
    /// O valor de timeout como uma string.
    /// </param>
    /// <returns>
    /// A interface de configuração do serviço web.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the timeout value for the web service configuration using a string representation.
    /// </summary>
    /// <param name="AValue">
    /// The timeout value as a string.
    /// </param>
    /// <returns>
    /// The web service configuration interface.
    /// </returns>
    {$ENDIF}
    function TimeOut(const AValue: string): ISetup4DCEPConfigurationWebService; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define o valor de timeout para a configuração do serviço web usando um valor inteiro.
    /// </summary>
    /// <param name="AValue">
    /// O valor de timeout como um inteiro (em milesegundos).
    /// </param>
    /// <returns>
    /// A interface de configuração do serviço web.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the timeout value for the web service configuration using an integer value.
    /// </summary>
    /// <param name="AValue">
    /// The timeout value as an integer (in mileseconds).
    /// </param>
    /// <returns>
    /// The web service configuration interface.
    /// </returns>
    {$ENDIF}
    function TimeOut(const AValue: Integer): ISetup4DCEPConfigurationWebService; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o valor de timeout como uma representação em string.
    /// </summary>
    /// <returns>O valor de timeout como uma string.</returns>
    {$ELSE}
    /// <summary>
    /// Gets the timeout value as a string representation.
    /// </summary>
    /// <returns>
    /// The timeout value as a string.
    /// </returns>
    {$ENDIF}
    function TimeOutInStr: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o valor de timeout como um inteiro (em segundos).
    /// </summary>
    /// <returns>
    /// O valor de timeout como um inteiro.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the timeout value as an integer (in seconds).
    /// </summary>
    /// <returns>
    /// The timeout value as an integer.
    /// </returns>
    {$ENDIF}
    function TimeOut: Integer; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define se deve analisar o texto nas respostas do serviço web.
    /// </summary>
    /// <param name="AValue">
    /// Se True, o texto será analisado; caso contrário, False.
    /// </param>
    /// <returns>
    /// A interface de configuração do serviço web.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets whether to parse text in the web service responses.
    /// </summary>
    /// <param name="AValue">
    /// If True, text will be parsed; otherwise, False.
    /// </param>
    /// <returns>
    /// The web service configuration interface.
    /// </returns>
    {$ENDIF}
    function ParseText(const AValue: Boolean): ISetup4DCEPConfigurationWebService; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém se deve analisar o texto nas respostas do serviço web.
    /// </summary>
    /// <returns>
    /// True se o texto será analisado; caso contrário, False.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets whether to parse text in the web service responses.
    /// </summary>
    /// <returns>
    /// True if text will be parsed; otherwise, False.
    /// </returns>
    {$ENDIF}
    function ParseText: Boolean; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Conclui a configuração do web service no framework.
    /// </summary>
    /// <returns>
    /// Uma interface de configuração do framework.
    /// </returns>
    /// <remarks>
    /// Este método finaliza a configuração do web service no framework.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Finalizes the configuration of the web service in the framework.
    /// </summary>
    /// <returns>
    /// An interface for framework configuration.
    /// </returns>
    /// <remarks>
    /// This method completes the web service configuration within the framework.
    /// </remarks>
    {$ENDIF}
    function Finish: ISetup4DCEPConfiguration;

  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Interface que configura o Web Service CEP do framework.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Interface for configuring the framework's Web Service Zip Code.
  /// </summary>
  {$ENDIF}
  ISetup4DCEPConfigurationWebServiceZIPCode = interface
    ['{04DB6A47-6E2B-400D-B510-D7EA660C1A4C}']

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Não seleciona nenhum web service.
    /// </summary>
    /// <returns>
    /// Uma interface de configuração do framework.
    /// </returns>
    /// <remarks>
    /// Este método seleciona o web service a ser utilizado.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Does not select any web service.
    /// </summary>
    /// <returns>
    /// An interface for framework configuration.
    /// </returns>
    /// <remarks>
    /// This method selects the web service to be used.
    /// </remarks>
    {$ENDIF}
    function Nenhum : ISetup4DCEPConfigurationWebServiceZIPCode;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Seleciona o web serice BuscarCep.
    /// </summary>
    /// <returns>
    /// Uma interface de configuração do framework.
    /// </returns>
    /// <remarks>
    /// Este método seleciona o web service a ser utilizado.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Selects the web service BuscarCep.
    /// </summary>
    /// <returns>
    /// An interface for framework configuration.
    /// </returns>
    /// <remarks>
    /// This method selects the web service to be used.
    /// </remarks>
    {$ENDIF}
    function BuscarCep : ISetup4DCEPConfigurationWebServiceZIPCode;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Seleciona o web serice CepLivre.
    /// </summary>
    /// <returns>
    /// Uma interface de configuração do framework.
    /// </returns>
    /// <remarks>
    /// Este método seleciona o web service a ser utilizado.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Selects the web service CepLivre.
    /// </summary>
    /// <returns>
    /// An interface for framework configuration.
    /// </returns>
    /// <remarks>
    /// This method selects the web service to be used.
    /// </remarks>
    {$ENDIF}
    function CepLivre : ISetup4DCEPConfigurationWebServiceZIPCode;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Seleciona o web serice RepublicaVirtual.
    /// </summary>
    /// <returns>
    /// Uma interface de configuração do framework.
    /// </returns>
    /// <remarks>
    /// Este método seleciona o web service a ser utilizado.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Selects the web service RepublicaVirtual.
    /// </summary>
    /// <returns>
    /// An interface for framework configuration.
    /// </returns>
    /// <remarks>
    /// This method selects the web service to be used.
    /// </remarks>
    {$ENDIF}
    function RepublicaVirtual : ISetup4DCEPConfigurationWebServiceZIPCode;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Seleciona o web serice Bases4you.
    /// </summary>
    /// <returns>
    /// Uma interface de configuração do framework.
    /// </returns>
    /// <remarks>
    /// Este método seleciona o web service a ser utilizado.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Selects the web service Bases4you.
    /// </summary>
    /// <returns>
    /// An interface for framework configuration.
    /// </returns>
    /// <remarks>
    /// This method selects the web service to be used.
    /// </remarks>
    {$ENDIF}
    function Bases4you : ISetup4DCEPConfigurationWebServiceZIPCode;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Seleciona o web serice RNSolucoes.
    /// </summary>
    /// <returns>
    /// Uma interface de configuração do framework.
    /// </returns>
    /// <remarks>
    /// Este método seleciona o web service a ser utilizado.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Selects the web service RNSolucoes.
    /// </summary>
    /// <returns>
    /// An interface for framework configuration.
    /// </returns>
    /// <remarks>
    /// This method selects the web service to be used.
    /// </remarks>
    {$ENDIF}
    function RNSolucoes : ISetup4DCEPConfigurationWebServiceZIPCode;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Seleciona o web serice KingHost.
    /// </summary>
    /// <returns>
    /// Uma interface de configuração do framework.
    /// </returns>
    /// <remarks>
    /// Este método seleciona o web service a ser utilizado.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Selects the web service KingHost.
    /// </summary>
    /// <returns>
    /// An interface for framework configuration.
    /// </returns>
    /// <remarks>
    /// This method selects the web service to be used.
    /// </remarks>
    {$ENDIF}
    function KingHost : ISetup4DCEPConfigurationWebServiceZIPCode;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Seleciona o web serice ByJG.
    /// </summary>
    /// <returns>
    /// Uma interface de configuração do framework.
    /// </returns>
    /// <remarks>
    /// Este método seleciona o web service a ser utilizado.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Selects the web service ByJG.
    /// </summary>
    /// <returns>
    /// An interface for framework configuration.
    /// </returns>
    /// <remarks>
    /// This method selects the web service to be used.
    /// </remarks>
    {$ENDIF}
    function ByJG : ISetup4DCEPConfigurationWebServiceZIPCode;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Seleciona o web serice Correios.
    /// </summary>
    /// <returns>
    /// Uma interface de configuração do framework.
    /// </returns>
    /// <remarks>
    /// Este método seleciona o web service a ser utilizado.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Selects the web service Correios.
    /// </summary>
    /// <returns>
    /// An interface for framework configuration.
    /// </returns>
    /// <remarks>
    /// This method selects the web service to be used.
    /// </remarks>
    {$ENDIF}
    function Correios : ISetup4DCEPConfigurationWebServiceZIPCode;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Seleciona o web serice DevMedia.
    /// </summary>
    /// <returns>
    /// Uma interface de configuração do framework.
    /// </returns>
    /// <remarks>
    /// Este método seleciona o web service a ser utilizado.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Selects the web service DevMedia.
    /// </summary>
    /// <returns>
    /// An interface for framework configuration.
    /// </returns>
    /// <remarks>
    /// This method selects the web service to be used.
    /// </remarks>
    {$ENDIF}
    function DevMedia : ISetup4DCEPConfigurationWebServiceZIPCode;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Seleciona o web serice ViaCep.
    /// </summary>
    /// <returns>
    /// Uma interface de configuração do framework.
    /// </returns>
    /// <remarks>
    /// Este método seleciona o web service a ser utilizado.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Selects the web service ViaCep.
    /// </summary>
    /// <returns>
    /// An interface for framework configuration.
    /// </returns>
    /// <remarks>
    /// This method selects the web service to be used.
    /// </remarks>
    {$ENDIF}
    function ViaCep : ISetup4DCEPConfigurationWebServiceZIPCode;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Seleciona o web serice CorreiosSIGEP.
    /// </summary>
    /// <returns>
    /// Uma interface de configuração do framework.
    /// </returns>
    /// <remarks>
    /// Este método seleciona o web service a ser utilizado.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Selects the web service CorreiosSIGEP.
    /// </summary>
    /// <returns>
    /// An interface for framework configuration.
    /// </returns>
    /// <remarks>
    /// This method selects the web service to be used.
    /// </remarks>
    {$ENDIF}
    function CorreiosSIGEP : ISetup4DCEPConfigurationWebServiceZIPCode;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Seleciona o web serice CepAberto.
    /// </summary>
    /// <returns>
    /// Uma interface de configuração do framework.
    /// </returns>
    /// <remarks>
    /// Este método seleciona o web service a ser utilizado.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Selects the web service CepAberto.
    /// </summary>
    /// <returns>
    /// An interface for framework configuration.
    /// </returns>
    /// <remarks>
    /// This method selects the web service to be used.
    /// </remarks>
    {$ENDIF}
    function CepAberto : ISetup4DCEPConfigurationWebServiceZIPCode;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Seleciona o web serice WSCep.
    /// </summary>
    /// <returns>
    /// Uma interface de configuração do framework.
    /// </returns>
    /// <remarks>
    /// Este método seleciona o web service a ser utilizado.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Selects the web service WSCep.
    /// </summary>
    /// <returns>
    /// An interface for framework configuration.
    /// </returns>
    /// <remarks>
    /// This method selects the web service to be used.
    /// </remarks>
    {$ENDIF}
    function WSCep : ISetup4DCEPConfigurationWebServiceZIPCode;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Seleciona o web serice OpenCep.
    /// </summary>
    /// <returns>
    /// Uma interface de configuração do framework.
    /// </returns>
    /// <remarks>
    /// Este método seleciona o web service a ser utilizado.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Selects the web service OpenCep.
    /// </summary>
    /// <returns>
    /// An interface for framework configuration.
    /// </returns>
    /// <remarks>
    /// This method selects the web service to be used.
    /// </remarks>
    {$ENDIF}
    function OpenCep : ISetup4DCEPConfigurationWebServiceZIPCode;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Seleciona o web serice BrasilAPI.
    /// </summary>
    /// <returns>
    /// Uma interface de configuração do framework.
    /// </returns>
    /// <remarks>
    /// Este método seleciona o web service a ser utilizado.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Selects the web service BrasilAPI.
    /// </summary>
    /// <returns>
    /// An interface for framework configuration.
    /// </returns>
    /// <remarks>
    /// This method selects the web service to be used.
    /// </remarks>
    {$ENDIF}
    function BrasilAPI  : ISetup4DCEPConfigurationWebServiceZIPCode;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Retornar o indice do web service selecionado
    /// </summary>
    /// <returns>
    /// Uma interface de configuração do framework.
    /// </returns>
    /// <remarks>
    /// Este método para retornar o indice do web service.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Retrieve the index of the selected web service.
    /// </summary>
    /// <returns>
    /// An interface for framework configuration.
    /// </returns>
    /// <remarks>
    /// This method is used to return the index of the web service.
    /// </remarks>
    {$ENDIF}
    function Index : Integer;

     {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Inforamar a chave de Acesso da web service
    /// </summary>
    /// <param name="AValue">
    /// A chave de acesso desejada.
    /// </param>
    /// <returns>
    /// Uma interface de configuração do framework.
    /// </returns>
    /// <remarks>
    /// Este método para informar a chave de acesso do web service.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Inform the Access Key for the web service.
    /// </summary>
    /// <param name="AValue">
    /// The desired access key.
    /// </param>
    /// <returns>
    /// An interface for framework configuration.
    /// </returns>
    /// <remarks>
    /// This method is used to provide the access key for the web service.
    /// </remarks>
    {$ENDIF}
    function Key(AValue: string) : ISetup4DCEPConfigurationWebServiceZIPCode; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Retornar a chave de acesso do webservice
    /// </summary>
    /// <returns>
    /// Uma interface de configuração do framework.
    /// </returns>
    /// <remarks>
    /// Este método para retornar a chave de acesso do web service.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Retrieve the access key for the web service.
    /// </summary>
    /// <returns>
    /// An interface for framework configuration.
    /// </returns>
    /// <remarks>
    /// This method is used to return the access key for the web service.
    /// </remarks>
    {$ENDIF}
    function Key : string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define o nome de usuário do servidor web para consulta de CEP.
    /// </summary>
    /// <param name="AValue">
    /// O nome de usuário do servidor web.
    /// </param>
    /// <returns>
    /// Uma instância da interface ISetup4DCEPConfigurationProxy.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Set the web server username for ZIP code queries.
    /// </summary>
    /// <param name="AValue">
    /// The username of the web server.
    /// </param>
    /// <returns>
    /// An instance of the ISetup4DCEPConfigurationProxy interface.
    /// </returns>
    {$ENDIF}
    function User(Const AValue: string) : ISetup4DCEPConfigurationWebServiceZIPCode; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome de usuário do servidor web para consulta de CEP.
    /// </summary>
    /// <returns>
    /// O nome de usuário do servidor web.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Retrieve the web server username for ZIP code queries.
    /// </summary>
    /// <returns>
    /// The username of the web server.
    /// </returns>
    {$ENDIF}
    function User : string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define o senha de usuário do servidor web para consulta de CEP.
    /// </summary>
    /// <param name="AValue">
    /// A senha do servidor web.
    /// </param>
    /// <returns>
    /// Uma instância da interface ISetup4DCEPConfigurationProxy.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Set the web server password for ZIP code queries.
    /// </summary>
    /// <param name="AValue">
    /// The password of the web server.
    /// </param>
    /// <returns>
    /// An instance of the ISetup4DCEPConfigurationProxy interface.
    /// </returns>
    {$ENDIF}
    function Password(Const AValue: string) : ISetup4DCEPConfigurationWebServiceZIPCode; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém a senha do servidor web para consulta de CEP.
    /// </summary>
    /// <returns>
    /// O nome de senha do servidor web.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Retrieve the web server password for ZIP code queries.
    /// </summary>
    /// <returns>
    /// The password of the web server.
    /// </returns>
    {$ENDIF}
    function Password : string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define se deve retornar informações do IBGE.
    /// </summary>
    /// <param name="AValue">
    /// Se True, as informações do IBGE serão retornadas; caso contrário, False.
    /// </param>
    /// <returns>
    /// A interface de configuração do serviço web.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets whether to return IBGE information.
    /// </summary>
    /// <param name="AValue">
    /// If True, IBGE information will be returned; otherwise, False.
    /// </param>
    /// <returns>
    /// The web service configuration interface.
    /// </returns>
    {$ENDIF}
    function ReturnIBGE(const AValue: Boolean): ISetup4DCEPConfigurationWebServiceZIPCode; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém se deve retornar informações do IBGE.
    /// </summary>
    /// <returns>
    /// True se as informações do IBGE serão retornadas; caso contrário, False.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets whether to return IBGE information.
    /// </summary>
    /// <returns>
    /// True if IBGE information will be returned; otherwise, False.
    /// </returns>
    {$ENDIF}
    function ReturnIBGE: Boolean; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Conclui a configuração do Web Servide CEP no framework.
    /// </summary>
    /// <returns>
    /// Uma interface de configuração do framework.
    /// </returns>
    /// <remarks>
    /// Este método finaliza a configuração do Web Servide CEP no framework.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Finalizes the configuration of the Web Servide Zip Code in the framework.
    /// </summary>
    /// <returns>
    /// An interface for framework configuration.
    /// </returns>
    /// <remarks>
    /// This method completes the Web Servide Zip Code configuration within the framework.
    /// </remarks>
    {$ENDIF}
    function Finish: ISetup4DCEPConfigurationWebService;
  end;


  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Interface que configura o Web Service IBGE do framework.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Interface for configuring the framework's Web Service IBGE.
  /// </summary>
  {$ENDIF}
  ISetup4DCEPConfigurationWebServiceIBGE = interface
    ['{A5CF2B44-CA63-4443-ADC8-F4787549CC3F}']

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define o nome do arquivo de cache para consultas por IBGE.
    /// </summary>
    /// <param name="AValue">
    /// O nome do arquivo de cache.
    /// </param>
    /// <returns>
    /// A interface de configuração de CEP por IBGE.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the cache file name for IBGE queries.
    /// </summary>
    /// <param name="AValue">
    /// The cache file name.
    /// </param>
    /// <returns>
    /// The IBGE configuration interface.
    /// </returns>
    {$ENDIF}
    function CacheName(const AValue: string): ISetup4DCEPConfigurationWebServiceIBGE; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome do arquivo de cache atualmente definido para consultas por IBGE.
    /// </summary>
    /// <returns>
    /// O nome do arquivo de cache atualmente definido.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the currently set cache file name for IBGE queries.
    /// </summary>
    /// <returns>
    /// The currently set cache file name.
    /// </returns>
    {$ENDIF}
    function CacheName: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define a validade do cache em dias para consultas por IBGE.
    /// </summary>
    /// <param name="AValue">
    /// O número de dias de validade do cache.
    /// </param>
    /// <returns>
    /// A interface de configuração de CEP por IBGE.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the cache validity in days for IBGE queries.
    /// </summary>
    /// <param name="AValue">
    /// The number of days for cache validity.
    /// </param>
    /// <returns>
    /// The IBGE configuration interface.
    /// </returns>
    {$ENDIF}
    function CacheValidity(const AValue: Integer): ISetup4DCEPConfigurationWebServiceIBGE; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define a validade do arquivo de cache para consultas por IBGE usando um valor em string.
    /// </summary>
    /// <param name="AValue">
    /// O nome do arquivo de cache como string.
    /// </param>
    /// <returns>
    /// A interface de configuração de CEP por IBGE.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the cache file valid for IBGE queries using a string value.
    /// </summary>
    /// <param name="AValue">
    /// The cache file name as a string.
    /// </param>
    /// <returns>
    /// The IBGE configuration interface.
    /// </returns>
    {$ENDIF}
    function CacheValidity(const AValue: string): ISetup4DCEPConfigurationWebServiceIBGE; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém a validade do cache atualmente definida para consultas por IBGE.
    /// </summary>
    /// <returns>
    /// A validade do cache em dias.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the currently set cache validity for IBGE queries.
    /// </summary>
    /// <returns>
    /// The cache validity in days.
    /// </returns>
    {$ENDIF}
    function CacheValidity: Integer; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém a validade do cache atualmente definida para consultas por IBGE em formato de string.
    /// </summary>
    /// <returns>
    /// A validade do cache como string.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the currently set cache validity for IBGE queries as a string.
    /// </summary>
    /// <returns>
    /// The cache validity as a string.
    /// </returns>
    {$ENDIF}
    function CacheValidityInStr: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Executa a limpeza do cache para dados do IBGE.
    /// </summary>
    /// <returns>
    /// A instância de execução do IBGE.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Executes the cache cleanup for IBGE data.
    /// </summary>
    /// <returns>
    /// The IBGE execution instance.
    /// </returns>
    {$ENDIF}
    function CacheClear : ISetup4DCEPConfigurationWebServiceIBGE;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define se a pesquisa por IBGE deve ser sensível a maiúsculas e minúsculas.
    /// </summary>
    /// <param name="AValue">
    /// True para habilitar a pesquisa case sensitive, False para desabilitar.
    /// </param>
    /// <returns>
    /// A interface de configuração de CEP por IBGE.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets whether IBGE search should be case sensitive.
    /// </summary>
    /// <param name="AValue">
    /// True to enable case sensitive search, False to disable.
    /// </param>
    /// <returns>
    /// The IBGE configuration interface.
    /// </returns>
    {$ENDIF}
    function CaseSensitive(const AValue: Boolean): ISetup4DCEPConfigurationWebServiceIBGE; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o status atual da pesquisa por IBGE, se é sensível a maiúsculas e minúsculas.
    /// </summary>
    /// <returns>
    /// True se a pesquisa por IBGE é case sensitive, False se não é.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the current status of IBGE search, whether it is case sensitive.
    /// </summary>
    /// <returns>
    /// True if IBGE search is case sensitive, False if it is not.
    /// </returns>
    {$ENDIF}
    function CaseSensitive: Boolean; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Finaliza a configuração para pesquisa por IBGE.
    /// </summary>
    /// <returns>
    /// A interface de configuração de serviços web de CEP.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Finishes the configuration for IBGE search.
    /// </summary>
    /// <returns>
    /// The web service configuration interface.
    /// </returns>
    {$ENDIF}
    function Finish: ISetup4DCEPConfigurationWebService;
  end;


  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Interface que configura o Proxy do framework.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Interface for configuring the framework's Proxy.
  /// </summary>
  {$ENDIF}
  ISetup4DCEPConfigurationProxy = interface
    ['{B62C6779-BA06-4135-ADC7-CB9C43250024}']

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define o host do servidor proxy para o serviço web de consulta de CEP.
    /// </summary>
    /// <param name="AValue">
    /// O host do servidor proxy.
    ///</param>
    /// <returns>
    /// Uma instância da interface ISetup4DCEPConfigurationProxy.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the host of the proxy server for the CEP query web service.
    /// </summary>
    /// <param name="AValue">
    /// The host of the proxy server.
    /// </param>
    /// <returns>
    /// An instance of the ISetup4DCEPConfigurationProxy interface.
    /// </returns>
    {$ENDIF}
    function Host(const AValue: string): ISetup4DCEPConfigurationProxy; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define a porta do servidor proxy para o serviço web de consulta de CEP.
    /// </summary>
    /// <param name="AValue">
    /// A porta do servidor proxy como uma string.
    /// </param>
    /// <returns>
    /// Uma instância da interface ISetup4DCEPConfigurationProxy.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the port of the proxy server for the CEP query web service.
    /// </summary>
    /// <param name="AValue">
    /// The port of the proxy server as a string.
    /// </param>
    /// <returns>
    /// An instance of the ISetup4DCEPConfigurationProxy interface.
    /// </returns>
    {$ENDIF}
    function Port(const AValue: string): ISetup4DCEPConfigurationProxy; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define a porta do servidor proxy para o serviço web de consulta de CEP.
    /// </summary>
    /// <param name="AValue">
    /// A porta do servidor proxy como um número inteiro.
    /// </param>
    /// <returns>Uma instância da interface ISetup4DCEPConfigurationProxy.</returns>
    {$ELSE}
    /// <summary>
    /// Sets the port of the proxy server for the CEP query web service.
    /// </summary>
    /// <param name="AValue">
    /// The port of the proxy server as an integer.
    /// </param>
    /// <returns>
    /// An instance of the ISetup4DCEPConfigurationProxy interface.
    /// </returns>
    {$ENDIF}
    function Port(const AValue: integer): ISetup4DCEPConfigurationProxy; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define o nome de usuário do servidor proxy para o serviço web de consulta de CEP.
    /// </summary>
    /// <param name="AValue">
    /// O nome de usuário do servidor proxy.
    /// </param>
    /// <returns>
    /// Uma instância da interface ISetup4DCEPConfigurationProxy.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the username of the proxy server for the CEP query web service.
    /// </summary>
    /// <param name="AValue">
    /// The username of the proxy server.
    /// </param>
    /// <returns>
    /// An instance of the ISetup4DCEPConfigurationProxy interface.
    /// </returns>
    {$ENDIF}
    function User(const AValue: string): ISetup4DCEPConfigurationProxy; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define a senha do servidor proxy para o serviço web de consulta de CEP.
    /// </summary>
    /// <param name="AValue">
    /// A senha do servidor proxy.
    /// </param>
    /// <returns>
    /// Uma instância da interface ISetup4DCEPConfigurationProxy.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the password of the proxy server for the CEP query web service.
    /// </summary>
    /// <param name="AValue">
    /// The password of the proxy server.
    /// </param>
    /// <returns>
    /// An instance of the ISetup4DCEPConfigurationProxy interface.
    /// </returns>
    {$ENDIF}
    function Password(const AValue: string): ISetup4DCEPConfigurationProxy; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o host do servidor proxy para o serviço web de consulta de CEP.
    /// </summary>
    /// <returns>
    /// O host do servidor proxy.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the host of the proxy server for the CEP query web service.
    /// </summary>
    /// <returns>
    /// The host of the proxy server.
    /// </returns>
    {$ENDIF}
    function Host: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém a porta do servidor proxy para o serviço web de consulta de CEP.
    /// </summary>
    /// <returns>
    /// A porta do servidor proxy como um número inteiro.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the port of the proxy server for the CEP query web service.
    /// </summary>
    /// <returns>
    /// The port of the proxy server as an integer.
    /// </returns>
    {$ENDIF}
    function Port: integer; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém a porta do servidor proxy para o serviço web de consulta de CEP.
    /// </summary>
    /// <returns>
    /// A porta do servidor proxy como um número string.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the port of the proxy server for the CEP query web service.
    /// </summary>
    /// <returns>
    /// The port of the proxy server as an string.
    /// </returns>
    {$ENDIF}
    function PortInStr : string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome de usuário do servidor proxy para o serviço web de consulta de CEP.
    /// </summary>
    /// <returns>
    /// O nome de usuário do servidor proxy.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the username of the proxy server for the CEP query web service.
    /// </summary>
    /// <returns>
    /// The username of the proxy server.
    /// </returns>
    {$ENDIF}
    function User: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém a senha do servidor proxy para o serviço web de consulta de CEP.
    /// </summary>
    /// <returns>
    /// A senha do servidor proxy.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the password of the proxy server for the CEP query web service.
    /// </summary>
    /// <returns>
    /// The password of the proxy server.
    /// </returns>
    {$ENDIF}
    function Password: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Conclui a configuração do proxy no framework.
    /// </summary>
    /// <returns>
    /// Uma interface de configuração do framework.
    /// </returns>
    /// <remarks>
    /// Este método finaliza a configuração do proxy no framework.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Finalizes the configuration of the proxy in the framework.
    /// </summary>
    /// <returns>
    /// An interface for framework configuration.
    /// </returns>
    /// <remarks>
    /// This method completes the proxy configuration within the framework.
    /// </remarks>
    {$ENDIF}
    function Finish: ISetup4DCEPConfiguration;
  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Interface de busca de CEP (Código de Endereçamento Postal) por meio do código postal.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Interface for ZIP code (Postal Code) lookup using the postal code.
  /// </summary>
  {$ENDIF}
  ISetup4DCEPFilterZipCodeKey  = interface
    ['{28E3042A-8032-4476-8860-C1BA01F59381}']

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define o valor do CEP a ser pesquisado.
    /// </summary>
    /// <param name="AValue">
    /// O valor do CEP.
    /// </param>
    /// <returns>
    /// Uma instância da interface ISetup4DCEPFilterZipCodeKey.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the value of the CEP to be searched.
    /// </summary>
    /// <param name="AValue">
    /// The value of the CEP.
    /// </param>
    /// <returns>
    /// An instance of the ISetup4DCEPFilterZipCodeKey interface.
    /// </returns>
    {$ENDIF}
    function Value(const AValue: string): ISetup4DCEPFilterZipCodeKey; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o valor do CEP a ser pesquisado.
    /// </summary>
    /// <returns>
    /// O valor do CEP.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the value of the CEP to be searched.
    /// </summary>
    /// <returns>
    /// The value of the CEP.
    /// </returns>
    {$ENDIF}
    function Value: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Conclui a configuração de pesquisa pelo CEP no framework.
    /// </summary>
    /// <returns>
    /// Uma interface de configuração do framework.
    /// </returns>
    /// <remarks>
    /// Este método finaliza a pesquisa pelo CEP no framework.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Finalizes the ZIP code search configuration within the framework.
    /// </summary>
    /// <returns>
    /// An interface for framework configuration.
    /// </returns>
    /// <remarks>
    /// This method concludes the ZIP code search within the framework.
    /// </remarks>
    {$ENDIF}
    function Finish: ISetup4DCEPFilterZipCode;
  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Interface de busca de CEP (Código de Endereçamento Postal) por meio do endereço.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Interface for ZIP code (Postal Code) lookup using the Address.
  /// </summary>
  {$ENDIF}
  ISetup4DCEPFilterZipCodeAddress  = interface
    ['{268B40A2-8078-40CF-BE19-3DAC07C72A7C}']

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define o tipo de endereço a ser pesquisado no CEP.
    /// </summary>
    /// <param name="AValue">
    /// O tipo de endereço a ser pesquisado.
    /// </param>
    /// <returns>
    /// Uma instância da interface para continuar a configuração da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the address type to be searched in the ZIP code search.
    /// </summary>
    /// <param name="AValue">
    /// The address type to be searched.
    /// </param>
    /// <returns>
    /// An instance of the interface to continue configuring the search.
    /// </returns>
    {$ENDIF}
    function Types(Const AValue: string): ISetup4DCEPFilterZipCodeAddress; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define o nome da rua na pesquisa de CEP.
    /// </summary>
    /// <param name="AValue">
    /// O nome da rua.
    /// </param>
    /// <returns>
    /// Uma instância da interface para continuar a configuração da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the street name in the ZIP code search.
    /// </summary>
    /// <param name="AValue">
    /// The street name.
    /// </param>
    /// <returns>
    /// An instance of the interface to continue configuring the search.
    /// </returns>
    {$ENDIF}
    function Street(Const AValue: string): ISetup4DCEPFilterZipCodeAddress; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define o nome da cidade na pesquisa de CEP.
    /// </summary>
    /// <param name="AValue">
    /// O nome da cidade.
    /// </param>
    /// <returns>
    /// Uma instância da interface para continuar a configuração da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the city name in the ZIP code search.
    /// </summary>
    /// <param name="AValue">
    /// The city name.
    /// </param>
    /// <returns>
    /// An instance of the interface to continue configuring the search.
    /// </returns>
    {$ENDIF}
    function City(Const AValue: string): ISetup4DCEPFilterZipCodeAddress; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define a sigla do estado na pesquisa de CEP.
    /// </summary>
    /// <param name="AValue">
    /// A sigla do estado.
    /// </param>
    /// <returns>
    /// Uma instância da interface para continuar a configuração da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the state abbreviation in the ZIP code search.
    /// </summary>
    /// <param name="AValue">
    /// The state abbreviation.
    /// </param>
    /// <returns>
    /// An instance of the interface to continue configuring the search.
    /// </returns>
    {$ENDIF}
    function StateAbbreviated(Const AValue: string): ISetup4DCEPFilterZipCodeAddress; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define a sigla do estado na pesquisa de CEP.
    /// </summary>
    /// <param name="AValue">
    /// A sigla do estado.
    /// </param>
    /// <returns>
    /// Uma instância da interface para continuar a configuração da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the state abbreviation in the ZIP code search.
    /// </summary>
    /// <param name="AValue">
    /// The state abbreviation.
    /// </param>
    /// <returns>
    /// An instance of the interface to continue configuring the search.
    /// </returns>
    {$ENDIF}
    function StateAbbreviated(Const AValue: TSetup4DUtilityEstadoAbreviado): ISetup4DCEPFilterZipCodeAddress; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define o nome do bairro na pesquisa de CEP.
    /// </summary>
    /// <param name="AValue">
    /// O nome do bairro.
    /// </param>
    /// <returns>
    /// Uma instância da interface para continuar a configuração da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the district name in the ZIP code search.
    /// </summary>
    /// <param name="AValue">
    /// The district name.
    /// </param>
    /// <returns>
    /// An instance of the interface to continue configuring the search.
    /// </returns>
    {$ENDIF}
    function District(Const AValue: string): ISetup4DCEPFilterZipCodeAddress; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o tipo de endereço atualmente definido na pesquisa de CEP.
    /// </summary>
    /// <returns>
    /// O tipo de endereço atualmente definido.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the currently set address type in the ZIP code search.
    /// </summary>
    /// <returns>
    /// The currently set address type.
    /// </returns>
    {$ENDIF}
    function Types: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome da rua atualmente definido na pesquisa de CEP.
    /// </summary>
    /// <returns>
    /// O nome da rua atualmente definido.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the currently set street name in the ZIP code search.
    /// </summary>
    /// <returns>
    /// The currently set street name.
    /// </returns>
    {$ENDIF}
    function Street: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome da cidade atualmente definido na pesquisa de CEP.
    /// </summary>
    /// <returns>
    /// O nome da cidade atualmente definido.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the currently set city name in the ZIP code search.
    /// </summary>
    /// <returns>
    /// The currently set city name.
    /// </returns>
    {$ENDIF}
    function City: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém a sigla do estado atualmente definida na pesquisa de CEP.
    /// </summary>
    /// <returns>
    /// A sigla do estado atualmente definida.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the currently set state abbreviation in the ZIP code search.
    /// </summary>
    /// <returns>
    /// The currently set state abbreviation.
    /// </returns>
    {$ENDIF}
    function StateAbbreviated: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome do bairro atualmente definido na pesquisa de CEP.
    /// </summary>
    /// <returns>
    /// O nome do bairro atualmente definido.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the currently set district name in the ZIP code search.
    /// </summary>
    /// <returns>
    /// The currently set district name.
    /// </returns>
    {$ENDIF}
    function District: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Conclui a configuração de pesquisa pelo Endereçp no framework.
    /// </summary>
    /// <returns>
    /// Uma interface de configuração do framework.
    /// </returns>
    /// <remarks>
    /// Este método finaliza a pesquisa pelo Endereçp no framework.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Finalizes the Address search configuration within the framework.
    /// </summary>
    /// <returns>
    /// An interface for framework configuration.
    /// </returns>
    /// <remarks>
    /// This method concludes the Address search within the framework.
    /// </remarks>
    {$ENDIF}
    function Finish: ISetup4DCEPFilterZipCode;
  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Interface para a busca do código do IBGE a partir do código informado.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Interface for searching the IBGE code based on the provided code.
  /// </summary>
  {$ENDIF}
  ISetup4DCEPFilterIBGEKey  = interface
    ['{37CB0A19-C867-4E2F-B7DB-42962A33946A}']

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define o valor do código do IBGE a ser pesquisado.
    /// </summary>
    /// <param name="AValue">
    /// O valor do código do IBGE a ser pesquisado.
    /// </param>
    /// <returns>
    /// Uma instância da interface para continuar a configuração da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the value of the IBGE code to be searched.
    /// </summary>
    /// <param name="AValue">
    /// The value of the IBGE code to be searched.
    /// </param>
    /// <returns>
    /// An instance of the interface to continue configuring the search.
    /// </returns>
    {$ENDIF}
    function Value(const AValue: string): ISetup4DCEPFilterIBGEKey; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o valor do código IBGE atualmente definido na pesquisa.
    /// </summary>
    /// <returns>
    /// O valor do dado IBGE atualmente definido.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the currently set value of the IBGE code in the search.
    /// </summary>
    /// <returns>
    /// The currently set value of the IBGE data.
    /// </returns>
    {$ENDIF}
    function Value: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Finaliza a configuração da pesquisa pelo código do IBGE com base no código, no framework.
    /// </summary>
    /// <returns>
    /// Uma interface de configuração do framework.
    /// </returns>
    /// <remarks>
    /// Este método finaliza a cda pesquisa do código do IBGE, no framework.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Finalizes the configuration of the IBGE code lookup based on the code within the framework.
    /// </summary>
    /// <returns>
    /// An interface for framework configuration.
    /// </returns>
    /// <remarks>
    /// This method concludes the IBGE code lookup within the framework.
    /// </remarks>
    {$ENDIF}
    function Finish: ISetup4DCEPFilterIBGE;
  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Interface para a busca do código do IBGE a partir do Endereço informado.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Interface for searching the IBGE code based on the provided Address.
  /// </summary>
  {$ENDIF}
  ISetup4DCEPFilterIBGEAddress  = interface
    ['{6DF91C11-CA02-4E19-B8D5-C83940BAC789}']

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define o nome da cidade a ser pesquisada no IBGE.
    /// </summary>
    /// <param name="AValue">
    /// O nome da cidade a ser pesquisada.
    /// </param>
    /// <returns>
    /// Uma instância da interface para continuar a configuração da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the name of the city to be searched in IBGE.
    /// </summary>
    /// <param name="AValue">
    /// The name of the city to be searched.
    /// </param>
    /// <returns>
    /// An instance of the interface to continue configuring the search.
    /// </returns>
    {$ENDIF}
    function City(const AValue: string): ISetup4DCEPFilterIBGEAddress; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define a sigla do estado a ser pesquisada no IBGE.
    /// </summary>
    /// <param name="AValue">
    /// A sigla do estado a ser pesquisada.
    /// </param>
    /// <returns>
    /// Uma instância da interface para continuar a configuração da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the state abbreviation to be searched in IBGE.
    /// </summary>
    /// <param name="AValue">
    /// The state abbreviation to be searched.
    /// </param>
    /// <returns>
    /// An instance of the interface to continue configuring the search.
    /// </returns>
    {$ENDIF}
    function StateAbbreviated(const AValue: string): ISetup4DCEPFilterIBGEAddress; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define a sigla do estado a ser pesquisada no IBGE.
    /// </summary>
    /// <param name="AValue">
    /// A sigla do estado a ser pesquisada.
    /// </param>
    /// <returns>
    /// Uma instância da interface para continuar a configuração da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the state abbreviation to be searched in IBGE.
    /// </summary>
    /// <param name="AValue">
    /// The state abbreviation to be searched.
    /// </param>
    /// <returns>
    /// An instance of the interface to continue configuring the search.
    /// </returns>
    {$ENDIF}
    function StateAbbreviated(const AValue: TSetup4DUtilityEstadoAbreviado): ISetup4DCEPFilterIBGEAddress; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome da cidade atualmente definido na pesquisa do IBGE.
    /// </summary>
    /// <returns>
    /// O nome da cidade atualmente definido.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the currently set city name in the IBGE search.
    /// </summary>
    /// <returns>
    /// The currently set city name.
    /// </returns>
    {$ENDIF}
    function City: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém a sigla do estado atualmente definida na pesquisa do IBGE.
    /// </summary>
    /// <returns>
    /// A sigla do estado atualmente definida.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the currently set state abbreviation in the IBGE search.
    /// </summary>
    /// <returns>
    /// The currently set state abbreviation.
    /// </returns>
    {$ENDIF}
    function StateAbbreviated: string; overload;


    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Finaliza a configuração da pesquisa pelo código do IBGE com base no endereço, no framework.
    /// </summary>
    /// <returns>
    /// Uma interface de configuração do framework.
    /// </returns>
    /// <remarks>
    /// Este método finaliza a pesquisa pelo código do IBGE, no framework.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Finalizes the configuration of the IBGE code lookup based on the address within the framework.
    /// </summary>
    /// <returns>
    /// An interface for framework configuration.
    /// </returns>
    /// <remarks>
    /// This method concludes the IBGE address lookup within the framework.
    /// </remarks>
    {$ENDIF}
    function Finish: ISetup4DCEPFilterIBGE;
  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Interface para poder executar a pesquisa pelo CEP.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Interface for executing ZIP code lookup.
  /// </summary>
  {$ENDIF}
  ISetup4DCEPSearechZipCode  = interface
    ['{C5789576-C291-405A-949A-763727681C0B}']

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define se deve ser realizada uma nova configuração antes da execução.
    /// </summary>
    /// <returns>
    /// A interface de execução de CEP com código.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets whether a new configuration should be performed before execution.
    /// </summary>
    /// <returns>
    /// The zip code execution interface.
    /// </returns>
    {$ENDIF}
    function Reconfiguration: ISetup4DCEPSearechZipCode;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Executa a pesquisa de CEP por código.
    /// </summary>
    /// <returns>
    /// A interface de execução de CEP com código.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Executes the zip code search by code.
    /// </summary>
    /// <returns>
    /// The zip code execution interface.
    /// </returns>
    {$ENDIF}
    function Code: ISetup4DCEPSearechZipCode;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Executa a pesquisa de CEP por endereço.
    /// </summary>
    /// <returns>A interface de execução de CEP com código.</returns>
    {$ELSE}
    /// <summary>
    /// Executes the zip code search by address.
    /// </summary>
    /// <returns>
    /// The zip code execution interface.
    /// </returns>
    {$ENDIF}
    function Address: ISetup4DCEPSearechZipCode;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o componente interno associado a esta instância.
    /// </summary>
    /// <remarks>
    /// Esta função retorna o componente interno associado a esta instância.
    /// </remarks>
    /// <returns>
    /// O componente interno associado a esta instância.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the internal component associated with this instance.
    /// </summary>
    /// <remarks>
    /// This function returns the internal component associated with this instance.
    /// </remarks>
    /// <returns>
    /// The internal component associated with this instance.
    /// </returns>
    {$ENDIF}
    function Component : TComponent;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Conclui a execução da pesquisa por CEP
    /// </summary>
    /// <returns>
    /// Uma interface que executa a pesquisa por CEP.
    /// </returns>
    /// <remarks>
    /// Este método finaliza execução de pesquisa por CEP.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Concludes the execution of the ZIP code lookup.
    /// </summary>
    /// <returns>
    /// An interface for executing ZIP code lookup.
    /// </returns>
    /// <remarks>
    /// This method finalizes the execution of ZIP code lookup.
    /// </remarks>
    {$ENDIF}
    function Finish: ISetup4DCEPSearech;
  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Interface para poder executar a pesquisa pelo IBGE.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Interface for executing IBGE lookup.
  /// </summary>
  {$ENDIF}
  ISetup4DCEPSearechIBGE  = interface
    ['{C11E8EB2-DEE5-43FB-A159-9823CA3F3136}']

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Reconfigura as configurações de proxy e cache para execução do IBGE.
    /// </summary>
    /// <returns>
    /// A instância de execução do IBGE.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Reconfigures the proxy and cache settings for IBGE execution.
    /// </summary>
    /// <returns>
    /// The IBGE execution instance.
    /// </returns>
    {$ENDIF}
    function Reconfiguration: ISetup4DCEPSearechIBGE;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Executa uma pesquisa com base em código para dados do IBGE.
    /// </summary>
    /// <returns>
    /// A instância de execução do IBGE.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Executes a code-based search for IBGE data.
    /// </summary>
    /// <returns>
    /// The IBGE execution instance.
    /// </returns>
    {$ENDIF}
    function Code : ISetup4DCEPSearechIBGE;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Executa uma pesquisa com base em estado para dados do IBGE.
    /// </summary>
    /// <returns>
    /// A instância de execução do IBGE.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Executes a state-based search for IBGE data.
    /// </summary>
    /// <returns>
    /// The IBGE execution instance.
    /// </returns>
    {$ENDIF}
    function State : ISetup4DCEPSearechIBGE;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Executa uma pesquisa com base em cidade para dados do IBGE.
    /// </summary>
    /// <returns>
    /// A instância de execução do IBGE.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Executes a city-based search for IBGE data.
    /// </summary>
    /// <returns>
    /// The IBGE execution instance.
    /// </returns>
    {$ENDIF}
    function City : ISetup4DCEPSearechIBGE;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o componente interno associado a esta instância.
    /// </summary>
    /// <remarks>
    /// Esta função retorna o componente interno associado a esta instância.
    /// </remarks>
    /// <returns>
    /// O componente interno associado a esta instância.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the internal component associated with this instance.
    /// </summary>
    /// <remarks>
    /// This function returns the internal component associated with this instance.
    /// </remarks>
    /// <returns>
    /// The internal component associated with this instance.
    /// </returns>
    {$ENDIF}
    function Component : TComponent;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Conclui a execução da pesquisa por IBGE
    /// </summary>
    /// <returns>
    /// Uma interface que executa a pesquisa por IBGE.
    /// </returns>
    /// <remarks>
    /// Este método finaliza execução de pesquisa por IBGE.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Concludes the execution of the IBGE lookup.
    /// </summary>
    /// <returns>
    /// An interface for executing IBGE lookup.
    /// </returns>
    /// <remarks>
    /// This method finalizes the execution of IBGE lookup.
    /// </remarks>
    {$ENDIF}
    function Finish: ISetup4DCEPSearech;
  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Interface que configura o resultado da pesquisa do CEP.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Interface that configures the result of the ZIP code lookup.
  /// </summary>
  {$ENDIF}
  ISetup4DCEPResultZipCode  = interface
    ['{E4C354A6-03AC-4FB5-96A8-0AE557CD3D70}']

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém um objeto que permite o acesso à interface de exibição dos resultados de pesquisa de CEP.
    /// </summary>
    /// <remarks>
    /// Esta função retorna um objeto que oferece acesso às informações detalhadas do resultado de pesquisa de CEP.
    /// </remarks>
    /// <returns>
    /// Um objeto que permite o acesso à interface de exibição dos resultados de pesquisa de CEP.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets an object that allows access to the display interface of ZIP code search results.
    /// </summary>
    /// <remarks>
    /// This function returns an object that provides access to detailed information of the ZIP code search result.
    /// </remarks>
    /// <returns>
    /// An object that allows access to the display interface of ZIP code search results.
    /// </returns>
    {$ENDIF}
    function Display: iSetup4DCEPResultZipCodeDisplay;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o objeto JSON correspondente a este resultado de pesquisa de CEP.
    /// </summary>
    /// <param name="AValue">O objeto JSON correspondente a este resultado de pesquisa de CEP.</param>
    /// <remarks>
    /// Esta função retorna o objeto JSON que corresponde a este resultado de pesquisa de CEP.
    /// </remarks>
    /// <returns>
    /// O objeto JSON correspondente a este resultado de pesquisa de CEP.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the JSON object corresponding to this ZIP code search result.
    /// </summary>
    /// <param name="AValue">The JSON object corresponding to this ZIP code search result.</param>
    /// <remarks>
    /// This function returns the JSON object corresponding to this ZIP code search result.
    /// </remarks>
    /// <returns>
    /// The JSON object corresponding to this ZIP code search result.
    /// </returns>
    {$ENDIF}
    function JSONObject(out AValue: TJSONObject): ISetup4DCEPResultZipCode; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o objeto JSON correspondente a este resultado de pesquisa de CEP.
    /// </summary>
    /// <remarks>
    /// Esta função retorna o objeto JSON que corresponde a este resultado de pesquisa de CEP.
    /// </remarks>
    /// <returns>
    /// O objeto JSON correspondente a este resultado de pesquisa de CEP.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the JSON object corresponding to this ZIP code search result.
    /// </summary>
    /// <remarks>
    /// This function returns the JSON object corresponding to this ZIP code search result.
    /// </remarks>
    /// <returns>
    /// The JSON object corresponding to this ZIP code search result.
    /// </returns>
    {$ENDIF}
    function JSONObject: TJSONObject; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o objeto JSON correspondente a este resultado de pesquisa de CEP em formato de string.
    /// </summary>
    /// <remarks>
    /// Esta função retorna o objeto JSON que corresponde a este resultado de pesquisa de CEP em formato de string.
    /// </remarks>
    /// <returns>O objeto JSON correspondente a este resultado de pesquisa de CEP em formato de string.</returns>
    {$ELSE}
    /// <summary>
    /// Gets the JSON object corresponding to this ZIP code search result as a string.
    /// </summary>
    /// <remarks>
    /// This function returns the JSON object corresponding to this ZIP code search result as a string.
    /// </remarks>
    /// <returns>
    /// The JSON object corresponding to this ZIP code search result as a string.
    /// </returns>
    {$ENDIF}
    function JSONObjectInStr: String; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém um JSONArray da resposta do CEP.
    /// </summary>
    /// <remarks>
    /// Esta função retorna um JSONArray contendo os dados da resposta do CEP, se disponível.
    /// </remarks>
    /// <returns>
    /// Um JSONArray com os dados do CEP.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets a JSONArray from the CEP response.
    /// </summary>
    /// <remarks>
    /// This function returns a JSONArray containing the data from the CEP response, if available.
    /// </remarks>
    /// <returns>
    /// A JSONArray with CEP data.
    /// </returns>
    {$ENDIF}
    function JSONArray: TJSONArray; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o número total de registros na resposta do CEP.
    /// </summary>
    /// <remarks>
    /// Esta função retorna o número total de registros contidos na resposta do CEP, se disponível.
    /// </remarks>
    /// <returns>
    /// O número total de registros na resposta do CEP.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the total number of records in the CEP response.
    /// </summary>
    /// <remarks>
    /// This function returns the total number of records contained in the CEP response, if available.
    /// </remarks>
    /// <returns>
    /// The total number of records in the CEP response.
    /// </returns>
    {$ENDIF}
    function RecordCount : Int64;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o número total de registros na resposta do CEP como uma string.
    /// </summary>
    /// <remarks>
    /// Esta função retorna o número total de registros na resposta do CEP como uma string, se disponível.
    /// </remarks>
    /// <returns>
    /// O número total de registros na resposta do CEP como uma string.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the total number of records in the CEP response as a string.
    /// </summary>
    /// <remarks>
    /// This function returns the total number of records in the CEP response as a string, if available.
    /// </remarks>
    /// <returns>
    /// The total number of records in the CEP response as a string.
    /// </returns>
    {$ENDIF}
    function RecordCountInStr : string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Conclui o resultado da pesquisa do CEP no framework
    /// </summary>
    /// <returns>
    /// Uma interface de resultado do framework.
    /// </returns>
    /// <remarks>
    /// Este método finaliza o resultado da pesquisa do CEP no framework.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Finalizes the result of the ZIP code lookup within the framework.
    /// </summary>
    /// <returns>
    /// An interface for the framework's result.
    /// </returns>
    /// <remarks>
    /// This method concludes the result of the ZIP code lookup within the framework.
    /// </remarks>
    {$ENDIF}
    function Finish: ISetup4DCEPResult;
  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Interface que mostra o resultado da pesquisa do IBGE.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Interface that displays the result of the IBGE code lookup.
  /// </summary>
  {$ENDIF}
  iSetup4DCEPResultZipCodeDisplay = interface
    ['{3935086D-007E-444F-91CD-600C3AF53AD3}']

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o CEP (Código de Endereçamento Postal) associado a este resultado de pesquisa.
    /// </summary>
    /// <remarks>
    /// Esta função retorna o CEP (Código de Endereçamento Postal) do endereço encontrado durante a pesquisa.
    /// </remarks>
    /// <returns>
    /// O CEP associado a este resultado de pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the postal code (CEP) associated with this search result.
    /// </summary>
    /// <remarks>
    /// This function returns the postal code (CEP) of the address found during the search.
    /// </remarks>
    /// <returns>
    /// The postal code associated with this search result.
    /// </returns>
    {$ENDIF}
    function Code: string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o tipo de logradouro (por exemplo, "Rua", "Avenida") associado a este resultado de pesquisa.
    /// </summary>
    /// <remarks>
    /// Esta função retorna o tipo de logradouro (por exemplo, "Rua" ou "Avenida") do endereço encontrado durante a pesquisa.
    /// </remarks>
    /// <returns>
    /// O tipo de logradouro associado a este resultado de pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the street type (e.g., "Rua" for "Street," "Avenida" for "Avenue") associated with this search result.
    /// </summary>
    /// <remarks>
    /// This function returns the street type (e.g., "Rua" or "Avenida") of the address found during the search.
    /// </remarks>
    /// <returns>
    /// The street type associated with this search result.
    /// </returns>
    {$ENDIF}
    function Types: string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome da rua associado a este resultado de pesquisa.
    /// </summary>
    /// <remarks>
    /// Esta função retorna o nome da rua do endereço encontrado durante a pesquisa.
    /// </remarks>
    /// <returns>
    /// O nome da rua associado a este resultado de pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the street name associated with this search result.
    /// </summary>
    /// <remarks>
    /// This function returns the name of the street of the address found during the search.
    /// </remarks>
    /// <returns>
    /// The street name associated with this search result.
    /// </returns>
    {$ENDIF}
    function Street: string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome completo da rua, incluindo o tipo (por exemplo, "Rua Main" ou "Avenida Central").
    /// </summary>
    /// <remarks>
    /// Esta função retorna o nome completo da rua, incluindo o tipo (por exemplo, "Rua Main" ou "Avenida Central"), do endereço encontrado durante a pesquisa.
    /// </remarks>
    /// <returns>O nome completo da rua associado a este resultado de pesquisa.</returns>
    {$ELSE}
    /// <summary>
    /// Gets the full street name, including the type (e.g., "Main Street" or "Central Avenue") associated with this search result.
    /// </summary>
    /// <remarks>
    /// This function returns the full street name, including the type (e.g., "Main Street" or "Central Avenue"), of the address found during the search.
    /// </remarks>
    /// <returns>
    /// The full street name associated with this search result.
    /// </returns>
    {$ENDIF}
    function StreetComplete: string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém informações adicionais sobre o endereço, como complemento, apartamento, bloco, etc.
    /// </summary>
    /// <remarks>
    /// Esta função retorna informações adicionais sobre o endereço, como complemento, apartamento, bloco, etc., encontradas durante a pesquisa.
    /// </remarks>
    /// <returns>Informações adicionais de endereço associadas a este resultado de pesquisa.</returns>
    {$ELSE}
    /// <summary>
    /// Gets additional address information, such as complement, apartment, block, etc. associated with this search result.
    /// </summary>
    /// <remarks>
    /// This function returns additional address information, such as complement, apartment, block, etc., found during the search.
    /// </remarks>
    /// <returns>
    /// Additional address information associated with this search result.
    /// </returns>
    {$ENDIF}
    function Complement: string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome do bairro associado a este resultado de pesquisa.
    /// </summary>
    /// <remarks>
    /// Esta função retorna o nome do bairro do endereço encontrado durante a pesquisa.
    /// </remarks>
    /// <returns>
    /// O nome do bairro associado a este resultado de pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the neighborhood name associated with this search result.
    /// </summary>
    /// <remarks>
    /// This function returns the neighborhood name of the address found during the search.
    /// </remarks>
    /// <returns>
    /// The neighborhood name associated with this search result.
    /// </returns>
    {$ENDIF}
    function District: string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome da cidade associado a este resultado de pesquisa.
    /// </summary>
    /// <remarks>
    /// Esta função retorna o nome da cidade do endereço encontrado durante a pesquisa.
    /// </remarks>
    /// <returns>
    /// O nome da cidade associado a este resultado de pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the city name associated with this search result.
    /// </summary>
    /// <remarks>
    /// This function returns the city name of the address found during the search.
    /// </remarks>
    /// <returns>
    /// The city name associated with this search result.
    /// </returns>
    {$ENDIF}
    function City: string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o código da cidade no padrão do IBGE associado a este resultado de pesquisa.
    /// </summary>
    /// <remarks>
    /// Esta função retorna o código da cidade no padrão do IBGE do endereço encontrado durante a pesquisa.
    /// </remarks>
    /// <returns>
    /// O código da cidade no padrão do IBGE associado a este resultado de pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the city code in the IBGE standard associated with this search result.
    /// </summary>
    /// <remarks>
    /// This function returns the city code in the IBGE standard of the address found during the search.
    /// </remarks>
    /// <returns>
    /// The city code in the IBGE standard associated with this search result.
    /// </returns>
    {$ENDIF}
    function IBGECity: string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome do estado associado a este resultado de pesquisa.
    /// </summary>
    /// <remarks>
    /// Esta função retorna o nome do estado do endereço encontrado durante a pesquisa.
    /// </remarks>
    /// <returns>
    /// O nome do estado associado a este resultado de pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the state name associated with this search result.
    /// </summary>
    /// <remarks>
    /// This function returns the state name of the address found during the search.
    /// </remarks>
    /// <returns>
    /// The state name associated with this search result.
    /// </returns>
    {$ENDIF}
    function State: string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o código do estado no padrão do IBGE associado a este resultado de pesquisa.
    /// </summary>
    /// <remarks>
    /// Esta função retorna o código do estado no padrão do IBGE do endereço encontrado durante a pesquisa.
    /// </remarks>
    /// <returns>
    /// O código do estado no padrão do IBGE associado a este resultado de pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the state code in the IBGE standard associated with this search result.
    /// </summary>
    /// <remarks>
    /// This function returns the state code in the IBGE standard of the address found during the search.
    /// </remarks>
    /// <returns>
    /// The state code in the IBGE standard associated with this search result.
    /// </returns>
    {$ENDIF}
    function IBGEState: string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o código de discagem direta a distância (DDD) associado a este resultado de pesquisa.
    /// </summary>
    /// <remarks>
    /// Esta função retorna o código de discagem direta a distância (DDD) associado ao estado deste resultado de pesquisa.
    /// </remarks>
    /// <returns>
    /// O código DDD associado a este resultado de pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the direct dialing distance (DDD) code associated with this search result.
    /// </summary>
    /// <remarks>
    /// This function returns the direct dialing distance (DDD) code associated with the state of this search result.
    /// </remarks>
    /// <returns>
    /// The DDD code associated with this search result.
    /// </returns>
    {$ENDIF}
    function DDD: string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o código GIA (Gerência de Informações de Arrecadação) associado a este resultado de pesquisa.
    /// É uma declaração acessória obrigatória para apuração de valores a título de ICMS.
    /// </summary>
    /// <remarks>
    /// Esta função retorna o código GIA (Gerência de Informações de Arrecadação) associado a este resultado de pesquisa.
    /// </remarks>
    /// <returns>
    /// O código GIA associado a este resultado de pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the GIA (Revenue Information Management) code associated with this search result.
    /// This is a mandatory ancillary statement for the calculation of ICMS (Value Added Tax) amounts.
    /// </summary>
    /// <remarks>
    /// This function returns the GIA (Gerência de Informações de Arrecadação) code associated with this search result.
    /// </remarks>
    /// <returns>
    /// The GIA code associated with this search result.
    /// </returns>
    {$ENDIF}
    function GIA: string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o código SIAFI (Sistema Integrado de Administração Financeira) associado a este resultado de pesquisa.
    /// É o principal instrumento utilizado para registro, acompanhamento e
    /// controle da execução orçamentária, financeira, patrimonial e contábil do Governo Federal
    /// </summary>
    /// <remarks>
    /// Esta função retorna o código SIAFI (Sistema Integrado de Administração Financeira) associado a este resultado de pesquisa.
    /// </remarks>
    /// <returns>
    /// O código SIAFI associado a este resultado de pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the SIAFI (Integrated Financial Administration System) code associated with this search result.
    /// It is the main instrument used for the registration, monitoring, and
    /// control of the budgetary, financial, patrimonial, and accounting execution of the Federal Government.
    /// </summary>
    /// <remarks>
    /// This function returns the SIAFI (Sistema Integrado de Administração Financeira) code associated with this search result.
    /// </remarks>
    /// <returns>
    /// The SIAFI code associated with this search result.
    /// </returns>
    {$ENDIF}
    function SIAFI: string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém a altitude associada a este resultado de pesquisa de CEP.
    /// </summary>
    /// <remarks>
    /// Esta função retorna a altitude associada ao local correspondente ao resultado de pesquisa de CEP.
    /// </remarks>
    /// <returns>
    /// A altitude associada a este resultado de pesquisa de CEP.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the altitude associated with this ZIP code search result.
    /// </summary>
    /// <remarks>
    /// This function returns the altitude associated with the location corresponding to the ZIP code search result.
    /// </remarks>
    /// <returns>
    /// The altitude associated with this ZIP code search result.
    /// </returns>
    {$ENDIF}
    function Altitude: string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém a latitude associada a este resultado de pesquisa de CEP.
    /// </summary>
    /// <remarks>
    /// Esta função retorna a latitude associada ao local correspondente ao resultado de pesquisa de CEP.
    /// </remarks>
    /// <returns>
    /// A latitude associada a este resultado de pesquisa de CEP.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the latitude associated with this ZIP code search result.
    /// </summary>
    /// <remarks>
    /// This function returns the latitude associated with the location corresponding to the ZIP code search result.
    /// </remarks>
    /// <returns>
    /// The latitude associated with this ZIP code search result.
    /// </returns>
    {$ENDIF}
    function Latitude: string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém a longitude associada a este resultado de pesquisa de CEP.
    /// </summary>
    /// <remarks>
    /// Esta função retorna a longitude associada ao local correspondente ao resultado de pesquisa de CEP.
    /// </remarks>
    /// <returns>
    /// A longitude associada a este resultado de pesquisa de CEP.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the longitude associated with this ZIP code search result.
    /// </summary>
    /// <remarks>
    /// This function returns the longitude associated with the location corresponding to the ZIP code search result.
    /// </remarks>
    /// <returns>
    /// The longitude associated with this ZIP code search result.
    /// </returns>
    {$ENDIF}
    function  Longitude: string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define um objeto JSON para esta instância a partir de um TJSONObject.
    /// </summary>
    /// <remarks>
    /// Esta função define um objeto JSON para esta instância a partir de um TJSONObject.
    /// </remarks>
    /// <param name="AValue">
    /// O objeto JSON a ser definido.
    /// </param>
    /// <returns>
    /// Uma instância da interface que fornece métodos para exibir o JSON.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets a JSON object for this instance from a TJSONObject.
    /// </summary>
    /// <remarks>
    /// This function sets a JSON object for this instance from a TJSONObject.
    /// </remarks>
    /// <param name="AValue">
    /// The JSON object to be set.
    /// </param>
    /// <returns>
    /// An instance of the interface that provides methods for displaying the JSON.
    /// </returns>
    {$ENDIF}
    function JSON (Const AValue: TJSONObject) : iSetup4DCEPResultZipCodeDisplay; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Mostrar o resultado da pesquisa.
    /// </summary>
    /// <returns>
    /// Uma interface de resultado do framework.
    /// </returns>
    /// <remarks>
    /// Este método finaliza a apresentação da pesquisa do CEP no framework.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Display the search result.
    /// </summary>
    /// <returns>
    /// An interface for the framework's result.
    /// </returns>
    /// <remarks>
    /// This method concludes the presentation of the ZIP code search in the framework.
    /// </remarks>
    {$ENDIF}
    function Finish: iSetup4DCEPResultZipCode;
  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Interface que configura o resultado da pesquisa do IBGE.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Interface that configures the result of the IBGE lookup.
  /// </summary>
  {$ENDIF}
  ISetup4DCEPResultIBGE  = interface
    ['{5E76FB51-23D1-41D9-AF8B-18CA3DA49053}']

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém a interface para configuração da exibição dos resultados das consultas por IBGE.
    /// </summary>
    /// <returns>
    /// A interface de configuração da exibição de resultados por IBGE.
    /// </returns>
    /// <remarks>
    /// Este método retorna a função que exibe o resultado.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Gets the interface for configuring the display of results for IBGE queries.
    /// </summary>
    /// <returns>
    /// The interface for configuring the display of IBGE query results.
    /// </returns>
    /// <remarks>
    /// This method returns the function that displays the result.
    /// </remarks>
    {$ENDIF}
    function Display: ISetup4DCEPResultIBGEDisplay;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o objeto JSON associado a este resultado.
    /// </summary>
    /// <param name="AValue">
    /// O objeto JSON associado a este resultado.
    /// </param>
    /// <remarks>
    /// Esta função fornece acesso ao objeto JSON que contém informações detalhadas sobre a consulta do IBGE.
    /// Você pode usar esse objeto para obter informações específicas, como códigos de UF, município e outras informações do IBGE.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Gets the JSON object associated with this result.
    /// </summary>
    /// <param name="AValue">
    /// The JSON object associated with this result.
    /// </param>
    /// <remarks>
    /// This function provides access to the JSON object that contains detailed information about the IBGE.
    /// You can use this object to retrieve specific information, such as UF codes, municipality, and other IBGE-related details.
    /// </remarks>
    {$ENDIF}
    function JSONObject(out AValue: TJSONObject): ISetup4DCEPResultIBGE; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o objeto JSON associado a este resultado.
    /// </summary>
    /// <returns>O objeto JSON associado a este resultado.</returns>
    /// <remarks>
    /// Esta função fornece acesso ao objeto JSON que contém informações detalhadas sobre a consulta do IBGE.
    /// Você pode usar esse objeto para obter informações específicas, como códigos de UF, município e outras informações do IBGE.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Gets the JSON object associated with this result.
    /// </summary>
    /// <returns>The JSON object associated with this result.</returns>
    /// <remarks>
    /// This function provides access to the JSON object that contains detailed information about the IBGE.
    /// You can use this object to retrieve specific information, such as UF codes, municipality, and other IBGE-related details.
    /// </remarks>
    {$ENDIF}
    function JSONObject: TJSONObject; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém uma representação em string do objeto JSON associado a este resultado.
    /// </summary>
    /// <returns>
    /// Uma representação em string do objeto JSON associado a este resultado.
    /// </returns>
    /// <remarks>
    /// Esta função fornece uma representação em formato de string do objeto JSON associado a este resultado.
    /// Isso pode ser útil para depuração ou exibição de informações do resultado.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Gets a string representation of the JSON object associated with this result.
    /// </summary>
    /// <returns>
    /// A string representation of the JSON object associated with this result.
    /// </returns>
    /// <remarks>
    /// This function provides a string format representation of the JSON object associated with this result.
    /// This can be useful for debugging or displaying result information.
    /// </remarks>
    {$ENDIF}
    function JSONObjectInStr: string; overload;


    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Conclui o resultado da pesquisa do IBGE no framework
    /// </summary>
    /// <returns>
    /// Uma interface de resultado do framework.
    /// </returns>
    /// <remarks>
    /// Este método finaliza o resultado da pesquisa do IBGE no framework.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Finalizes the result of the IBGE lookup within the framework.
    /// </summary>
    /// <returns>
    /// An interface for the framework's result.
    /// </returns>
    /// <remarks>
    /// This method concludes the result of the IBGE lookup within the framework.
    /// </remarks>
    {$ENDIF}
    function Finish: ISetup4DCEPResult;
  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Interface que mostra o resultado da pesquisa do IBGE.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Interface that displays the result of the IBGE code lookup.
  /// </summary>
  {$ENDIF}
  iSetup4DCEPResultIBGEDisplay = interface
    ['{CF6EDFB4-FEEC-4D48-850A-2FD06D3E44BF}']

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o código da Unidade Federativa (UF) relacionado ao resultado da consulta por IBGE.
    /// </summary>
    /// <returns>
    /// O código da UF relacionado ao resultado.
    /// </returns>
    /// <remarks>
    /// Esta função retorna o código da Unidade Federativa (UF) associado ao resultado da consulta por IBGE.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Gets the code of the Federal Unit (UF) associated with the IBGE query result.
    /// </summary>
    /// <returns>
    /// The code of the UF related to the result.
    /// </returns>
    /// <remarks>
    /// This function returns the code of the Federal Unit (UF) associated with the IBGE query result.
    /// </remarks>
    {$ENDIF}
    function StateCode: string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome da Unidade Federativa (UF) relacionado ao resultado da consulta por IBGE.
    /// </summary>
    /// <returns>
    /// O nome da UF relacionado ao resultado.
    /// </returns>
    /// <remarks>
    /// Esta função retorna o nome da Unidade Federativa (UF) associado ao resultado da consulta por IBGE.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Gets the name of the Federal Unit (UF) associated with the IBGE query result.
    /// </summary>
    /// <returns>
    /// The name of the UF related to the result.
    /// </returns>
    /// <remarks>
    /// This function returns the name of the Federal Unit (UF) associated with the IBGE query result.
    /// </remarks>
    {$ENDIF}
    function State: string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o código do município relacionado ao resultado da consulta por IBGE.
    /// </summary>
    /// <returns>
    /// O código do município relacionado ao resultado.
    /// </returns>
    /// <remarks>
    /// Esta função retorna o código do município associado ao resultado da consulta por IBGE.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Gets the code of the municipality associated with the IBGE query result.
    /// </summary>
    /// <returns>
    /// The code of the municipality related to the result.
    /// </returns>
    /// <remarks>
    /// This function returns the code of the municipality associated with the IBGE query result.
    /// </remarks>
    {$ENDIF}
    function CityCode: string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome do município relacionado ao resultado da consulta por IBGE.
    /// </summary>
    /// <returns>
    /// O nome do município relacionado ao resultado.
    /// </returns>
    /// <remarks>
    /// Esta função retorna o nome do município associado ao resultado da consulta por IBGE.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Gets the name of the municipality associated with the IBGE query result.
    /// </summary>
    /// <returns>
    /// The name of the municipality related to the result.
    /// </returns>
    /// <remarks>
    /// This function returns the name of the municipality associated with the IBGE query result.
    /// </remarks>
    {$ENDIF}
    function City: string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém a área relacionada ao resultado da consulta por IBGE.
    /// </summary>
    /// <returns>
    /// A área relacionada ao resultado.
    /// </returns>
    /// <remarks>
    /// Esta função retorna a área associada ao resultado da consulta por IBGE.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Gets the area associated with the IBGE query result.
    /// </summary>
    /// <returns>
    /// The area related to the result.
    /// </returns>
    /// <remarks>
    /// This function returns the area associated with the IBGE query result.
    /// </remarks>
    {$ENDIF}
    function Zone: string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define um objeto JSON para esta instância a partir de um TJSONObject.
    /// </summary>
    /// <remarks>
    /// Esta função define um objeto JSON para esta instância a partir de um TJSONObject.
    /// </remarks>
    /// <param name="AValue">
    /// O objeto JSON a ser definido.
    /// </param>
    /// <returns>
    /// Uma instância da interface que fornece métodos para exibir o JSON.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets a JSON object for this instance from a TJSONObject.
    /// </summary>
    /// <remarks>
    /// This function sets a JSON object for this instance from a TJSONObject.
    /// </remarks>
    /// <param name="AValue">
    /// The JSON object to be set.
    /// </param>
    /// <returns>
    /// An instance of the interface that provides methods for displaying the JSON.
    /// </returns>
    {$ENDIF}
    function JSON (Const AValue: TJSONObject) : iSetup4DCEPResultIBGEDisplay; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Mostrar o resultado da pesquisa.
    /// </summary>
    /// <returns>
    /// Uma interface de resultado do framework.
    /// </returns>
    /// <remarks>
    /// Este método finaliza a apresentação da pesquisa do IBGE no framework.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Display the search result.
    /// </summary>
    /// <returns>
    /// An interface for the framework's result.
    /// </returns>
    /// <remarks>
    /// This method concludes the presentation of the IBGE search in the framework.
    /// </remarks>
    {$ENDIF}
    function Finish: iSetup4DCEPResultIBGE;
  end;

implementation

end.
