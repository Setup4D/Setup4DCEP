unit Setup4D.CEP.Searech.IBGE;

interface

uses
  Setup4D.Utility,
  Setup4D.Utility.Constantes,

  Setup4D.Rest,
  Setup4D.Rest.Interf,

  Setup4D.CEP.Interf,

  System.SysUtils;

type
  TSetup4DCEPSearechIBGE = class(TInterfacedObject, ISetup4DCEPSearechIBGE)
  private
    [weak]
    FParent : ISetup4DCEPSearech;
    FRequest: ISetup4DRest;
    FConfiguration: ISetup4DCEPConfiguration;
    FFilter: ISetup4DCEPFilter;
    FResult : ISetup4DCEPResult;

  protected

    function Country : ISetup4DCEPSearechIBGE;
    function State : ISetup4DCEPSearechIBGE;
    function City : ISetup4DCEPSearechIBGE;
    function Code : ISetup4DCEPSearechIBGE;

    function Finish: ISetup4DCEPSearech;

    Constructor Create(const ASearech: ISetup4DCEPSearech;
      Const AConfiguration: ISetup4DCEPConfiguration;
      Const AFilter: ISetup4DCEPFilter;
      Const AResult: ISetup4DCEPResult); overload;
  public

    Destructor Destroy; override;
    class function New(const ASearech: ISetup4DCEPSearech;
      Const AConfiguration: ISetup4DCEPConfiguration;
      Const AFilter: ISetup4DCEPFilter;
      Const AResult: ISetup4DCEPResult): ISetup4DCEPSearechIBGE; overload;
  end;

implementation

{ TSetup4DCEPSearechIBGE }

function TSetup4DCEPSearechIBGE.City: ISetup4DCEPSearechIBGE;
begin
  Result := Self;

  if TSetup4DUtility.IsEmpty(FFilter.IBGE.City) or TSetup4DUtility.IsEmpty(FFilter.IBGE.State) then
    raise Exception.Create(TSetup4DUtilityConstantes.REQUIRED_INFORMATION({$IFDEF HAS_PORTUGUES}'Cidade/Estado'{$ELSE}'City/State'{$ENDIF}));


  FRequest
    .ClearHeaders
    .AddHeader('X-Upper', FConfiguration.WebService.UpperTextInString)
    .AddHeader('Content-Type', 'application/json; charset=UTF-8')
    .ClearResource
    .ClearResourceSuffix
    .Resource('ibge/cidade/')
    .ResourceSuffix(Format('%s/estado/%s', [FFilter.IBGE.City, FFilter.IBGE.State]))
      .Get;

  case FRequest.AsStatusCode of
    200 : FResult.IBGE.JSONObject(FRequest.AsContent);
    400 : raise Exception.Create(FRequest.AsJSONValue.GetValue<string>('error'));
    404 : raise Exception.Create(TSetup4DUtilityConstantes.MESSAGE_GENERIC);
  end;
end;

function TSetup4DCEPSearechIBGE.Code: ISetup4DCEPSearechIBGE;
begin
  Result := Self;

  if TSetup4DUtility.IsEmpty(FFilter.IBGE.Code) then
    raise Exception.Create(TSetup4DUtilityConstantes.REQUIRED_INFORMATION({$IFDEF HAS_PORTUGUES}'Código'{$ELSE}'Code'{$ENDIF}));


  FRequest
    .ClearHeaders
    .AddHeader('X-Upper', FConfiguration.WebService.UpperTextInString)
    .AddHeader('Content-Type', 'application/json; charset=UTF-8')
    .ClearResource
    .ClearResourceSuffix
    .Resource('ibge/code/')
    .ResourceSuffix(FFilter.IBGE.Code)
      .Get;

  case FRequest.AsStatusCode of
    200 : FResult.IBGE.JSONObject(FRequest.AsContent);
    400 : raise Exception.Create(FRequest.AsJSONValue.GetValue<string>('error'));
    404 : raise Exception.Create(TSetup4DUtilityConstantes.MESSAGE_GENERIC);
  end;

end;

