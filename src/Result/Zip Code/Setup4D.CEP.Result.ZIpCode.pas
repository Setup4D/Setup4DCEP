unit Setup4D.CEP.Result.ZIpCode;

interface

uses
  Setup4D.Utility,
  Setup4D.Utility.Constantes,

  Setup4D.CEP.Interf,

  System.JSON,
  System.SysUtils,
  System.Generics.Collections;

type
  TSetup4DCEPResultZipCode = class(TInterfacedObject, ISetup4DCEPResultZipCode)
  private
    [weak]
    FParent : ISetup4DCEPResult;
    FJSONString : string;
    FJSONArrayString : string;
    FOwner : Boolean;
    FJSON : TJSONObject;
    FJSONArray : TJSONArray;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o valor associado a um campo específico de um objeto JSON.
    /// </summary>
    /// <param name="AField">
    /// O nome do campo desejado.
    /// </param>
    /// <returns>
    /// O valor associado ao campo especificado.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the value associated with a specific field from a JSON object.
    /// </summary>
    /// <param name="AField">
    /// The name of the desired field.
    /// </param>
    /// <returns>
    /// The value associated with the specified field.
    /// </returns>
    {$ENDIF}
    function GetValueFromJSONObject(Const AField: string) : String; overload;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Obtém o valor associado a um campo específico de um objeto JSON em um array JSON.
    /// </summary>
    /// <param name="AField">
    /// O nome do campo desejado.
    /// </param>
    /// <param name="AItem">
    /// O índice do item no array JSON.
    /// </param>
    /// <returns>
    /// O valor associado ao campo especificado.
    /// </returns>
    {$ELSE}
    /// <summary>
    /// Gets the value associated with a specific field from a JSON object in a JSON array.
    /// </summary>
    /// <param name="AField">
    /// The name of the desired field.
    /// </param>
    /// <param name="AItem">
    /// The index of the item in the JSON array.
    /// </param>
    /// <returns>
    /// The value associated with the specified field.
    /// </returns>
    {$ENDIF}
    function GetValueFromJSONArray(Const AField: string; const AItem: Integer) : String; overload;

  protected
    function JSONObject(AJSONString : string; AOwner: Boolean = false): ISetup4DCEPResultZipCode; overload;
    function JSONArray(AJSONString : string; AOwner: Boolean = false): ISetup4DCEPResultZipCode; overload;

    function Code : string; overload;
    function Code(Const AItem : Integer) : string; overload;
    function Street : string; overload;
    function Street(Const AItem : Integer) : string; overload;
    function StreetComplent : string; overload;
    function StreetComplent(Const AItem : Integer) : string; overload;
    function District : string; overload;
    function District(Const AItem : Integer) : string; overload;
    function City : string; overload;
    function City(Const AItem : Integer) : string; overload;
    function CityIBGE : string; overload;
    function CityIBGE(Const AItem : Integer) : string; overload;
    function State : string; overload;
    function State(Const AItem : Integer) : string; overload;
    function StateSigla : string;overload;
    function StateSigla(Const AItem : Integer) : string;overload;
    function StateIBGE : string; overload;
    function StateIBGE(Const AItem : Integer) : string; overload;
    function DDD : string; overload;
    function DDD(Const AItem : Integer) : string; overload;
    function Region : string; overload;
    function Region(Const AItem : Integer) : string; overload;
    function Country : string; overload;
    function Country(Const AItem : Integer) : string; overload;
    function CountrySigla : string; overload;
    function CountrySigla(Const AItem : Integer) : string; overload;
    function CountryIBGE : string;  overload;
    function CountryIBGE(Const AItem : Integer) : string;  overload;
    function DDI : string; overload;
    function DDI(Const AItem : Integer) : string; overload;
    function Continent : string; overload;
    function Continent(Const AItem : Integer) : string; overload;
    function Altitude : string; overload;
    function Altitude(Const AItem : Integer) : string; overload;
    function Latitude : string; overload;
    function Latitude(Const AItem : Integer) : string; overload;
    function Longitude : string; overload;
    function Longitude(Const AItem : Integer) : string; overload;
    function SIAFICode : string; overload;
    function SIAFICode(Const AItem : Integer) : string; overload;
    function SIAFIName : string; overload;
    function SIAFIName(Const AItem : Integer) : string; overload;
    function SIAFICNPJ : string; overload;
    function SIAFICNPJ(Const AItem : Integer) : string; overload;

    function JSONObject: TJSONObject; overload;
    function JSONObjectInString: string; overload;
    function JSONArray: TJSONArray; overload;
    function JSONArrayInString: string; overload;

    Constructor Create(const AValue: ISetup4DCEPResult); overload;
  public

    Destructor Destroy; override;
    class function New(const AValue: ISetup4DCEPResult): ISetup4DCEPResultZipCode; overload;
  end;

