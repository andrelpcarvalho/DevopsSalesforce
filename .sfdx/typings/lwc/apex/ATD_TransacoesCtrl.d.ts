declare module "@salesforce/apex/ATD_TransacoesCtrl.getCards" {
  export default function getCards(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_TransacoesCtrl.getTransactionStatus" {
  export default function getTransactionStatus(): Promise<any>;
}
declare module "@salesforce/apex/ATD_TransacoesCtrl.getTransactions" {
  export default function getTransactions(param: {recordId: any, requestJSON: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_TransacoesCtrl.getTransactionDetail" {
  export default function getTransactionDetail(param: {recordId: any, transactionId: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_TransacoesCtrl.checkPermissionSet" {
  export default function checkPermissionSet(param: {component: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_TransacoesCtrl.getByPass" {
  export default function getByPass(param: {recordId: any, card: any, transction: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_TransacoesCtrl.tabCase" {
  export default function tabCase(param: {caso: any, tabLabel: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_TransacoesCtrl.getCase" {
  export default function getCase(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_TransacoesCtrl.checkValidCard" {
  export default function checkValidCard(param: {cardStatus: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_TransacoesCtrl.checkPidInitialization" {
  export default function checkPidInitialization(param: {recordId: any, servico: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_TransacoesCtrl.getListaTabulacao" {
  export default function getListaTabulacao(param: {label: any}): Promise<any>;
}
