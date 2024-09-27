declare module "@salesforce/apex/ATD_PreferenciaEnvioFaturaCtrl.getProduct" {
  export default function getProduct(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_PreferenciaEnvioFaturaCtrl.getMetodoEnvioAtual" {
  export default function getMetodoEnvioAtual(param: {recordId: any, numeroConta: any, emissor: any, filialEmissor: any, produto: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_PreferenciaEnvioFaturaCtrl.updateMetodoEnvio" {
  export default function updateMetodoEnvio(param: {recordId: any, numeroConta: any, emissor: any, filialEmissor: any, produto: any, enviaFaturaFisica: any}): Promise<any>;
}
