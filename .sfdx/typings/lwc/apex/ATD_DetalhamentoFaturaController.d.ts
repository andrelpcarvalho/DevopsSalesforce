declare module "@salesforce/apex/ATD_DetalhamentoFaturaController.tabulaFatura" {
  export default function tabulaFatura(param: {recordId: any, tabulacao: any, vencimento: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_DetalhamentoFaturaController.consultaDadosPessoais" {
  export default function consultaDadosPessoais(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_DetalhamentoFaturaController.enviaEmailBoleto" {
  export default function enviaEmailBoleto(param: {recordId: any, parametrosFatura: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_DetalhamentoFaturaController.envia2ViaEmail" {
  export default function envia2ViaEmail(param: {recordId: any, parametrosFatura: any, tabulacao: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_DetalhamentoFaturaController.checkPermissionSet" {
  export default function checkPermissionSet(param: {component: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_DetalhamentoFaturaController.salvarComentario" {
  export default function salvarComentario(param: {comentarioAtendimento: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_DetalhamentoFaturaController.buscarFaturas" {
  export default function buscarFaturas(param: {recordId: any, mesReferencia: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_DetalhamentoFaturaController.verificaFaturaEstorno" {
  export default function verificaFaturaEstorno(param: {recordId: any, invoice: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_DetalhamentoFaturaController.obterRubricasValidasCancelamentoComp" {
  export default function obterRubricasValidasCancelamentoComp(): Promise<any>;
}
declare module "@salesforce/apex/ATD_DetalhamentoFaturaController.isAvaliableReversal" {
  export default function isAvaliableReversal(): Promise<any>;
}
