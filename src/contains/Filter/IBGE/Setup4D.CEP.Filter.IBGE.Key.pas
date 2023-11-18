unit Setup4D.CEP.Filter.IBGE.Key;

{$I Setup4DCEPLanguage.inc}

interface

uses
  Setup4D.CEP.Interf;

type
  TSetup4DCEPFilterIBGEKey = class(TInterfacedObject, ISetup4DCEPFilterIBGEKey)
  private
    [weak]
    FParent : ISetup4DCEPFilterIBGE;
    FValue : string;
  protected

    function Value(Const AValue: string) : ISetup4DCEPFilterIBGEKey; overload;
    function Value : string; overload;

    function Finish: ISetup4DCEPFilterIBGE;

    Constructor Create(const AValue: ISetup4DCEPFilterIBGE); overload;
  public

    Destructor Destroy; override;
    class function New(const AValue: ISetup4DCEPFilterIBGE): ISetup4DCEPFilterIBGEKey; overload;
  end;

implementation

uses
  Setup4D.Utility;

{ TSetup4DCEPFilterIBGEKey }

constructor TSetup4DCEPFilterIBGEKey.Create(const AValue: ISetup4DCEPFilterIBGE);
begin
  FParent := AValue;
end;

destructor TSetup4DCEPFilterIBGEKey.Destroy;
begin

  inherited;
end;

function TSetup4DCEPFilterIBGEKey.Finish: ISetup4DCEPFilterIBGE;
begin
  Result := FParent;
end;

class function TSetup4DCEPFilterIBGEKey.New(const AValue: ISetup4DCEPFilterIBGE): ISetup4DCEPFilterIBGEKey;
begin
  Result:= Self.Create(AValue);
end;

function TSetup4DCEPFilterIBGEKey.Value: string;
begin
  Result := FValue;
end;

function TSetup4DCEPFilterIBGEKey.Value(
  const AValue: string): ISetup4DCEPFilterIBGEKey;
begin
  Result := Self;
  FValue := TSetup4DUtility.OnlyNumber(AValue);;
end;

end.
