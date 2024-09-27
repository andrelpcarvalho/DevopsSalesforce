declare module "@salesforce/apex/InsuranceViewerController.getInsurances" {
  export default function getInsurances(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/InsuranceViewerController.getInsuranceDetail" {
  export default function getInsuranceDetail(param: {proposalNumber: any, productCode: any}): Promise<any>;
}
