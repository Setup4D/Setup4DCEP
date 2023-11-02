unit Setup4D.CEP.Result.ZIpCode;

{$I Setup4DCEPLanguage.inc}

interface
uses
  Setup4D.CEP.Interf,

  ACBrCEP,
  ACBrIBGE,

  System.JSON;

type
  TSetup4DCEPResultZipCode = class(TInterfacedObject, ISetup4DCEPResultZipCode)
  private
    [weak]
    FParent : ISetup4DCEPResult;
    FExecute: ISetup4DCEPSearech;
    FFilter : ISetup4DCEPFilter;
    FZipCodeDisplay : iSetup4DCEPResultZipCodeDisplay;
    FConfiguration : ISetup4DCEPConfiguration;

    FJSON : TJSONObject;
    FJSONArray: TJSONArray;

    FACBrCEP : TACBrCEP;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Função para poder validar o endereço
    /// </summary>
    {$ELSE}
    /// <summary>
    /// Web server configuration for searching.
    /// </summary>
    {$ENDIF}
    function ValidAddress(AIndex : Integer) : Boolean;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Realizar a conversão do TACBr para o formato JSON.
    /// </summary>
    {$ELSE}
    /// <summary>
    /// Perform the conversion of TACBr to JSON format.
    /// </summary>
    {$ENDIF}
    procedure PrepareJSON;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Executar a pesquisa no IBGE caso não haja correspondência nos resultados da pesquisa.
    /// </summary>
    {$ELSE}
    /// <summary>
    /// Execute the search in IBGE if there is no match in the search results.
    /// </summary>
    {$ENDIF}
    function SearchIBGE: Boolean;
  protected

    function Display: iSetup4DCEPResultZipCodeDisplay;

    function JSONObject(out AValue : TJSONObject): ISetup4DCEPResultZipCode; overload;
    function JSONObject: TJSONObject; overload;
    function JSONObjectInStr: String; overload;
    function JSONArray: TJSONArray; overload;
    function RecordCount : Int64;
    function RecordCountInStr : string;

    function Finish: ISetup4DCEPResult;

    Constructor Create(const AValue: ISetup4DCEPResult;
      Const AExecute : ISetup4DCEPSearech; const ASearch : ISetup4DCEPFilter;
      Const AConfiguration : ISetup4DCEPConfiguration); overload;
  public

    Destructor Destroy; override;
    class function New(const AValue: ISetup4DCEPResult;
      Const AExecute : ISetup4DCEPSearech; const ASearch : ISetup4DCEPFilter;
      Const AConfiguration : ISetup4DCEPConfiguration): ISetup4DCEPResultZipCode; overload;
  end;

implementation
uses
  Setup4D.Utility,

  Setup4D.CEP.Result.ZIpCode.Display,

  System.SysUtils;

constructor TSetup4DCEPResultZipCode.Create(const AValue: ISetup4DCEPResult;
  Const AExecute : ISetup4DCEPSearech; const ASearch : ISetup4DCEPFilter;
  Const AConfiguration : ISetup4DCEPConfiguration);
begin
  FParent := AValue;
  FExecute := AExecute;
  FFilter := ASearch;
  FConfiguration := AConfiguration;
  FJSON := TJSONObject.Create;
  FJSONArray:= TJSONArray.Create;
end;

destructor TSetup4DCEPResultZipCode.Destroy;
begin
  if Assigned(FJSONArray) then
    FJSONArray.DisposeOf;

  if Assigned(FJSON) then
    FJSON.DisposeOf;

  inherited;
end;

function TSetup4DCEPResultZipCode.Display: iSetup4DCEPResultZipCodeDisplay;
begin
  PrepareJSON;

  if not Assigned(FZipCodeDisplay) then
    FZipCodeDisplay := TSetup4DCEPResultZipCodeDisplay.New(Self).JSON(FJSON);

  Result := FZipCodeDisplay.JSON(FJSON);
end;

