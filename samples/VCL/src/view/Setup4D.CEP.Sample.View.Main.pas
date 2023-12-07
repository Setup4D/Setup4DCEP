unit Setup4D.CEP.Sample.View.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Variants,
  System.Classes,
  System.JSON,

  Vcl.Mask,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,

  Setup4D.CEP,
  Setup4D.CEP.interf,

  Setup4D.Utility,
  Setup4D.Utility.Enum,
  Setup4D.Utility.Generic,

  Setup4D.CEP.Sample.Comum.Controller;

type
  {$SCOPEDENUMS ON}
  TIBGE = (Country, State, City);
  {$SCOPEDENUMS OFF}
  TPageMain = class(TForm)
    PageControl: TPageControl;
    tsConfiguration: TTabSheet;
    tsCEP: TTabSheet;
    tsIBGE: TTabSheet;
    gbWebSevice: TGroupBox;
    gbProxy: TGroupBox;
    edtChave: TLabeledEdit;
    edtHost: TLabeledEdit;
    edtUserProxy: TLabeledEdit;
    edtPassProxy: TLabeledEdit;
    edtPort: TLabeledEdit;
    gbCEP: TGroupBox;
    edtCEP: TLabeledEdit;
    gbEndereco: TGroupBox;
    edtTipo: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtBairo: TLabeledEdit;
    edtLogradouro: TLabeledEdit;
    btPesquisarCEP: TButton;
    btPersquisarEndereco: TButton;
    cbxUF: TComboBox;
    lblUF: TLabel;
    gbCodigoIBGE: TGroupBox;
    edtCodigoIBGE: TLabeledEdit;
    btPesquisarCodigoIBGE: TButton;
    gbCidadeEstadoIBGE: TGroupBox;
    lblUFIBGE: TLabel;
    edtCidadeIBGE: TLabeledEdit;
    btPesquisarCidadeIBGE: TButton;
    cbxUFIBGE: TComboBox;
    btPesquisarEstadoIBGE: TButton;
    edtUserWebService: TLabeledEdit;
    edtPassWebService: TLabeledEdit;
    edtTimeOutWebService: TLabeledEdit;
    Memo: TMemo;
    edtPaisIBGE: TLabeledEdit;
    btPais: TButton;
    cbUpper: TCheckBox;
    cbTodosEnderecos: TCheckBox;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btPesquisarCEPClick(Sender: TObject);
    procedure btPesquisarCidadeIBGEClick(Sender: TObject);
    procedure btPesquisarEstadoIBGEClick(Sender: TObject);
    procedure btPaisClick(Sender: TObject);
    procedure btPesquisarCodigoIBGEClick(Sender: TObject);
    procedure btPersquisarEnderecoClick(Sender: TObject);
  private
    procedure ResultadoIBGE(AValue : TIBGE);
    procedure ResultadoCEP(AListArray: Boolean = False);
    procedure SetupFields;
    procedure SetupListComboBox;
  end;

var
  PageMain: TPageMain;
  FCEP : ISetup4DCEP;
  FController : iController;

implementation

{$R *.dfm}


procedure TPageMain.btPersquisarEnderecoClick(Sender: TObject);
var
  LTimeOut : Integer;
begin
  LTimeOut := TSetup4DUtility.IIF<Integer>(TSetup4DUtility.IsEmpty(edtTimeOutWebService.Text), 0, StrToIntDef(edtTimeOutWebService.Text, 0));

  if LTimeOut = 0 then
    LTimeOut := 5000;

  FCEP
    .Configuration
      .WebService
          .User(edtUserWebService.Text)
          .Password(edtPassWebService.Text)
          .Key(edtChave.Text)
          .TimeOut(LTimeOut)
          .UpperText(cbUpper.Checked)
      .Finish
      .Proxy
        .Host(edtHost.Text)
        .Port(edtPort.Text)
        .User(edtUserProxy.Text)
        .Password(edtPassProxy.Text)
      .Finish
    .Finish
    .Filter
      .Clear
      .ZipCode
        .Street(edtLogradouro.Text)
        .District(edtBairo.Text)
        .City(edtCidade.Text)
        .State(cbxUF.Text)
      .Finish
    .Finish
    .Searech
      .ZipCode
        .Address(cbTodosEnderecos.Checked)
      .Finish
    .Finish;

  if cbTodosEnderecos.Checked then
    ResultadoCEP(True)
  else
    ResultadoCEP(False);

end;

procedure TPageMain.btPesquisarCEPClick(Sender: TObject);
var
  LTimeOut : Integer;
