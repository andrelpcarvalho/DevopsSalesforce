declare module "@salesforce/apex/CardFinancialAdjustmentController.getTypes" {
  export default function getTypes(): Promise<any>;
}
declare module "@salesforce/apex/CardFinancialAdjustmentController.checkPermission" {
  export default function checkPermission(): Promise<any>;
}
declare module "@salesforce/apex/CardFinancialAdjustmentController.preFillType" {
  export default function preFillType(): Promise<any>;
}
declare module "@salesforce/apex/CardFinancialAdjustmentController.getInvoices" {
  export default function getInvoices(param: {caseId: any, numberOfInvoices: any}): Promise<any>;
}
declare module "@salesforce/apex/CardFinancialAdjustmentController.getInvoiceDetails" {
  export default function getInvoiceDetails(param: {recordId: any, mesReferencia: any, adjustmentType: any}): Promise<any>;
}
declare module "@salesforce/apex/CardFinancialAdjustmentController.getParcelDates" {
  export default function getParcelDates(param: {parcelQtd: any, firstDate: any}): Promise<any>;
}
declare module "@salesforce/apex/CardFinancialAdjustmentController.makeAdjustment" {
  export default function makeAdjustment(param: {recordId: any, invoiceDetailsString: any, adjustmentType: any}): Promise<any>;
}
declare module "@salesforce/apex/CardFinancialAdjustmentController.refuseAdjustment" {
  export default function refuseAdjustment(param: {recordId: any}): Promise<any>;
}
