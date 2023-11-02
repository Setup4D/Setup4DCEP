unit Setup4D.CEP.Filter.ZipCode;

{$I Setup4DCEPLanguage.inc}

interface
uses
  Setup4D.CEP.Interf;

type
  TSetup4DCEPFilterZipCode = class(TInterfacedObject, ISetup4DCEPFilterZipCode)
  private
    [weak]
    FFilter : ISetup4DCEPFilter;
    FFilterKey : ISetup4DCEPFilterZipCodeKey;
    FFilterAddress : ISetup4DCEPFilterZipCodeAddress;
  protected

    function Key:ISetup4DCEPFilterZipCodeKey;
    function Address:ISetup4DCEPFilterZipCodeAddress;
    function Finish: ISetup4DCEPFilter;

    Constructor Create(const AValue: ISetup4DCEPFilter); overload;
  public

    Destructor Destroy; override;
    class function New(const AValue: ISetup4DCEPFilter): ISetup4DCEPFilterZipCode; overload;
  end;

implementation

uses
  Setup4D.CEP.Filter.ZipCode.Key,
  Setup4D.CEP.Filter.ZipCode.Address;

{ TSetup4DCEPFilterZipCode }

function TSetup4DCEPFilterZipCode.Address: ISetup4DCEPFilterZipCodeAddress;
begin
  if not Assigned(FFilterAddress) then
    FFilterAddress := TSetup4DCEPFilterZipCodeAddress.New(Self);
  Result := FFilterAddress;
end;

constructor TSetup4DCEPFilterZipCode.Create(const AValue: ISetup4DCEPFilter);
begin
  FFilter := AValue;
end;

destructor TSetup4DCEPFilterZipCode.Destroy;
begin

  inherited;
end;

function TSetup4DCEPFilterZipCode.Finish: ISetup4DCEPFilter;
begin
  Result := FFilter;
end;

class function TSetup4DCEPFilterZipCode.New(const AValue: ISetup4DCEPFilter): ISetup4DCEPFilterZipCode;
begin
  Result:= Self.Create(AValue);
end;

function TSetup4DCEPFilterZipCode.Key: ISetup4DCEPFilterZipCodeKey;
begin
  if not Assigned(FFilterKey) then
    FFilterKey := TSetup4DCEPFilterZipCodeKey.New(Self);
  Result := FFilterKey;
end;

end.
