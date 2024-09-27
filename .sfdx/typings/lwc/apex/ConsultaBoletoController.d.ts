declare module "@salesforce/apex/ConsultaBoletoController.getDadosCliente" {
  export default function getDadosCliente(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/ConsultaBoletoController.transferirFilaFraude" {
  export default function transferirFilaFraude(param: {recordId: any, dataPagamento: any, linhaDigitavel: any, valorPagamento: any}): Promise<any>;
}
declare module "@salesforce/apex/ConsultaBoletoController.transferirFilaBoleto" {
  export default function transferirFilaBoleto(param: {recordId: any, linhaDigitavel: any, dataPagamento: any, permissao: any, textArea: any, valorPagamento: any}): Promise<any>;
}
declare module "@salesforce/apex/ConsultaBoletoController.consultarBoleto" {
  export default function consultarBoleto(param: {recordId: any, codigoBoleto: any}): Promise<any>;
}
declare module "@salesforce/apex/ConsultaBoletoController.pagarBoleto" {
  export default function pagarBoleto(param: {recordId: any, jsonPagarBoleto: any, permissao: any, textArea: any}): Promise<any>;
}
declare module "@salesforce/apex/ConsultaBoletoController.salvarJustificativa" {
  export default function salvarJustificativa(param: {recordId: any, textArea: any, valor: any}): Promise<any>;
}
