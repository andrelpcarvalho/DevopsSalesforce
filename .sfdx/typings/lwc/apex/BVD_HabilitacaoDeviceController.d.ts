declare module "@salesforce/apex/BVD_HabilitacaoDeviceController.gerarLog" {
  export default function gerarLog(param: {caseId: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_HabilitacaoDeviceController.getPickListFromCase" {
  export default function getPickListFromCase(param: {rTypeDevName: any, fieldApiName: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_HabilitacaoDeviceController.getPickListFromComentarioAtendimento" {
  export default function getPickListFromComentarioAtendimento(param: {rTypeDevName: any, fieldApiName: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_HabilitacaoDeviceController.salvarCampos" {
  export default function salvarCampos(param: {caseId: any, transacaoAprovada: any, descricao: any, analise: any, justificativa: any, contato: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_HabilitacaoDeviceController.finalizarCaso" {
  export default function finalizarCaso(param: {caseId: any}): Promise<any>;
}
