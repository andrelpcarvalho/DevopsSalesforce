declare module "@salesforce/apex/ATD_FinalizarAtendimentoCtrl.dadosTabulacao" {
  export default function dadosTabulacao(param: {tabulacao: any, recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_FinalizarAtendimentoCtrl.continuarAtendimento" {
  export default function continuarAtendimento(param: {recordId: any, protocolo: any, tabulacao: any, reclama: any, casesToFinish: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_FinalizarAtendimentoCtrl.finalizarAtendimento" {
  export default function finalizarAtendimento(param: {recordId: any, tabulacao: any, reclama: any, casesToFinish: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_FinalizarAtendimentoCtrl.tratarAtendimento" {
  export default function tratarAtendimento(param: {caseId: any, tab: any, isReclamacao: any, createNewCase: any, captacao: any, casesToFinish: any}): Promise<any>;
}
