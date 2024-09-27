declare module "@salesforce/apex/UnprocessedPaymentController.getBusinessHours" {
  export default function getBusinessHours(): Promise<any>;
}
declare module "@salesforce/apex/UnprocessedPaymentController.checkDateValidity" {
  export default function checkDateValidity(param: {businessHoursId: any, informedPaymentDate: any}): Promise<any>;
}
declare module "@salesforce/apex/UnprocessedPaymentController.getCheckingPaymentInvoice" {
  export default function getCheckingPaymentInvoice(param: {invoiceJSON: any, paymentValue: any, paymentDate: any}): Promise<any>;
}
declare module "@salesforce/apex/UnprocessedPaymentController.getNumberOfBusinessDays" {
  export default function getNumberOfBusinessDays(param: {businessHoursId: any, informedPaymentDate: any}): Promise<any>;
}
declare module "@salesforce/apex/UnprocessedPaymentController.getBanks" {
  export default function getBanks(): Promise<any>;
}
declare module "@salesforce/apex/UnprocessedPaymentController.getDigitalAccountStatement" {
  export default function getDigitalAccountStatement(param: {request: any, dateFilter: any}): Promise<any>;
}
declare module "@salesforce/apex/UnprocessedPaymentController.performPaymentRefund" {
  export default function performPaymentRefund(param: {requestBody: any}): Promise<any>;
}
declare module "@salesforce/apex/UnprocessedPaymentController.tabCase" {
  export default function tabCase(param: {recordId: any, tabLabel: any, serviceInformation: any}): Promise<any>;
}
declare module "@salesforce/apex/UnprocessedPaymentController.getParameterizedPaymentCategories" {
  export default function getParameterizedPaymentCategories(): Promise<any>;
}
declare module "@salesforce/apex/UnprocessedPaymentController.getRefundItemCodes" {
  export default function getRefundItemCodes(): Promise<any>;
}
declare module "@salesforce/apex/UnprocessedPaymentController.logCase" {
  export default function logCase(param: {recordId: any, logId: any, logJson: any}): Promise<any>;
}
declare module "@salesforce/apex/UnprocessedPaymentController.checkPid" {
  export default function checkPid(param: {recordId: any, servico: any}): Promise<any>;
}
