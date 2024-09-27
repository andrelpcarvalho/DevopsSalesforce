declare module "@salesforce/apex/ReimpressaoSenhaController.reqReprint" {
  export default function reqReprint(param: {recordId: any, contaCartao: any, card: any, produto: any, tipoEnvio: any, dadosPessoais: any}): Promise<any>;
}
declare module "@salesforce/apex/ReimpressaoSenhaController.getSendTypeData" {
  export default function getSendTypeData(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/ReimpressaoSenhaController.tabulateCase" {
  export default function tabulateCase(param: {recordId: any, contaCartao: any, numeroCartao: any, tipoEnvio: any, dadosEnvio: any, status: any, permiteSms: any}): Promise<any>;
}
