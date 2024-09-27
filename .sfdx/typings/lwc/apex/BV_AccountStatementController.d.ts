declare module "@salesforce/apex/BV_AccountStatementController.CalloutResponseStatement" {
  export default function CalloutResponseStatement(param: {recordId: any, dataInicial: any, dataFinal: any}): Promise<any>;
}
declare module "@salesforce/apex/BV_AccountStatementController.inserirLogSaldo" {
  export default function inserirLogSaldo(param: {caseId: any, tipoLancamento: any, dataDe: any, dataAte: any}): Promise<any>;
}
declare module "@salesforce/apex/BV_AccountStatementController.gerarPDF" {
  export default function gerarPDF(param: {recordId: any, dataInicial: any, dataFinal: any}): Promise<any>;
}
