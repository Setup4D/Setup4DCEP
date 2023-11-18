unit Setup4D.CEP.Configuration.WebService;

{$I Setup4DCEPLanguage.inc}

interface

uses
  Setup4D.CEP.Enum,
  Setup4D.Utility.Generic,

  Setup4D.CEP.Interf;

type
  TSetup4DCepConfigurationWebService = class(TInterfacedObject, ISetup4DCEPConfigurationWebService)
  private
    [weak]
    FParent : ISetup4DCEPConfiguration;
    FConfigurationWebServiceZipCode : ISetup4DCEPConfigurationWebServiceZIPCode;
    FConfigurationWebServiceIBGE : ISetup4DCEPConfigurationWebServiceIBGE;

    FTimeOut : Integer;
    FParseText : Boolean;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Define as configurações relacionadas ao serviço web para consulta de CEP.
    /// </summary>
    {$ELSE}
    /// <summary>
    /// Defines the settings related to the web service for ZIP code lookup.
    /// </summary>
    {$ENDIF}
    procedure Configuration;

  protected

    function ZipCode : ISetup4DCEPConfigurationWebServiceZIPCode;
    function IBGE : ISetup4DCEPConfigurationWebServiceIBGE;

    function TimeOut(Const AValue: string) : ISetup4DCEPConfigurationWebService; overload;
    function TimeOut(Const AValue: Integer) : ISetup4DCEPConfigurationWebService; overload;
    function TimeOutInStr : string; overload;
    function TimeOut : Integer; overload;
    function ParseText(Const AValue: Boolean) : ISetup4DCEPConfigurationWebService; overload;
    function ParseText : Boolean; overload;

    function Finish: ISetup4DCEPConfiguration;

    Constructor Create(Const AValue: ISetup4DCEPConfiguration); overload;
  public
    Destructor Destroy; override;

    {$IFDEF HAS_PORTUGUES}
    /// <summary>
    /// Cria uma nova instância da interface `ISetup4DCEPConfigurationWebService`.
    /// </summary>
    /// <param name="AValue">A instância da interface `ISetup4DCEPConfiguration` que contém configurações relacionadas a um serviço web.</param>
    /// <returns>Uma nova instância da interface `ISetup4DCEPConfigurationWebService` associada à instância `AValue` da interface `ISetup4DCEPConfiguration`.</returns>
    {$ELSE}
    /// <summary>
    /// Creates a new instance of the `ISetup4DCEPConfigurationWebService` interface.
    /// </summary>
    /// <param name="AValue">The `ISetup4DCEPConfiguration` interface instance containing configurations related to a web service.</param>
    /// <returns>A new instance of the `ISetup4DCEPConfigurationWebService` interface associated with the `AValue` instance of the `ISetup4DCEPConfiguration` interface.</returns>
    {$ENDIF}
    class function New(Const AValue: ISetup4DCEPConfiguration): ISetup4DCEPConfigurationWebService; overload;
  end;

implementation
uses
  System.SysUtils,
  Setup4D.CEP.Configuration.WebService.IBGE,
  Setup4D.CEP.Configuration.WebService.ZipCode;

procedure TSetup4DCepConfigurationWebService.Configuration;
begin
  FParseText  := False;
end;

constructor TSetup4DCepConfigurationWebService.Create(Const AValue: ISetup4DCEPConfiguration);
begin
  FParent := AValue;
  Configuration;
end;

destructor TSetup4DCepConfigurationWebService.Destroy;
begin

  inherited;
end;

function TSetup4DCepConfigurationWebService.Finish: ISetup4DCEPConfiguration;
begin
  Result := FParent;

end;

function TSetup4DCepConfigurationWebService.IBGE: ISetup4DCEPConfigurationWebServiceIBGE;
begin
  if not Assigned(FConfigurationWebServiceIBGE) then
    FConfigurationWebServiceIBGE := TSetup4DCepConfigurationWebServiceIBGE.New(Self);
  Result := FConfigurationWebServiceIBGE;
end;

class function TSetup4DCepConfigurationWebService.New(
  Const AValue: ISetup4DCEPConfiguration): ISetup4DCEPConfigurationWebService;
begin
  Result:= Self.Create(AValue);
end;

function TSetup4DCepConfigurationWebService.ParseText: Boolean;
begin
  Result := FParseText;
end;

function TSetup4DCepConfigurationWebService.ParseText(
  const AValue: Boolean): ISetup4DCEPConfigurationWebService;
begin
  Result := Self;
  FParseText := True;
end;

function TSetup4DCepConfigurationWebService.TimeOut(
  const AValue: string): ISetup4DCEPConfigurationWebService;
begin
  Result := Self;
  try
    if AValue.Trim.IsEmpty then
      FTimeOut := 90000
    else
      FTimeOut := AValue.ToInteger;
  except
    {$IFDEF HAS_PORTUGUES}
    raise EConvertError.Create('A Time Out informada não corresponde a um número');
    {$ELSE}
    raise EConvertError.Create('The Time Out provided does not correspond to a number.');
    {$ENDIF}
  end;

end;

function TSetup4DCepConfigurationWebService.TimeOut(
  const AValue: Integer): ISetup4DCEPConfigurationWebService;
begin
  Result := Self;
  FTimeOut := AValue;
end;

function TSetup4DCepConfigurationWebService.TimeOut: Integer;
begin
  Result := FTimeOut;
end;

function TSetup4DCepConfigurationWebService.TimeOutInStr: string;
begin
  Result := FTimeOut.ToString;
end;

function TSetup4DCepConfigurationWebService.ZipCode: ISetup4DCEPConfigurationWebServiceZIPCode;
begin
  if not Assigned(FConfigurationWebServiceZipCode) then
    FConfigurationWebServiceZipCode := TSetup4DCepConfigurationWebServiceZipCode.New(Self);
  Result := FConfigurationWebServiceZipCode;
end;

end.