procedure TSetup4DCEPResultZipCode.PrepareJSON;
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
    raise EConvertError.Create('"The Configuration class has not been instantiated."');
    {$ENDIF}

  if Assigned(FJSON) then
    FJSON.DisposeOf;

  FJSON := TJSONObject.Create;

  FACBrCEP := TACBrCEP(FExecute.ZipCode.Component);

  for var I := 0 to Pred(FACBrCEP.Enderecos.Count) do
  begin
    if not ValidAddress(I) then
      Continue;

    FJSON
    .AddPair('cep', FACBrCEP.Enderecos[I].Cep)
    .AddPair('tipo',  FACBrCEP.Enderecos[I].Tipo_Logradouro)
    .AddPair('rua', FACBrCEP.Enderecos[I].Logradouro)
    .AddPair('complemento', FACBrCEP.Enderecos[I].Complemento)
    .AddPair('bairro', FACBrCEP.Enderecos[I].Bairro)
    .AddPair('cidade',  FACBrCEP.Enderecos[I].Municipio)
    .AddPair('estado', FACBrCEP.Enderecos[I].UF)
    .AddPair('ddd', EmptyStr)
    .AddPair('gia', EmptyStr)
    .AddPair('siafi', EmptyStr)
    .AddPair('altitude', FACBrCEP.Enderecos[I].Altitude)
    .AddPair('latitude', FACBrCEP.Enderecos[I].Latitude)
    .AddPair('longitude', FACBrCEP.Enderecos[I].Longitude)
    .AddPair('ibge_cidade', FACBrCEP.Enderecos[I].IBGE_Municipio)
    .AddPair('ibge_estado', FACBrCEP.Enderecos[I].IBGE_UF);;

    case FConfiguration.WebService.ZipCode.ReturnIBGE of
      True:
      begin
        var LResultIBGE : Boolean;

        LResultIBGE := not (FACBrCEP.Enderecos[I].IBGE_Municipio.IsEmpty and FACBrCEP.Enderecos[I].IBGE_UF.IsEmpty);

        if not LResultIBGE then
          LResultIBGE := SearchIBGE;

        if not LResultIBGE then
        begin
          FJSON.RemovePair('ibge_cidade').Free;
          FJSON.RemovePair('ibge_estado').Free;
        end;
      end;

      False:
      begin
          FJSON.RemovePair('ibge_cidade').Free;
          FJSON.RemovePair('ibge_estado').Free;
      end;
    end;

    case FACBrCEP.WebService of
      wsRepublicaVirtual:
      begin
        FJSON.RemovePair('complemento').Free;
        FJSON.RemovePair('ddd').Free;
        FJSON.RemovePair('gia').Free;
        FJSON.RemovePair('siafi').Free;
        FJSON.RemovePair('altitude').Free;
        FJSON.RemovePair('latitude').Free;
        FJSON.RemovePair('longitude').Free;
      end;

      wsKingHost:
      begin
        FJSON.RemovePair('complemento').Free;
        FJSON.RemovePair('ddd').Free;
        FJSON.RemovePair('gia').Free;
        FJSON.RemovePair('siafi').Free;
        FJSON.RemovePair('altitude').Free;
        FJSON.RemovePair('latitude').Free;
        FJSON.RemovePair('longitude').Free;
      end;

      wsCorreios:
      begin
        FJSON.RemovePair('tipo').Free;
        FJSON.RemovePair('ddd').Free;
        FJSON.RemovePair('gia').Free;
        FJSON.RemovePair('siafi').Free;
        FJSON.RemovePair('altitude').Free;
        FJSON.RemovePair('latitude').Free;
        FJSON.RemovePair('longitude').Free;
      end;

      wsViaCep:
      begin
        FJSON.RemovePair('tipo').Free;
        FJSON.RemovePair('ddd').Free;
        FJSON.RemovePair('gia').Free;
        FJSON.RemovePair('siafi').Free;
        FJSON.RemovePair('altitude').Free;
        FJSON.RemovePair('latitude').Free;
        FJSON.RemovePair('longitude').Free;

        FJSON
          .AddPair('ddd', TSetup4DUtility.ReadXMLTag(FACBrCEP.RespHTTP, 'ddd'))
          .AddPair('gia', TSetup4DUtility.ReadXMLTag(FACBrCEP.RespHTTP, 'gia'))
          .AddPair('siafi', TSetup4DUtility.ReadXMLTag(FACBrCEP.RespHTTP, 'siafi'));
      end;

      wsCorreiosSIGEP:
      begin
        FJSON.RemovePair('tipo').Free;
        FJSON.RemovePair('ddd').Free;
        FJSON.RemovePair('gia').Free;
        FJSON.RemovePair('siafi').Free;
        FJSON.RemovePair('altitude').Free;
        FJSON.RemovePair('latitude').Free;
        FJSON.RemovePair('longitude').Free;
      end;

      wsCepAberto:
      begin
        FJSON.RemovePair('tipo').Free;
        FJSON.RemovePair('complemento').Free;
        FJSON.RemovePair('ddd').Free;
        FJSON.RemovePair('gia').Free;
        FJSON.RemovePair('siafi').Free;
      end;

      wsOpenCep:
      begin
        FJSON.RemovePair('tipo').Free;
        FJSON.RemovePair('ddd').Free;
        FJSON.RemovePair('gia').Free;
        FJSON.RemovePair('siafi').Free;
        FJSON.RemovePair('altitude').Free;
      end;

      wsBrasilAPI:
      begin
        FJSON.RemovePair('tipo').Free;
        FJSON.RemovePair('complemento').Free;
        FJSON.RemovePair('ddd').Free;
        FJSON.RemovePair('gia').Free;
        FJSON.RemovePair('siafi').Free;
        FJSON.RemovePair('altitude').Free;
      end;
    end;

    Break;
  end;
