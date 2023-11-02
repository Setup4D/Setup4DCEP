unit Setup4D.CEP.Filter.IBGE.Address;

{$I Setup4DCEPLanguage.inc}

interface

uses
  Setup4D.Utility.Enum,
  Setup4D.CEP.Interf;

type
  TSetup4DCEPFilterIBGEAddress = class(TInterfacedObject, ISetup4DCEPFilterIBGEAddress)
  private
    [weak]
    FParent : iSetup4DCEPFilterIBGE;
    FCity : string;
    FStateAbbreviated : TSetup4DUtilityEstadoAbreviado;

  protected

    function City(Const AValue : string): ISetup4DCEPFilterIBGEAddress; overload;
    function StateAbbreviated(Const AValue : string): ISetup4DCEPFilterIBGEAddress; overload;
    function StateAbbreviated(Const AValue : TSetup4DUtilityEstadoAbreviado): ISetup4DCEPFilterIBGEAddress; overload;

    function City: string; overload;
    function StateAbbreviated: string; overload;

    function Finish: iSetup4DCEPFilterIBGE;

    Constructor Create(const AValue: iSetup4DCEPFilterIBGE); overload;
  public

    Destructor Destroy; override;
    class function New(const AValue: iSetup4DCEPFilterIBGE): ISetup4DCEPFilterIBGEAddress; overload;
  end;

implementation

uses
  System.SysUtils,

  Setup4D.Utility,
  Setup4D.Utility.Generic;

{ TSetup4DCEPFilterIBGEAddress }

function TSetup4DCEPFilterIBGEAddress.City(
  Const AValue: string): ISetup4DCEPFilterIBGEAddress;
begin
  Result := Self;
  FCity := AValue;
end;

function TSetup4DCEPFilterIBGEAddress.City: string;
begin
  Result := FCity;
end;

constructor TSetup4DCEPFilterIBGEAddress.Create(const AValue: iSetup4DCEPFilterIBGE);
begin
  FParent := AValue;
end;

destructor TSetup4DCEPFilterIBGEAddress.Destroy;
begin

  inherited;
end;

function TSetup4DCEPFilterIBGEAddress.Finish: iSetup4DCEPFilterIBGE;
begin
  Result := FParent
end;

class function TSetup4DCEPFilterIBGEAddress.New(const AValue: iSetup4DCEPFilterIBGE): ISetup4DCEPFilterIBGEAddress;
begin
  Result:= Self.Create(AValue);
end;

function TSetup4DCEPFilterIBGEAddress.StateAbbreviated(
  Const AValue: string): ISetup4DCEPFilterIBGEAddress;
begin
  Result := Self;

  if AValue.Trim.IsEmpty then
    Exit;

  var LState : string;
  LState := Format('_%s', [TSetup4DUtility.OnlyAlpha(AValue.ToUpper)]);
  FStateAbbreviated := TSetup4DUtilityGeneric<TSetup4DUtilityEstadoAbreviado>.StringToEnum(LState);
end;


function TSetup4DCEPFilterIBGEAddress.StateAbbreviated(
  Const AValue: TSetup4DUtilityEstadoAbreviado): ISetup4DCEPFilterIBGEAddress;
begin
  Result := Self;
  FStateAbbreviated := AValue;
end;

function TSetup4DCEPFilterIBGEAddress.StateAbbreviated: string;
begin
  Result:= TSetup4DUtilityGeneric<TSetup4DUtilityEstadoAbreviado>.EnumToString(FStateAbbreviated, '_', EmptyStr);
end;

end.
