unit Setup4D.CEP.Filter.IBGE;

{$I Setup4DCEPLanguage.inc}

interface

uses
  Setup4D.CEP.Interf;

type
  TSetup4DCEPFilterIBGE = class(TInterfacedObject, ISetup4DCEPFilterIBGE)
  private
    [weak]
    FFilter : ISetup4DCEPFilter;
    FFilterKey: ISetup4DCEPFilterIBGEKey;
    FFilterAddress: ISetup4DCEPFilterIBGEAddress;
  protected

    function Key: ISetup4DCEPFilterIBGEKey;
    function Address: ISetup4DCEPFilterIBGEAddress;
    function Finish: ISetup4DCEPFilter;


    Constructor Create(const AValue: ISetup4DCEPFilter); overload;
  public

    Destructor Destroy; override;
    class function New(const AValue: ISetup4DCEPFilter): ISetup4DCEPFilterIBGE; overload;
  end;

implementation

uses
  Setup4D.CEP.Filter.IBGE.Key,
  Setup4D.CEP.Filter.IBGE.Address;

{ TSetup4DCEPFilterIBGE }

function TSetup4DCEPFilterIBGE.Address: ISetup4DCEPFilterIBGEAddress;
begin
  if not Assigned(FFilterAddress) then
    FFilterAddress := TSetup4DCEPFilterIBGEAddress.New(Self);
  Result := FFilterAddress;
end;

constructor TSetup4DCEPFilterIBGE.Create(const AValue: ISetup4DCEPFilter);
begin
  FFilter := AValue;
end;

function TSetup4DCEPFilterIBGE.Key: ISetup4DCEPFilterIBGEKey;
begin
  if not Assigned(FFilterKey) then
    FFilterKey := TSetup4DCEPFilterIBGEKey.New(Self);
  Result := FFilterKey;
end;

destructor TSetup4DCEPFilterIBGE.Destroy;
begin

  inherited;
end;

function TSetup4DCEPFilterIBGE.Finish: ISetup4DCEPFilter;
begin
  Result := FFilter;
end;

class function TSetup4DCEPFilterIBGE.New(const AValue: ISetup4DCEPFilter): ISetup4DCEPFilterIBGE;
begin
  Result:= Self.Create(AValue);
end;

end.
