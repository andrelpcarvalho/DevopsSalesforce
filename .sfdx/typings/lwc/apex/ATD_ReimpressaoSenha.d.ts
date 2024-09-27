declare module "@salesforce/apex/ATD_ReimpressaoSenha.getCardList" {
  export default function getCardList(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_ReimpressaoSenha.reqReprint" {
  export default function reqReprint(param: {recordId: any, contaCartao: any, numeroCartao: any, correlativo: any, emissor: any, filial: any, produto: any, tipoEnvio: any, dadosEnvio: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_ReimpressaoSenha.getSendTypeData" {
  export default function getSendTypeData(param: {dispatchType: any, recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_ReimpressaoSenha.tabulateCase" {
  export default function tabulateCase(param: {recordId: any, contaCartao: any, numeroCartao: any, tipoEnvio: any, dadosEnvio: any, statusCode: any, permiteSms: any}): Promise<any>;
}
