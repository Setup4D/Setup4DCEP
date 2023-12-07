unit Setup4D.CEP.Searech.ZipCode;

interface

uses
  Setup4D.Utility,
  Setup4D.Utility.Constantes,

  Setup4D.Rest,
  Setup4D.Rest.Interf,

  Setup4D.CEP.Interf,

  System.SysUtils;


type
  TSetup4DCEPSearechZipCode = class(TInterfacedObject, ISetup4DCEPSearechZipCode)
  private
    [weak]
    FParent : ISetup4DCEPSearech;
    FRequest: ISetup4DRest;
    FConfiguration: ISetup4DCEPConfiguration;
    FFilter: ISetup4DCEPFilter;
    FResult: ISetup4DCEPResult;

  protected

    function Value : ISetup4DCEPSearechZipCode;
    function Address(AAll: Boolean = False) : ISetup4DCEPSearechZipCode;

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
      Const AResult: ISetup4DCEPResult): ISetup4DCEPSearechZipCode; overload;
  end;

implementation

{ TSetup4DCEPSearechZipCode }

function TSetup4DCEPSearechZipCode.Address(
  AAll: Boolean): ISetup4DCEPSearechZipCode;
var
  LResourceSuffix : string;
begin
  Result := Self;

  if TSetup4DUtility.IsEmpty(FFilter.ZipCode.Street) then
    raise Exception.Create(TSetup4DUtilityConstantes.REQUIRED_INFORMATION({$IFDEF HAS_PORTUGUES}'Rua'{$ELSE}'Street'{$ENDIF}));

  if TSetup4DUtility.IsEmpty(FFilter.ZipCode.District) then
    raise Exception.Create(TSetup4DUtilityConstantes.REQUIRED_INFORMATION({$IFDEF HAS_PORTUGUES}'Bairro'{$ELSE}'District'{$ENDIF}));

  if TSetup4DUtility.IsEmpty(FFilter.ZipCode.City) then
    raise Exception.Create(TSetup4DUtilityConstantes.REQUIRED_INFORMATION({$IFDEF HAS_PORTUGUES}'Cidade'{$ELSE}'City'{$ENDIF}));

  if TSetup4DUtility.IsEmpty(FFilter.ZipCode.State) then
    raise Exception.Create(TSetup4DUtilityConstantes.REQUIRED_INFORMATION({$IFDEF HAS_PORTUGUES}'Estado'{$ELSE}'State'{$ENDIF}));

  LResourceSuffix := Format('/%s/bairro/%s/cidade/%s/estado/%s/', [FFilter.ZipCode.Street,
                                                                        FFilter.ZipCode.District,
                                                                        FFilter.ZipCode.City,
                                                                        FFilter.ZipCode.State]);

  if AAll then
    LResourceSuffix := Format('%sall/', [LResourceSuffix]);

  FRequest
    .ClearHeaders
    .AddHeader('X-Upper', FConfiguration.WebService.UpperTextInString)
    .AddHeader('Content-Type', 'application/json; charset=UTF-8')
    .ClearResource
    .ClearResourceSuffix
    .Resource('endereco/rua/')
    .ResourceSuffix(LResourceSuffix)
      .Get;

  case FRequest.AsStatusCode of
    200 : IF AAll then
            FResult.ZIPCode.JSONArray(FRequest.AsContent)
          else
            FResult.ZIPCode.JSONObject(FRequest.AsContent);

    400 : raise Exception.Create(FRequest.AsJSONValue.GetValue<string>('error'));
    404 : raise Exception.Create(TSetup4DUtilityConstantes.MESSAGE_GENERIC);
  end;

end;

Constructor TSetup4DCEPSearechZipCode.Create(const ASearech: ISetup4DCEPSearech;
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

destructor TSetup4DCEPSearechZipCode.Destroy;
begin

  inherited;
end;

function TSetup4DCEPSearechZipCode.Finish: ISetup4DCEPSearech;
begin
  Result := FParent;
end;

class function TSetup4DCEPSearechZipCode.New(const ASearech: ISetup4DCEPSearech;
      Const AConfiguration: ISetup4DCEPConfiguration;
      Const AFilter: ISetup4DCEPFilter;
      Const AResult: ISetup4DCEPResult): ISetup4DCEPSearechZipCode;
begin
  Result:= Self.Create(ASearech, AConfiguration, AFilter, AResult);
end;


function TSetup4DCEPSearechZipCode.Value: ISetup4DCEPSearechZipCode;
begin
  Result := Self;

  if TSetup4DUtility.IsEmpty(FFilter.ZipCode.Value) then
    raise Exception.Create(TSetup4DUtilityConstantes.REQUIRED_INFORMATION({$IFDEF HAS_PORTUGUES}'CEP'{$ELSE}'Zip Code'{$ENDIF}));


  FRequest
    .ClearHeaders
    .AddHeader('X-Upper', FConfiguration.WebService.UpperTextInString)
    .AddHeader('Content-Type', 'application/json; charset=UTF-8')
    .ClearResource
    .ClearResourceSuffix
    .Resource('endereco/v3/cep/')
    .ResourceSuffix(FFilter.ZipCode.Value)
      .Get;

  case FRequest.AsStatusCode of
    200 : FResult.ZIPCode.JSONObject(FRequest.AsContent);
    400 : raise Exception.Create(FRequest.AsJSONValue.GetValue<string>('error'));
    404 : raise Exception.Create(TSetup4DUtilityConstantes.MESSAGE_GENERIC);
  end;
end;

end.
