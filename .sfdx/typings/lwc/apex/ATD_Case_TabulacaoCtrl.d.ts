declare module "@salesforce/apex/ATD_Case_TabulacaoCtrl.updateCase" {
  export default function updateCase(param: {recordId: any, motivo: any, submotivo: any, email: any, captacao: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_Case_TabulacaoCtrl.getResults" {
  export default function getResults(param: {ObjectName: any, fieldName: any, value: any, produto: any, rId: any, filtro: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_Case_TabulacaoCtrl.getResultsPickList" {
  export default function getResultsPickList(param: {idLookup: any, produto: any, filtro: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_Case_TabulacaoCtrl.getResultsLookup" {
  export default function getResultsLookup(param: {value: any, idLookup: any, produto: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_Case_TabulacaoCtrl.verificaCaptacao" {
  export default function verificaCaptacao(param: {idLookup: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_Case_TabulacaoCtrl.verificaComentarios" {
  export default function verificaComentarios(param: {recordId: any, motivoId: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_Case_TabulacaoCtrl.verificaAnexos" {
  export default function verificaAnexos(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_Case_TabulacaoCtrl.getTreatmentReason" {
  export default function getTreatmentReason(param: {reasonId: any, businessArea: any}): Promise<any>;
}
