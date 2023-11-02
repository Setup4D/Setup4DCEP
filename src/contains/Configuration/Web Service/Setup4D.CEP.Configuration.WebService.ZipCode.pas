unit Setup4D.CEP.Configuration.WebService.ZipCode;

 {$I Setup4DCEPLanguage.inc}

interface

uses
  Setup4D.CEP.Enum,

  Setup4D.CEP.Interf;

type
  TSetup4DCepConfigurationWebServiceZipCode = class(TInterfacedObject, ISetup4DCEPConfigurationWebServiceZIPCode)
  private
    [weak]
    FParent : ISetup4DCEPConfigurationWebService;
    FWebService :  TSetup4DCEPWebService;
    FKey : string;
    FUser : string;
    FPassword : string;
    FReturnIBGE : Boolean;


  protected

    function Nenhum : ISetup4DCEPConfigurationWebServiceZIPCode;
    function BuscarCep : ISetup4DCEPConfigurationWebServiceZIPCode;
    function CepLivre : ISetup4DCEPConfigurationWebServiceZIPCode;
    function RepublicaVirtual : ISetup4DCEPConfigurationWebServiceZIPCode;
    function Bases4you : ISetup4DCEPConfigurationWebServiceZIPCode;
    function RNSolucoes : ISetup4DCEPConfigurationWebServiceZIPCode;
    function KingHost : ISetup4DCEPConfigurationWebServiceZIPCode;
    function ByJG : ISetup4DCEPConfigurationWebServiceZIPCode;
    function Correios : ISetup4DCEPConfigurationWebServiceZIPCode;
    function DevMedia : ISetup4DCEPConfigurationWebServiceZIPCode;
    function ViaCep : ISetup4DCEPConfigurationWebServiceZIPCode;
    function CorreiosSIGEP : ISetup4DCEPConfigurationWebServiceZIPCode;
    function CepAberto : ISetup4DCEPConfigurationWebServiceZIPCode;
    function WSCep : ISetup4DCEPConfigurationWebServiceZIPCode;
    function OpenCep : ISetup4DCEPConfigurationWebServiceZIPCode;
    function BrasilAPI  : ISetup4DCEPConfigurationWebServiceZIPCode;
    function Index : Integer;

    function Key(AValue: string) : ISetup4DCEPConfigurationWebServiceZIPCode; overload;
    function Key : string; overload;
    function User(Const AValue: string) : ISetup4DCEPConfigurationWebServiceZIPCode; overload;
    function User : string; overload;
    function Password(Const AValue: string) : ISetup4DCEPConfigurationWebServiceZIPCode; overload;
    function Password : string; overload;

    function ReturnIBGE(const AValue: Boolean): ISetup4DCEPConfigurationWebServiceZIPCode; overload;
    function ReturnIBGE: Boolean; overload;

    function Finish: ISetup4DCEPConfigurationWebService;

    Constructor Create(const AValue: ISetup4DCEPConfigurationWebService); overload;
  public

    Destructor Destroy; override;


    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Cria uma nova instância de configurações relacionadas ao serviço web de consulta de CEP para Códigos Postais.
    /// </summary>
    /// <remarks>
    /// Esta instância é usada para configurar opções específicas para consultas de CEP.
    /// </remarks>
    /// <returns>A interface para configuração do serviço web de consulta de CEP para Códigos Postais.</returns>
    {$ELSE}
    /// <summary>
    /// Creates a new instance of settings related to the web service for ZIP code lookup.
    /// </summary>
    /// <remarks>
    /// This instance is used to configure specific options for ZIP code lookup.
    /// </remarks>
    /// <returns>The interface for configuring the web service for ZIP code lookup.</returns>
    {$ENDIF}
    class function New(const AValue: ISetup4DCEPConfigurationWebService): ISetup4DCEPConfigurationWebServiceZIPCode; overload;
  end;

implementation

uses
  Setup4D.Utility.Generic,
  System.SysUtils;

function TSetup4DCepConfigurationWebServiceZipCode.Bases4you: ISetup4DCEPConfigurationWebServiceZIPCode;
begin
  Result := Self;

  {$IFDEF HAS_PORTUGUES}
  raise EConvertError.Create('Este serviço encontra-se temporariamente indisponível.');
  {$ELSE}
  raise EConvertError.Create('This service is temporarily unavailable.');
  {$ENDIF}

  FWebService := TSetup4DCEPWebService.Bases4you;
end;

function TSetup4DCepConfigurationWebServiceZipCode.BrasilAPI: ISetup4DCEPConfigurationWebServiceZIPCode;
begin
  Result := Self;
  FWebService := TSetup4DCEPWebService.BrasilAPI;
end;

function TSetup4DCepConfigurationWebServiceZipCode.BuscarCep: ISetup4DCEPConfigurationWebServiceZIPCode;
begin
  Result := Self;
  FWebService := TSetup4DCEPWebService.BuscarCep;
end;

function TSetup4DCepConfigurationWebServiceZipCode.ByJG: ISetup4DCEPConfigurationWebServiceZIPCode;
begin
  Result := Self;
  FWebService := TSetup4DCEPWebService.ByJG;
end;

function TSetup4DCepConfigurationWebServiceZipCode.CepAberto: ISetup4DCEPConfigurationWebServiceZIPCode;
begin
  Result := Self;
  FWebService := TSetup4DCEPWebService.CepAberto;
end;

function TSetup4DCepConfigurationWebServiceZipCode.CepLivre: ISetup4DCEPConfigurationWebServiceZIPCode;
begin
  Result := Self;
  FWebService := TSetup4DCEPWebService.CepLivre;