end;

function TSetup4DCEPResultZipCode.Finish: ISetup4DCEPResult;
begin
  Result := FParent;
end;

function TSetup4DCEPResultZipCode.JSONArray: TJSONArray;
begin
  if Assigned(FJSONArray) then
    FJSONArray.DisposeOf;

  FJSONArray := TJSONArray.Create;

  FACBrCEP := TACBrCEP(FExecute.ZipCode.Component);
  for var I := 0 to Pred(FACBrCEP.Enderecos.Count) do
  begin
    if not ValidAddress(I) then
      Continue;

    var LJSON : TJSONObject;
    LJSON := TJSONObject.Create;

    LJSON
    .AddPair('cep', FACBrCEP.Enderecos[I].Cep)
    .AddPair('tipo',  FACBrCEP.Enderecos[I].Tipo_Logradouro)
    .AddPair('rua', FACBrCEP.Enderecos[I].Logradouro)
    .AddPair('complemento', FACBrCEP.Enderecos[I].Complemento)
    .AddPair('bairro', FACBrCEP.Enderecos[I].Bairro)
    .AddPair('cidade',  FACBrCEP.Enderecos[I].Municipio)
    .AddPair('estado', FACBrCEP.Enderecos[I].UF)
    .AddPair('ddd', EmptyStr)
    .AddPair('gia', EmptyStr)
    .AddPair('siafi', EmptyStr)
    .AddPair('altitude', FACBrCEP.Enderecos[I].Altitude)
    .AddPair('latitude', FACBrCEP.Enderecos[I].Latitude)
    .AddPair('longitude', FACBrCEP.Enderecos[I].Longitude)
    .AddPair('ibge_cidade', FACBrCEP.Enderecos[I].IBGE_Municipio)
    .AddPair('ibge_estado', FACBrCEP.Enderecos[I].IBGE_UF);

    case FACBrCEP.WebService of
      wsViaCep:
      begin
        LJSON.RemovePair('ddd').Free;
        LJSON.RemovePair('gia').Free;
        LJSON.RemovePair('siafi').Free;

        LJSON
          .AddPair('ddd', TSetup4DUtility.ReadXMLTag(FACBrCEP.RespHTTP, 'ddd'))
          .AddPair('gia', TSetup4DUtility.ReadXMLTag(FACBrCEP.RespHTTP, 'gia'))
          .AddPair('siafi', TSetup4DUtility.ReadXMLTag(FACBrCEP.RespHTTP, 'siafi'));
      end;
    end;

    case FConfiguration.WebService.ZipCode.ReturnIBGE of
      True:
      begin
        var LResultIBGE : Boolean;

        LResultIBGE := not (FACBrCEP.Enderecos[I].IBGE_Municipio.IsEmpty and FACBrCEP.Enderecos[I].IBGE_UF.IsEmpty);

        if not LResultIBGE then
          LResultIBGE := SearchIBGE;

        if not LResultIBGE then
        begin
          FJSON.RemovePair('ibge_cidade').Free;
          FJSON.RemovePair('ibge_estado').Free;
        end;
      end;

      False:
      begin
          FJSON.RemovePair('ibge_cidade').Free;
          FJSON.RemovePair('ibge_estado').Free;
      end;
    end;

    FJSONArray.AddElement(LJSON);
  end;

  Result := FJSONArray;

