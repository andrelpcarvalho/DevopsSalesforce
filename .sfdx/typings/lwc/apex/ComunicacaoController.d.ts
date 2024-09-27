declare module "@salesforce/apex/ComunicacaoController.getFileUploadSettings" {
  export default function getFileUploadSettings(): Promise<any>;
}
declare module "@salesforce/apex/ComunicacaoController.deleteDocuments" {
  export default function deleteDocuments(param: {documentIds: any}): Promise<any>;
}
declare module "@salesforce/apex/ComunicacaoController.sendMessage" {
  export default function sendMessage(param: {caseId: any, textMessage: any, contentDocumentIds: any, caseParam: any}): Promise<any>;
}
declare module "@salesforce/apex/ComunicacaoController.getPicklist" {
  export default function getPicklist(param: {fieldName: any}): Promise<any>;
}
declare module "@salesforce/apex/ComunicacaoController.getStatusValues" {
  export default function getStatusValues(): Promise<any>;
}
declare module "@salesforce/apex/ComunicacaoController.updateStatusCase" {
  export default function updateStatusCase(param: {recordId: any, hasRDRError: any, erroMessage: any, caseParam: any}): Promise<any>;
}
declare module "@salesforce/apex/ComunicacaoController.nexStepValidation" {
  export default function nexStepValidation(param: {recordId: any, status: any}): Promise<any>;
}
declare module "@salesforce/apex/ComunicacaoController.isEnabledBacen" {
  export default function isEnabledBacen(): Promise<any>;
}
