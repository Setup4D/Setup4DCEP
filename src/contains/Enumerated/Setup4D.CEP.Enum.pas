unit Setup4D.CEP.Enum;

interface

type
{$SCOPEDENUMS ON}
  /// <summary>
  /// Enumera��o que representa os servi�os web de consulta de CEP dispon�veis.
  /// </summary>
  /// <remarks>
  /// Esta enumera��o lista os diferentes servi�os web que podem ser usados para consultar informa��es de CEP.
  /// </remarks>
  TSetup4DCEPWebService = (Nenhum, BuscarCep, CepLivre, RepublicaVirtual,
    Bases4you, RNSolucoes, KingHost, ByJG, Correios, DevMedia, ViaCep,
    CorreiosSIGEP, CepAberto, WSCep, OpenCep, BrasilAPI);
{$SCOPEDENUMS OFF}


implementation

end.
