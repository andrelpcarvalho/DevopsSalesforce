declare module "@salesforce/apex/RenegotiationController.getRenegotiationStatus" {
  export default function getRenegotiationStatus(param: {contrato: any, sqFinanceira: any}): Promise<any>;
}
declare module "@salesforce/apex/RenegotiationController.cancelRenegotiation" {
  export default function cancelRenegotiation(param: {contrato: any, cpfCnpj: any}): Promise<any>;
}
declare module "@salesforce/apex/RenegotiationController.getRenegotiationHistoric" {
  export default function getRenegotiationHistoric(param: {contrato: any}): Promise<any>;
}
declare module "@salesforce/apex/RenegotiationController.getCalculoRenegContrato" {
  export default function getCalculoRenegContrato(param: {body: any}): Promise<any>;
}
declare module "@salesforce/apex/RenegotiationController.sendRenegotiation" {
  export default function sendRenegotiation(param: {req: any}): Promise<any>;
}
declare module "@salesforce/apex/RenegotiationController.sendRenegotiationInadiplente" {
  export default function sendRenegotiationInadiplente(param: {req: any, reqRetry: any, reqBoleto: any}): Promise<any>;
}
declare module "@salesforce/apex/RenegotiationController.getDataClient" {
  export default function getDataClient(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/RenegotiationController.calculateEntrance" {
  export default function calculateEntrance(param: {req: any}): Promise<any>;
}
declare module "@salesforce/apex/RenegotiationController.getContractAdicionalInfo" {
  export default function getContractAdicionalInfo(param: {nrContrato: any}): Promise<any>;
}
declare module "@salesforce/apex/RenegotiationController.getInfoAutomaticTab" {
  export default function getInfoAutomaticTab(param: {tabName: any}): Promise<any>;
}