implementation


function TSetup4DCEPResultZipCode.Altitude: string;
begin
  Result := GetValueFromJSONObject('endereco.localizacao.coordenadas.altitude');
end;

function TSetup4DCEPResultZipCode.City: string;
begin
  Result := GetValueFromJSONObject('endereco.cidade.nome');
end;

function TSetup4DCEPResultZipCode.CityIBGE: string;
begin
  Result := GetValueFromJSONObject('endereco.cidade.codigo_ibge');
end;

function TSetup4DCEPResultZipCode.Code: string;
begin
  Result := GetValueFromJSONObject('cep');
end;

function TSetup4DCEPResultZipCode.Continent: string;
begin
  Result := GetValueFromJSONObject('endereco.localizacao.continente');
end;

function TSetup4DCEPResultZipCode.Country: string;
begin
  Result := GetValueFromJSONObject('endereco.localizacao.pais.nome');
end;

function TSetup4DCEPResultZipCode.CountryIBGE: string;
begin
  Result := GetValueFromJSONObject('endereco.localizacao.pais.codigo_ibge');
end;

function TSetup4DCEPResultZipCode.CountrySigla: string;
begin
  Result := GetValueFromJSONObject('endereco.localizacao.pais.sigla');
end;

constructor TSetup4DCEPResultZipCode.Create(const AValue: ISetup4DCEPResult);
begin
  FParent := AValue;
end;

function TSetup4DCEPResultZipCode.DDD: string;
begin
  Result := GetValueFromJSONObject('endereco.estado.ddd');
end;

function TSetup4DCEPResultZipCode.DDI: string;
begin
  Result := GetValueFromJSONObject('endereco.localizacao.pais.ddi');
end;

destructor TSetup4DCEPResultZipCode.Destroy;
begin
  if not FOwner then
    if Assigned(FJSON) then
      FJSON.Free;

  if not FOwner then
    if Assigned(FJSONArray) then
      FJSONArray.Free;

  inherited;
end;

function TSetup4DCEPResultZipCode.District(const AItem: Integer): string;
begin
  Result := GetValueFromJSONArray('bairro', AItem);
end;

function TSetup4DCEPResultZipCode.District: string;
begin
  Result := GetValueFromJSONObject('endereco.bairro');
end;

function TSetup4DCEPResultZipCode.JSONArray(AJSONString: string;
  AOwner: Boolean): ISetup4DCEPResultZipCode;
begin
  Result := Self;
  FJSONArrayString := AJSONString;

  if TSetup4DUtility.IsEmpty(FJSONArrayString) then
    raise EConvertError.Create(TSetup4DUtilityConstantes.REQUIRED_INFORMATION('JSON Array String'));

  if not TSetup4DUtility.IsValidJSONArray(FJSONArrayString) then
    raise EConvertError.Create(TSetup4DUtilityConstantes.REQUIRED_INFORMATION('JSONArrayString'));

  if Assigned(FJSONArray) then
    try
      FJSONArray.Free;
    except
    end;


  FJSONArray := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(FJSONArrayString), 0) as TJSONArray;
  FOwner := AOwner;

end;

function TSetup4DCEPResultZipCode.JSONArray: TJSONArray;
begin
  if not Assigned(FJSONArray) then
    raise EConvertError.Create(TSetup4DUtilityConstantes.UNINSTANTIATED_CLASS('TJSONArray'));

  Result := FJSONArray;
