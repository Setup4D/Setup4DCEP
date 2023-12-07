unit Setup4D.CEP.Result;

{$I Setup4DCEPLanguage.inc}

interface

uses
  Setup4D.CEP.Interf, Setup4D.CEP.Result.ZIpCode, Setup4D.CEP.Result.IBGE;

type
  TSetup4DCEPResult = class(TInterfacedObject, ISetup4DCEPResult)
  private
    [weak]
    FParent : ISetup4DCEP;
    FResultZipCode: ISetup4DCEPResultZipCode;
    FResultIBGE: ISetup4DCEPResultIBGE;

  protected
    function ZipCode: ISetup4DCEPResultZipCode;
    function IBGE: ISetup4DCEPResultIBGE;
    function Finish: ISetup4DCEP;

    Constructor Create; overload;
    Constructor Create(const AValue: ISetup4DCEP); overload;
  public

    Destructor Destroy; override;
    class function New: ISetup4DCEPResult; overload;
    class function New(const AValue: ISetup4DCEP): ISetup4DCEPResult; overload;
  end;

implementation

{ TSetup4DCEPResult }

constructor TSetup4DCEPResult.Create;
begin

end;

constructor TSetup4DCEPResult.Create(const AValue: ISetup4DCEP);
begin
  FParent := AValue;
end;

destructor TSetup4DCEPResult.Destroy;
begin

  inherited;
end;

function TSetup4DCEPResult.Finish: ISetup4DCEP;
begin
  Result := FParent;
end;

function TSetup4DCEPResult.IBGE: ISetup4DCEPResultIBGE;
begin
  if not Assigned(FResultIBGE) then
    FResultIBGE := TSetup4DCEPResultIBGE.New(Self);
  Result := FResultIBGE;
end;

class function TSetup4DCEPResult.New(const AValue: ISetup4DCEP): ISetup4DCEPResult;
begin
  Result:= Self.Create(AValue);
end;

function TSetup4DCEPResult.ZipCode: ISetup4DCEPResultZipCode;
begin
  if not Assigned(FResultZipCode) then
    FResultZipCode := TSetup4DCEPResultZipCode.New(Self);
  Result := FResultZipCode;
end;

class function TSetup4DCEPResult.New: ISetup4DCEPResult;
begin
  Result:= Self.Create;
end;

end.
