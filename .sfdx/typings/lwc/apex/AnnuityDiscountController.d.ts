declare module "@salesforce/apex/AnnuityDiscountController.getCards" {
  export default function getCards(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/AnnuityDiscountController.getAvailableAnnuityDiscounts" {
  export default function getAvailableAnnuityDiscounts(param: {request: any, parentCode: any}): Promise<any>;
}
declare module "@salesforce/apex/AnnuityDiscountController.simulateAnnuityDiscount" {
  export default function simulateAnnuityDiscount(param: {request: any}): Promise<any>;
}
declare module "@salesforce/apex/AnnuityDiscountController.performAnnuityDiscount" {
  export default function performAnnuityDiscount(param: {request: any}): Promise<any>;
}
declare module "@salesforce/apex/AnnuityDiscountController.registrarDescontoAnuidadeAplicado" {
  export default function registrarDescontoAnuidadeAplicado(param: {recordId: any, descPermitido: any, cartaoAdicional: any, parcelasList: any}): Promise<any>;
}
declare module "@salesforce/apex/AnnuityDiscountController.tabulateCase" {
  export default function tabulateCase(param: {recordId: any, tabLabel: any}): Promise<any>;
}
declare module "@salesforce/apex/AnnuityDiscountController.getTab" {
  export default function getTab(param: {reason: any, apiReasonCode: any}): Promise<any>;
}
declare module "@salesforce/apex/AnnuityDiscountController.logCase" {
  export default function logCase(param: {recordId: any, logJson: any}): Promise<any>;
}
declare module "@salesforce/apex/AnnuityDiscountController.getSubmotivesHoldWithoutNegociation" {
  export default function getSubmotivesHoldWithoutNegociation(param: {reason: any}): Promise<any>;
}
