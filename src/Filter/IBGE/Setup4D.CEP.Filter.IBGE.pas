unit Setup4D.CEP.Filter.IBGE;

{$IFNDEF FPC}
{$I Setup4DCEPLanguage.inc}
{$ENDIF}

interface

uses
  {$IFDEF FPC}
  SysUtils,
  {$ELSE}
  System.SysUtils,
  {$ENDIF}

  Setup4D.Utility.Generic,
  Setup4D.Utility.Enum,

  Setup4D.CEP.Interf;

type
  TSetup4DCEPFilterIBGE = class(TInterfacedObject, ISetup4DCEPFilterIBGE)
  private
    {$IFNDEF FPC}
    [weak]
    {$ENDIF}
    FParent : ISetup4DCEPFilter;
    FCity  : string;
    FState : string;
    FCountry : string;
    FCode  : string;
  protected

    function Code (Const AValue : string): ISetup4DCEPFilterIBGE; overload;
    function Country (Const AValue : string): ISetup4DCEPFilterIBGE; overload;
    function City(Const AValue : string): ISetup4DCEPFilterIBGE; overload;
    function State(Const AValue : string): ISetup4DCEPFilterIBGE; overload;
    function State(Const AValue : TSetup4DUtilityEstadoAbreviado): ISetup4DCEPFilterIBGE; overload;
    function State(Const AValue : TSetup4DUtilityEstado): ISetup4DCEPFilterIBGE; overload;

    function Code: string; overload;
    function City: string; overload;
    function State: string; overload;
    function Country: string; overload;

    function Finish: ISetup4DCEPFilter;

    {$IFNDEF FPC}
    Constructor Create(const AValue: ISetup4DCEPFilter); overload;
    {$ENDIF}
  public
    {$IFDEF FPC}
    Constructor Create(const AValue: ISetup4DCEPFilter); overload;
    {$ENDIF}

    Destructor Destroy; override;
    class function New(const AValue: ISetup4DCEPFilter): ISetup4DCEPFilterIBGE; overload;
  end;

implementation


{ TSetup4DCEPFilterIBGE }

function TSetup4DCEPFilterIBGE.City(
  const AValue: string): ISetup4DCEPFilterIBGE;
begin
  Result := Self;
  FCity := AValue;
end;

function TSetup4DCEPFilterIBGE.City: string;
begin
  Result := FCity;
end;

function TSetup4DCEPFilterIBGE.Code: string;
begin
  Result := FCode;
end;

function TSetup4DCEPFilterIBGE.Code(
  const AValue: string): ISetup4DCEPFilterIBGE;
begin
  Result := Self;
  FCode := AValue;
end;

function TSetup4DCEPFilterIBGE.Country: string;
begin
  Result := FCountry;
end;

function TSetup4DCEPFilterIBGE.Country(
  const AValue: string): ISetup4DCEPFilterIBGE;
begin
  Result := Self;
  FCountry := AValue;
end;

constructor TSetup4DCEPFilterIBGE.Create(const AValue: ISetup4DCEPFilter);
begin
  FParent := AValue;
end;


destructor TSetup4DCEPFilterIBGE.Destroy;
begin

  inherited;
end;

function TSetup4DCEPFilterIBGE.Finish: ISetup4DCEPFilter;
begin
  Result := FParent;
end;

class function TSetup4DCEPFilterIBGE.New(const AValue: ISetup4DCEPFilter): ISetup4DCEPFilterIBGE;
begin
  Result:= Self.Create(AValue);
end;

function TSetup4DCEPFilterIBGE.State(
  const AValue: TSetup4DUtilityEstado): ISetup4DCEPFilterIBGE;
begin
  Result := Self;
  FState := TSetup4DUtilityGeneric<TSetup4DUtilityEstado>.EnumToString(AValue, '_', ' ');
end;

function TSetup4DCEPFilterIBGE.State(
  const AValue: string): ISetup4DCEPFilterIBGE;
begin
  Result := Self;
  FState := AValue;
end;

function TSetup4DCEPFilterIBGE.State(
  const AValue: TSetup4DUtilityEstadoAbreviado): ISetup4DCEPFilterIBGE;
begin
  Result := Self;
  FState := TSetup4DUtilityGeneric<TSetup4DUtilityEstadoAbreviado>.EnumToString(AValue, '_', EmptyStr);
end;

function TSetup4DCEPFilterIBGE.State: string;
begin
  Result := FState;
end;

end.
