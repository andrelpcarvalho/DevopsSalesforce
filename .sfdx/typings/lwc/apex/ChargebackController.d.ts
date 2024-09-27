declare module "@salesforce/apex/ChargebackController.performChargeback" {
  export default function performChargeback(param: {requestBody: any}): Promise<any>;
}
declare module "@salesforce/apex/ChargebackController.tabulateCaseEstorno" {
  export default function tabulateCaseEstorno(param: {recordId: any, tabLabel: any, vlrTotal: any, vlrEstorno: any}): Promise<any>;
}
declare module "@salesforce/apex/ChargebackController.tabulateCaseEspecialista" {
  export default function tabulateCaseEspecialista(param: {recordId: any, tabLabel: any, vlrExcedido: any}): Promise<any>;
}
declare module "@salesforce/apex/ChargebackController.isAbleToChargeback" {
  export default function isAbleToChargeback(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/ChargebackController.logCase" {
  export default function logCase(param: {recordId: any, logId: any, logTitle: any, logJson: any}): Promise<any>;
}
