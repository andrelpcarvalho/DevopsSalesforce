declare module "@salesforce/apex/CustomerContactInformationController.checkDataEditPermission" {
  export default function checkDataEditPermission(param: {recordId: any, objectApiName: any}): Promise<any>;
}
declare module "@salesforce/apex/CustomerContactInformationController.getAddress" {
  export default function getAddress(param: {zipCode: any}): Promise<any>;
}
declare module "@salesforce/apex/CustomerContactInformationController.updateCustomerContactData" {
  export default function updateCustomerContactData(param: {cpfCnpj: any, editedValues: any}): Promise<any>;
}
declare module "@salesforce/apex/CustomerContactInformationController.tabulateAndLogCase" {
  export default function tabulateAndLogCase(param: {recordId: any, tabLabel: any, log: any}): Promise<any>;
}
