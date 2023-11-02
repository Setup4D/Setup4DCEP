unit Setup4D.CEP.Searech;

{$I Setup4DCEPLanguage.inc}

interface

uses
  Setup4D.CEP.Interf;

type
  TSetup4DCEPSearech = class(TInterfacedObject, ISetup4DCEPSearech)
  private
    [weak]
    FParent : ISetup4DCEP;
    FConfiguration : ISetup4DCEPConfiguration;
    FSearechZipCode: ISetup4DCEPSearechZipCode;
    FSearechIBGE: ISetup4DCEPSearechIBGE;
    FFilter : ISetup4DCEPFilter;

  protected

    function ZipCode: ISetup4DCEPSearechZipCode;
    function IBGE: ISetup4DCEPSearechIBGE;
    function Finish: ISetup4DCEP;

    Constructor Create(const AValue: ISetup4DCEP;
      const AConfiguration : ISetup4DCEPConfiguration;
      Const ASearch: ISetup4DCEPFilter); overload;
  public

    Destructor Destroy; override;

    class function New(const AValue: ISetup4DCEP;
      const AConfiguration : ISetup4DCEPConfiguration;
      Const ASearch: ISetup4DCEPFilter): ISetup4DCEPSearech; overload;

  end;

implementation

uses
  Setup4D.CEP.Searech.IBGE,
  Setup4D.CEP.Searech.ZipCode,

  System.SysUtils;


constructor TSetup4DCEPSearech.Create(const AValue: ISetup4DCEP;
  const AConfiguration: ISetup4DCEPConfiguration;
  Const ASearch: ISetup4DCEPFilter);
begin
  FParent := AValue;
  FConfiguration := AConfiguration;
  FFilter := ASearch;
end;

destructor TSetup4DCEPSearech.Destroy;
begin

  inherited;
end;

function TSetup4DCEPSearech.Finish: ISetup4DCEP;
begin
  Result := FParent;
end;

function TSetup4DCEPSearech.IBGE: ISetup4DCEPSearechIBGE;
begin
  if FConfiguration = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe de configuração não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('"The Configuration class has not been instantiated."');
    {$ENDIF}

  if FFilter = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe de pesquisa não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('"The search class has not been instantiated."');
    {$ENDIF}

  if not Assigned(FSearechIBGE) then
    FSearechIBGE := TSetup4DCEPSearechIBGE.New(Self, FConfiguration, FFilter);

  Result := FSearechIBGE;
end;

class function TSetup4DCEPSearech.New(const AValue: ISetup4DCEP;
  const AConfiguration: ISetup4DCEPConfiguration;
  Const ASearch: ISetup4DCEPFilter): ISetup4DCEPSearech;
begin
  Result:= Self.Create(AValue, AConfiguration, ASearch);
end;

function TSetup4DCEPSearech.ZipCode: ISetup4DCEPSearechZipCode;
begin
  if not Assigned(FSearechZipCode) then
    FSearechZipCode := TSetup4DCEPSearechZipCode.New(Self, FConfiguration, FFilter);
  Result := FSearechZipCode;
end;


end.
