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

  Setup4D.CEP.Sample.Comum.Controller;

type
  TPageMain = class(TForm)
    PageControl: TPageControl;
    tsConfiguration: TTabSheet;
    tsCEP: TTabSheet;
    tsIBGE: TTabSheet;
    gbWebSevice: TGroupBox;
    gbProxy: TGroupBox;
    cbxWebService: TComboBox;
    edtChave: TLabeledEdit;
    lblWebService: TLabel;
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
    GroupBox1: TGroupBox;
    cbPesquisarIBGE: TCheckBox;
    cbParseText: TCheckBox;
    GroupBox2: TGroupBox;
    cbCaseSensitive: TCheckBox;
    edtCacheName: TLabeledEdit;
    edtCacheValid: TLabeledEdit;
    Memo: TMemo;
    btLimparCahe: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btPesquisarCEPClick(Sender: TObject);
    procedure btPersquisarEnderecoClick(Sender: TObject);
    procedure btPesquisarCodigoIBGEClick(Sender: TObject);
    procedure btPesquisarCidadeIBGEClick(Sender: TObject);
    procedure cbxWebServiceSelect(Sender: TObject);
    procedure btPesquisarEstadoIBGEClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btLimparCaheClick(Sender: TObject);
  private
    procedure ResultadoIBGE;
    procedure ResultadoCEP;
    procedure SetupFields;
    procedure SetupListComboBox;
  end;

var
  PageMain: TPageMain;
  FCEP : ISetup4DCEP;
  FController : iController;

implementation

uses
  Setup4D.CEP.Enum,
  Setup4D.Utility,
  Setup4D.Utility.Enum,
  Setup4D.Utility.Generic;

{$R *.dfm}


procedure TPageMain.btPersquisarEnderecoClick(Sender: TObject);
begin
  FCEP
    .Configuration
      .WebService
        .ZipCode
          .User(edtUserWebService.Text)
          .Password(edtPassWebService.Text)
          .Key(edtChave.Text)
          .ReturnIBGE(cbPesquisarIBGE.Checked)
        .Finish
        .TimeOut(edtTimeOutWebService.Text)
        .ParseText(cbParseText.Checked)
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
        .Address
          .Types(edtTipo.Text)
          .Street(edtLogradouro.Text)
          .City(edtCidade.Text)
          .StateAbbreviated(cbxUF.Text)
          .District(edtBairo.Text)
        .Finish
      .Finish
    .Finish
    .Searech
      .ZipCode
        .Reconfiguration
        .Address
      .Finish
    .Finish;


  ResultadoCEP;

end;

procedure TPageMain.btPesquisarCEPClick(Sender: TObject);
begin
  FCEP
    .Configuration
      .WebService
        .ZipCode
          .User(edtUserWebService.Text)
          .Password(edtPassWebService.Text)
          .Key(edtChave.Text)
          .ReturnIBGE(cbPesquisarIBGE.Checked)
        .Finish
        .TimeOut(edtTimeOutWebService.Text)
        .ParseText(cbParseText.Checked)
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
        .Key
          .Value(edtCEP.Text)
        .Finish
      .Finish
    .Finish
    .Searech
      .ZipCode
        .Reconfiguration
        .Code
      .Finish
    .Finish;

  ResultadoCEP;
end;

procedure TPageMain.btPesquisarCidadeIBGEClick(Sender: TObject);
begin
  if Trim(edtCidadeIBGE.Text).IsEmpty then
    raise Exception.Create('Informe a cidade');

  if cbxUFIBGE.ItemIndex = -1 then
    raise Exception.Create('Selecione um estado');

  FCEP
    .Configuration
      .WebService
        .IBGE
          .CaseSensitive(cbCaseSensitive.Checked)
          .CacheName(edtCacheName.Text)
          .CacheValidity(edtCacheValid.Text)
        .Finish
        .TimeOut(edtTimeOutWebService.Text)
        .ParseText(cbParseText.Checked)
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
        .Address
          .City(edtCidadeIBGE.Text)
          .StateAbbreviated(cbxUFIBGE.Text)
        .Finish
      .Finish
    .Finish
    .Searech
      .IBGE
        .Reconfiguration
        .City
      .Finish
    .Finish;

  ResultadoIBGE;