end;

function TSetup4DCEPResultZipCode.JSONObject: TJSONObject;
begin
  if not Assigned(FJSON) then
    raise EConvertError.Create(TSetup4DUtilityConstantes.UNINSTANTIATED_CLASS('TJSONObject'));

  Result := FJSON;
end;

function TSetup4DCEPResultZipCode.JSONObject(
  AJSONString: string; AOwner: Boolean): ISetup4DCEPResultZipCode;
begin
  Result := Self;
  FJSONString := AJSONString;

  if TSetup4DUtility.IsEmpty(FJSONString) then
    raise EConvertError.Create(TSetup4DUtilityConstantes.REQUIRED_INFORMATION('JSON String'));

  if not TSetup4DUtility.IsValidJSONObject(FJSONString) then
    raise EConvertError.Create(TSetup4DUtilityConstantes.REQUIRED_INFORMATION('JSONString'));

  if Assigned(FJSON) then
    FJSON.Free;

  FJSON := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(FJSONString), 0) as TJSONObject;
  FOwner := AOwner;
end;

class function TSetup4DCEPResultZipCode.New(const AValue: ISetup4DCEPResult): ISetup4DCEPResultZipCode;
begin
  Result:= Self.Create(AValue);
end;


function TSetup4DCEPResultZipCode.Region(const AItem: Integer): string;
begin
  Result := GetValueFromJSONArray('regiao', AItem);
end;

function TSetup4DCEPResultZipCode.Region: string;
begin
  Result := GetValueFromJSONObject('endereco.localizacao.regiao');
end;

function TSetup4DCEPResultZipCode.SIAFICNPJ: string;
begin
  Result := GetValueFromJSONObject('endereco.siafi.cnpj');
end;

function TSetup4DCEPResultZipCode.SIAFICode: string;
begin
  Result := GetValueFromJSONObject('endereco.siafi.codigo');
end;

function TSetup4DCEPResultZipCode.SIAFIName: string;
begin
  Result := GetValueFromJSONObject('endereco.siafi.nome');
end;

function TSetup4DCEPResultZipCode.State: string;
begin
  Result := GetValueFromJSONObject('endereco.estado.nome');
end;

function TSetup4DCEPResultZipCode.StateIBGE: string;
begin
  Result := GetValueFromJSONObject('endereco.estado.codigo_ibge');
end;

function TSetup4DCEPResultZipCode.StateSigla: string;
begin
  Result := GetValueFromJSONObject('endereco.estado.sigla');
end;

function TSetup4DCEPResultZipCode.Street: string;
begin
  Result := GetValueFromJSONObject('endereco.logradouro');
end;

function TSetup4DCEPResultZipCode.StreetComplent: string;
begin
  Result := GetValueFromJSONObject('endereco.complemento');
end;

function TSetup4DCEPResultZipCode.GetValueFromJSONObject(const AField: string): String;
begin
  if not Assigned(FJSON) then
    raise EConvertError.Create(TSetup4DUtilityConstantes.UNINSTANTIATED_CLASS('TJSONObject'));

  FJSON.TryGetValue<string>(AField, Result);
end;

function TSetup4DCEPResultZipCode.JSONObjectInString: string;
begin
  if TSetup4DUtility.IsEmpty(FJSONString) then
    raise EConvertError.Create(TSetup4DUtilityConstantes.NO_DATA_FOUND);

  Result := FJSONString;
end;

function TSetup4DCEPResultZipCode.Latitude: string;
begin
  Result := GetValueFromJSONObject('endereco.localizacao.coordenadas.latitude');
end;

function TSetup4DCEPResultZipCode.Longitude: string;
begin
  Result := GetValueFromJSONObject('endereco.localizacao.coordenadas.longitude');
end;

function TSetup4DCEPResultZipCode.GetValueFromJSONArray(const AField: string; const AItem: Integer): String;
var
  LJSON : TJSONObject;
