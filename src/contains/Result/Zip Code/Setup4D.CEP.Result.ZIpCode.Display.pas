unit Setup4D.CEP.Result.ZIpCode.Display;

{$I Setup4DCEPLanguage.inc}

interface
uses
  Setup4D.CEP.Interf,

  System.JSON;

type
  TSetup4DCEPResultZipCodeDisplay = class(TInterfacedObject, iSetup4DCEPResultZipCodeDisplay)
  private
    [weak]
    FParent : iSetup4DCEPResultZipCode;
    FJSON : TJSONObject;
  protected

    function Code : string;
    function Types : string;
    function Street : string;
    function StreetComplete : string;
    function Complement : string;
    function District : string;
    function City : string;
    function IBGECity : string;
    function State : string;
    function IBGEState : string;
    function DDD : string;
    function GIA : string;
    function SIAFI : string;
    function Altitude : string;
    function Latitude : string;
    function Longitude : string;

    function JSON (Const AValue: TJSONObject) : iSetup4DCEPResultZipCodeDisplay; overload;

    function Finish: iSetup4DCEPResultZipCode;

    Constructor Create(const AValue: iSetup4DCEPResultZipCode); overload;
  public

    Destructor Destroy; override;
    class function New(const AValue: iSetup4DCEPResultZipCode): iSetup4DCEPResultZipCodeDisplay; overload;
  end;

implementation

uses
  System.SysUtils;

function TSetup4DCEPResultZipCodeDisplay.Altitude: string;
begin
  if FJSON = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe do JSONObject não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('The JSONObject class has not been instantiated.');
    {$ENDIF}

  FJSON.TryGetValue<string>('altitude', Result);
end;

function TSetup4DCEPResultZipCodeDisplay.District: string;
begin
  if FJSON = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe do JSONObject não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('The JSONObject class has not been instantiated.');
    {$ENDIF}

  FJSON.TryGetValue<string>('bairro', Result);
end;

function TSetup4DCEPResultZipCodeDisplay.Code: string;
begin
  if FJSON = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe do JSONObject não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('The JSONObject class has not been instantiated.');
    {$ENDIF}

  FJSON.TryGetValue<string>('cep', Result);
end;

function TSetup4DCEPResultZipCodeDisplay.City: string;
begin
  if FJSON = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe do JSONObject não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('The JSONObject class has not been instantiated.');
    {$ENDIF}

  FJSON.TryGetValue<string>('cidade', Result);
end;

function TSetup4DCEPResultZipCodeDisplay.Complement: string;
begin
  if FJSON = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe do JSONObject não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('The JSONObject class has not been instantiated.');
    {$ENDIF}

  FJSON.TryGetValue<string>('complemento', Result);
end;

constructor TSetup4DCEPResultZipCodeDisplay.Create(const AValue: iSetup4DCEPResultZipCode);
begin
  FParent := AValue;
end;

function TSetup4DCEPResultZipCodeDisplay.DDD: string;
begin
  if FJSON = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe do JSONObject não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('The JSONObject class has not been instantiated.');
    {$ENDIF}

  FJSON.TryGetValue<string>('ddd', Result);
end;

destructor TSetup4DCEPResultZipCodeDisplay.Destroy;
begin

  inherited;
end;

function TSetup4DCEPResultZipCodeDisplay.State: string;
begin
  if FJSON = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe do JSONObject não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('The JSONObject class has not been instantiated.');
    {$ENDIF}

  FJSON.TryGetValue<string>('estado', Result);
end;

function TSetup4DCEPResultZipCodeDisplay.Finish: iSetup4DCEPResultZipCode;
begin
  Result := FParent;
end;

function TSetup4DCEPResultZipCodeDisplay.GIA: string;
begin
  if FJSON = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe do JSONObject não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('The JSONObject class has not been instantiated.');
    {$ENDIF}

  FJSON.TryGetValue<string>('gia', Result);
end;

function TSetup4DCEPResultZipCodeDisplay.IBGECity: string;
begin
  if FJSON = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe do JSONObject não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('The JSONObject class has not been instantiated.');
    {$ENDIF}

  FJSON.TryGetValue<string>('ibge_cidade', Result);
end;

function TSetup4DCEPResultZipCodeDisplay.IBGEState: string;
begin
  if FJSON = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe do JSONObject não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('The JSONObject class has not been instantiated.');
    {$ENDIF}

  FJSON.TryGetValue<string>('ibge_estado', Result);
end;

function TSetup4DCEPResultZipCodeDisplay.JSON(
  const AValue: TJSONObject): iSetup4DCEPResultZipCodeDisplay;
begin
  Result := Self;

  if AValue = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe do JSONObject não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('The JSONObject class has not been instantiated.');
    {$ENDIF}

  FJSON := AValue;
end;

function TSetup4DCEPResultZipCodeDisplay.Latitude: string;
begin
  if FJSON = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe do JSONObject não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('The JSONObject class has not been instantiated.');
    {$ENDIF}

  FJSON.TryGetValue<string>('latitude', Result);
end;

function TSetup4DCEPResultZipCodeDisplay.Longitude: string;
begin
  if FJSON = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe do JSONObject não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('The JSONObject class has not been instantiated.');
    {$ENDIF}

  FJSON.TryGetValue<string>('longitude', Result);
end;

class function TSetup4DCEPResultZipCodeDisplay.New(const AValue: iSetup4DCEPResultZipCode): iSetup4DCEPResultZipCodeDisplay;
begin
  Result:= Self.Create(AValue);
end;

function TSetup4DCEPResultZipCodeDisplay.Street: string;
begin
  if FJSON = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe do JSONObject não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('The JSONObject class has not been instantiated.');
    {$ENDIF}

  FJSON.TryGetValue<string>('rua', Result);
end;

function TSetup4DCEPResultZipCodeDisplay.StreetComplete: string;
begin
  if FJSON = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe do JSONObject não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('The JSONObject class has not been instantiated.');
    {$ENDIF}

  var LRua: string;
  FJSON.TryGetValue<string>('rua', LRua);

  var LTipo : string;
  FJSON.TryGetValue<string>('tipo', LTipo);

  Result := LTipo + LRua;
end;

function TSetup4DCEPResultZipCodeDisplay.SIAFI: string;
begin
  if FJSON = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe do JSONObject não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('The JSONObject class has not been instantiated.');
    {$ENDIF}

  FJSON.TryGetValue<string>('siafi', Result);
end;

function TSetup4DCEPResultZipCodeDisplay.Types: string;
begin
  if FJSON = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe do JSONObject não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('The JSONObject class has not been instantiated.');
    {$ENDIF}

  FJSON.TryGetValue<string>('tipo', Result);
end;

end.
