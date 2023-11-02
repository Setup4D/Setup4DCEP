unit Setup4D.CEP.Configuration;

{$I Setup4DCEPLanguage.inc}

interface
uses
  Setup4D.CEP.Interf;
type
  TSetup4DCepConfiguration = class(TInterfacedObject, ISetup4DCEPConfiguration)
  private
    [weak]
    FParent : ISetup4DCEP;
    FConfigurationWebService : ISetup4DCEPConfigurationWebService;
    FConfigurationProxy : ISetup4DCEPConfigurationProxy;

  protected
    function WebService:ISetup4DCEPConfigurationWebService;
    function Proxy:ISetup4DCEPConfigurationProxy;

    function Finish: ISetup4DCEP;

    Constructor Create(Const AValue : ISetup4DCEP); overload;
  public
    Destructor Destroy; override;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Cria uma nova instância da interface ISetup4DCEPConfiguration.
    /// </summary>
    /// <param name="AValue">
    /// A instância da interface ISetup4DCEP a ser associada à configuração.
    /// </param>
    /// <remarks>
    /// Esta função cria uma nova instância da interface ISetup4DCEPConfiguration e associa-a a uma instância
    /// da interface ISetup4DCEP. A interface de configuração é usada para configurar opções relacionadas
    /// à consulta do CEP.
    /// </remarks>
    /// <returns>
    /// Uma nova instância da interface ISetup4DCEPConfiguration associada à instância AValue da interface ISetup4DCEP.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Creates a new instance of the ISetup4DCEPConfiguration interface.
    /// </summary>
    /// <param name="AValue">
    /// The ISetup4DCEP interface instance to be associated with the configuration.
    /// </param>
    /// <remarks>
    /// This function creates a new instance of the `ISetup4DCEPConfiguration` interface and associates it with an instance
    /// of the `ISetup4DCEP` interface. The configuration interface is used to set options related to CEP queries.
    /// </remarks>
    /// <returns>
    /// A new instance of the ISetup4DCEPConfiguration interface associated with the AValue instance of the ISetup4DCEP interface.
    /// </returns>
    {$ENDIF}
    class function New(Const AValue : ISetup4DCEP): ISetup4DCEPConfiguration; overload;
  end;

implementation

uses
  Setup4D.CEP.Configuration.Proxy,
  Setup4D.CEP.Configuration.WebService;

{ TSetup4DCepConfiguration }

constructor TSetup4DCepConfiguration.Create(const AValue: ISetup4DCEP);
begin
  FParent := AValue;
end;

destructor TSetup4DCepConfiguration.Destroy;
begin

  inherited;
end;

function TSetup4DCepConfiguration.Finish: ISetup4DCEP;
begin
  Result := FParent;
end;

class function TSetup4DCepConfiguration.New(
  const AValue: ISetup4DCEP): ISetup4DCEPConfiguration;
begin
  Result:= Self.Create(AValue);
end;

function TSetup4DCepConfiguration.Proxy: ISetup4DCEPConfigurationProxy;
begin
  if not Assigned(FConfigurationProxy) then
    FConfigurationProxy := TSetup4DCepConfigurationProxy.New(Self);
  Result := FConfigurationProxy;
end;

function TSetup4DCepConfiguration.WebService: ISetup4DCEPConfigurationWebService;
begin
  if not Assigned(FConfigurationWebService) then
    FConfigurationWebService := TSetup4DCepConfigurationWebService.New(Self);
  Result := FConfigurationWebService;
end;

end.