function TSetup4DCEPSearechIBGE.Country: ISetup4DCEPSearechIBGE;
begin
  Result := Self;

  if TSetup4DUtility.IsEmpty(FFilter.IBGE.Country) then
    raise Exception.Create(TSetup4DUtilityConstantes.REQUIRED_INFORMATION({$IFDEF HAS_PORTUGUES}'País'{$ELSE}'Country'{$ENDIF}));


  FRequest
    .ClearHeaders
    .AddHeader('X-Upper', FConfiguration.WebService.UpperTextInString)
    .AddHeader('Content-Type', 'application/json; charset=UTF-8')
    .ClearResource
    .ClearResourceSuffix
    .Resource('ibge/pais/')
    .ResourceSuffix(FFilter.IBGE.Country)
      .Get;

  case FRequest.AsStatusCode of
    200 : FResult.IBGE.JSONObject(FRequest.AsContent);
    400 : raise Exception.Create(FRequest.AsJSONValue.GetValue<string>('error'));
    404 : raise Exception.Create(TSetup4DUtilityConstantes.MESSAGE_GENERIC);
  end;

end;

Constructor TSetup4DCEPSearechIBGE.Create(const ASearech: ISetup4DCEPSearech;
      Const AConfiguration: ISetup4DCEPConfiguration;
      Const AFilter: ISetup4DCEPFilter;
      Const AResult: ISetup4DCEPResult);
begin
  FParent := ASearech;
  FConfiguration := AConfiguration;
  FFilter := AFilter;
  FResult := AResult;

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

  if TSetup4DUtility.IsEmpty(FConfiguration.WebService.BaseURL) then
    raise Exception.Create(TSetup4DUtilityConstantes.REQUIRED_INFORMATION('Base URL'));


  FRequest := TSetup4DRest.New
                .Timeout(TSetup4DUtility.IIF<Integer>(FConfiguration.WebService.TimeOut = 0, 30000, FConfiguration.WebService.TimeOut))
                .BaseURL(FConfiguration.WebService.BaseUrl);

  if FConfiguration.Proxy.Host.IsEmpty and (FConfiguration.Proxy.Port = 0) and
    FConfiguration.Proxy.User.IsEmpty and FConfiguration.Proxy.Password.IsEmpty then
    Exit;

  FRequest.Proxy(FConfiguration.Proxy.Host,
                  FConfiguration.Proxy.Password,
                  FConfiguration.Proxy.User,
                  TSetup4DUtility.
                    IIF<Integer>(
                      FConfiguration.Proxy.Port = 0,
                        3000,
                        FConfiguration.Proxy.Port)) ;
end;

destructor TSetup4DCEPSearechIBGE.Destroy;
begin

  inherited;
end;

function TSetup4DCEPSearechIBGE.Finish: ISetup4DCEPSearech;
begin
  Result := FParent;
end;

class function TSetup4DCEPSearechIBGE.New(const ASearech: ISetup4DCEPSearech;
      Const AConfiguration: ISetup4DCEPConfiguration;
      Const AFilter: ISetup4DCEPFilter;
      Const AResult: ISetup4DCEPResult): ISetup4DCEPSearechIBGE;
begin
  Result:= Self.Create(ASearech, AConfiguration, AFilter, AResult);
end;


function TSetup4DCEPSearechIBGE.State: ISetup4DCEPSearechIBGE;
begin
  Result := Self;

  if TSetup4DUtility.IsEmpty(FFilter.IBGE.State) then
    raise Exception.Create(TSetup4DUtilityConstantes.REQUIRED_INFORMATION({$IFDEF HAS_PORTUGUES}'Estado'{$ELSE}'State'{$ENDIF}));


  FRequest
    .ClearHeaders
    .AddHeader('X-Upper', FConfiguration.WebService.UpperTextInString)
    .AddHeader('Content-Type', 'application/json; charset=UTF-8')
    .ClearResource;

  if FFilter.IBGE.State.Trim.Length > 2 then
    FRequest
      .Resource('ibge/estado/')
  else
    FRequest
      .Resource('ibge/estado/sigla/');

  FRequest
    .ClearResourceSuffix
    .ResourceSuffix(FFilter.IBGE.State)
      .Get;

  case FRequest.AsStatusCode of
    200 : FResult.IBGE.JSONObject(FRequest.AsContent);
    400 : raise Exception.Create(FRequest.AsJSONValue.GetValue<string>('error'));
    404 : raise Exception.Create(TSetup4DUtilityConstantes.MESSAGE_GENERIC);
  end;
end;

end.

