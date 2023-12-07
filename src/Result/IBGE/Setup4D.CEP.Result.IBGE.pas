unit Setup4D.CEP.Result.IBGE;

interface

uses
  Setup4D.Utility,
  Setup4D.Utility.Constantes,

  Setup4D.CEP.Interf,

  System.JSON,
  System.SysUtils;

type
  TSetup4DCEPResultIBGE = class(TInterfacedObject, ISetup4DCEPResultIBGE)
  private
    [weak]
    FParent : iSetup4DCEPResult;
    FJSONString : string;
    FOwner : Boolean;
    FJSON : TJSONObject;

  protected
    function JSONObject(AJSONString : string; AOwner: Boolean = false): ISetup4DCEPResultIBGE; overload;

    function CountryCode : string;
    function Country : string;
    function StateCode : string;
    function State : string;
    function CityCode : string;
    function City : string;

    function JSONObject: TJSONObject; overload;
    function JSONObjectInString: string; overload;

    Constructor Create(const AValue: iSetup4DCEPResult); overload;
  public

    Destructor Destroy; override;
    class function New(const AValue: iSetup4DCEPResult): ISetup4DCEPResultIBGE; overload;
  end;

implementation

function TSetup4DCEPResultIBGE.City: string;
begin
  FJSON.TryGetValue<string>('cidade', Result);
end;

function TSetup4DCEPResultIBGE.CityCode: string;
begin
  FJSON.TryGetValue<string>('codigo_ibge', Result);
end;

function TSetup4DCEPResultIBGE.Country: string;
begin
  FJSON.TryGetValue<string>('pais', Result);
end;

function TSetup4DCEPResultIBGE.CountryCode: string;
begin
  FJSON.TryGetValue<string>('codigo_ibge_pais', Result);
end;

constructor TSetup4DCEPResultIBGE.Create(const AValue: iSetup4DCEPResult);
begin
  FParent := AValue;
end;

destructor TSetup4DCEPResultIBGE.Destroy;
begin
  if not FOwner then
    if Assigned(FJSON) then
      FJSON.Free;

  inherited;
end;

function TSetup4DCEPResultIBGE.JSONObject: TJSONObject;
begin
  if not Assigned(FJSON) then
    raise EConvertError.Create(TSetup4DUtilityConstantes.UNINSTANTIATED_CLASS('TJSONObject'));

  Result := FJSON;
end;

function TSetup4DCEPResultIBGE.JSONObject(
  AJSONString: string; AOwner: Boolean): ISetup4DCEPResultIBGE;
begin
  Result := Self;
  FJSONString := AJSONString;

  if TSetup4DUtility.RemoveSpaces(FJSONString).IsEmpty then
    raise EConvertError.Create(TSetup4DUtilityConstantes.REQUIRED_INFORMATION('JSON String'));

  if not TSetup4DUtility.IsValidJSONObject(FJSONString) then
    raise EConvertError.Create(TSetup4DUtilityConstantes.REQUIRED_INFORMATION('JSONString'));

  if Assigned(FJSON) then
    FJSON.Free;

  FJSON := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(FJSONString), 0) as TJSONObject;
  FOwner := AOwner;

end;

class function TSetup4DCEPResultIBGE.New(const AValue: iSetup4DCEPResult): ISetup4DCEPResultIBGE;
begin
  Result:= Self.Create(AValue);
end;

function TSetup4DCEPResultIBGE.State: string;
begin
  FJSON.TryGetValue<string>('estado', Result);
end;

function TSetup4DCEPResultIBGE.StateCode: string;
begin
  FJSON.TryGetValue<string>('codigo_ibge_estado', Result);
end;

function TSetup4DCEPResultIBGE.JSONObjectInString: string;
begin
  if TSetup4DUtility.IsEmpty(FJSONString) then
    raise EConvertError.Create(TSetup4DUtilityConstantes.NO_DATA_FOUND);

  Result := FJSONString;
end;

end.
