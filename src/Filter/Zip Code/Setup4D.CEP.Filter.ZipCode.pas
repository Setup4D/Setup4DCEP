unit Setup4D.CEP.Filter.ZipCode;

{$IFNDEF FPC}
{$I Setup4DCEPLanguage.inc}
{$ENDIF}

interface
uses
  Setup4D.CEP.Interf,

  Setup4D.Utility.Enum,
  Setup4D.Utility.Generic,

  System.SysUtils;

type
  TSetup4DCEPFilterZipCode = class(TInterfacedObject, ISetup4DCEPFilterZipCode)
  private
    {$IFNDEF FPC}
    [weak]
    {$ENDIF}
    FParent : ISetup4DCEPFilter;
    FZipCode : string;
    FStreet : string;
    FDistrict : string;
    FCity : string;
    FState : string;
  protected

    function Value(Const AValue: string) : ISetup4DCEPFilterZipCode; overload;
    function Street (Const AValue : string): ISetup4DCEPFilterZipCode; overload;
    function District (Const AValue : string): ISetup4DCEPFilterZipCode; overload;
    function City(Const AValue : string): ISetup4DCEPFilterZipCode; overload;
    function State(Const AValue : string): ISetup4DCEPFilterZipCode; overload;
    function State(Const AValue : TSetup4DUtilityEstadoAbreviado): ISetup4DCEPFilterZipCode; overload;
    function State(Const AValue : TSetup4DUtilityEstado): ISetup4DCEPFilterZipCode; overload;

    function Value : string; overload;
    function Street: string; overload;
    function District: string; overload;
    function City: string; overload;
    function State: string; overload;

    function Finish: ISetup4DCEPFilter;

    {$IFNDEF FPC}
    Constructor Create(const AValue: ISetup4DCEPFilter); overload;
    {$ENDIF}
  public
    {$IFDEF FPC}
    Constructor Create(const AValue: ISetup4DCEPFilter); overload;
    {$ENDIF}

    Destructor Destroy; override;
    class function New(const AValue: ISetup4DCEPFilter): ISetup4DCEPFilterZipCode; overload;
  end;

implementation

{ TSetup4DCEPFilterZipCode }

function TSetup4DCEPFilterZipCode.City: string;
begin
  Result := FCity;
end;

function TSetup4DCEPFilterZipCode.City(
  const AValue: string): ISetup4DCEPFilterZipCode;
begin
  Result := Self;
  FCity := AValue;
end;

constructor TSetup4DCEPFilterZipCode.Create(const AValue: ISetup4DCEPFilter);
begin
  FParent := AValue;
end;

destructor TSetup4DCEPFilterZipCode.Destroy;
begin

  inherited;
end;

function TSetup4DCEPFilterZipCode.District: string;
begin
  Result := FDistrict;
end;

function TSetup4DCEPFilterZipCode.District(
  const AValue: string): ISetup4DCEPFilterZipCode;
begin
  Result := Self;
  FDistrict := AValue;
end;

function TSetup4DCEPFilterZipCode.Finish: ISetup4DCEPFilter;
begin
  Result := FParent;
end;

class function TSetup4DCEPFilterZipCode.New(const AValue: ISetup4DCEPFilter): ISetup4DCEPFilterZipCode;
begin
  Result:= Self.Create(AValue);
end;

function TSetup4DCEPFilterZipCode.State(
  const AValue: TSetup4DUtilityEstadoAbreviado): ISetup4DCEPFilterZipCode;
begin
  Result := Self;
  FState := TSetup4DUtilityGeneric<TSetup4DUtilityEstadoAbreviado>.EnumToString(AValue, '_', EmptyStr);
end;

function TSetup4DCEPFilterZipCode.State(
  const AValue: string): ISetup4DCEPFilterZipCode;
begin
  Result := Self;
  FState := AValue;
end;

function TSetup4DCEPFilterZipCode.State: string;
begin
  Result := FState;
end;

function TSetup4DCEPFilterZipCode.State(
  const AValue: TSetup4DUtilityEstado): ISetup4DCEPFilterZipCode;
begin
  Result := Self;
  FState := TSetup4DUtilityGeneric<TSetup4DUtilityEstado>.EnumToString(AValue, '_', ' ');
end;

function TSetup4DCEPFilterZipCode.Street: string;
begin
  Result := FStreet;
end;

function TSetup4DCEPFilterZipCode.Street(
  const AValue: string): ISetup4DCEPFilterZipCode;
begin
  Result := Self;
  FStreet := AValue;
end;

function TSetup4DCEPFilterZipCode.Value: string;
begin
  Result := FZipCode;
end;

function TSetup4DCEPFilterZipCode.Value(
  const AValue: string): ISetup4DCEPFilterZipCode;
begin
  Result := Self;
  FZipCode := AValue;
end;

end.
