declare module "@salesforce/apex/RepaymentController.sendRepayment" {
  export default function sendRepayment(param: {repaymentParams: any}): Promise<any>;
}
declare module "@salesforce/apex/RepaymentController.getRepaymentHistoric" {
  export default function getRepaymentHistoric(param: {cpfCnpj: any}): Promise<any>;
}
declare module "@salesforce/apex/RepaymentController.getBankInfo" {
  export default function getBankInfo(param: {cpfCnpj: any}): Promise<any>;
}
declare module "@salesforce/apex/RepaymentController.getBanks" {
  export default function getBanks(): Promise<any>;
}
declare module "@salesforce/apex/RepaymentController.getInfoAutomaticTab" {
  export default function getInfoAutomaticTab(param: {tabName: any}): Promise<any>;
}