begin
  LTimeOut := TSetup4DUtility.IIF<Integer>(TSetup4DUtility.IsEmpty(edtTimeOutWebService.Text), 0, StrToIntDef(edtTimeOutWebService.Text, 0));

  if LTimeOut = 0 then
    LTimeOut := 5000;

  FCEP
    .Configuration
      .WebService
          .User(edtUserWebService.Text)
          .Password(edtPassWebService.Text)
          .Key(edtChave.Text)
          .TimeOut(LTimeOut)
          .UpperText(cbUpper.Checked)
      .Finish
      .Proxy
        .Host(edtHost.Text)
        .Port(edtPort.Text)
        .User(edtUserProxy.Text)
        .Password(edtPassProxy.Text)
      .Finish
    .Finish
    .Filter
      .Clear
      .ZipCode
        .Value(edtCEP.Text)
      .Finish
    .Finish
    .Searech
      .ZipCode
        .Value
      .Finish
    .Finish;

  ResultadoCEP;

end;

procedure TPageMain.btPesquisarCidadeIBGEClick(Sender: TObject);
var
  LTimeOut : Integer;
begin
  LTimeOut := TSetup4DUtility.IIF<Integer>(TSetup4DUtility.IsEmpty(edtTimeOutWebService.Text), 0, StrToIntDef(edtTimeOutWebService.Text, 0));

  if LTimeOut = 0 then
    LTimeOut := 5000;

  FCEP
    .Configuration
      .WebService
          .User(edtUserWebService.Text)
          .Password(edtPassWebService.Text)
          .Key(edtChave.Text)
          .UpperText(cbUpper.Checked)
          .TimeOut(LTimeOut)
      .Finish
      .Proxy
        .Host(edtHost.Text)
        .Port(edtPort.Text)
        .User(edtUserProxy.Text)
        .Password(edtPassProxy.Text)
      .Finish
    .Finish
    .Filter
      .Clear
      .IBGE
        .City(edtCidadeIBGE.Text)
        .State(cbxUFIBGE.Text)
      .Finish
    .Finish
    .Searech
      .IBGE
        .City
      .Finish
    .Finish;

  ResultadoIBGE(TIBGE.City);

end;

procedure TPageMain.btPesquisarCodigoIBGEClick(Sender: TObject);
var
  LTimeOut : Integer;
begin
  LTimeOut := TSetup4DUtility.IIF<Integer>(TSetup4DUtility.IsEmpty(edtTimeOutWebService.Text), 0, StrToIntDef(edtTimeOutWebService.Text, 0));

  if LTimeOut = 0 then
    LTimeOut := 5000;

  FCEP
    .Configuration
      .WebService
          .User(edtUserWebService.Text)
          .Password(edtPassWebService.Text)
          .Key(edtChave.Text)
          .UpperText(cbUpper.Checked)
          .TimeOut(LTimeOut)
      .Finish
      .Proxy
        .Host(edtHost.Text)
        .Port(edtPort.Text)
        .User(edtUserProxy.Text)
        .Password(edtPassProxy.Text)
      .Finish
    .Finish
    .Filter
      .Clear
      .IBGE
        .Code(edtCodigoIBGE.Text)
      .Finish
    .Finish
    .Searech
      .IBGE
        .Code
      .Finish
    .Finish;

  ResultadoIBGE(TIBGE.City);

end;

procedure TPageMain.btPesquisarEstadoIBGEClick(Sender: TObject);
var
  LTimeOut : Integer;
begin
  LTimeOut := TSetup4DUtility.IIF<Integer>(TSetup4DUtility.IsEmpty(edtTimeOutWebService.Text), 0, StrToIntDef(edtTimeOutWebService.Text, 0));

  if LTimeOut = 0 then
    LTimeOut := 5000;

  FCEP
    .Configuration
      .WebService
          .User(edtUserWebService.Text)
          .Password(edtPassWebService.Text)
          .Key(edtChave.Text)
          .UpperText(cbUpper.Checked)
          .TimeOut(LTimeOut)
      .Finish
      .Proxy
        .Host(edtHost.Text)
        .Port(edtPort.Text)
        .User(edtUserProxy.Text)
        .Password(edtPassProxy.Text)
      .Finish
    .Finish
    .Filter
      .Clear
      .IBGE
        .State(cbxUFIBGE.Text)
      .Finish
    .Finish
    .Searech
      .IBGE
        .State
      .Finish
    .Finish;

  ResultadoIBGE(TIBGE.State);

end;


procedure TPageMain.btPaisClick(Sender: TObject);
var
  LTimeOut : Integer;
