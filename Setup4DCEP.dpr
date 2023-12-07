program Setup4DCEP;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Setup4D.CEP in 'src\Setup4D.CEP.pas',
  Setup4D.CEP.Interf in 'src\Interfaces\Setup4D.CEP.Interf.pas',
  Setup4D.CEP.Configuration.Proxy in 'src\Configuration\Proxy\Setup4D.CEP.Configuration.Proxy.pas',
  Setup4D.CEP.Configuration.WebService in 'src\Configuration\Web Service\Setup4D.CEP.Configuration.WebService.pas',
  Setup4D.CEP.Configuration in 'src\Configuration\Setup4D.CEP.Configuration.pas',
  Setup4D.CEP.Filter in 'src\Filter\Setup4D.CEP.Filter.pas',
  Setup4D.CEP.Filter.ZipCode in 'src\Filter\Zip Code\Setup4D.CEP.Filter.ZipCode.pas',
  Setup4D.CEP.Filter.IBGE in 'src\Filter\IBGE\Setup4D.CEP.Filter.IBGE.pas',
  Setup4D.CEP.Searech in 'src\Searech\Setup4D.CEP.Searech.pas',
  Setup4D.CEP.Searech.IBGE in 'src\Searech\IBGE\Setup4D.CEP.Searech.IBGE.pas',
  Setup4D.CEP.Searech.ZipCode in 'src\Searech\Zip Code\Setup4D.CEP.Searech.ZipCode.pas',
  Setup4D.CEP.Result in 'src\Result\Setup4D.CEP.Result.pas',
  Setup4D.CEP.Result.ZIpCode in 'src\Result\Zip Code\Setup4D.CEP.Result.ZIpCode.pas',
  Setup4D.CEP.Result.IBGE in 'src\Result\IBGE\Setup4D.CEP.Result.IBGE.pas';

begin
end.
