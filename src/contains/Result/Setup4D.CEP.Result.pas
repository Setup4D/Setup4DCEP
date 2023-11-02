unit Setup4D.CEP.Result;

{$I Setup4DCEPLanguage.inc}

interface

uses
  Setup4D.CEP.Interf;

type
  TSetup4DCEPResult = class(TInterfacedObject, ISetup4DCEPResult)
  private
    [weak]
    FParent: ISetup4DCEP;
    FResultZipCode: ISetup4DCEPResultZipCode;
    FResultIBGE: ISetup4DCEPResultIBGE;
    FExecute: ISetup4DCEPSearech;
    FFilter : ISetup4DCEPFilter;
    FConfiguration : ISetup4DCEPConfiguration;

  protected
    function ZipCode: ISetup4DCEPResultZipCode;
    function IBGE: ISetup4DCEPResultIBGE;
    function Finish: ISetup4DCEP;

    Constructor Create(const AValue: ISetup4DCEP;
      Const AExecute: ISetup4DCEPSearech; const ASearch : ISetup4DCEPFilter;
      Const AConfiguration : ISetup4DCEPConfiguration); overload;
  public

    Destructor Destroy; override;
    class function New(const AValue: ISetup4DCEP;
      Const AExecute: ISetup4DCEPSearech; const ASearch : ISetup4DCEPFilter;
      Const AConfiguration : ISetup4DCEPConfiguration): ISetup4DCEPResult; overload;
  end;

implementation

uses
  Setup4D.CEP.Result.IBGE,
  Setup4D.CEP.Result.ZipCode,

  System.SysUtils;

{ TSetup4DCEPResult }

constructor TSetup4DCEPResult.Create(const AValue: ISetup4DCEP;
  Const AExecute : ISetup4DCEPSearech; const ASearch : ISetup4DCEPFilter;
      Const AConfiguration : ISetup4DCEPConfiguration);
begin
  FParent := AValue;
  FExecute := AExecute;
  FFilter := ASearch;
  FConfiguration := AConfiguration;
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
  if FExecute = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe de Execução não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('"The Execute class has not been instantiated."');
    {$ENDIF}

  if FFilter = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe de pesquisa não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('"The search class has not been instantiated."');
    {$ENDIF}

  if FConfiguration = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe de configuração não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('"The Configuration class has not been instantiated."');
    {$ENDIF}

  if not Assigned(FResultIBGE) then
    FResultIBGE := TSetup4DCEPResultIBGE.New(Self, FExecute, FFilter, FConfiguration);
  Result := FResultIBGE;
end;

class function TSetup4DCEPResult.New(const AValue: ISetup4DCEP;
  Const AExecute : ISetup4DCEPSearech; const ASearch : ISetup4DCEPFilter;
  Const AConfiguration : ISetup4DCEPConfiguration) : ISetup4DCEPResult;
begin
  Result := Self.Create(AValue, AExecute, ASearch, AConfiguration);
end;

function TSetup4DCEPResult.ZipCode: ISetup4DCEPResultZipCode;
begin
  if FExecute = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe de Execução não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('"The Execute class has not been instantiated."');
    {$ENDIF}

  if FFilter = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe de pesquisa não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('"The search class has not been instantiated."');
    {$ENDIF}

  if FConfiguration = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe de configuração não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('"The Configuration class has not been instantiated."');
    {$ENDIF}

  if not Assigned(FResultZipCode) then
    FResultZipCode := TSetup4DCEPResultZipCode.New(Self, FExecute, FFilter, FConfiguration);
  Result := FResultZipCode;
end;

end.