begin
  LTimeOut := TSetup4DUtility.IIF<Integer>(TSetup4DUtility.IsEmpty(edtTimeOutWebService.Text), 0, StrToIntDef(edtTimeOutWebService.Text, 0));

  if LTimeOut = 0 then
    LTimeOut := 5000;

  FCEP
    .Configuration
      .WebService
          .User(edtUserWebService.Text)
          .Password(edtPassWebService.Text)
          .Key(edtChave.Text)
          .UpperText(cbUpper.Checked)
          .TimeOut(LTimeOut)
      .Finish
      .Proxy
        .Host(edtHost.Text)
        .Port(edtPort.Text)
        .User(edtUserProxy.Text)
        .Password(edtPassProxy.Text)
      .Finish
    .Finish
    .Filter
      .Clear
      .IBGE
        .Country(edtPaisIBGE.Text)
      .Finish
    .Finish
    .Searech
      .IBGE
        .Country
      .Finish
    .Finish;

  ResultadoIBGE(TIBGE.Country);

end;


procedure TPageMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FController
    .WebService
      .users(edtUserWebService.Text)
      .PassW(edtPassWebService.Text)
      .Chave(edtChave.Text)
      .TimeOut(edtTimeOutWebService.Text)
      .UpperText(cbUpper.Checked)
    .Finish
    .Proxy
      .Host(edtHost.Text)
      .Port(edtPort.Text)
      .User(edtUserProxy.Text)
      .Pass(edtPassProxy.Text)
    .Finish
    .CEP
      .TodosEnderecos(cbTodosEnderecos.Checked)
    .Finish
      .GravarINI;
end;

procedure TPageMain.FormCreate(Sender: TObject);
begin
  PageControl.ActivePage := tsConfiguration;

  SetupListComboBox;

  SetupFields;

end;

procedure TPageMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl as TWinControl, True, True);
    Key := #0;
  end;
end;

procedure TPageMain.FormShow(Sender: TObject);
begin
  edtChave.SetFocus;
  Memo.Lines.Clear;
end;

