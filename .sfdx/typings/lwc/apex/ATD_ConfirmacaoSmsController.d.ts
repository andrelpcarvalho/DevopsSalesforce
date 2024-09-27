declare module "@salesforce/apex/ATD_ConfirmacaoSmsController.buscarTelefone" {
  export default function buscarTelefone(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_ConfirmacaoSmsController.salvarTelefone" {
  export default function salvarTelefone(param: {recordId: any, telefone: any, vencimento: any, periodo: any, tab: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_ConfirmacaoSmsController.getTabs" {
  export default function getTabs(param: {tabCode: any}): Promise<any>;
}
