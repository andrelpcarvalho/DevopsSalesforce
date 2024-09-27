declare module "@salesforce/apex/ATD_ResumoLimiteCtrl.getCardList" {
  export default function getCardList(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_ResumoLimiteCtrl.getLimiteRotativo" {
  export default function getLimiteRotativo(param: {recordId: any, contaCartao: any, emissor: any, filial: any, produto: any, correlativo: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_ResumoLimiteCtrl.getLimiteGeral" {
  export default function getLimiteGeral(param: {recordId: any, contaCartao: any, emissor: any, filial: any, produto: any, correlativo: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_ResumoLimiteCtrl.tabulaCaso" {
  export default function tabulaCaso(param: {recordId: any, numeroCartao: any, mapLimite: any, mapSaque: any, mapStatus: any}): Promise<any>;
}
