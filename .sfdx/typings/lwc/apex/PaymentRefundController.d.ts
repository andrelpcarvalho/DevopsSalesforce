declare module "@salesforce/apex/PaymentRefundController.getAmountToBeRefunded" {
  export default function getAmountToBeRefunded(param: {invoiceJSON: any}): Promise<any>;
}
declare module "@salesforce/apex/PaymentRefundController.checkPaymentOnStatement" {
  export default function checkPaymentOnStatement(param: {statementJSON: any, paymentsJSON: any}): Promise<any>;
}
declare module "@salesforce/apex/PaymentRefundController.getBanks" {
  export default function getBanks(): Promise<any>;
}
declare module "@salesforce/apex/PaymentRefundController.getBankCodes" {
  export default function getBankCodes(): Promise<any>;
}
declare module "@salesforce/apex/PaymentRefundController.getDigitalAccountStatement" {
  export default function getDigitalAccountStatement(param: {request: any, initialDate: any, finalDate: any}): Promise<any>;
}
declare module "@salesforce/apex/PaymentRefundController.performPaymentRefund" {
  export default function performPaymentRefund(param: {recordId: any, requestBody: any}): Promise<any>;
}
declare module "@salesforce/apex/PaymentRefundController.tabulateAndUpdateCase" {
  export default function tabulateAndUpdateCase(param: {recordId: any, tabLabel: any, serviceInformation: any, refundInformation: any}): Promise<any>;
}
declare module "@salesforce/apex/PaymentRefundController.transferCase" {
  export default function transferCase(param: {recordId: any, queue: any, bankData: any, serviceInformation: any}): Promise<any>;
}
declare module "@salesforce/apex/PaymentRefundController.rejectCase" {
  export default function rejectCase(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/PaymentRefundController.requestPagM" {
  export default function requestPagM(param: {favoredData: any, issuerBranch: any}): Promise<any>;
}
declare module "@salesforce/apex/PaymentRefundController.registerCaseLog" {
  export default function registerCaseLog(param: {recordId: any, logTitle: any, logJson: any}): Promise<any>;
}
declare module "@salesforce/apex/PaymentRefundController.featureToggleChecker" {
  export default function featureToggleChecker(param: {featureEntry: any}): Promise<any>;
}
declare module "@salesforce/apex/PaymentRefundController.getPaymentComponentData" {
  export default function getPaymentComponentData(param: {recordId: any, userId: any}): Promise<any>;
}