end;

procedure TPageMain.btPesquisarCodigoIBGEClick(Sender: TObject);
begin
  FCEP
    .Configuration
      .WebService
        .IBGE
          .CaseSensitive(cbCaseSensitive.Checked)
          .CacheName(edtCacheName.Text)
          .CacheValidity(edtCacheValid.Text)
        .Finish
        .TimeOut(edtTimeOutWebService.Text)
        .ParseText(cbParseText.Checked)
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
        .Key
          .Value(edtCodigoIBGE.Text)
        .Finish
      .Finish
    .Finish
    .Searech
      .IBGE
        .Reconfiguration
        .Code
      .Finish
    .Finish
    .Configuration
      .WebService
        .IBGE
          .CacheClear
        .Finish
      .Finish
    .Finish;

    ResultadoIBGE;
end;

procedure TPageMain.btPesquisarEstadoIBGEClick(Sender: TObject);
begin
  if cbxUFIBGE.ItemIndex = -1 then
    raise Exception.Create('Selecione um estado');

  FCEP
    .Configuration
      .WebService
        .IBGE
          .CaseSensitive(cbCaseSensitive.Checked)
          .CacheName(edtCacheName.Text)
          .CacheValidity(edtCacheValid.Text)
        .Finish
        .TimeOut(edtTimeOutWebService.Text)
        .ParseText(cbParseText.Checked)
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
        .Address
          .StateAbbreviated(cbxUFIBGE.Text)
        .Finish
      .Finish
    .Finish
    .Searech
      .IBGE
        .Reconfiguration
        .State
      .Finish
    .Finish;


  ResultadoIBGE
end;

procedure TPageMain.btLimparCaheClick(Sender: TObject);
begin
  FCEP.Configuration.WebService.IBGE.CacheName(edtCacheName.Text).CacheClear;
end;

procedure TPageMain.cbxWebServiceSelect(Sender: TObject);
begin
  case (TSetup4DUtilityGeneric<TSetup4DCEPWebService>.StringToEnum(cbxWebService.Text)) of
    TSetup4DCEPWebService.Nenhum : FCEP
                                    .Configuration
                                      .WebService
                                        .ZipCode
                                          .Nenhum
                                        .Finish
                                      .Finish
                                    .Finish;

    TSetup4DCEPWebService.BuscarCep : FCEP
                                        .Configuration
                                          .WebService
                                            .ZipCode
                                              .BuscarCep
                                            .Finish
                                          .Finish
                                        .Finish;

    TSetup4DCEPWebService.CepLivre : FCEP
                                      .Configuration
                                        .WebService
                                          .ZipCode
                                            .CepLivre
                                          .Finish
                                        .Finish
                                      .Finish;

    TSetup4DCEPWebService.RepublicaVirtual : FCEP
                                              .Configuration
                                                .WebService
                                                  .ZipCode
                                                    .RepublicaVirtual
                                                  .Finish
                                                .Finish
                                              .Finish;

    TSetup4DCEPWebService.Bases4you : FCEP
                                        .Configuration
                                          .WebService
                                            .ZipCode
                                              .Bases4you
                                            .Finish
                                          .Finish
                                        .Finish;

    TSetup4DCEPWebService.RNSolucoes : FCEP
                                        .Configuration
                                          .WebService
                                            .ZipCode
                                              .RNSolucoes
                                            .Finish
                                          .Finish
                                        .Finish;

    TSetup4DCEPWebService.KingHost : FCEP
                                      .Configuration
                                        .WebService
                                          .ZipCode
                                            .KingHost
                                          .Finish
                                        .Finish
                                      .Finish;

    TSetup4DCEPWebService.ByJG : FCEP
                                  .Configuration
                                    .WebService
                                      .ZipCode
                                        .ByJG
                                      .Finish
                                    .Finish
                                  .Finish;

    TSetup4DCEPWebService.Correios : FCEP
                                      .Configuration
                                        .WebService
                                          .ZipCode
                                            .Correios
                                          .Finish
                                        .Finish
                                      .Finish;

    TSetup4DCEPWebService.DevMedia : FCEP
                                      .Configuration
                                        .WebService
                                          .ZipCode
                                            .DevMedia
                                          .Finish
                                        .Finish
                                      .Finish;

    TSetup4DCEPWebService.ViaCep : FCEP
                                    .Configuration
                                      .WebService
                                        .ZipCode
                                          .ViaCep
                                        .Finish
                                      .Finish
                                    .Finish;

    TSetup4DCEPWebService.CorreiosSIGEP : FCEP
                                            .Configuration
                                              .WebService
                                                .ZipCode
                                                  .CorreiosSIGEP
                                                .Finish
                                              .Finish
                                            .Finish;

    TSetup4DCEPWebService.CepAberto : FCEP
                                        .Configuration
                                          .WebService
                                            .ZipCode
                                              .CepAberto
                                            .Finish
                                          .Finish
                                        .Finish;

    TSetup4DCEPWebService.WSCep : FCEP
                                    .Configuration
                                      .WebService
                                        .ZipCode
                                          .WSCep
                                        .Finish
                                      .Finish
                                    .Finish;

    TSetup4DCEPWebService.OpenCep : FCEP
                                      .Configuration
                                        .WebService
                                          .ZipCode
                                            .OpenCep
                                          .Finish
                                        .Finish
                                      .Finish;

    TSetup4DCEPWebService.BrasilAPI : FCEP
                                        .Configuration
                                          .WebService
                                            .ZipCode
                                              .BrasilAPI
                                            .Finish
                                          .Finish
                                        .Finish;
  end;

