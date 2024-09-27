declare module "@salesforce/apex/CardServicesHomeController.getCards" {
  export default function getCards(param: {recordId: any, accountNumber: any, productCode: any}): Promise<any>;
}
declare module "@salesforce/apex/CardServicesHomeController.getCardAccountDetail" {
  export default function getCardAccountDetail(param: {accountNumber: any, productCode: any}): Promise<any>;
}
declare module "@salesforce/apex/CardServicesHomeController.getCardLimits" {
  export default function getCardLimits(param: {cardInfo: any}): Promise<any>;
}
declare module "@salesforce/apex/CardServicesHomeController.getCardScore" {
  export default function getCardScore(param: {accountNumber: any, productCode: any}): Promise<any>;
}
declare module "@salesforce/apex/CardServicesHomeController.getInvoiceSummary" {
  export default function getInvoiceSummary(param: {cardInfo: any}): Promise<any>;
}
declare module "@salesforce/apex/CardServicesHomeController.insertCardInfo" {
  export default function insertCardInfo(param: {recordId: any, cardInfo: any}): Promise<any>;
}
