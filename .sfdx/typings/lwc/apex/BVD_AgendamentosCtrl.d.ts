declare module "@salesforce/apex/BVD_AgendamentosCtrl.consultarLancamentos" {
  export default function consultarLancamentos(param: {caseId: any, dataInicio: any, dataFim: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_AgendamentosCtrl.geraLogConsulta" {
  export default function geraLogConsulta(param: {caseId: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_AgendamentosCtrl.cancelarAgendamento" {
  export default function cancelarAgendamento(param: {caseId: any, nsu: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_AgendamentosCtrl.geraLogCancelamento" {
  export default function geraLogCancelamento(param: {pCaseId: any, pLancamento: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_AgendamentosCtrl.doSendEmail" {
  export default function doSendEmail(param: {pCaseId: any, pLancamento: any}): Promise<any>;
}
