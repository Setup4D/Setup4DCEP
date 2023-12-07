unit Setup4D.CEP.Interf;

{$IFNDEF FPC}
{$I Setup4DCEPLanguage.inc}
{$ENDIF}

interface

uses
  {$IFDEF FPC}
  Classes,
  fpjson,

  {$ELSE}
  System.Classes,
  System.JSON,
  {$ENDIF}

  Setup4D.Utility.Enum;

type
  ISetup4DCEP = interface;
  ISetup4DCEPConfiguration = interface;
  ISetup4DCEPConfigurationProxy = interface;
  ISetup4DCEPConfigurationWebService = interface;
  ISetup4DCEPFilter = interface;
  ISetup4DCEPFilterIBGE = interface;
  ISetup4DCEPFilterZipCode = interface;
  ISetup4DCEPSearech  = interface;
  ISetup4DCEPSearechIBGE = interface;
  ISetup4DCEPSearechZipCode = interface;
  ISetup4DCEPResult = interface;
  ISetup4DCEPResultIBGE = interface;
  ISetup4DCEPResultZipCode = interface;

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
  /// Interface que configura o Proxy do framework.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Interface for configuring the framework's Proxy.
  /// </summary>
  {$ENDIF}
  ISetup4DCEPConfigurationProxy = interface

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
  /// Interface que configura o Web Service do framework.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Interface for configuring the framework's web service.
  /// </summary>
  {$ENDIF}
  ISetup4DCEPConfigurationWebService = interface

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define a URL base para o serviço web de configuração do CEP.
    /// </summary>
    /// <param name="AValue">
    /// A URL base para o serviço web.
    /// </param>
    /// <returns>
    /// A instância atual da interface ISetup4DCEPConfigurationWebService.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the base URL for the CEP configuration web service.
    /// </summary>
    /// <param name="AValue">
    /// The base URL for the web service.
    /// </param>
    /// <returns>
    /// The current instance of the ISetup4DCEPConfigurationWebService interface.
    /// </returns>
    {$ENDIF}
    function BaseURL(Const AValue: string): ISetup4DCEPConfigurationWebService; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém a URL base atualmente configurada para o serviço web de configuração do CEP.
    /// </summary>
    /// <returns>
    /// A URL base como uma string.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the currently configured base URL for the CEP configuration web service.
    /// </summary>
    /// <returns>
    /// The base URL as a string.
    /// </returns>
    {$ENDIF}
    function BaseURL: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define se o texto do CEP deve ser convertido para maiúsculas.
    /// </summary>
    /// <param name="AValue">
    /// Indica se o texto do CEP deve ser convertido para maiúsculas (True) ou não (False).
    /// </param>
    /// <returns>
    /// A instância atual da interface ISetup4DCEPConfigurationWebService.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets whether the CEP text should be converted to uppercase.
    /// </summary>
    /// <param name="AValue">
    /// Indicates whether the CEP text should be converted to uppercase (True) or not (False).
    /// </param>
    /// <returns>
    /// The current instance of the ISetup4DCEPConfigurationWebService interface.
    /// </returns>
    {$ENDIF}
    function UpperText(Const AValue: Boolean): ISetup4DCEPConfigurationWebService; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o valor indicando se o texto do CEP deve ser convertido para maiúsculas.
    /// </summary>
    /// <returns>
    /// True se o texto do CEP deve ser convertido para maiúsculas, False caso contrário.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the value indicating whether the CEP text should be converted to uppercase.
    /// </summary>
    /// <returns>
    /// True if the CEP text should be converted to uppercase, False otherwise.
    /// </returns>
    {$ENDIF}
    function UpperText: Boolean; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o valor do texto do CEP, convertido para maiúsculas ou não, como uma string.
    /// </summary>
    /// <returns>
    /// O texto do CEP como uma string.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the value of the CEP text, converted to uppercase or not, as a string.
    /// </summary>
    /// <returns>
    /// The CEP text as a string.
    /// </returns>
    {$ENDIF}
    function UpperTextInString: string; overload;

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
    function Key(Const AValue: string) : ISetup4DCEPConfigurationWebService; overload;

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
    function User(Const AValue: string) : ISetup4DCEPConfigurationWebService; overload;

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
    function Password(Const AValue: string) : ISetup4DCEPConfigurationWebService; overload;

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
  /// Interface que define a pesquisa do framework de pesquisa de CEP.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Interface defining the search functionality of the ZIP code lookup framework.
  /// </summary>
  {$ENDIF}
  ISetup4DCEPFilter = interface
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
  /// Interface que define a pesquisa do código do IBGE no framework de pesquisa de CEP.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Interface defining the IBGE code search within the ZIP code lookup framework.
  /// </summary>
  {$ENDIF}
  ISetup4DCEPFilterIBGE = interface
    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define o código do país para filtrar resultados da consulta por IBGE.
    /// </summary>
    /// <param name="AValue">
    /// O código do país a ser definido para o filtro.
    /// </param>
    /// <returns>
    /// A instância atual da interface ISetup4DCEPFilterIBGE.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the country code to filter in the IBGE query web service.
    /// </summary>
    /// <param name="AValue">
    /// The country code to be set for the filter.
    /// </param>
    /// <returns>
    /// The current instance of the ISetup4DCEPFilterIBGE interface.
    /// </returns>
    {$ENDIF}
    function Country(Const AValue: string): ISetup4DCEPFilterIBGE; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o código do país atualmente configurado para o filtro de consulta por IBGE.
    /// </summary>
    /// <returns>
    /// O código do país como uma string.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the currently configured country code for filtering in the IBGE query web service.
    /// </summary>
    /// <returns>
    /// The country code as a string.
    /// </returns>
    {$ENDIF}
    function Country: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define o código IBGE para filtrar a consulta por IBGE.
    /// </summary>
    /// <param name="AValue">
    /// O código IBGE a ser definido para o filtro.
    /// </param>
    /// <returns>
    /// A instância atual da interface ISetup4DCEPFilterIBGE.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the IBGE code to filter in the IBGE query web service.
    /// </summary>
    /// <param name="AValue">
    /// The IBGE code to be set for the filter.
    /// </param>
    /// <returns>
    /// The current instance of the ISetup4DCEPFilterIBGE interface.
    /// </returns>
    {$ENDIF}
    function Code(Const AValue: string): ISetup4DCEPFilterIBGE; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o código IBGE atualmente configurado para o filtro de consulta por IBGE.
    /// </summary>
    /// <returns>
    /// O código IBGE como uma string.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the currently configured IBGE code for filtering in the IBGE query web service.
    /// </summary>
    /// <returns>
    /// The IBGE code as a string.
    /// </returns>
    {$ENDIF}
    function Code: string; overload;

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
    function City(const AValue: string): ISetup4DCEPFilterIBGE; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define o estado a ser pesquisada no IBGE.
    /// </summary>
    /// <param name="AValue">
    /// A sigla do estado a ser pesquisada.
    /// </param>
    /// <returns>
    /// Uma instância da interface para continuar a configuração da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the state to be searched in IBGE.
    /// </summary>
    /// <param name="AValue">
    /// The state to be searched.
    /// </param>
    /// <returns>
    /// An instance of the interface to continue configuring the search.
    /// </returns>
    {$ENDIF}
    function State(const AValue: string): ISetup4DCEPFilterIBGE; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define o estado a ser pesquisada no IBGE.
    /// </summary>
    /// <param name="AValue">
    /// A Enum do estado a ser pesquisada.
    /// </param>
    /// <returns>
    /// Uma instância da interface para continuar a configuração da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the state to be searched in IBGE.
    /// </summary>
    /// <param name="AValue">
    /// The state Enum to be searched.
    /// </param>
    /// <returns>
    /// An instance of the interface to continue configuring the search.
    /// </returns>
    {$ENDIF}
    function State(const AValue: TSetup4DUtilityEstadoAbreviado): ISetup4DCEPFilterIBGE; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define o estado a ser pesquisada no IBGE.
    /// </summary>
    /// <param name="AValue">
    /// A Enum do estado a ser pesquisada.
    /// </param>
    /// <returns>
    /// Uma instância da interface para continuar a configuração da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the state to be searched in IBGE.
    /// </summary>
    /// <param name="AValue">
    /// The state Enum to be searched.
    /// </param>
    /// <returns>
    /// An instance of the interface to continue configuring the search.
    /// </returns>
    {$ENDIF}
    function State(const AValue: TSetup4DUtilityEstado): ISetup4DCEPFilterIBGE; overload;

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
    function State: string; overload;

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
  /// Interface que define a pesquisa do framework de pesquisa de CEP.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Interface defining the search functionality of the ZIP code lookup framework.
  /// </summary>
  {$ENDIF}
  ISetup4DCEPFilterZipCode = interface

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define o nome da rua para filtrar resultados de CEPs no serviço web de consulta por CEP.
    /// </summary>
    /// <param name="AValue">
    /// O nome da rua a ser definido para o filtro.
    /// </param>
    /// <returns>
    /// A instância atual da interface ISetup4DCEPFilterZipCode.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the street name to filter CEP results in the ZIP code query web service.
    /// </summary>
    /// <param name="AValue">
    /// The street name to be set for the filter.
    /// </param>
    /// <returns>
    /// The current instance of the ISetup4DCEPFilterZipCode interface.
    /// </returns>
    {$ENDIF}
    function Street(Const AValue: string): ISetup4DCEPFilterZipCode; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define o nome do bairro para filtrar resultados de CEPs no serviço web de consulta por CEP.
    /// </summary>
    /// <param name="AValue">
    /// O nome do bairro a ser definido para o filtro.
    /// </param>
    /// <returns>
    /// A instância atual da interface ISetup4DCEPFilterZipCode.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the district name to filter CEP results in the ZIP code query web service.
    /// </summary>
    /// <param name="AValue">
    /// The district name to be set for the filter.
    /// </param>
    /// <returns>
    /// The current instance of the ISetup4DCEPFilterZipCode interface.
    /// </returns>
    {$ENDIF}
    function District(Const AValue: string): ISetup4DCEPFilterZipCode; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define o nome da cidade para filtrar resultados de CEPs no serviço web de consulta por CEP.
    /// </summary>
    /// <param name="AValue">
    /// O nome da cidade a ser definido para o filtro.
    /// </param>
    /// <returns>
    /// A instância atual da interface ISetup4DCEPFilterZipCode.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the city name to filter CEP results in the ZIP code query web service.
    /// </summary>
    /// <param name="AValue">
    /// The city name to be set for the filter.
    /// </param>
    /// <returns>
    /// The current instance of the ISetup4DCEPFilterZipCode interface.
    /// </returns>
    {$ENDIF}
    function City(Const AValue: string): ISetup4DCEPFilterZipCode; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define a abreviação do estado para filtrar resultados de CEPs no serviço web de consulta por CEP.
    /// </summary>
    /// <param name="AValue">
    /// A abreviação do estado a ser definida para o filtro.
    /// </param>
    /// <returns>
    /// A instância atual da interface ISetup4DCEPFilterZipCode.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the state abbreviation to filter CEP results in the ZIP code query web service.
    /// </summary>
    /// <param name="AValue">
    /// The state abbreviation to be set for the filter.
    /// </param>
    /// <returns>
    /// The current instance of the ISetup4DCEPFilterZipCode interface.
    /// </returns>
    {$ENDIF}
    function State(Const AValue: string): ISetup4DCEPFilterZipCode; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define o estado utilizando uma abreviação para filtrar resultados de CEPs no serviço web de consulta por CEP.
    /// </summary>
    /// <param name="AValue">
    /// A abreviação do estado a ser definida para o filtro.
    /// </param>
    /// <returns>
    /// A instância atual da interface ISetup4DCEPFilterZipCode.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the state using an abbreviation to filter CEP results in the ZIP code query web service.
    /// </summary>
    /// <param name="AValue">
    /// The state abbreviation to be set for the filter.
    /// </param>
    /// <returns>
    /// The current instance of the ISetup4DCEPFilterZipCode interface.
    /// </returns>
    {$ENDIF}
    function State(Const AValue: TSetup4DUtilityEstadoAbreviado): ISetup4DCEPFilterZipCode; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define o estado utilizando um nome completo para filtrar resultados de CEPs no serviço web de consulta por CEP.
    /// </summary>
    /// <param name="AValue">
    /// O nome completo do estado a ser definido para o filtro.
    /// </param>
    /// <returns>
    /// A instância atual da interface ISetup4DCEPFilterZipCode.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets the state using a full name to filter CEP results in the ZIP code query web service.
    /// </summary>
    /// <param name="AValue">
    /// The full name of the state to be set for the filter.
    /// </param>
    /// <returns>
    /// The current instance of the ISetup4DCEPFilterZipCode interface.
    /// </returns>
    {$ENDIF}
    function State(Const AValue: TSetup4DUtilityEstado): ISetup4DCEPFilterZipCode; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome da rua atualmente configurado para o filtro de resultados de CEPs no serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// O nome da rua como uma string.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the currently configured street name for filtering CEP results in the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The street name as a string.
    /// </returns>
    {$ENDIF}
    function Street: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome do bairro atualmente configurado para o filtro de resultados de CEPs no serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// O nome do bairro como uma string.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the currently configured district name for filtering CEP results in the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The district name as a string.
    /// </returns>
    {$ENDIF}
    function District: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome da cidade atualmente configurado para o filtro de resultados de CEPs no serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// O nome da cidade como uma string.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the currently configured city name for filtering CEP results in the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The city name as a string.
    /// </returns>
    {$ENDIF}
    function City: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém a abreviação do estado atualmente configurada para o filtro de resultados de CEPs no serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// A abreviação do estado como uma string.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the currently configured state abbreviation for filtering CEP results in the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The state abbreviation as a string.
    /// </returns>
    {$ENDIF}
    function State: string; overload;

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
    function Value(const AValue: string): ISetup4DCEPFilterZipCode; overload;

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
  /// Interface para poder executar a pesquisa pelo IBGE.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Interface for executing IBGE lookup.
  /// </summary>
  {$ENDIF}
  ISetup4DCEPSearechIBGE = interface

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define a pesquisa no serviço web de consulta por IBGE para informações sobre o país.
    /// </summary>
    /// <returns>
    /// A instância atual da interface ISetup4DCEPSearechIBGE.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets up the query in the IBGE query web service for information about the country.
    /// </summary>
    /// <returns>
    /// The current instance of the ISetup4DCEPSearechIBGE interface.
    /// </returns>
    {$ENDIF}
    function Country: ISetup4DCEPSearechIBGE;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define a pesquisa no serviço web de consulta por IBGE para informações sobre o estado.
    /// </summary>
    /// <returns>
    /// A instância atual da interface ISetup4DCEPSearechIBGE.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets up the query in the IBGE query web service for information about the state.
    /// </summary>
    /// <returns>
    /// The current instance of the ISetup4DCEPSearechIBGE interface.
    /// </returns>
    {$ENDIF}
    function State: ISetup4DCEPSearechIBGE;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define a pesquisa no serviço web de consulta por IBGE para informações sobre a cidade.
    /// </summary>
    /// <returns>
    /// A instância atual da interface ISetup4DCEPSearechIBGE.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets up the query in the IBGE query web service for information about the city.
    /// </summary>
    /// <returns>
    /// The current instance of the ISetup4DCEPSearechIBGE interface.
    /// </returns>
    {$ENDIF}
    function City: ISetup4DCEPSearechIBGE;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define a pesquisa no serviço web de consulta por IBGE para informações sobre o código.
    /// </summary>
    /// <returns>
    /// A instância atual da interface ISetup4DCEPSearechIBGE.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets up the query in the IBGE query web service for information about the code.
    /// </summary>
    /// <returns>
    /// The current instance of the ISetup4DCEPSearechIBGE interface.
    /// </returns>
    {$ENDIF}
    function Code: ISetup4DCEPSearechIBGE;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Conclui a configuração da pesquisa no serviço web de consulta do IBGE.
    /// </summary>
    /// <returns>
    /// A instância atual da interface ISetup4DCEPSearech.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Finishes configuring the query in the IBGE query web service.
    /// </summary>
    /// <returns>
    /// The current instance of the ISetup4DCEPSearech interface.
    /// </returns>
    {$ENDIF}
    function Finish: ISetup4DCEPSearech;
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
  ISetup4DCEPSearechZipCode = interface
    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém informações específicas sobre o CEP configurado na pesquisa do serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// A instância atual da interface ISetup4DCEPSearechZipCode.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets specific information about the configured ZIP code in the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The current instance of the ISetup4DCEPSearechZipCode interface.
    /// </returns>
    {$ENDIF}
    function Value: ISetup4DCEPSearechZipCode;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define a pesquisa no serviço web de consulta por CEP para informações sobre o endereço, com a opção de obter todas as informações disponíveis.
    /// </summary>
    /// <param name="AAll">
    /// Indica se todas as informações disponíveis devem ser obtidas.
    /// </param>
    /// <returns>
    /// A instância atual da interface ISetup4DCEPSearechZipCode.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Sets up the query in the ZIP code query web service for information about the address, with the option to get all available information.
    /// </summary>
    /// <param name="AAll">
    /// Indicates whether all available information should be obtained.
    /// </param>
    /// <returns>
    /// The current instance of the ISetup4DCEPSearechZipCode interface.
    /// </returns>
    {$ENDIF}
    function Address(AAll: Boolean = False): ISetup4DCEPSearechZipCode;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Conclui a configuração da pesquisa no serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// A instância atual da interface ISetup4DCEPSearech.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Finishes configuring the query in the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The current instance of the ISetup4DCEPSearech interface.
    /// </returns>
    {$ENDIF}
    function Finish: ISetup4DCEPSearech;
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
  /// Interface que configura o resultado da pesquisa do CEP.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Interface that configures the result of the ZIP code lookup.
  /// </summary>
  {$ENDIF}
  ISetup4DCEPResultZipCode  = interface
    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Configura o resultado da pesquisa no serviço web de consulta por CEP usando um objeto JSON.
    /// </summary>
    /// <param name="AJSONString">
    /// A string JSON contendo as informações do resultado.
    /// </param>
    /// <param name="AOwner">
    /// Indica se o objeto JSON é de propriedade do resultado e deve ser destruído quando o resultado for destruído.
    /// </param>
    /// <returns>
    /// A instância atual da interface ISetup4DCEPResultZipCode.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Configures the result of the ZIP code query web service using a JSON object.
    /// </summary>
    /// <param name="AJSONString">
    /// The JSON string containing the result information.
    /// </param>
    /// <param name="AOwner">
    /// Indicates whether the JSON object is owned by the result and should be destroyed when the result is destroyed.
    /// </param>
    /// <returns>
    /// The current instance of the ISetup4DCEPResultZipCode interface.
    /// </returns>
    {$ENDIF}
    function JSONObject(AJSONString: string; AOwner: Boolean = False): ISetup4DCEPResultZipCode; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Configura o resultado da pesquisa no serviço web de consulta por CEP usando um array JSON.
    /// </summary>
    /// <param name="AJSONString">
    /// A string JSON contendo as informações do resultado.
    /// </param>
    /// <param name="AOwner">
    /// Indica se o array JSON é de propriedade do resultado e deve ser destruído quando o resultado for destruído.
    /// </param>
    /// <returns>
    /// A instância atual da interface ISetup4DCEPResultZipCode.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Configures the result of the ZIP code query web service using a JSON array.
    /// </summary>
    /// <param name="AJSONString">
    /// The JSON string containing the result information.
    /// </param>
    /// <param name="AOwner">
    /// Indicates whether the JSON array is owned by the result and should be destroyed when the result is destroyed.
    /// </param>
    /// <returns>
    /// The current instance of the ISetup4DCEPResultZipCode interface.
    /// </returns>
    {$ENDIF}
    function JSONArray(AJSONString: string; AOwner: Boolean = False): ISetup4DCEPResultZipCode; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o código do resultado da pesquisa no serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// O código associado ao resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the code from the result of the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The code associated with the query result.
    /// </returns>
    {$ENDIF}
    function Code: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o código do resultado da pesquisa no serviço web de consulta por CEP para um item específico.
    /// </summary>
    /// <param name="AItem">
    /// O índice do item para o qual obter o código.
    /// </param>
    /// <returns>
    /// O código associado ao item especificado do resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the code from the result of the ZIP code query web service for a specific item.
    /// </summary>
    /// <param name="AItem">
    /// The index of the item for which to get the code.
    /// </param>
    /// <returns>
    /// The code associated with the specified item from the query result.
    /// </returns>
    {$ENDIF}
    function Code(const AItem: Integer): string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome da rua do resultado da pesquisa no serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// O nome da rua associado ao resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the street name from the result of the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The street name associated with the query result.
    /// </returns>
    {$ENDIF}
    function Street: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome da rua do resultado da pesquisa no serviço web de consulta por CEP para um item específico.
    /// </summary>
    /// <param name="AItem">
    /// O índice do item para o qual obter o nome da rua.
    /// </param>
    /// <returns>
    /// O nome da rua associado ao item especificado do resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the street name from the result of the ZIP code query web service for a specific item.
    /// </summary>
    /// <param name="AItem">
    /// The index of the item for which to get the street name.
    /// </param>
    /// <returns>
    /// The street name associated with the specified item from the query result.
    /// </returns>
    {$ENDIF}
    function Street(const AItem: Integer): string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o complemento do nome da rua do resultado da pesquisa no serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// O complemento do nome da rua associado ao resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the street name complement from the result of the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The street name complement associated with the query result.
    /// </returns>
    {$ENDIF}
    function StreetComplent: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o complemento do nome da rua do resultado da pesquisa no serviço web de consulta por CEP para um item específico.
    /// </summary>
    /// <param name="AItem">
    /// O índice do item para o qual obter o complemento do nome da rua.
    /// </param>
    /// <returns>
    /// O complemento do nome da rua associado ao item especificado do resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the street name complement from the result of the ZIP code query web service for a specific item.
    /// </summary>
    /// <param name="AItem">
    /// The index of the item for which to get the street name complement.
    /// </param>
    /// <returns>
    /// The street name complement associated with the specified item from the query result.
    /// </returns>
    {$ENDIF}
    function StreetComplent(const AItem: Integer): string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome do bairro do resultado da pesquisa no serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// O nome do bairro associado ao resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the district name from the result of the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The district name associated with the query result.
    /// </returns>
    {$ENDIF}
    function District: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome do bairro do resultado da pesquisa no serviço web de consulta por CEP para um item específico.
    /// </summary>
    /// <param name="AItem">
    /// O índice do item para o qual obter o nome do bairro.
    /// </param>
    /// <returns>
    /// O nome do bairro associado ao item especificado do resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the district name from the result of the ZIP code query web service for a specific item.
    /// </summary>
    /// <param name="AItem">
    /// The index of the item for which to get the district name.
    /// </param>
    /// <returns>
    /// The district name associated with the specified item from the query result.
    /// </returns>
    {$ENDIF}
    function District(const AItem: Integer): string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome da cidade do resultado da pesquisa no serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// O nome da cidade associado ao resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the city name from the result of the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The city name associated with the query result.
    /// </returns>
    {$ENDIF}
    function City: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome da cidade do resultado da pesquisa no serviço web de consulta por CEP para um item específico.
    /// </summary>
    /// <param name="AItem">
    /// O índice do item para o qual obter o nome da cidade.
    /// </param>
    /// <returns>
    /// O nome da cidade associado ao item especificado do resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the city name from the result of the ZIP code query web service for a specific item.
    /// </summary>
    /// <param name="AItem">
    /// The index of the item for which to get the city name.
    /// </param>
    /// <returns>
    /// The city name associated with the specified item from the query result.
    /// </returns>
    {$ENDIF}
    function City(const AItem: Integer): string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o código IBGE da cidade do resultado da pesquisa no serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// O código IBGE da cidade associado ao resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the IBGE code of the city from the result of the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The IBGE code of the city associated with the query result.
    /// </returns>
    {$ENDIF}
    function CityIBGE: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o código IBGE da cidade do resultado da pesquisa no serviço web de consulta por CEP para um item específico.
    /// </summary>
    /// <param name="AItem">
    /// O índice do item para o qual obter o código IBGE da cidade.
    /// </param>
    /// <returns>
    /// O código IBGE da cidade associado ao item especificado do resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the IBGE code of the city from the result of the ZIP code query web service for a specific item.
    /// </summary>
    /// <param name="AItem">
    /// The index of the item for which to get the IBGE code of the city.
    /// </param>
    /// <returns>
    /// The IBGE code of the city associated with the specified item from the query result.
    /// </returns>
    {$ENDIF}
    function CityIBGE(const AItem: Integer): string; overload;


    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome do estado do resultado da pesquisa no serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// O nome do estado associado ao resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the name of the state from the result of the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The name of the state associated with the query result.
    /// </returns>
    {$ENDIF}
    function State: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome do estado do resultado da pesquisa no serviço web de consulta por CEP para um item específico.
    /// </summary>
    /// <param name="AItem">
    /// O índice do item para o qual obter o nome do estado.
    /// </param>
    /// <returns>
    /// O nome do estado associado ao item especificado do resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the name of the state from the result of the ZIP code query web service for a specific item.
    /// </summary>
    /// <param name="AItem">
    /// The index of the item for which to get the name of the state.
    /// </param>
    /// <returns>
    /// The name of the state associated with the specified item from the query result.
    /// </returns>
    {$ENDIF}
    function State(const AItem: Integer): string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém a sigla do estado do resultado da pesquisa no serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// A sigla do estado associada ao resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the abbreviation of the state from the result of the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The abbreviation of the state associated with the query result.
    /// </returns>
    {$ENDIF}
    function StateSigla: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém a sigla do estado do resultado da pesquisa no serviço web de consulta por CEP para um item específico.
    /// </summary>
    /// <param name="AItem">
    /// O índice do item para o qual obter a sigla do estado.
    /// </param>
    /// <returns>
    /// A sigla do estado associada ao item especificado do resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the abbreviation of the state from the result of the ZIP code query web service for a specific item.
    /// </summary>
    /// <param name="AItem">
    /// The index of the item for which to get the abbreviation of the state.
    /// </param>
    /// <returns>
    /// The abbreviation of the state associated with the specified item from the query result.
    /// </returns>
    {$ENDIF}
    function StateSigla(const AItem: Integer): string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o código IBGE do estado do resultado da pesquisa no serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// O código IBGE do estado associado ao resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the IBGE code of the state from the result of the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The IBGE code of the state associated with the query result.
    /// </returns>
    {$ENDIF}
    function StateIBGE: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o código IBGE do estado do resultado da pesquisa no serviço web de consulta por CEP para um item específico.
    /// </summary>
    /// <param name="AItem">
    /// O índice do item para o qual obter o código IBGE do estado.
    /// </param>
    /// <returns>
    /// O código IBGE do estado associado ao item especificado do resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the IBGE code of the state from the result of the ZIP code query web service for a specific item.
    /// </summary>
    /// <param name="AItem">
    /// The index of the item for which to get the IBGE code of the state.
    /// </param>
    /// <returns>
    /// The IBGE code of the state associated with the specified item from the query result.
    /// </returns>
    {$ENDIF}
    function StateIBGE(const AItem: Integer): string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o DDD (código de área) do resultado da pesquisa no serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// O DDD (código de área) associado ao resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the area code (DDD) from the result of the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The area code (DDD) associated with the query result.
    /// </returns>
    {$ENDIF}
    function DDD: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o DDD (código de área) do resultado da pesquisa no serviço web de consulta por CEP para um item específico.
    /// </summary>
    /// <param name="AItem">
    /// O índice do item para o qual obter o DDD (código de área).
    /// </param>
    /// <returns>
    /// O DDD (código de área) associado ao item especificado do resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the area code (DDD) from the result of the ZIP code query web service for a specific item.
    /// </summary>
    /// <param name="AItem">
    /// The index of the item for which to get the area code (DDD).
    /// </param>
    /// <returns>
    /// The area code (DDD) associated with the specified item from the query result.
    /// </returns>
    {$ENDIF}
    function DDD(const AItem: Integer): string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém a região do resultado da pesquisa no serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// A região associada ao resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the region from the result of the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The region associated with the query result.
    /// </returns>
    {$ENDIF}
    function Region: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém a região do resultado da pesquisa no serviço web de consulta por CEP para um item específico.
    /// </summary>
    /// <param name="AItem">
    /// O índice do item para o qual obter a região.
    /// </param>
    /// <returns>
    /// A região associada ao item especificado do resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the region from the result of the ZIP code query web service for a specific item.
    /// </summary>
    /// <param name="AItem">
    /// The index of the item for which to get the region.
    /// </param>
    /// <returns>
    /// The region associated with the specified item from the query result.
    /// </returns>
    {$ENDIF}
    function Region(const AItem: Integer): string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome do país do resultado da pesquisa no serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// O nome do país associado ao resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the country name from the result of the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The country name associated with the query result.
    /// </returns>
    {$ENDIF}
    function Country: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome do país do resultado da pesquisa no serviço web de consulta por CEP para um item específico.
    /// </summary>
    /// <param name="AItem">
    /// O índice do item para o qual obter o nome do país.
    /// </param>
    /// <returns>
    /// O nome do país associado ao item especificado do resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the country name from the result of the ZIP code query web service for a specific item.
    /// </summary>
    /// <param name="AItem">
    /// The index of the item for which to get the country name.
    /// </param>
    /// <returns>
    /// The country name associated with the specified item from the query result.
    /// </returns>
    {$ENDIF}
    function Country(const AItem: Integer): string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém a sigla do país do resultado da pesquisa no serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// A sigla do país associada ao resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the country code from the result of the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The country code associated with the query result.
    /// </returns>
    {$ENDIF}
    function CountrySigla: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém a sigla do país do resultado da pesquisa no serviço web de consulta por CEP para um item específico.
    /// </summary>
    /// <param name="AItem">
    /// O índice do item para o qual obter a sigla do país.
    /// </param>
    /// <returns>
    /// A sigla do país associada ao item especificado do resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the country code from the result of the ZIP code query web service for a specific item.
    /// </summary>
    /// <param name="AItem">
    /// The index of the item for which to get the country code.
    /// </param>
    /// <returns>
    /// The country code associated with the specified item from the query result.
    /// </returns>
    {$ENDIF}
    function CountrySigla(const AItem: Integer): string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o código IBGE do país do resultado da pesquisa no serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// O código IBGE do país associado ao resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the IBGE code of the country from the result of the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The IBGE code of the country associated with the query result.
    /// </returns>
    {$ENDIF}
    function CountryIBGE: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o código IBGE do país do resultado da pesquisa no serviço web de consulta por CEP para um item específico.
    /// </summary>
    /// <param name="AItem">
    /// O índice do item para o qual obter o código IBGE do país.
    /// </param>
    /// <returns>
    /// O código IBGE do país associado ao item especificado do resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the IBGE code of the country from the result of the ZIP code query web service for a specific item.
    /// </summary>
    /// <param name="AItem">
    /// The index of the item for which to get the IBGE code of the country.
    /// </param>
    /// <returns>
    /// The IBGE code of the country associated with the specified item from the query result.
    /// </returns>
    {$ENDIF}
    function CountryIBGE(const AItem: Integer): string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o código DDI (Discagem Direta Internacional) do país do resultado da pesquisa no serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// O código DDI do país associado ao resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the International Direct Dialing (DDI) code of the country from the result of the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The DDI code of the country associated with the query result.
    /// </returns>
    {$ENDIF}
    function DDI: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o código DDI (Discagem Direta Internacional) do país do resultado da pesquisa no serviço web de consulta por CEP para um item específico.
    /// </summary>
    /// <param name="AItem">
    /// O índice do item para o qual obter o código DDI do país.
    /// </param>
    /// <returns>
    /// O código DDI do país associado ao item especificado do resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the International Direct Dialing (DDI) code of the country from the result of the ZIP code query web service for a specific item.
    /// </summary>
    /// <param name="AItem">
    /// The index of the item for which to get the DDI code of the country.
    /// </param>
    /// <returns>
    /// The DDI code of the country associated with the specified item from the query result.
    /// </returns>
    {$ENDIF}
    function DDI(const AItem: Integer): string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o continente do país do resultado da pesquisa no serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// O continente associado ao resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the continent of the country from the result of the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The continent associated with the query result.
    /// </returns>
    {$ENDIF}
    function Continent: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o continente do país do resultado da pesquisa no serviço web de consulta por CEP para um item específico.
    /// </summary>
    /// <param name="AItem">
    /// O índice do item para o qual obter o continente do país.
    /// </param>
    /// <returns>
    /// O continente associado ao item especificado do resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the continent of the country from the result of the ZIP code query web service for a specific item.
    /// </summary>
    /// <param name="AItem">
    /// The index of the item for which to get the continent of the country.
    /// </param>
    /// <returns>
    /// The continent associated with the specified item from the query result.
    /// </returns>
    {$ENDIF}
    function Continent(const AItem: Integer): string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém a altitude do endereço da pesquisa no serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// A altitude associada ao endereço da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the altitude from the address of the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The altitude associated with the query address.
    /// </returns>
    {$ENDIF}
    function Altitude: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém a altitude do endereço da pesquisa no serviço web de consulta por CEP para um item específico.
    /// </summary>
    /// <param name="AItem">
    /// O índice do item para o qual obter a altitude.
    /// </param>
    /// <returns>
    /// A altitude associada ao item especificado do endereço da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the altitude from the address of the ZIP code query web service for a specific item.
    /// </summary>
    /// <param name="AItem">
    /// The index of the item for which to get the altitude.
    /// </param>
    /// <returns>
    /// The altitude associated with the specified item from the query address.
    /// </returns>
    {$ENDIF}
    function Altitude(const AItem: Integer): string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém a latitude do endereço da pesquisa no serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// A latitude associada ao endereço da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the latitude from the address of the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The latitude associated with the query address.
    /// </returns>
    {$ENDIF}
    function Latitude: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém a latitude do endereço da pesquisa no serviço web de consulta por CEP para um item específico.
    /// </summary>
    /// <param name="AItem">
    /// O índice do item para o qual obter a latitude.
    /// </param>
    /// <returns>
    /// A latitude associada ao item especificado do endereço da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the latitude from the address of the ZIP code query web service for a specific item.
    /// </summary>
    /// <param name="AItem">
    /// The index of the item for which to get the latitude.
    /// </param>
    /// <returns>
    /// The latitude associated with the specified item from the query address.
    /// </returns>
    {$ENDIF}
    function Latitude(const AItem: Integer): string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém a longitude do endereço da pesquisa no serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// A longitude associada ao endereço da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the longitude from the address of the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The longitude associated with the query address.
    /// </returns>
    {$ENDIF}
    function Longitude: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém a longitude do endereço da pesquisa no serviço web de consulta por CEP para um item específico.
    /// </summary>
    /// <param name="AItem">
    /// O índice do item para o qual obter a longitude.
    /// </param>
    /// <returns>
    /// A longitude associada ao item especificado do endereço da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the longitude from the address of the ZIP code query web service for a specific item.
    /// </summary>
    /// <param name="AItem">
    /// The index of the item for which to get the longitude.
    /// </param>
    /// <returns>
    /// The longitude associated with the specified item from the query address.
    /// </returns>
    {$ENDIF}
    function Longitude(const AItem: Integer): string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o código SIAFI do resultado da pesquisa no serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// O código SIAFI associado ao resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the SIAFI code from the result of the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The SIAFI code associated with the query result.
    /// </returns>
    {$ENDIF}
    function SIAFICode: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o código SIAFI do resultado da pesquisa no serviço web de consulta por CEP para um item específico.
    /// </summary>
    /// <param name="AItem">
    /// O índice do item para o qual obter o código SIAFI.
    /// </param>
    /// <returns>
    /// O código SIAFI associado ao item especificado do resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the SIAFI code from the result of the ZIP code query web service for a specific item.
    /// </summary>
    /// <param name="AItem">
    /// The index of the item for which to get the SIAFI code.
    /// </param>
    /// <returns>
    /// The SIAFI code associated with the specified item from the query result.
    /// </returns>
    {$ENDIF}
    function SIAFICode(const AItem: Integer): string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o cidade SIAFI do resultado da pesquisa no serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// O cidade SIAFI associado ao resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the SIAFI City from the result of the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The SIAFI City associated with the query result.
    /// </returns>
    {$ENDIF}
    function SIAFIName: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o cidade SIAFI do resultado da pesquisa no serviço web de consulta por CEP para um item específico.
    /// </summary>
    /// <param name="AItem">
    /// O índice do item para o qual obter o cidade SIAFI.
    /// </param>
    /// <returns>
    /// O cidade SIAFI associado ao item especificado do resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the SIAFI City from the result of the ZIP code query web service for a specific item.
    /// </summary>
    /// <param name="AItem">
    /// The index of the item for which to get the SIAFI City.
    /// </param>
    /// <returns>
    /// The SIAFI City associated with the specified item from the query result.
    /// </returns>
    {$ENDIF}
    function SIAFIName(const AItem: Integer): string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o CNPJ SIAFI do resultado da pesquisa no serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// O CNPJ SIAFI associado ao resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the SIAFI CNPJ from the result of the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The SIAFI CNPJ associated with the query result.
    /// </returns>
    {$ENDIF}
    function SIAFICNPJ: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o CNPJ SIAFI do resultado da pesquisa no serviço web de consulta por CEP para um item específico.
    /// </summary>
    /// <param name="AItem">
    /// O índice do item para o qual obter o CNPJ SIAFI.
    /// </param>
    /// <returns>
    /// O CNPJ SIAFI associado ao item especificado do resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the SIAFI CNPJ from the result of the ZIP code query web service for a specific item.
    /// </summary>
    /// <param name="AItem">
    /// The index of the item for which to get the SIAFI CNPJ.
    /// </param>
    /// <returns>
    /// The SIAFI CNPJ associated with the specified item from the query result.
    /// </returns>
    {$ENDIF}
    function SIAFICNPJ(const AItem: Integer): string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o objeto JSON associado ao resultado da pesquisa no serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// O objeto JSON associado ao resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the JSON object associated with the result of the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The JSON object associated with the query result.
    /// </returns>
    {$ENDIF}
    function JSONObject: TJSONObject; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém a representação em string do objeto JSON associado ao resultado da pesquisa no serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// A representação em string do objeto JSON associado ao resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the string representation of the JSON object associated with the result of the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The string representation of the JSON object associated with the query result.
    /// </returns>
    {$ENDIF}
    function JSONObjectInString: string; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém a matriz JSON associada ao resultado da pesquisa no serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// A matriz JSON associada ao resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the JSON array associated with the result of the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The JSON array associated with the query result.
    /// </returns>
    {$ENDIF}
    function JSONArray: TJSONArray; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém a representação em string da matriz JSON associada ao resultado da pesquisa no serviço web de consulta por CEP.
    /// </summary>
    /// <returns>
    /// A representação em string da matriz JSON associada ao resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the string representation of the JSON array associated with the result of the ZIP code query web service.
    /// </summary>
    /// <returns>
    /// The string representation of the JSON array associated with the query result.
    /// </returns>
    {$ENDIF}
    function JSONArrayInString: string; overload;

  end;

  {$IFDEF HAS_PORTUGUES}
  /// <summary>
  /// Interface para o resultado da pesquisa no serviço web de consulta por CEP com informações do IBGE.
  /// </summary>
  {$ELSE}
  /// <summary>
  /// Interface for the result of the ZIP code query web service with IBGE information.
  /// </summary>
  {$ENDIF}
  ISetup4DCEPResultIBGE = interface
    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o objeto JSON associado ao resultado da pesquisa no serviço web de consulta por CEP com informações do IBGE.
    /// </summary>
    /// <param name="AJSONString">
    /// A string contendo o JSON associado ao resultado da pesquisa.
    /// </param>
    /// <param name="AOwner">
    /// Indica se a instância deve ser proprietária (responsável por liberar a memória) do objeto JSON.
    /// </param>
    /// <returns>
    /// A interface ISetup4DCEPResultIBGE.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the JSON object associated with the result of the ZIP code query web service with IBGE information.
    /// </summary>
    /// <param name="AJSONString">
    /// The string containing the JSON associated with the query result.
    /// </param>
    /// <param name="AOwner">
    /// Indicates whether the instance should be the owner (responsible for freeing memory) of the JSON object.
    /// </param>
    /// <returns>
    /// The interface ISetup4DCEPResultIBGE.
    /// </returns>
    {$ENDIF}
    function JSONObject(AJSONString: string; AOwner: Boolean = False): ISetup4DCEPResultIBGE; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o código do país associado ao resultado da pesquisa no serviço web de consulta por CEP com informações do IBGE.
    /// </summary>
    /// <returns>
    /// O código do país.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the country code associated with the result of the ZIP code query web service with IBGE information.
    /// </summary>
    /// <returns>
    /// The country code.
    /// </returns>
    {$ENDIF}
    function CountryCode: string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome do país associado ao resultado da pesquisa no serviço web de consulta por CEP com informações do IBGE.
    /// </summary>
    /// <returns>
    /// O nome do país.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the country name associated with the result of the ZIP code query web service with IBGE information.
    /// </summary>
    /// <returns>
    /// The country name.
    /// </returns>
    {$ENDIF}
    function Country: string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o código do estado associado ao resultado da pesquisa no serviço web de consulta por CEP com informações do IBGE.
    /// </summary>
    /// <returns>
    /// O código do estado.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the state code associated with the result of the ZIP code query web service with IBGE information.
    /// </summary>
    /// <returns>
    /// The state code.
    /// </returns>
    {$ENDIF}
    function StateCode: string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome do estado associado ao resultado da pesquisa no serviço web de consulta por CEP com informações do IBGE.
    /// </summary>
    /// <returns>
    /// O nome do estado.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the state name associated with the result of the ZIP code query web service with IBGE information.
    /// </summary>
    /// <returns>
    /// The state name.
    /// </returns>
    {$ENDIF}
    function State: string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o código da cidade associado ao resultado da pesquisa no serviço web de consulta por CEP com informações do IBGE.
    /// </summary>
    /// <returns>
    /// O código da cidade.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the city code associated with the result of the ZIP code query web service with IBGE information.
    /// </summary>
    /// <returns>
    /// The city code.
    /// </returns>
    {$ENDIF}
    function CityCode: string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o nome da cidade associado ao resultado da pesquisa no serviço web de consulta por CEP com informações do IBGE.
    /// </summary>
    /// <returns>
    /// O nome da cidade.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the city name associated with the result of the ZIP code query web service with IBGE information.
    /// </summary>
    /// <returns>
    /// The city name.
    /// </returns>
    {$ENDIF}
    function City: string;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o objeto JSON associado ao resultado da pesquisa no serviço web de consulta por CEP com informações do IBGE.
    /// </summary>
    /// <returns>
    /// O objeto JSON associado ao resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the JSON object associated with the result of the ZIP code query web service with IBGE information.
    /// </summary>
    /// <returns>
    /// The JSON object associated with the query result.
    /// </returns>
    {$ENDIF}
    function JSONObject: TJSONObject; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém a representação em string do objeto JSON associado ao resultado da pesquisa no serviço web de consulta por CEP com informações do IBGE.
    /// </summary>
    /// <returns>
    /// A representação em string do objeto JSON associado ao resultado da pesquisa.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the string representation of the JSON object associated with the result of the ZIP code query web service with IBGE information.
    /// </summary>
    /// <returns>
    /// The string representation of the JSON object associated with the query result.
    /// </returns>
    {$ENDIF}
    function JSONObjectInString: string; overload;
  end;

implementation

end.