end;

function TSetup4DCEPResultZipCode.JSONObject: TJSONObject;
begin
  PrepareJSON;

  Result := FJSON;
end;

function TSetup4DCEPResultZipCode.JSONObject(
  out AValue: TJSONObject): ISetup4DCEPResultZipCode;
begin
  Result := Self;

  PrepareJSON;

  AValue := FJSON;
end;

function TSetup4DCEPResultZipCode.JSONObjectInStr: String;
begin
  PrepareJSON;

  Result := FJSON.ToString;
end;

class function TSetup4DCEPResultZipCode.New(const AValue: ISetup4DCEPResult;
  Const AExecute : ISetup4DCEPSearech; const ASearch : ISetup4DCEPFilter;
  Const AConfiguration : ISetup4DCEPConfiguration): ISetup4DCEPResultZipCode;
begin
  Result:= Self.Create(AValue, AExecute, ASearch, AConfiguration);
end;


function TSetup4DCEPResultZipCode.RecordCount: Int64;
begin
  Result := 0;

  FACBrCEP := TACBrCEP(FExecute.ZipCode.Component);
  for var I := 0 to Pred(FACBrCEP.Enderecos.Count) do
  begin
    if not ValidAddress(I) then
      Continue;

    Inc(Result);
  end;
end;

function TSetup4DCEPResultZipCode.RecordCountInStr: string;
begin
  Result := RecordCount.ToString;
end;

function TSetup4DCEPResultZipCode.SearchIBGE: Boolean;
begin
  Result := False;
  if FConfiguration = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe de configuração não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('"The Configuration class has not been instantiated."');
    {$ENDIF}

  if not FConfiguration.WebService.ZipCode.ReturnIBGE then
    Exit;

  var LACBrIBGE : TACBrIBGE;
  LACBrIBGE := TACBrIBGE.Create(nil);
  try
    LACBrIBGE.ProxyHost := FConfiguration.Proxy.Host;
    LACBrIBGE.ProxyUser := FConfiguration.Proxy.User;
    LACBrIBGE.ProxyPass := FConfiguration.Proxy.Password;

    if FConfiguration.Proxy.Port > 0 then
      LACBrIBGE.ProxyPort := FConfiguration.Proxy.PortInStr;

    LACBrIBGE.IgnorarCaixaEAcentos := True;
    LACBrIBGE.ParseText := True;
    LACBrIBGE.CacheArquivo := 'TempCepIBGE.txt';
    LACBrIBGE.CacheDiasValidade := 0;


    var LEstado : string;
    FJSON.TryGetValue<string>('estado', LEstado);

    var LCidade : string;
    FJSON.TryGetValue<string>('cidade', LCidade);

    var LResult : String;
    FJSON.GetValue<string>('ibge_estado', LResult);
    if TSetup4DUtility.RemoveSpaces(LResult).IsEmpty then
    begin
      LACBrIBGE.BuscarPorUF(LEstado);
      for var I := 0 to Pred(LACBrIBGE.Cidades.Count) do
      begin
        if not LACBrIBGE.Cidades[I].UF.ToUpper.Equals(LEstado.ToUpper)  then
          Continue;

        FJSON.RemovePair('ibge_estado').Free;
        FJSON.AddPair('ibge_estado', LACBrIBGE.Cidades[I].CodUF.ToString);
        Break;
      end;
    end;

    FJSON.GetValue<string>('ibge_cidade', LResult);
    if TSetup4DUtility.RemoveSpaces(LResult).IsEmpty then
    begin
      LACBrIBGE.BuscarPorUF(LEstado);
      for var I := 0 to Pred(LACBrIBGE.Cidades.Count) do
      begin
        if (not LACBrIBGE.Cidades[I].UF.ToUpper.Equals(LEstado.ToUpper)) and
          (not TSetup4DUtility.ReplaceSpecialChars(LACBrIBGE.Cidades[I].Municipio.ToUpper).Equals(TSetup4DUtility.ReplaceSpecialChars(LCidade.ToUpper))) then
          Continue;

        FJSON.RemovePair('ibge_cidade').Free;
        FJSON.AddPair('ibge_cidade', LACBrIBGE.Cidades[0].CodMunicipio.ToString);
        Break;
      end;

    end;

    Result := True;
  finally
    LACBrIBGE.DisposeOf;
  end;

