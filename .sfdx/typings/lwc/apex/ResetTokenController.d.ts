declare module "@salesforce/apex/ResetTokenController.dataCheck" {
  export default function dataCheck(param: {caseId: any}): Promise<any>;
}
declare module "@salesforce/apex/ResetTokenController.getResetToken" {
  export default function getResetToken(param: {cpf: any, caso: any}): Promise<any>;
}
