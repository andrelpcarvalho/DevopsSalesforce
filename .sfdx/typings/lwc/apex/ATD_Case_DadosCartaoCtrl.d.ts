declare module "@salesforce/apex/ATD_Case_DadosCartaoCtrl.getListagemCartoes" {
  export default function getListagemCartoes(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_Case_DadosCartaoCtrl.alterarStatusCartao" {
  export default function alterarStatusCartao(param: {recordId: any, sourceRequest: any, numCartao: any, motivoAlteracao: any, segundaVia: any, funcionalidade: any, codigoStatusCartao: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_Case_DadosCartaoCtrl.getDetalhamentoCartao" {
  export default function getDetalhamentoCartao(param: {recordId: any, numCartao: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_Case_DadosCartaoCtrl.atualizaStatusCredito" {
  export default function atualizaStatusCredito(param: {recordId: any, emissor: any, filial: any, contaCartao: any, correlativo: any, produto: any, statusCredito: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_Case_DadosCartaoCtrl.getCardRequestStatus" {
  export default function getCardRequestStatus(param: {card: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_Case_DadosCartaoCtrl.checkPermissionSet" {
  export default function checkPermissionSet(param: {component: any}): Promise<any>;
}
