unit Setup4D.CEP.Searech;

{$I Setup4DCEPLanguage.inc}

interface

uses
  Setup4D.CEP.Interf, Setup4D.Utility.Constantes;

type
  TSetup4DCEPSearech = class(TInterfacedObject, ISetup4DCEPSearech)
  private
    [weak]
    FParent : ISetup4DCEP;
    FConfiguration : ISetup4DCEPConfiguration;
    FSearechZipCode: ISetup4DCEPSearechZipCode;
    FSearechIBGE: ISetup4DCEPSearechIBGE;
    FFilter : ISetup4DCEPFilter;
    FResult : ISetup4DCEPResult;

  protected

    function ZipCode: ISetup4DCEPSearechZipCode;
    function IBGE: ISetup4DCEPSearechIBGE;
    function Finish: ISetup4DCEP;

    Constructor Create(const AValue: ISetup4DCEP;
      const AConfiguration : ISetup4DCEPConfiguration;
      Const AFilter: ISetup4DCEPFilter;
      const AResult: ISetup4DCEPResult); overload;
  public

    Destructor Destroy; override;

    class function New(const AValue: ISetup4DCEP;
      const AConfiguration : ISetup4DCEPConfiguration;
      const AFilter: ISetup4DCEPFilter;
      const AResult: ISetup4DCEPResult): ISetup4DCEPSearech; overload;

  end;

implementation

uses
  Setup4D.CEP.Searech.IBGE,
  Setup4D.CEP.Searech.ZipCode,

  System.SysUtils;


Constructor TSetup4DCEPSearech.Create(const AValue: ISetup4DCEP;
      const AConfiguration : ISetup4DCEPConfiguration;
      Const AFilter: ISetup4DCEPFilter;
      const AResult: ISetup4DCEPResult);
begin
  FParent := AValue;
  FConfiguration := AConfiguration;
  FFilter := AFilter;
  FResult := AResult;
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
    raise EConvertError.Create(TSetup4DUtilityConstantes
                                .UNINSTANTIATED_CLASS({$IFDEF HAS_PORTUGUES}
                                                        'configuração'
                                                      {$ELSE}
                                                        'Configuration'
                                                      {$ENDIF}));

  if FFilter = nil then
    raise EConvertError.Create(TSetup4DUtilityConstantes
                                .UNINSTANTIATED_CLASS({$IFDEF HAS_PORTUGUES}
                                                        'pesquisa'
                                                      {$ELSE}
                                                        'search'
                                                      {$ENDIF}));

  if FResult = nil then
    raise EConvertError.Create(TSetup4DUtilityConstantes
                                .UNINSTANTIATED_CLASS({$IFDEF HAS_PORTUGUES}
                                                        'resultado'
                                                      {$ELSE}
                                                        'result'
                                                      {$ENDIF}));


  if not Assigned(FSearechIBGE) then
    FSearechIBGE := TSetup4DCEPSearechIBGE.New(Self, FConfiguration, FFilter, FResult);

  Result := FSearechIBGE;
end;

class function TSetup4DCEPSearech.New(const AValue: ISetup4DCEP;
      const AConfiguration : ISetup4DCEPConfiguration;
      const AFilter: ISetup4DCEPFilter;
      const AResult: ISetup4DCEPResult): ISetup4DCEPSearech;
begin
  Result:= Self.Create(AValue, AConfiguration, AFilter, AResult);
end;

function TSetup4DCEPSearech.ZipCode: ISetup4DCEPSearechZipCode;
begin
  if FConfiguration = nil then
    raise EConvertError.Create(TSetup4DUtilityConstantes
                                .UNINSTANTIATED_CLASS({$IFDEF HAS_PORTUGUES}
                                                        'configuração'
                                                      {$ELSE}
                                                        'Configuration'
                                                      {$ENDIF}));

  if FFilter = nil then
    raise EConvertError.Create(TSetup4DUtilityConstantes
                                .UNINSTANTIATED_CLASS({$IFDEF HAS_PORTUGUES}
                                                        'pesquisa'
                                                      {$ELSE}
                                                        'search'
                                                      {$ENDIF}));

  if FResult = nil then
    raise EConvertError.Create(TSetup4DUtilityConstantes
                                .UNINSTANTIATED_CLASS({$IFDEF HAS_PORTUGUES}
                                                        'resultado'
                                                      {$ELSE}
                                                        'result'
                                                      {$ENDIF}));

  if not Assigned(FSearechZipCode) then
    FSearechZipCode := TSetup4DCEPSearechZipCode.New(Self, FConfiguration, FFilter, FResult);
  Result := FSearechZipCode;
end;


end.