end;

procedure TPageMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FController
    .WebService
      .users(edtUserWebService.Text)
      .PassW(edtPassWebService.Text)
      .Chave(edtChave.Text)
      .TimeOut(edtTimeOutWebService.Text)
      .ParseText(cbParseText.Checked)
      .Index(cbxWebService.ItemIndex)
    .Finish
    .Proxy
      .Host(edtHost.Text)
      .Port(edtPort.Text)
      .User(edtUserProxy.Text)
      .Pass(edtPassProxy.Text)
    .Finish
    .CEP
      .ForcarIBGE(cbPesquisarIBGE.Checked)
    .Finish
    .IBGE
      .CaseSensitive(cbCaseSensitive.Checked)
      .NomeCache(edtCacheName.Text)
      .ValidadeCache(edtCacheValid.Text)
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
  cbxWebService.SetFocus;
  Memo.Lines.Clear;
end;

procedure TPageMain.ResultadoCEP;
begin
  TThread.CreateAnonymousThread(procedure
  begin
    TThread.Synchronize(TThread.CurrentThread, procedure
    var
      LJSON : TJSONObject;
    begin
      Memo.Lines.Clear;
      Memo.Lines.Add( StringOfChar('-',20) );
      Memo.Lines.Add('Retorno por variável');
      Memo.Lines.Add( StringOfChar('-',20) );
      Memo.Lines.Add(EmptyStr);
      Memo.Lines.Add('CEP: ' + FCEP.Result.ZIPCode.Display.Code);
      Memo.Lines.Add('Tipo: '+ FCEP.Result.ZIPCode.Display.Types);
      Memo.Lines.Add('Rua: ' + FCEP.Result.ZIPCode.Display.Street);
      Memo.Lines.Add('Rua Completa: ' + FCEP.Result.ZIPCode.Display.StreetComplete);
      Memo.Lines.Add('Complemento: ' + FCEP.Result.ZIPCode.Display.Complement);
      Memo.Lines.Add('Bairro: ' + FCEP.Result.ZIPCode.Display.District);
      Memo.Lines.Add('Cidade: '+ FCEP.Result.ZIPCode.Display.City);
      Memo.Lines.Add('IBGE Cidade: ' + FCEP.Result.ZIPCode.Display.IBGECity);
      Memo.Lines.Add('Estado: ' + FCEP.Result.ZIPCode.Display.State);
      Memo.Lines.Add('IBGE Estado: ' + FCEP.Result.ZIPCode.Display.IBGEState);
      Memo.Lines.Add('DDD: ' + FCEP.Result.ZIPCode.Display.DDD);
      Memo.Lines.Add('GIA (Gerência de Informações de Arrecadação): ' + FCEP.Result.ZIPCode.Display.GIA);
      Memo.Lines.Add('SIAFI (Sistema Integrado de Administração Financeira): ' + FCEP.Result.ZIPCode.Display.SIAFI);
      Memo.Lines.Add('Altitude: ' + FCEP.Result.ZIPCode.Display.Altitude);
      Memo.Lines.Add('Latitude: ' + FCEP.Result.ZIPCode.Display.Latitude);
      Memo.Lines.Add('Longitude: ' + FCEP.Result.ZIPCode.Display.Longitude);

      Memo.Lines.Add(EmptyStr);
      Memo.Lines.Add( StringOfChar('-',20) );
      Memo.Lines.Add('JSON Formatado');
      Memo.Lines.Add(FCEP.Result.ZIPCode.JSONObject.Format);
      Memo.Lines.Add( StringOfChar('-',20) );
      Memo.Lines.Add(EmptyStr);

      Memo.Lines.Add(EmptyStr);
      Memo.Lines.Add( StringOfChar('-',20) );
      Memo.Lines.Add('Retorno TJSONObject por OUT');
      FCEP.Result.ZIPCode.JSONObject(LJSON);
      Memo.Lines.Add(LJSON.ToString);
      Memo.Lines.Add( StringOfChar('-',20) );
      Memo.Lines.Add(EmptyStr);

      Memo.Lines.Add(EmptyStr);
      Memo.Lines.Add( StringOfChar('-',20) );
      Memo.Lines.Add('Retorno do TJSONObject');
      Memo.Lines.Add(FCEP.Result.ZIPCode.JSONObject.ToJSON);
      Memo.Lines.Add( StringOfChar('-',20) );
      Memo.Lines.Add(EmptyStr);

      Memo.Lines.Add(EmptyStr);
      Memo.Lines.Add( StringOfChar('-',20) );
      Memo.Lines.Add('Retorno por String');
      Memo.Lines.Add(FCEP.Result.ZIPCode.JSONObjectInStr);
      Memo.Lines.Add( StringOfChar('-',20) );
      Memo.Lines.Add(EmptyStr);

      Memo.Lines.Add(EmptyStr);
      Memo.Lines.Add( StringOfChar('-',20) );
      Memo.Lines.Add('JSON Array');
      Memo.Lines.Add(FCEP.Result.ZIPCode.JSONArray.Format);
      Memo.Lines.Add( StringOfChar('-',20) );
      Memo.Lines.Add(EmptyStr);

      Memo.Lines.Add(EmptyStr);
      Memo.Lines.Add( StringOfChar('-',20) );
      Memo.Lines.Add('Total de Registro');
      Memo.Lines.Add('Total: ' + FCEP.Result.ZIPCode.RecordCount.ToString);
      Memo.Lines.Add( StringOfChar('-',20) );
      Memo.Lines.Add(EmptyStr);

      Memo.Lines.Add(EmptyStr);
      Memo.Lines.Add( StringOfChar('-',20) );
      Memo.Lines.Add('Total de Registro (String)');
      Memo.Lines.Add('Total: ' + FCEP.Result.ZIPCode.RecordCountInStr);
      Memo.Lines.Add( StringOfChar('-',20) );
      Memo.Lines.Add(EmptyStr);

    end)
  end).Start;
