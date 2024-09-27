declare module "@salesforce/apex/FIN_ListaContratosFinanceiraCtrl.getInfoCase" {
  export default function getInfoCase(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/FIN_ListaContratosFinanceiraCtrl.getContratosInativos" {
  export default function getContratosInativos(param: {cpfCnpj: any}): Promise<any>;
}
declare module "@salesforce/apex/FIN_ListaContratosFinanceiraCtrl.getMapMotivosFinanceiros" {
  export default function getMapMotivosFinanceiros(): Promise<any>;
}
declare module "@salesforce/apex/FIN_ListaContratosFinanceiraCtrl.checkStatusService" {
  export default function checkStatusService(param: {contrato: any, sqFinanceira: any}): Promise<any>;
}
declare module "@salesforce/apex/FIN_ListaContratosFinanceiraCtrl.eligibilityService" {
  export default function eligibilityService(param: {header: any}): Promise<any>;
}
declare module "@salesforce/apex/FIN_ListaContratosFinanceiraCtrl.getRepaymentValues" {
  export default function getRepaymentValues(param: {cpfCnpj: any}): Promise<any>;
}
declare module "@salesforce/apex/FIN_ListaContratosFinanceiraCtrl.saveLogChangeContract" {
  export default function saveLogChangeContract(param: {selectedContract: any, lastProduct: any, actualProduct: any, recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/FIN_ListaContratosFinanceiraCtrl.isAvaliableRenegCarne" {
  export default function isAvaliableRenegCarne(param: {contractNumber: any, productCode: any, financialReason: any}): Promise<any>;
}
declare module "@salesforce/apex/FIN_ListaContratosFinanceiraCtrl.saveContract" {
  export default function saveContract(param: {numeroContrato: any, caseId: any}): Promise<any>;
}
