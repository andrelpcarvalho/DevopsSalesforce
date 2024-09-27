declare module "@salesforce/apex/OC_PaginaLimitesCTRL.pegarLista" {
  export default function pegarLista(param: {RecordID: any}): Promise<any>;
}
declare module "@salesforce/apex/OC_PaginaLimitesCTRL.pegarPreferencias" {
  export default function pegarPreferencias(): Promise<any>;
}
declare module "@salesforce/apex/OC_PaginaLimitesCTRL.atualizarPreferencias" {
  export default function atualizarPreferencias(param: {preferencia: any, objeto: any, tela: any}): Promise<any>;
}
declare module "@salesforce/apex/OC_PaginaLimitesCTRL.pegarListaProdutos" {
  export default function pegarListaProdutos(param: {codigoPessoa: any, codigosDelimitadores: any}): Promise<any>;
}
declare module "@salesforce/apex/OC_PaginaLimitesCTRL.pegarObservacoes" {
  export default function pegarObservacoes(param: {codigoLimiteCredito: any}): Promise<any>;
}
declare module "@salesforce/apex/OC_PaginaLimitesCTRL.pegarPorVencimentos" {
  export default function pegarPorVencimentos(param: {codigoFiltro: any, codigoLimiteCredito: any}): Promise<any>;
}
declare module "@salesforce/apex/OC_PaginaLimitesCTRL.pegarProdutosPermitidos" {
  export default function pegarProdutosPermitidos(param: {codigoLimiteCredito: any}): Promise<any>;
}
