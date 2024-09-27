declare module "@salesforce/apex/ATD_LimitesCartaoController.getListagemCartoesLimites" {
  export default function getListagemCartoesLimites(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_LimitesCartaoController.getLimite" {
  export default function getLimite(param: {recordId: any, emissor: any, produto: any, correlativo: any, filial: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_LimitesCartaoController.tabulaCaso" {
  export default function tabulaCaso(param: {recordId: any, numeroCartao: any, mapLimite: any, mapSaque: any, mapStatus: any}): Promise<any>;
}
