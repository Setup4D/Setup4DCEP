unit Setup4D.CEP;

{$IFNDEF FPC}
{$I Setup4DCEPLanguage.inc}
{$ENDIF}

interface

uses
  Setup4D.Utility.Constantes,

  Setup4D.CEP.Result,
  Setup4D.CEP.Filter,
  Setup4D.CEP.Searech,
  Setup4D.CEP.Configuration,
  Setup4D.CEP.Interf,

  System.SysUtils;

type
  TSetup4DCEP = class(TInterfacedObject, ISetup4DCEP)
  private
    FConfiguration : ISetup4DCEPConfiguration;
    FFilter : ISetup4DCEPFilter;
    FSearech : ISetup4DCEPSearech;
    FResult : ISetup4DCEPResult;

  protected

    function Configuration : ISetup4DCEPConfiguration;
    function Filter : ISetup4DCEPFilter;
    function Searech : ISetup4DCEPSearech;
    function Result : ISetup4DCEPResult;


    {$IFNDEF FPC}
    Constructor Create;
    {$ENDIF}
  public
    {$IFDEF FPC}
    Constructor Create;
    {$ENDIF}

    Destructor Destroy; override;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Cria uma nova instância da interface ISetup4DCEP.
    /// </summary>
    /// <remarks>
    /// Esta função cria uma nova instância da interface, que é a entrada principal para acessar
    /// as funcionalidades do Setup4DCEP.
    /// </remarks>
    /// <returns>Uma nova instância da interface ISetup4DCEP.</returns>
    {$ELSE}
    /// <summary>
    /// Creates a new instance of the ISetup4DCEP interface.
    /// </summary>
    /// <remarks>
    /// This function creates a new instance of the interface, which is the primary entry point for accessing
    /// Setup4D CEP functionalities.
    /// </remarks>
    /// <returns>A new instance of the ISetup4DCEP interface.</returns>
    {$ENDIF}
    class function New: ISetup4DCEP;
  end;

implementation


{ TSetup4DCEP }

function TSetup4DCEP.Configuration: ISetup4DCEPConfiguration;
begin
  if not Assigned(FConfiguration) then
    FConfiguration := TSetup4DCepConfiguration.New(Self);
  Result := FConfiguration;

end;

constructor TSetup4DCEP.Create;
begin
  FConfiguration := TSetup4DCepConfiguration.New(Self);
  FResult := TSetup4DCEPResult.New(Self);
end;

destructor TSetup4DCEP.Destroy;
begin

  inherited;
end;

function TSetup4DCEP.Filter: ISetup4DCEPFilter;
begin
  if not Assigned(FFilter) then
    FFilter := TSetup4DCEPFilter.New(Self);
  Result := FFilter;
end;

class function TSetup4DCEP.New: ISetup4DCEP;
begin
  Result:= Self.Create;
end;

function TSetup4DCEP.Result: ISetup4DCEPResult;
begin
  if not Assigned(FResult) then
    FResult := TSetup4DCEPResult.New(Self);
  Result := FResult;
end;

function TSetup4DCEP.Searech: ISetup4DCEPSearech;
begin
  if FConfiguration = nil then
    raise EConvertError.Create(TSetup4DUtilityConstantes
                                .UNINSTANTIATED_CLASS({$IFDEF HAS_PORTUGUES}
                                                        'configuração'
                                                      {$ELSE}
                                                        'Configuration'
                                                      {$ENDIF}));

  if FFilter = nil then
    raise EConvertError.Create(TSetup4DUtilityConstantes
                                .UNINSTANTIATED_CLASS({$IFDEF HAS_PORTUGUES}
                                                        'pesquisa'
                                                      {$ELSE}
                                                        'search'
                                                      {$ENDIF}));

  if FResult = nil then
    raise EConvertError.Create(TSetup4DUtilityConstantes
                                .UNINSTANTIATED_CLASS({$IFDEF HAS_PORTUGUES}
                                                        'resultado'
                                                      {$ELSE}
                                                        'result'
                                                      {$ENDIF}));

  if not Assigned(FSearech) then
    FSearech := TSetup4DCEPSearech.New(Self, FConfiguration, FFilter, FResult);

  Result := FSearech;

end;

end.
