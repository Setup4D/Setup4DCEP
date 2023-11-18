unit Setup4D.CEP.Result.IBGE.Display;

{$I Setup4DCEPLanguage.inc}

interface
uses
  Setup4D.CEP.Interf,
  System.JSON;

type
  TSetup4DCEPResultIBGEDisplay = class(TInterfacedObject, iSetup4DCEPResultIBGEDisplay)
  private
    [weak]
    FParent : iSetup4DCEPResultIBGE;
    FJSON : TJSONObject;

  protected

    function StateCode : string;
    function State : string;
    function CityCode : string;
    function City : string;
    function Zone : string;

    function JSON (Const AValue: TJSONObject) : iSetup4DCEPResultIBGEDisplay; overload;

    function Finish: iSetup4DCEPResultIBGE;

    Constructor Create(const AValue: iSetup4DCEPResultIBGE); overload;
  public

    Destructor Destroy; override;

    class function New(const AValue: iSetup4DCEPResultIBGE): iSetup4DCEPResultIBGEDisplay; overload;
  end;

implementation

uses
  System.SysUtils;

function TSetup4DCEPResultIBGEDisplay.Zone: string;
begin
  if FJSON = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe do JSONObject não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('The JSONObject class has not been instantiated.');
    {$ENDIF}

  FJSON.TryGetValue<string>('area', Result);
end;

function TSetup4DCEPResultIBGEDisplay.CityCode: string;
begin
  if FJSON = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe do JSONObject não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('The JSONObject class has not been instantiated.');
    {$ENDIF}

  FJSON.TryGetValue<string>('codigomunicipio', Result);
end;

function TSetup4DCEPResultIBGEDisplay.StateCode: string;
begin
  if FJSON = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe do JSONObject não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('The JSONObject class has not been instantiated.');
    {$ENDIF}

  FJSON.TryGetValue<string>('codigouf', Result);
end;

constructor TSetup4DCEPResultIBGEDisplay.Create(const AValue: iSetup4DCEPResultIBGE);
begin
  FParent := AValue;
end;

destructor TSetup4DCEPResultIBGEDisplay.Destroy;
begin

  inherited;
end;

function TSetup4DCEPResultIBGEDisplay.Finish: iSetup4DCEPResultIBGE;
begin
  Result := FParent;
end;

function TSetup4DCEPResultIBGEDisplay.JSON(
  const AValue: TJSONObject): iSetup4DCEPResultIBGEDisplay;
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

function TSetup4DCEPResultIBGEDisplay.City: string;
begin
  if FJSON = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe do JSONObject não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('The JSONObject class has not been instantiated.');
    {$ENDIF}

  FJSON.TryGetValue<string>('municipio', Result);
end;

class function TSetup4DCEPResultIBGEDisplay.New(const AValue: iSetup4DCEPResultIBGE): iSetup4DCEPResultIBGEDisplay;
begin
  Result:= Self.Create(AValue);
end;

function TSetup4DCEPResultIBGEDisplay.State: string;
begin
  if FJSON = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe do JSONObject não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('The JSONObject class has not been instantiated.');
    {$ENDIF}

  FJSON.TryGetValue<string>('uf', Result);
end;

end.

