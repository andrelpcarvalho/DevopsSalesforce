declare module "@salesforce/apex/ATD_AumentoLimiteAutomaticoCtrl.getSituacaoLimiteAutomatico" {
  export default function getSituacaoLimiteAutomatico(param: {numeroConta: any, emissor: any, filialEmissor: any, produto: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_AumentoLimiteAutomaticoCtrl.enableDisableAutomaticLimitIncrease" {
  export default function enableDisableAutomaticLimitIncrease(param: {recordId: any, numeroConta: any, emissor: any, filialEmissor: any, produto: any, optIn: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_AumentoLimiteAutomaticoCtrl.getProduct" {
  export default function getProduct(param: {recordId: any}): Promise<any>;
}
