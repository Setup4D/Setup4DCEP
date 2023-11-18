unit Setup4D.CEP.Result.IBGE;

{$I Setup4DCEPLanguage.inc}

interface
uses
  Setup4D.Utility,

  Setup4D.CEP.Interf,

  ACBrIBGE,

  System.JSON;

type
  TSetup4DCEPResultIBGE = class(TInterfacedObject, ISetup4DCEPResultIBGE)
  private
    [weak]
    FParent : iSetup4DCEPResult;
    FExecute: ISetup4DCEPSearech;
    FFilter : ISetup4DCEPFilter;
    FConfiguration : ISetup4DCEPConfiguration;
    FACBrIBGE : TACBrIBGE;
    FIBGEDisplay: iSetup4DCEPResultIBGEDisplay;
    FJSON : TJSONObject;

  protected

    function Display: iSetup4DCEPResultIBGEDisplay;

    function JSONObject(out AValue : TJSONObject): ISetup4DCEPResultIBGE; overload;
    function JSONObject: TJSONObject; overload;
    function JSONObjectInStr: String; overload;

    function Finish: ISetup4DCEPResult;

    Constructor Create(const AValue: iSetup4DCEPResult;
      Const AExecute : ISetup4DCEPSearech; const ASearch : ISetup4DCEPFilter;
      Const AConfiguration : ISetup4DCEPConfiguration); overload;
  public

    Destructor Destroy; override;
    class function New(const AValue: iSetup4DCEPResult;
      Const AExecute : ISetup4DCEPSearech; const ASearch : ISetup4DCEPFilter;
      Const AConfiguration : ISetup4DCEPConfiguration): ISetup4DCEPResultIBGE; overload;
  end;

implementation
uses
  Setup4D.CEP.Result.IBGE.Display,

  System.SysUtils;

constructor TSetup4DCEPResultIBGE.Create(const AValue: iSetup4DCEPResult;
      Const AExecute : ISetup4DCEPSearech; const ASearch : ISetup4DCEPFilter;
      Const AConfiguration : ISetup4DCEPConfiguration);
begin
  FParent := AValue;
  FExecute := AExecute;
  FFilter := ASearch;
  FConfiguration := AConfiguration;
  FJSON := TJSONObject.Create;
end;

destructor TSetup4DCEPResultIBGE.Destroy;
begin
  if Assigned(FJSON) then
    FJSON.DisposeOf;

  inherited;
end;