end;

function TSetup4DCepConfigurationWebServiceZipCode.Correios: ISetup4DCEPConfigurationWebServiceZIPCode;
begin
  Result := Self;
  FWebService := TSetup4DCEPWebService.Correios;
end;

function TSetup4DCepConfigurationWebServiceZipCode.CorreiosSIGEP: ISetup4DCEPConfigurationWebServiceZIPCode;
begin
  Result := Self;
  FWebService := TSetup4DCEPWebService.CorreiosSIGEP;
end;

constructor TSetup4DCepConfigurationWebServiceZipCode.Create(const AValue: ISetup4DCEPConfigurationWebService);
begin
  FParent := AValue;
  FWebService := TSetup4DCEPWebService.Nenhum;
  FReturnIBGE := True;
end;

destructor TSetup4DCepConfigurationWebServiceZipCode.Destroy;
begin

  inherited;
end;

function TSetup4DCepConfigurationWebServiceZipCode.DevMedia: ISetup4DCEPConfigurationWebServiceZIPCode;
begin
  Result := Self;
  {$IFDEF HAS_PORTUGUES}
  raise EConvertError.Create('Este serviço encontra-se temporariamente indisponível.');
  {$ELSE}
  raise EConvertError.Create('This service is temporarily unavailable.');
  {$ENDIF}

  FWebService := TSetup4DCEPWebService.DevMedia;
end;

function TSetup4DCepConfigurationWebServiceZipCode.Finish: ISetup4DCEPConfigurationWebService;
begin
  Result := FParent;
end;

function TSetup4DCepConfigurationWebServiceZipCode.Index: Integer;
begin
  Result := TSetup4DUtilityGeneric<TSetup4DCEPWebService>.EnumToInterger(FWebService);
end;

function TSetup4DCepConfigurationWebServiceZipCode.KingHost: ISetup4DCEPConfigurationWebServiceZIPCode;
begin
  Result := Self;
  FWebService := TSetup4DCEPWebService.KingHost;
end;

function TSetup4DCepConfigurationWebServiceZipCode.Nenhum: ISetup4DCEPConfigurationWebServiceZIPCode;
begin
  Result := Self;
  FWebService := TSetup4DCEPWebService.Nenhum;
end;

class function TSetup4DCepConfigurationWebServiceZipCode.New(const AValue: ISetup4DCEPConfigurationWebService): ISetup4DCEPConfigurationWebServiceZIPCode;
begin
  Result:= Self.Create(AValue);
end;

function TSetup4DCepConfigurationWebServiceZipCode.OpenCep: ISetup4DCEPConfigurationWebServiceZIPCode;
begin
  Result := Self;
  FWebService := TSetup4DCEPWebService.OpenCep;
end;

function TSetup4DCepConfigurationWebServiceZipCode.RepublicaVirtual: ISetup4DCEPConfigurationWebServiceZIPCode;
begin
  Result := Self;
  FWebService := TSetup4DCEPWebService.RepublicaVirtual;
end;

function TSetup4DCepConfigurationWebServiceZipCode.ReturnIBGE: Boolean;
begin
  Result := FReturnIBGE;
end;

function TSetup4DCepConfigurationWebServiceZipCode.ReturnIBGE(
  const AValue: Boolean): ISetup4DCEPConfigurationWebServiceZIPCode;
begin
  Result := Self;
  FReturnIBGE := AValue;
end;

function TSetup4DCepConfigurationWebServiceZipCode.RNSolucoes: ISetup4DCEPConfigurationWebServiceZIPCode;
begin
  Result := Self;

  {$IFDEF HAS_PORTUGUES}
  raise EConvertError.Create('Este serviço encontra-se temporariamente indisponível.');
  {$ELSE}
  raise EConvertError.Create('This service is temporarily unavailable.');
  {$ENDIF}

  FWebService := TSetup4DCEPWebService.RNSolucoes;
end;

function TSetup4DCepConfigurationWebServiceZipCode.ViaCep: ISetup4DCEPConfigurationWebServiceZIPCode;
begin
  Result := Self;
  FWebService := TSetup4DCEPWebService.ViaCep;
end;

function TSetup4DCepConfigurationWebServiceZipCode.WSCep: ISetup4DCEPConfigurationWebServiceZIPCode;
begin
  Result := Self;
  {$IFDEF HAS_PORTUGUES}
  raise EConvertError.Create('Este serviço encontra-se temporariamente indisponível.');
  {$ELSE}
  raise EConvertError.Create('This service is temporarily unavailable.');
  {$ENDIF}

  FWebService := TSetup4DCEPWebService.WSCep;
end;

function TSetup4DCepConfigurationWebServiceZipCode.Key: string;
begin
  Result := FKey;
end;

function TSetup4DCepConfigurationWebServiceZipCode.Key(
  AValue: string): ISetup4DCEPConfigurationWebServiceZIPCode;
begin
  Result := Self;
  FKey := AValue;
end;


function TSetup4DCepConfigurationWebServiceZipCode.Password(
  const AValue: string): ISetup4DCEPConfigurationWebServiceZIPCode;
begin
  Result := Self;
  FPassword := AValue;
end;

function TSetup4DCepConfigurationWebServiceZipCode.Password: string;
begin
  Result := FPassword;
end;

function TSetup4DCepConfigurationWebServiceZipCode.User(
  const AValue: string): ISetup4DCEPConfigurationWebServiceZIPCode;
begin
  Result := Self;
  FUser := AValue;
end;

function TSetup4DCepConfigurationWebServiceZipCode.User: string;
begin
  Result := FUser;
end;

end.