procedure TPageMain.ResultadoCEP(AListArray: Boolean);
begin
  case AListArray of
    True :
    begin
      TThread.CreateAnonymousThread(procedure
      begin
        TThread.Synchronize(TThread.CurrentThread, procedure
        begin
          Memo.Lines.Clear;
          Memo.Lines.Add( StringOfChar('-',20) );
          Memo.Lines.Add('Retorno por variável');
          Memo.Lines.Add( StringOfChar('-',20) );
          Memo.Lines.Add(EmptyStr);
          Memo.Lines.Add('CEP: ' + FCEP.Result.ZIPCode.Code(0));
          Memo.Lines.Add('Rua: ' + FCEP.Result.ZIPCode.Street(0));
          Memo.Lines.Add('Complemento: ' + FCEP.Result.ZIPCode.StreetComplent(0));
          Memo.Lines.Add('Bairro: ' + FCEP.Result.ZIPCode.District(0));
          Memo.Lines.Add('Cidade: '+ FCEP.Result.ZIPCode.City(0));
          Memo.Lines.Add('IBGE da Cidade: ' + FCEP.Result.ZIPCode.CityIBGE(0));
          Memo.Lines.Add('Estado: ' + FCEP.Result.ZIPCode.State(0));
          Memo.Lines.Add('Sigla do Estado: ' + FCEP.Result.ZIPCode.StateSigla(0));
          Memo.Lines.Add('IBGE do Estado: ' + FCEP.Result.ZIPCode.StateIBGE(0));
          Memo.Lines.Add('Região: ' + FCEP.Result.ZIPCode.Region(0));
          Memo.Lines.Add('DDD: ' + FCEP.Result.ZIPCode.DDD(0));
          Memo.Lines.Add('País: ' + FCEP.Result.ZIPCode.Country(0));
          Memo.Lines.Add('Sigla do País: '+ FCEP.Result.ZIPCode.CountrySigla(0));
          Memo.Lines.Add('IBGE do País: ' + FCEP.Result.ZIPCode.CountryIBGE(0));
          Memo.Lines.Add('DDI: ' + FCEP.Result.ZIPCode.DDI(0));
          Memo.Lines.Add('Continente: ' + FCEP.Result.ZIPCode.Continent(0));
          Memo.Lines.Add('Altitude: ' + FCEP.Result.ZIPCode.Altitude(0));
          Memo.Lines.Add('Latitude: ' + FCEP.Result.ZIPCode.Latitude(0));
          Memo.Lines.Add('Longitude: ' + FCEP.Result.ZIPCode.Longitude(0));
          Memo.Lines.Add('SIAFI (Sistema Integrado de Administração Financeira) - Código: ' + FCEP.Result.ZIPCode.SIAFICode(0));
          Memo.Lines.Add('SIAFI (Sistema Integrado de Administração Financeira) - CNPJ: ' + FCEP.Result.ZIPCode.SIAFICNPJ(0));
          Memo.Lines.Add('SIAFI (Sistema Integrado de Administração Financeira) - Cidade: ' + FCEP.Result.ZIPCode.SIAFIName(0));

          Memo.Lines.Add(EmptyStr);
          Memo.Lines.Add( StringOfChar('-',20) );
          Memo.Lines.Add('JSON Array');
          Memo.Lines.Add(FCEP.Result.ZIPCode.JSONArray.Format);
          Memo.Lines.Add( StringOfChar('-',20) );
          Memo.Lines.Add(EmptyStr);

          Memo.Lines.Add(EmptyStr);
          Memo.Lines.Add( StringOfChar('-',20) );
          Memo.Lines.Add('JSON Array');
          Memo.Lines.Add(FCEP.Result.ZIPCode.JSONArrayInString);
          Memo.Lines.Add( StringOfChar('-',20) );
          Memo.Lines.Add(EmptyStr);
        end)
      end).Start;
    end;

    False :
    begin
      TThread.CreateAnonymousThread(procedure
      begin
        TThread.Synchronize(TThread.CurrentThread, procedure
        begin
          Memo.Lines.Clear;
          Memo.Lines.Add( StringOfChar('-',20) );
          Memo.Lines.Add('Retorno por variável');
          Memo.Lines.Add( StringOfChar('-',20) );
          Memo.Lines.Add(EmptyStr);
          Memo.Lines.Add('CEP: ' + FCEP.Result.ZIPCode.Code);
          Memo.Lines.Add('Rua: ' + FCEP.Result.ZIPCode.Street);
          Memo.Lines.Add('Complemento: ' + FCEP.Result.ZIPCode.StreetComplent);
          Memo.Lines.Add('Bairro: ' + FCEP.Result.ZIPCode.District);
          Memo.Lines.Add('Cidade: '+ FCEP.Result.ZIPCode.City);
          Memo.Lines.Add('IBGE da Cidade: ' + FCEP.Result.ZIPCode.CityIBGE);
          Memo.Lines.Add('Estado: ' + FCEP.Result.ZIPCode.State);
          Memo.Lines.Add('Sigla do Estado: ' + FCEP.Result.ZIPCode.StateSigla);
          Memo.Lines.Add('IBGE do Estado: ' + FCEP.Result.ZIPCode.StateIBGE);
          Memo.Lines.Add('Região: ' + FCEP.Result.ZIPCode.Region);
          Memo.Lines.Add('DDD: ' + FCEP.Result.ZIPCode.DDD);
          Memo.Lines.Add('País: ' + FCEP.Result.ZIPCode.Country);
          Memo.Lines.Add('Sigla do País: '+ FCEP.Result.ZIPCode.CountrySigla);
          Memo.Lines.Add('IBGE do País: ' + FCEP.Result.ZIPCode.CountryIBGE);
          Memo.Lines.Add('DDI: ' + FCEP.Result.ZIPCode.DDI);
          Memo.Lines.Add('Continente: ' + FCEP.Result.ZIPCode.Continent);
          Memo.Lines.Add('Altitude: ' + FCEP.Result.ZIPCode.Altitude);
          Memo.Lines.Add('Latitude: ' + FCEP.Result.ZIPCode.Latitude);
          Memo.Lines.Add('Longitude: ' + FCEP.Result.ZIPCode.Longitude);
          Memo.Lines.Add('SIAFI (Sistema Integrado de Administração Financeira) - Código: ' + FCEP.Result.ZIPCode.SIAFICode);
          Memo.Lines.Add('SIAFI (Sistema Integrado de Administração Financeira) - CNPJ: ' + FCEP.Result.ZIPCode.SIAFICNPJ);
          Memo.Lines.Add('SIAFI (Sistema Integrado de Administração Financeira) - Cidade: ' + FCEP.Result.ZIPCode.SIAFIName);

          Memo.Lines.Add(EmptyStr);
          Memo.Lines.Add( StringOfChar('-',20) );
          Memo.Lines.Add('JSON Object');
          Memo.Lines.Add(FCEP.Result.ZIPCode.JSONObject.Format);
          Memo.Lines.Add( StringOfChar('-',20) );
          Memo.Lines.Add(EmptyStr);

          Memo.Lines.Add(EmptyStr);
          Memo.Lines.Add( StringOfChar('-',20) );
          Memo.Lines.Add('JSON String');
          Memo.Lines.Add(FCEP.Result.ZIPCode.JSONObjectInString);
          Memo.Lines.Add( StringOfChar('-',20) );
          Memo.Lines.Add(EmptyStr);
        end)
      end).Start;
    end;
  end;
