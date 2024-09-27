declare module "@salesforce/apex/ATD_opcoesResgatePontos.getPrograms" {
  export default function getPrograms(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_opcoesResgatePontos.getPoints" {
  export default function getPoints(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_opcoesResgatePontos.getCustomerAddress" {
  export default function getCustomerAddress(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_opcoesResgatePontos.rewardRedeemRequest" {
  export default function rewardRedeemRequest(param: {recordId: any, enteredValues: any, program: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_opcoesResgatePontos.tabulateCase" {
  export default function tabulateCase(param: {recordId: any, program: any, qttPoints: any}): Promise<any>;
}
