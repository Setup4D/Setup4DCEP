unit Setup4D.CEP.Filter.ZipCode.Key;

{$I Setup4DCEPLanguage.inc}

interface
uses
  Setup4D.Utility,

  Setup4D.CEP.Interf;

type
  TSetup4DCEPFilterZipCodeKey = class(TInterfacedObject, ISetup4DCEPFilterZipCodeKey)
  private
    [weak]
    FParent : ISetup4DCEPFilterZipCode;
    FValue : string;

  protected

    function Value(Const AValue: string) : ISetup4DCEPFilterZipCodeKey; overload;
    function Value : string; overload;

    function Finish: ISetup4DCEPFilterZipCode;

    Constructor Create(AValue: ISetup4DCEPFilterZipCode); overload;

  public
    Destructor Destroy; override;
    class function New(AValue: ISetup4DCEPFilterZipCode): ISetup4DCEPFilterZipCodeKey; overload;
  end;

implementation

{ TSetup4DCEPFilterZipCodeKey }

constructor TSetup4DCEPFilterZipCodeKey.Create(AValue: ISetup4DCEPFilterZipCode);
begin
  FParent := AValue;
end;

destructor TSetup4DCEPFilterZipCodeKey.Destroy;
begin

  inherited;
end;

function TSetup4DCEPFilterZipCodeKey.Finish: ISetup4DCEPFilterZipCode;
begin
  Result := FParent;
end;

class function TSetup4DCEPFilterZipCodeKey.New(
  AValue: ISetup4DCEPFilterZipCode): ISetup4DCEPFilterZipCodeKey;
begin
  Result:= Self.Create(AValue);
end;

function TSetup4DCEPFilterZipCodeKey.Value: string;
begin
  Result := FValue;
end;

function TSetup4DCEPFilterZipCodeKey.Value(
  const AValue: string): ISetup4DCEPFilterZipCodeKey;
begin
  Result := Self;
  FValue := TSetup4DUtility.OnlyNumber(AValue);
end;

end.