end;

procedure TPageMain.SetupFields;
begin
  TThread.CreateAnonymousThread(procedure
  begin
    TThread.Synchronize(TThread.CurrentThread, procedure
    begin
      FController.LerINI;

      edtChave.Text := FController.WebService.Chave;
      edtUserWebService.Text := FController.WebService.users;
      edtPassWebService.Text := FController.WebService.PassW;
      cbUpper.Checked := FController.WebService.UpperText;

      edtTimeOutWebService.Text := TSetup4DUtility.IIF<string>(FController.WebService.TimeOut = 0, EmptyStr, FController.WebService.TimeOutInStr);

      edtHost.Text := FController.Proxy.Host;
      edtPort.Text := TSetup4DUtility.IIF<string>(FController.Proxy.Port = 0, EmptyStr, FController.Proxy.PortInStr);
      edtUserProxy.Text := FController.Proxy.User;
      edtPassProxy.Text := FController.Proxy.Pass;

      cbTodosEnderecos.Checked := FController.CEP.TodosEnderecos;

      edtCEP.Text := '25812-360';

      edtCodigoIBGE.Text := '3300100';
    end)
  end).Start;
end;

procedure TPageMain.SetupListComboBox;
begin
  TThread.CreateAnonymousThread(procedure
  begin
    TThread.Synchronize(TThread.CurrentThread, procedure
    begin
      TSetup4DUtilityGeneric<TSetup4DUtilityEstadoAbreviado>.EnumToList(cbxUF.Items, '_', EmptyStr);
      cbxUFIBGE.Items := cbxUF.Items;
    end)
  end).Start;
end;

procedure TPageMain.ResultadoIBGE(AValue : TIBGE);
begin
  TThread.CreateAnonymousThread(procedure
  begin
    TThread.Synchronize(TThread.CurrentThread, procedure
    begin
      Memo.Lines.Clear;
      Memo.Lines.Add( StringOfChar('-',20) );
      Memo.Lines.Add('Retorno por variável');
      Memo.Lines.Add( StringOfChar('-',20) );
      Memo.Lines.Add(EmptyStr);

      case AValue of
        TIBGE.Country:
        begin
          Memo.Lines.Add(EmptyStr);
          Memo.Lines.Add('Código do País: ' + FCEP.Result.IBGE.CountryCode);
          Memo.Lines.Add('País: '+ FCEP.Result.IBGE.Country);
        end;
        TIBGE.State:
        begin
          Memo.Lines.Add(EmptyStr);
          Memo.Lines.Add('Código do País: ' + FCEP.Result.IBGE.CountryCode);
          Memo.Lines.Add('País: '+ FCEP.Result.IBGE.Country);
          Memo.Lines.Add('Código do Estado: ' + FCEP.Result.IBGE.StateCode);
          Memo.Lines.Add('Estado: '+ FCEP.Result.IBGE.State);
        end;
        TIBGE.City:
        begin
          Memo.Lines.Add(EmptyStr);
          Memo.Lines.Add('Código do País: ' + FCEP.Result.IBGE.CountryCode);
          Memo.Lines.Add('País: '+ FCEP.Result.IBGE.Country);
          Memo.Lines.Add('Código do Estado: ' + FCEP.Result.IBGE.StateCode);
          Memo.Lines.Add('Estado: '+ FCEP.Result.IBGE.State);
          Memo.Lines.Add('Código da Cidade: ' + FCEP.Result.IBGE.CityCode);
          Memo.Lines.Add('Cidade: '+ FCEP.Result.IBGE.City);
        end;

      end;

      Memo.Lines.Add(EmptyStr);
      Memo.Lines.Add( StringOfChar('-',20) );
      Memo.Lines.Add('JSON Object');
      Memo.Lines.Add(FCEP.Result.IBGE.JSONObject.Format);
      Memo.Lines.Add( StringOfChar('-',20) );
      Memo.Lines.Add(EmptyStr);

      Memo.Lines.Add(EmptyStr);
      Memo.Lines.Add( StringOfChar('-',20) );
      Memo.Lines.Add('JSON String');
      Memo.Lines.Add(FCEP.Result.IBGE.JSONObjectInString);
      Memo.Lines.Add( StringOfChar('-',20) );
      Memo.Lines.Add(EmptyStr);

    end)
  end).Start;

end;

initialization
  FCEP := TSetup4DCEP.New;
  FController := TController.New;

finalization
  FController := Nil;
  FCEP := Nil;

end.