end;

procedure TPageMain.SetupFields;
begin
  TThread.CreateAnonymousThread(procedure
  begin
    TThread.Synchronize(TThread.CurrentThread, procedure
    begin
      FController.LerINI;

      cbxWebService.ItemIndex := FController.WebService.Index;
      edtChave.Text := FController.WebService.Chave;
      edtUserWebService.Text := FController.WebService.users;
      edtPassWebService.Text := FController.WebService.PassW;
      edtTimeOutWebService.Text := TSetup4DUtility.IIF<string>(FController.WebService.TimeOut = 0, EmptyStr, FController.WebService.TimeOutInStr);
      cbParseText.Checked := FController.WebService.ParseText;

      edtHost.Text := FController.Proxy.Host;
      edtPort.Text := TSetup4DUtility.IIF<string>(FController.Proxy.Port = 0, EmptyStr, FController.Proxy.PortInStr);
      edtUserProxy.Text := FController.Proxy.User;
      edtPassProxy.Text := FController.Proxy.Pass;

      cbPesquisarIBGE.Checked := FController.CEP.ForcarIBGE;

      cbCaseSensitive.Checked := FController.IBGE.CaseSensitive;
      edtCacheName.Text := FController.IBGE.NomeCache;
      edtCacheValid.Text := TSetup4DUtility.IIF<string>(FController.IBGE.ValidadeCache = 0, EmptyStr, FController.IBGE.ValidadeCacheInStr);

      edtCEP.Text := '25812-360';

      edtCodigoIBGE.Text := '3300100';

      cbxWebServiceSelect(Self);
    end)
  end).Start;

