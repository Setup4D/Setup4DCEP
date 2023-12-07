unit Setup4D.CEP.Configuration.WebService;

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

  Setup4D.CEP.Interf;

type
  TSetup4DCepConfigurationWebService = class(TInterfacedObject, ISetup4DCEPConfigurationWebService)
  private
    {$IFNDEF FPC}
    [weak]
    {$ENDIF}
    FParent : ISetup4DCEPConfiguration;
    FKey : string;
    FUser : string;
    FPassword : string;
    FTimeOut : Integer;
    FBaseURL : string;
    FUpperText : Boolean;
  protected
    function BaseURL(Const AValue: string) : ISetup4DCEPConfigurationWebService; overload;
    function BaseURL : string; overload;
    function Key(Const AValue: string) : ISetup4DCEPConfigurationWebService; overload;
    function Key : string; overload;
    function User(Const AValue: string) : ISetup4DCEPConfigurationWebService; overload;
    function User : string; overload;
    function Password(Const AValue: string) : ISetup4DCEPConfigurationWebService; overload;
    function Password : string; overload;
    function UpperText(Const AValue: Boolean) : ISetup4DCEPConfigurationWebService; overload;
    function UpperText : Boolean; overload;
    function UpperTextInString : string; overload;
    function TimeOut(Const AValue: string) : ISetup4DCEPConfigurationWebService; overload;
    function TimeOut(Const AValue: Integer) : ISetup4DCEPConfigurationWebService; overload;
    function TimeOutInStr : string; overload;
    function TimeOut : Integer; overload;

    function Finish: ISetup4DCEPConfiguration;

    {$IFNDEF FPC}
    Constructor Create(Const AValue: ISetup4DCEPConfiguration); overload;
    {$ENDIF}
  public
    {$IFDEF FPC}
    Constructor Create(Const AValue: ISetup4DCEPConfiguration); overload;
    {$ENDIF}

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

{ TSetup4DCepConfigurationWebService }

function TSetup4DCepConfigurationWebService.BaseURL: string;
begin
  Result := FBaseURL;
end;

function TSetup4DCepConfigurationWebService.BaseURL(
  const AValue: string): ISetup4DCEPConfigurationWebService;
begin
  Result := Self;
  FBaseURL:= AValue;
end;

constructor TSetup4DCepConfigurationWebService.Create(
  const AValue: ISetup4DCEPConfiguration);
begin
  FParent := AValue;
  FBaseURL := 'https://api.setup4d.com.br/cep/ver.1.0.1/';
end;

destructor TSetup4DCepConfigurationWebService.Destroy;
begin

  inherited;
end;

function TSetup4DCepConfigurationWebService.Finish: ISetup4DCEPConfiguration;
begin
  Result := FParent;
end;

function TSetup4DCepConfigurationWebService.Key(
  Const AValue: string): ISetup4DCEPConfigurationWebService;
begin
  Result := Self;
  FKey := AValue;
end;

function TSetup4DCepConfigurationWebService.Key: string;
begin
  Result := FKey;

end;

class function TSetup4DCepConfigurationWebService.New(
  Const AValue: ISetup4DCEPConfiguration): ISetup4DCEPConfigurationWebService;
begin
  Result:= Self.Create(AValue);
end;

function TSetup4DCepConfigurationWebService.Password(
  const AValue: string): ISetup4DCEPConfigurationWebService;
begin
  Result := Self;
  FPassword := AValue;
end;

function TSetup4DCepConfigurationWebService.Password: string;
begin
  Result := FPassword;
end;

function TSetup4DCepConfigurationWebService.TimeOut(
  const AValue: string): ISetup4DCEPConfigurationWebService;
begin
  Result := Self;
  TimeOut(AValue.ToInteger);
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
  Result:= TimeOut.ToString;
end;

function TSetup4DCepConfigurationWebService.User(
  const AValue: string): ISetup4DCEPConfigurationWebService;
begin
  Result := Self;
  FUser := AValue;
end;

function TSetup4DCepConfigurationWebService.UpperText: Boolean;
begin
  Result := FUpperText;
end;

function TSetup4DCepConfigurationWebService.UpperTextInString: string;
begin
  case UpperText of
    True  : Result := 'True';
    False : Result := 'False';
  end;
end;

function TSetup4DCepConfigurationWebService.UpperText(
  const AValue: Boolean): ISetup4DCEPConfigurationWebService;
begin
  Result := Self;
  FUpperText := AValue;
end;

function TSetup4DCepConfigurationWebService.User: string;
begin
  Result := FUser;
end;

end.
