declare module "@salesforce/apex/ATD_CancelamentoServicoCtrl.getListagemCartoesLimites" {
  export default function getListagemCartoesLimites(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_CancelamentoServicoCtrl.getServicos" {
  export default function getServicos(param: {emissor: any, filial: any, produto: any, contaCartao: any, correlativo: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_CancelamentoServicoCtrl.cancelarServico" {
  export default function cancelarServico(param: {recordId: any, emissor: any, filial: any, produto: any, contaCartao: any, correlativo: any, codigoServico: any, descServico: any, tabulacao: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_CancelamentoServicoCtrl.getResultsPickList" {
  export default function getResultsPickList(param: {codigoServico: any}): Promise<any>;
}
