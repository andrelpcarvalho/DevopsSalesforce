declare module "@salesforce/apex/BVD_Novos_Pagamentos_Controller.getInfoCase" {
  export default function getInfoCase(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_Novos_Pagamentos_Controller.salvarDadosTransacao" {
  export default function salvarDadosTransacao(param: {objControle: any, recordId: any, valor: any, valorBRL: any, pedidoCliente: any, bodyServicoTed: any, fila: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_Novos_Pagamentos_Controller.salvarJustificativa" {
  export default function salvarJustificativa(param: {recordId: any, textArea: any, valor: any, favorecido: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_Novos_Pagamentos_Controller.salvarDadosTransacaoFilaTransacional" {
  export default function salvarDadosTransacaoFilaTransacional(param: {objControle: any, recordId: any, valor: any, valorBRL: any, textArea: any, bodyServicoTed: any, fila: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_Novos_Pagamentos_Controller.getListarBancos" {
  export default function getListarBancos(): Promise<any>;
}
declare module "@salesforce/apex/BVD_Novos_Pagamentos_Controller.validaQtdDigitosConta" {
  export default function validaQtdDigitosConta(param: {conta: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_Novos_Pagamentos_Controller.featureToggleChecker" {
  export default function featureToggleChecker(param: {featureEntry: any}): Promise<any>;
}
