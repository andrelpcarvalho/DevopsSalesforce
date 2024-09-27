declare module "@salesforce/apex/CancelamentoContaController.getEstado" {
  export default function getEstado(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/CancelamentoContaController.getSituacaoReceita" {
  export default function getSituacaoReceita(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/CancelamentoContaController.cancelarConta" {
  export default function cancelarConta(param: {recordId: any, codigoStatus: any, motivoStatus: any}): Promise<any>;
}
declare module "@salesforce/apex/CancelamentoContaController.getCache" {
  export default function getCache(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/CancelamentoContaController.temArquivo" {
  export default function temArquivo(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/CancelamentoContaController.salvarTabulacaoCaso" {
  export default function salvarTabulacaoCaso(param: {recordId: any, labelTabulacao: any}): Promise<any>;
}
declare module "@salesforce/apex/CancelamentoContaController.getResults" {
  export default function getResults(param: {value: any, statusCode: any}): Promise<any>;
}