function TSetup4DCEPResultIBGE.Display: iSetup4DCEPResultIBGEDisplay;
begin
  if FExecute = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe de Execução não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('The Execute class has not been instantiated.');
    {$ENDIF}

  if FFilter = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe de pesquisa não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('The search class has not been instantiated.');
    {$ENDIF}

  if FConfiguration = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe de configuração não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('The Configuration class has not been instantiated.');
    {$ENDIF}

  if Assigned(FJSON) then
    FJSON.DisposeOf;

  FJSON := TJSONObject.Create;

  FACBrIBGE := TACBrIBGE(FExecute.IBGE.Component);

  var LLoadData : Boolean;
  for var I := 0 to Pred(FACBrIBGE.Cidades.Count) do
  begin
    case FConfiguration.WebService.IBGE.CaseSensitive of
      True:
      begin
        LLoadData := FFilter
                      .IBGE
                      .Address
                      .StateAbbreviated
                      .ToUpper
                        .Equals(
                          FACBrIBGE
                            .Cidades[I]
                            .UF
                            .ToUpper
                        ) and
                     (not FFilter
                            .IBGE
                            .Address
                            .City
                            .ToUpper
                              .Equals(
                                FACBrIBGE
                                  .Cidades[I]
                                  .Municipio
                                  .ToUpper
                              )
                     ) and
                     (not FFilter
                            .IBGE
                            .Key
                            .Value
                            .ToUpper
                              .Equals(
                                FACBrIBGE
                                  .Cidades[I]
                                  .CodMunicipio
                                  .ToString
                                  .ToUpper
                              )
                     );

        if LLoadData then
        begin

          FJSON
            .AddPair('codigouf', FACBrIBGE.Cidades[I].CodUF)
            .AddPair('uf', TSetup4DUtility.ReplaceSpecialChars(FACBrIBGE.Cidades[I].UF));

          Break;
        end;

        LLoadData := (FFilter
                        .IBGE
                        .Address
                        .StateAbbreviated
                        .ToUpper
                          .Equals(
                            FACBrIBGE
                              .Cidades[I]
                              .UF
                              .ToUpper
                          ) and
                      FFilter
                        .IBGE
                        .Address
                        .City
                        .ToUpper
                          .Equals(
                            FACBrIBGE
                              .Cidades[I]
                              .Municipio
                              .ToUpper
                          ) and
                     (not FFilter
                            .IBGE
                            .Key
                            .Value
                            .ToUpper
                              .Equals(
                                FACBrIBGE
                                  .Cidades[I]
                                  .CodMunicipio
                                  .ToString
                                  .ToUpper
                              )
                     )
                     ) or
                     (FFilter
                        .IBGE
                        .Key
                        .Value
                        .ToUpper
                          .Equals(
                            FACBrIBGE
                              .Cidades[I]
                              .CodMunicipio
                              .ToString
                              .ToUpper
                          )
                     );

        if LLoadData then
        begin

          FJSON
            .AddPair('codigouf', FACBrIBGE.Cidades[I].CodUF)
            .AddPair('uf', TSetup4DUtility.ReplaceSpecialChars(FACBrIBGE.Cidades[I].UF))
            .AddPair('codigomunicipio', TSetup4DUtility.ReplaceSpecialChars(FACBrIBGE.Cidades[I].CodMunicipio.ToString))
            .AddPair('municipio', TSetup4DUtility.ReplaceSpecialChars(FACBrIBGE.Cidades[I].Municipio))
            .AddPair('area', FormatFloat('0.00', FACBrIBGE.Cidades[I].Area));

          Break;
        end;
      end;

      False:
      begin
        LLoadData := TSetup4DUtility
                        .ReplaceSpecialChars(
                          FFilter
                            .IBGE
                            .Address
                            .StateAbbreviated
                            .ToUpper
                        )
                              .Equals(
                                TSetup4DUtility
                                  .ReplaceSpecialChars(
                                    FACBrIBGE
                                      .Cidades[I]
                                      .UF
                                      .ToUpper
                                  )
                              ) and
                     (not TSetup4DUtility
                              .ReplaceSpecialChars(
                                FFilter
                                  .IBGE
                                  .Address
                                  .City
                                  .ToUpper
                              )
                                    .Equals(
                                      TSetup4DUtility
                                        .ReplaceSpecialChars(
                                          FACBrIBGE
                                            .Cidades[I]
                                            .Municipio
                                            .ToUpper
                                        )
                                    )
                     ) and
                     (not TSetup4DUtility
                              .ReplaceSpecialChars(
                                FFilter
                                  .IBGE
                                  .Key
                                  .Value
                                  .ToUpper
                              )
                                    .Equals(
                                      TSetup4DUtility
                                        .ReplaceSpecialChars(
                                          FACBrIBGE
                                            .Cidades[I]
                                            .CodMunicipio
                                            .ToString
                                            .ToUpper
                                        )
                                    )
                     );

        if LLoadData then
        begin

          FJSON
            .AddPair('codigouf', FACBrIBGE.Cidades[I].CodUF)
            .AddPair('uf', TSetup4DUtility.ReplaceSpecialChars(FACBrIBGE.Cidades[I].UF));

          Break;
        end;

        LLoadData := (TSetup4DUtility
                        .ReplaceSpecialChars(
                          FFilter
                            .IBGE
                            .Address
                            .StateAbbreviated
                            .ToUpper
                        )
                              .Equals(
                                TSetup4DUtility
                                  .ReplaceSpecialChars(
                                    FACBrIBGE
                                      .Cidades[I]
                                      .UF
                                      .ToUpper
                                  )
                              ) and
                     TSetup4DUtility
                        .ReplaceSpecialChars(
                          FFilter
                            .IBGE
                            .Address
                            .City
                            .ToUpper
                      )
                              .Equals(
                                TSetup4DUtility
                                  .ReplaceSpecialChars(
                                    FACBrIBGE
                                      .Cidades[I]
                                      .Municipio
                                      .ToUpper
                                  )
                              ) and
                     (not TSetup4DUtility
                        .ReplaceSpecialChars(
                          FFilter
                            .IBGE
                            .Key
                            .Value
                            .ToUpper
                        )
                              .Equals(
                                TSetup4DUtility
                                  .ReplaceSpecialChars(
                                    FACBrIBGE
                                    .Cidades[I]
                                    .CodMunicipio
                                    .ToString
                                    .ToUpper
                                  )
                              )
                     )
                     ) or
                     (TSetup4DUtility
                        .ReplaceSpecialChars(
                          FFilter
                            .IBGE
                            .Key
                            .Value
                            .ToUpper
                        )
                              .Equals(
                                TSetup4DUtility
                                  .ReplaceSpecialChars(
                                    FACBrIBGE
                                      .Cidades[I]
                                      .CodMunicipio
                                      .ToString
                                      .ToUpper
                                  )
                              )
                     );

        if LLoadData then
        begin

          FJSON
            .AddPair('codigouf', FACBrIBGE.Cidades[I].CodUF)
            .AddPair('uf', TSetup4DUtility.ReplaceSpecialChars(FACBrIBGE.Cidades[I].UF))
            .AddPair('codigomunicipio', TSetup4DUtility.ReplaceSpecialChars(FACBrIBGE.Cidades[I].CodMunicipio.ToString))
            .AddPair('municipio', TSetup4DUtility.ReplaceSpecialChars(FACBrIBGE.Cidades[I].Municipio))
            .AddPair('area', FormatFloat('0.00', FACBrIBGE.Cidades[I].Area));

          Break;
        end;
      end;
    end;
  end;

  if not Assigned(FIBGEDisplay) then
    FIBGEDisplay := TSetup4DCEPResultIBGEDisplay.New(Self).JSON(FJSON);

  Result := FIBGEDisplay.JSON(FJSON);
end;

function TSetup4DCEPResultIBGE.Finish: ISetup4DCEPResult;
begin
  Result := FParent;
end;

function TSetup4DCEPResultIBGE.JSONObject: TJSONObject;
begin
  Result := FJSON;
end;

function TSetup4DCEPResultIBGE.JSONObject(
  out AValue: TJSONObject): ISetup4DCEPResultIBGE;
begin
  Result := Self;
  AValue := FJSON;
end;

class function TSetup4DCEPResultIBGE.New(const AValue: iSetup4DCEPResult;
      Const AExecute : ISetup4DCEPSearech; const ASearch : ISetup4DCEPFilter;
      Const AConfiguration : ISetup4DCEPConfiguration): ISetup4DCEPResultIBGE;
begin
  Result:= Self.Create(AValue, AExecute, ASearch, AConfiguration);
end;

function TSetup4DCEPResultIBGE.JSONObjectInStr: String;
begin
  Result := FJSON.ToString;
end;

end.
