declare module "@salesforce/apex/ATD_OfertasController.getOffers" {
  export default function getOffers(param: {caseId: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_OfertasController.getChecklist" {
  export default function getChecklist(param: {caseId: any, serviceCode: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_OfertasController.acquireOffer" {
  export default function acquireOffer(param: {caseId: any, addressType: any, card: any, service: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_OfertasController.getReasons" {
  export default function getReasons(param: {serviceCode: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_OfertasController.cancelService" {
  export default function cancelService(param: {caseId: any, card: any, service: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_OfertasController.tabulateCase" {
  export default function tabulateCase(param: {caseId: any, tab: any, service: any, isRecusa: any, isCancelamento: any, status: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_OfertasController.getCustomerAddresses" {
  export default function getCustomerAddresses(param: {caseId: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_OfertasController.getModalMessage" {
  export default function getModalMessage(param: {code: any}): Promise<any>;
}
