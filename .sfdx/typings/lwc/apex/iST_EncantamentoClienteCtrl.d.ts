declare module "@salesforce/apex/iST_EncantamentoClienteCtrl.getIstbyAcc" {
  export default function getIstbyAcc(param: {accId: any, caseId: any}): Promise<any>;
}
declare module "@salesforce/apex/iST_EncantamentoClienteCtrl.regIstFechado" {
  export default function regIstFechado(param: {istId: any, Status: any}): Promise<any>;
}
declare module "@salesforce/apex/iST_EncantamentoClienteCtrl.regPopAberto" {
  export default function regPopAberto(param: {istId: any, CaseId: any, dInterval: any}): Promise<any>;
}
declare module "@salesforce/apex/iST_EncantamentoClienteCtrl.regPopFechado" {
  export default function regPopFechado(param: {istId: any, CaseId: any, dInterval: any}): Promise<any>;
}
declare module "@salesforce/apex/iST_EncantamentoClienteCtrl.regVIC" {
  export default function regVIC(param: {istId: any, accountId: any, caseId: any}): Promise<any>;
}
declare module "@salesforce/apex/iST_EncantamentoClienteCtrl.loggerPopOverOpen" {
  export default function loggerPopOverOpen(param: {istId: any, accountId: any, caseId: any, tipoInsight: any, optionPropDigital: any, ordinaryPlace: any}): Promise<any>;
}
declare module "@salesforce/apex/iST_EncantamentoClienteCtrl.loggerPopOverClose" {
  export default function loggerPopOverClose(param: {istId: any, accountId: any, caseId: any, tipoInsight: any, optionPropDigital: any, ordinaryPlace: any}): Promise<any>;
}
declare module "@salesforce/apex/iST_EncantamentoClienteCtrl.loggerPopOverAcaoTomada" {
  export default function loggerPopOverAcaoTomada(param: {istId: any, accountId: any, caseId: any, tipoInsight: any, optionPropDigital: any, ordinaryPlace: any}): Promise<any>;
}
declare module "@salesforce/apex/iST_EncantamentoClienteCtrl.loggerSaibaMais" {
  export default function loggerSaibaMais(param: {istId: any, accountId: any, caseId: any}): Promise<any>;
}
