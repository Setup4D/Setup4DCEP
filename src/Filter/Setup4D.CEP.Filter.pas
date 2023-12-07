unit Setup4D.CEP.Filter;

{$IFNDEF FPC}
{$I Setup4DCEPLanguage.inc}
{$ENDIF}


interface
uses
  {$IFDEF FPC}
  SysUtils,
  {$ELSE}
  System.SysUtils,
  {$ENDIF}

  Setup4D.CEP.Interf;

type
  TSetup4DCEPFilter = class(TInterfacedObject, ISetup4DCEPFilter)
  private
    {$IFNDEF FPC}
    [weak]
    {$ENDIF}
    FParent : ISetup4DCEP;
    FFilterZipCode : ISetup4DCEPFilterZipCode;
    FFilterIBGE:ISetup4DCEPFilterIBGE;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Limpar o filtro do IBGE.
    /// </summary>
    {$ELSE}
    /// <summary>
    /// Clear the IBGE filter.
    /// </summary>
    {$ENDIF}
    procedure ClearIBGE;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Limpar o filtro do CEP.
    /// </summary>
    {$ELSE}
    /// <summary>
    /// Clear the Zip Code filter.
    /// </summary>
    {$ENDIF}
    procedure ClearZipCode;

  protected

    function ZipCode:ISetup4DCEPFilterZipCode;
    function IBGE:ISetup4DCEPFilterIBGE;
    function Clear : ISetup4DCEPFilter;

    function Finish: ISetup4DCEP;

    Constructor Create(const AValue: ISetup4DCEP); overload;
  public

    Destructor Destroy; override;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Cria uma nova instância da classe de configurações para o filtro de pesquisa.
    /// </summary>
    /// <param name="AValue">
    /// A instância de ISetup4DCEP que será associada a esta configuração.
    /// </param>
    /// <returns>
    /// A interface para configuração do filtro de consulta.
    /// </returns>
    /// <remarks>
    /// Esta classe permite configurar opções específicas para os filtros de consultas de CEP ou IBGE.
    /// Para criar uma instância desta classe, utilize o método New.
    /// </remarks>
    {$ELSE}
    /// <summary>
    /// Creates a new instance of the configuration class for the search filter.
    /// </summary>
    /// <param name="AValue">
    /// The instance of ISetup4DCEP that will be associated with this configuration.
    /// </param>
    /// <returns>
    /// The interface for configuring the query filter.
    /// </returns>
    /// <remarks>
    /// This class allows configuring specific options for CEP or IBGE query filters.
    /// To create an instance of this class, use the New method.
    /// </remarks>
    {$ENDIF}
    class function New(const AValue: ISetup4DCEP): ISetup4DCEPFilter; overload;
  end;

implementation

uses
  Setup4D.CEP.Filter.IBGE,
  Setup4D.CEP.Filter.ZipCode;

function TSetup4DCEPFilter.ZipCode: ISetup4DCEPFilterZipCode;
begin
  if not Assigned(FFilterZipCode) then
    FFilterZipCode := TSetup4DCEPFilterZipCode.New(Self);
  Result := FFilterZipCode;
end;

procedure TSetup4DCEPFilter.ClearIBGE;
begin
  if not Assigned(FFilterIBGE) then
    Exit;

  FFilterIBGE.City(EmptyStr);
  FFilterIBGE.State(EmptyStr);
  FFilterIBGE.Code(EmptyStr);
  FFilterIBGE.Country(EmptyStr);
end;

function TSetup4DCEPFilter.Clear: ISetup4DCEPFilter;
begin
  Result:= Self;
  ClearIBGE;
  ClearZipCode;
end;

procedure TSetup4DCEPFilter.ClearZipCode;
begin
  if not Assigned(FFilterZipCode) then
    Exit;

  FFilterZipCode.Value(EmptyStr);
  FFilterZipCode.Street(EmptyStr);
  FFilterZipCode.District(EmptyStr);
  FFilterZipCode.City(EmptyStr);
  FFilterZipCode.State(EmptyStr);
end;

constructor TSetup4DCEPFilter.Create(const AValue: ISetup4DCEP);
begin
  FParent := AValue;
end;

destructor TSetup4DCEPFilter.Destroy;
begin

  inherited;
end;

function TSetup4DCEPFilter.Finish: ISetup4DCEP;
begin
  Result := FParent;
end;

function TSetup4DCEPFilter.IBGE: ISetup4DCEPFilterIBGE;
begin
  if not Assigned(FFilterIBGE) then
    FFilterIBGE := TSetup4DCEPFilterIBGE.New(Self);
  Result := FFilterIBGE;
end;

class function TSetup4DCEPFilter.New(const AValue: ISetup4DCEP): ISetup4DCEPFilter;
begin
  Result:= Self.Create(AValue);
end;

end.
