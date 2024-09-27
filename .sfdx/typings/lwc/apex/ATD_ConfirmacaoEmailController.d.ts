declare module "@salesforce/apex/ATD_ConfirmacaoEmailController.consultaDadosPessoais" {
  export default function consultaDadosPessoais(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_ConfirmacaoEmailController.salvarEmailFatura" {
  export default function salvarEmailFatura(param: {recordId: any, email: any, source: any, codBarras: any, dataVencimento: any, periodo: any, tab: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_ConfirmacaoEmailController.getTabs" {
  export default function getTabs(param: {tabCode: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_ConfirmacaoEmailController.salvarEmailEmCase" {
  export default function salvarEmailEmCase(param: {recordId: any, email: any, source: any, numCartao: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_ConfirmacaoEmailController.sendEmailChecklist" {
  export default function sendEmailChecklist(param: {caseId: any, seguro: any, email: any}): Promise<any>;
}
