program Setup4DCEPSample;

uses
  Vcl.Forms,
  Setup4D.CEP.Sample.View.Main in 'src\view\Setup4D.CEP.Sample.View.Main.pas' {PageMain},
  Vcl.Themes,
  Vcl.Styles,
  Setup4D.CEP.Sample.Comum.Controller in '..\Comum\Controller\Setup4D.CEP.Sample.Comum.Controller.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Glossy');
  Application.CreateForm(TPageMain, PageMain);
  Application.Run;
end.
