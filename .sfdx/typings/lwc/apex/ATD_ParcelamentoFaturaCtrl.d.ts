declare module "@salesforce/apex/ATD_ParcelamentoFaturaCtrl.getInstallmentLimit" {
  export default function getInstallmentLimit(): Promise<any>;
}
declare module "@salesforce/apex/ATD_ParcelamentoFaturaCtrl.verificaParcela" {
  export default function verificaParcela(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_ParcelamentoFaturaCtrl.simulaParcela" {
  export default function simulaParcela(param: {recordId: any, pgValor: any, pgData: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_ParcelamentoFaturaCtrl.contrataParcela" {
  export default function contrataParcela(param: {recordId: any, parcela: any, mesReferencia: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_ParcelamentoFaturaCtrl.tabulacaoSair" {
  export default function tabulacaoSair(param: {recordId: any}): Promise<any>;
}
