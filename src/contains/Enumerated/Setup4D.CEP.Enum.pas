unit Setup4D.CEP.Enum;

interface

type
{$SCOPEDENUMS ON}
  /// <summary>
  /// Enumeração que representa os serviços web de consulta de CEP disponíveis.
  /// </summary>
  /// <remarks>
  /// Esta enumeração lista os diferentes serviços web que podem ser usados para consultar informações de CEP.
  /// </remarks>
  TSetup4DCEPWebService = (Nenhum, BuscarCep, CepLivre, RepublicaVirtual,
    Bases4you, RNSolucoes, KingHost, ByJG, Correios, DevMedia, ViaCep,
    CorreiosSIGEP, CepAberto, WSCep, OpenCep, BrasilAPI);
{$SCOPEDENUMS OFF}


implementation

end.
