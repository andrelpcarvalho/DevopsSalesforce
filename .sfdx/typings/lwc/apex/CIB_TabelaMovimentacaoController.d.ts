declare module "@salesforce/apex/CIB_TabelaMovimentacaoController.obterProdutos" {
  export default function obterProdutos(): Promise<any>;
}
declare module "@salesforce/apex/CIB_TabelaMovimentacaoController.obterMovimentacoes" {
  export default function obterMovimentacoes(param: {tipoOperacao: any, recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/CIB_TabelaMovimentacaoController.obterAplicacoesPorData" {
  export default function obterAplicacoesPorData(param: {data: any, recordId: any, tipoOperacao: any, filtro: any}): Promise<any>;
}
