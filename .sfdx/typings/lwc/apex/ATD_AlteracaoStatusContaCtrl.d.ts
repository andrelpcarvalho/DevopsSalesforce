declare module "@salesforce/apex/ATD_AlteracaoStatusContaCtrl.loadStatus" {
  export default function loadStatus(param: {statusCode: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_AlteracaoStatusContaCtrl.alteracaoStatus" {
  export default function alteracaoStatus(param: {recordId: any, tabulacaoId: any, statusCode: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_AlteracaoStatusContaCtrl.getResults" {
  export default function getResults(param: {ObjectName: any, fieldName: any, value: any, statusCode: any}): Promise<any>;
}