end;

procedure TPageMain.SetupListComboBox;
begin
  TThread.CreateAnonymousThread(procedure
  begin
    TThread.Synchronize(TThread.CurrentThread, procedure
    begin
      TSetup4DUtilityGeneric<TSetup4DCEPWebService>.EnumToList(cbxWebService.Items);
      TSetup4DUtilityGeneric<TSetup4DUtilityEstadoAbreviado>.EnumToList(cbxUF.Items, '_', EmptyStr);
      cbxUFIBGE.Items := cbxUF.Items;
    end)
  end).Start;
end;

procedure TPageMain.ResultadoIBGE;
begin

  TThread.CreateAnonymousThread(procedure
  begin
    TThread.Synchronize(TThread.CurrentThread, procedure
    var
      LJSON : TJSONObject;
    begin
      Memo.Lines.Clear;
      Memo.Lines.Add( StringOfChar('-',20) );
      Memo.Lines.Add('Retorno por variável');
      Memo.Lines.Add( StringOfChar('-',20) );
      Memo.Lines.Add(EmptyStr);
      Memo.Lines.Add('Código UF: ' + FCEP.Result.IBGE.Display.StateCode);
      Memo.Lines.Add('UF: '+ FCEP.Result.IBGE.Display.State);
      Memo.Lines.Add('Código Município: ' + FCEP.Result.IBGE.Display.CityCode);
      Memo.Lines.Add('Município: ' + FCEP.Result.IBGE.Display.City);
      Memo.Lines.Add('Área: ' + FCEP.Result.IBGE.Display.Zone);

      Memo.Lines.Add(EmptyStr);
      Memo.Lines.Add( StringOfChar('-',20) );
      Memo.Lines.Add('JSON Formatado');
      Memo.Lines.Add(FCEP.Result.IBGE.JSONObject.Format);
      Memo.Lines.Add( StringOfChar('-',20) );
      Memo.Lines.Add(EmptyStr);

      Memo.Lines.Add(EmptyStr);
      Memo.Lines.Add( StringOfChar('-',20) );
      Memo.Lines.Add('Retorno TJSONObject por OUT');
      FCEP.Result.IBGE.JSONObject(LJSON);
      Memo.Lines.Add(LJSON.ToString);
      Memo.Lines.Add( StringOfChar('-',20) );
      Memo.Lines.Add(EmptyStr);

      Memo.Lines.Add(EmptyStr);
      Memo.Lines.Add( StringOfChar('-',20) );
      Memo.Lines.Add('Retorno do TJSONObject');
      Memo.Lines.Add(FCEP.Result.IBGE.JSONObject.ToJSON);
      Memo.Lines.Add( StringOfChar('-',20) );
      Memo.Lines.Add(EmptyStr);

      Memo.Lines.Add(EmptyStr);
      Memo.Lines.Add( StringOfChar('-',20) );
      Memo.Lines.Add('Retorno por String');
      Memo.Lines.Add(FCEP.Result.IBGE.JSONObjectInStr);
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