begin
  if not Assigned(FJSONArray) then
    raise EConvertError.Create(TSetup4DUtilityConstantes.UNINSTANTIATED_CLASS('TJSONArray'));

  if AItem > FJSONArray.Count then
    raise EConvertError.Create(TSetup4DUtilityConstantes.NO_RECORDS_FOUND);

  LJSON := FJSONArray.Items[AItem] as TJSONObject;

  LJSON.TryGetValue<string>(AField, Result);
end;

function TSetup4DCEPResultZipCode.JSONArrayInString: string;
begin
  if TSetup4DUtility.IsEmpty(FJSONArrayString) then
    raise EConvertError.Create(TSetup4DUtilityConstantes.NO_DATA_FOUND);

  Result := FJSONArrayString;
end;

function TSetup4DCEPResultZipCode.Altitude(const AItem: Integer): string;
begin
  Result := GetValueFromJSONArray('altitude', AItem);
end;


function TSetup4DCEPResultZipCode.City(const AItem: Integer): string;
begin
  Result := GetValueFromJSONArray('cidade', AItem);
end;


function TSetup4DCEPResultZipCode.CityIBGE(const AItem: Integer): string;
begin
  Result := GetValueFromJSONArray('ibge_cidade', AItem);
end;

function TSetup4DCEPResultZipCode.Code(const AItem: Integer): string;
begin
  Result := GetValueFromJSONArray('cep', AItem);
end;

function TSetup4DCEPResultZipCode.Continent(const AItem: Integer): string;
begin
  Result := GetValueFromJSONArray('continente', AItem);
end;


function TSetup4DCEPResultZipCode.Country(const AItem: Integer): string;
begin
  Result := GetValueFromJSONArray('pais', AItem);
end;


function TSetup4DCEPResultZipCode.CountryIBGE(const AItem: Integer): string;
begin
  Result := GetValueFromJSONArray('ibge_pais', AItem);
end;

function TSetup4DCEPResultZipCode.CountrySigla(const AItem: Integer): string;
begin
  Result := GetValueFromJSONArray('sigla_pais', AItem);
end;

function TSetup4DCEPResultZipCode.DDD(const AItem: Integer): string;
begin
  Result := GetValueFromJSONArray('ddd', AItem);
end;


function TSetup4DCEPResultZipCode.DDI(const AItem: Integer): string;
begin
  Result := GetValueFromJSONArray('ddi', AItem);
end;

function TSetup4DCEPResultZipCode.Latitude(const AItem: Integer): string;
begin
  Result := GetValueFromJSONArray('latitude', AItem);
end;

function TSetup4DCEPResultZipCode.Longitude(const AItem: Integer): string;
begin
  Result := GetValueFromJSONArray('longitude', AItem);
end;

function TSetup4DCEPResultZipCode.SIAFICNPJ(const AItem: Integer): string;
begin
  Result := GetValueFromJSONArray('cnpj_siafi', AItem);
end;

function TSetup4DCEPResultZipCode.SIAFICode(const AItem: Integer): string;
begin
  Result := GetValueFromJSONArray('codigo_siafi', AItem);
end;

function TSetup4DCEPResultZipCode.SIAFIName(const AItem: Integer): string;
begin
  Result := GetValueFromJSONArray('nome_siafi', AItem);
end;

function TSetup4DCEPResultZipCode.State(const AItem: Integer): string;
begin
  Result := GetValueFromJSONArray('estado', AItem);
end;

function TSetup4DCEPResultZipCode.StateIBGE(const AItem: Integer): string;
begin
  Result := GetValueFromJSONArray('ibge_estado', AItem);
end;

function TSetup4DCEPResultZipCode.StateSigla(const AItem: Integer): string;
begin
  Result := GetValueFromJSONArray('sigla_estado', AItem);
end;

function TSetup4DCEPResultZipCode.Street(const AItem: Integer): string;
begin
  Result := GetValueFromJSONArray('logradouro', AItem);
end;

function TSetup4DCEPResultZipCode.StreetComplent(const AItem: Integer): string;
begin
  Result := GetValueFromJSONArray('complemento', AItem);
end;

end.
