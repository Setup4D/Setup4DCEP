unit Setup4D.CEP.Filter.ZipCode.Address;

{$I Setup4DCEPLanguage.inc}

interface
uses
  Setup4D.Utility,
  Setup4D.Utility.Generic,
  Setup4D.Utility.Enum,

  Setup4D.CEP.Interf;
type
  TSetup4DCEPFilterZipCodeAddress = class(TInterfacedObject, ISetup4DCEPFilterZipCodeAddress)
  private
    [weak]
    FParent : ISetup4DCEPFilterZipCode;
    FTypes : string;
    FStreet : string;
    FCity : string;
    FStateAbbreviated : TSetup4DUtilityEstadoAbreviado;
    FDistrict : string;
  protected

    function Types(Const AValue : string): ISetup4DCEPFilterZipCodeAddress; overload;
    function Street(Const AValue : string): ISetup4DCEPFilterZipCodeAddress; overload;
    function City(Const AValue : string): ISetup4DCEPFilterZipCodeAddress; overload;
    function StateAbbreviated(Const AValue : string): ISetup4DCEPFilterZipCodeAddress; overload;
    function StateAbbreviated(Const AValue : TSetup4DUtilityEstadoAbreviado): ISetup4DCEPFilterZipCodeAddress; overload;
    function District(Const AValue : string): ISetup4DCEPFilterZipCodeAddress; overload;

    function Types: string; overload;
    function Street: string; overload;
    function City: string; overload;
    function StateAbbreviated: string; overload;
    function District: string; overload;

    function Finish: ISetup4DCEPFilterZipCode;

    Constructor Create(const AValue: ISetup4DCEPFilterZipCode); overload;
  public

    Destructor Destroy; override;
    class function New(const AValue: ISetup4DCEPFilterZipCode): ISetup4DCEPFilterZipCodeAddress; overload;
  end;

implementation

uses
  System.SysUtils;

{ TSetup4DCEPFilterZipCodeAddress }

function TSetup4DCEPFilterZipCodeAddress.City: string;
begin
  Result := FCity;
end;

function TSetup4DCEPFilterZipCodeAddress.City(
  Const AValue: string): ISetup4DCEPFilterZipCodeAddress;
begin
  Result := Self;
  FCity := AValue;
end;

constructor TSetup4DCEPFilterZipCodeAddress.Create(const AValue: ISetup4DCEPFilterZipCode);
begin
  FParent := AValue;
end;

destructor TSetup4DCEPFilterZipCodeAddress.Destroy;
begin

  inherited;
end;

function TSetup4DCEPFilterZipCodeAddress.District: string;
begin
  Result := FDistrict;
end;

function TSetup4DCEPFilterZipCodeAddress.District(
  Const AValue: string): ISetup4DCEPFilterZipCodeAddress;
begin
  Result := Self;
  FDistrict := AValue;
end;

function TSetup4DCEPFilterZipCodeAddress.Finish: ISetup4DCEPFilterZipCode;
begin
  Result := FParent;
end;

class function TSetup4DCEPFilterZipCodeAddress.New(const AValue: ISetup4DCEPFilterZipCode): ISetup4DCEPFilterZipCodeAddress;
begin
  Result:= Self.Create(AValue);
end;

function TSetup4DCEPFilterZipCodeAddress.Types: string;
begin
  Result := FTypes;
end;

function TSetup4DCEPFilterZipCodeAddress.Types(
  Const AValue: string): ISetup4DCEPFilterZipCodeAddress;
begin
  Result := Self;
  FTypes := AValue;
end;

function TSetup4DCEPFilterZipCodeAddress.StateAbbreviated(
  Const AValue: string): ISetup4DCEPFilterZipCodeAddress;
begin
  Result := Self;

  if AValue.Trim.IsEmpty then
    Exit;

  var LState : string;
  LState := Format('_%s', [TSetup4DUtility.OnlyAlpha(AValue.ToUpper)]);
  FStateAbbreviated := TSetup4DUtilityGeneric<TSetup4DUtilityEstadoAbreviado>.StringToEnum(LState);
end;

function TSetup4DCEPFilterZipCodeAddress.StateAbbreviated: string;
begin
  Result:= TSetup4DUtilityGeneric<TSetup4DUtilityEstadoAbreviado>.EnumToString(FStateAbbreviated, '_', EmptyStr);
end;

function TSetup4DCEPFilterZipCodeAddress.StateAbbreviated(
  Const AValue: TSetup4DUtilityEstadoAbreviado): ISetup4DCEPFilterZipCodeAddress;
begin
  Result := Self;
  FStateAbbreviated := AValue;
end;

function TSetup4DCEPFilterZipCodeAddress.Street: string;
begin
  Result := FStreet;
end;

function TSetup4DCEPFilterZipCodeAddress.Street(
  Const AValue: string): ISetup4DCEPFilterZipCodeAddress;
begin
  Result := Self;
  FStreet := AValue;
end;

end.