end;

function TSetup4DCEPResultZipCode.ValidAddress(
  AIndex : Integer): Boolean;
begin
  if FACBrCEP = nil then
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A classe de CEP não foi instanciada.');
    {$ELSE}
    raise EConvertError.Create('The Zip Code class has not been instantiated.');
    {$ENDIF}

  var LZipCode :string;
  LZipCode := FACBrCEP.Enderecos[AIndex].Cep.ToUpper;
  LZipCode := TSetup4DUtility.RemoveSpaces(LZipCode);
  LZipCode := TSetup4DUtility.OnlyNumber(LZipCode);

  var LZipCodeSearech :string;
  LZipCodeSearech := FFilter.ZipCode.Key.Value.ToUpper;
  LZipCodeSearech := TSetup4DUtility.RemoveSpaces(LZipCodeSearech);
  LZipCodeSearech := TSetup4DUtility.OnlyNumber(LZipCodeSearech);

  Result := LZipCode.Equals(LZipCodeSearech);

  if Result then
    Exit;

  var LDistrict :string;
  LDistrict := FACBrCEP.Enderecos[AIndex].Bairro.ToUpper;
  LDistrict := TSetup4DUtility.RemoveSpaces(LDistrict);

  var LDistrictSearech :string;
  LDistrictSearech := FFilter.ZipCode.Address.District.ToUpper;
  LDistrictSearech := TSetup4DUtility.RemoveSpaces(LDistrictSearech);

  var LCity :string;
  LCity := FACBrCEP.Enderecos[AIndex].Municipio.ToUpper;
  LCity := TSetup4DUtility.RemoveSpaces(LCity);

  var LCitySearech :string;
  LCitySearech := FFilter.ZipCode.Address.City.ToUpper;
  LCitySearech := TSetup4DUtility.RemoveSpaces(LCitySearech);

  var LStateAbbreviated :string;
  LStateAbbreviated := FACBrCEP.Enderecos[AIndex].UF.ToUpper;
  LStateAbbreviated := TSetup4DUtility.RemoveSpaces(LStateAbbreviated);

  var LStateAbbreviatedSearech :string;
  LStateAbbreviatedSearech := FFilter.ZipCode.Address.StateAbbreviated.ToUpper;
  LStateAbbreviatedSearech := TSetup4DUtility.RemoveSpaces(LStateAbbreviatedSearech);

  Result := LDistrict.Equals(LDistrictSearech) and
                  LCity.Equals(LCitySearech) and
                  LStateAbbreviated.Equals(LStateAbbreviatedSearech);


  if not Result then
    Exit;

  var LStreet : string;
  LStreet := FACBrCEP.Enderecos[AIndex].Logradouro.ToUpper;
  LStreet := TSetup4DUtility.RemoveSpaces(LStreet);

  var LStreetSearch : string;
  LStreetSearch := FFilter.ZipCode.Address.Street.ToUpper;
  LStreetSearch := TSetup4DUtility.RemoveSpaces(LStreetSearch);

  Result := LStreet.Equals(LStreetSearch);

  if Result then
    Exit;

  LStreetSearch := FFilter.ZipCode.Address.Types.ToUpper + FFilter.ZipCode.Address.Street.ToUpper;
  LStreetSearch := TSetup4DUtility.RemoveSpaces(LStreetSearch);

  Result := LStreet.Equals(LStreetSearch);
end;

end.
