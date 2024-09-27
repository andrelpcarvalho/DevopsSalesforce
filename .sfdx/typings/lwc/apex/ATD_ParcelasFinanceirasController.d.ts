declare module "@salesforce/apex/ATD_ParcelasFinanceirasController.getParcelas" {
  export default function getParcelas(param: {contractId: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_ParcelasFinanceirasController.setCalculo" {
  export default function setCalculo(param: {contractId: any, dataFiltro: any, todasParcelas: any, parcelasSelecionadas: any, retornaValores: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_ParcelasFinanceirasController.getInfoCase" {
  export default function getInfoCase(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_ParcelasFinanceirasController.getBoleto" {
  export default function getBoleto(param: {objeto: any, situacaoFinanceiraContrato: any, tabName: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_ParcelasFinanceirasController.getDataClient" {
  export default function getDataClient(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_ParcelasFinanceirasController.getCalculoValoresBoleto" {
  export default function getCalculoValoresBoleto(param: {requestInput: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_ParcelasFinanceirasController.getRangeDatePayment" {
  export default function getRangeDatePayment(param: {numeroContrato: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_ParcelasFinanceirasController.getStandardRangeDate" {
  export default function getStandardRangeDate(param: {dateViewModel: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_ParcelasFinanceirasController.checkValidItems" {
  export default function checkValidItems(param: {parcelaList: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_ParcelasFinanceirasController.saveContractData" {
  export default function saveContractData(param: {recordId: any, sequencia: any, contractId: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_ParcelasFinanceirasController.saveRequesterPayment" {
  export default function saveRequesterPayment(param: {recordId: any, requester: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_ParcelasFinanceirasController.sendDemonstrativeIR" {
  export default function sendDemonstrativeIR(param: {cpfCpnj: any, yearList: any, email: any, contractNumber: any, tabName: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_ParcelasFinanceirasController.getDiscountMultaMora" {
  export default function getDiscountMultaMora(): Promise<any>;
}
declare module "@salesforce/apex/ATD_ParcelasFinanceirasController.getBoletoServiceMetadata" {
  export default function getBoletoServiceMetadata(): Promise<any>;
}
declare module "@salesforce/apex/ATD_ParcelasFinanceirasController.getBoletoServiceCustomSetting" {
  export default function getBoletoServiceCustomSetting(): Promise<any>;
}
declare module "@salesforce/apex/ATD_ParcelasFinanceirasController.getInfoAutomaticTab" {
  export default function getInfoAutomaticTab(param: {tabName: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_ParcelasFinanceirasController.insertLog" {
  export default function insertLog(param: {caseId: any, logTitle: any, logData: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_ParcelasFinanceirasController.getListSimulationHistory" {
  export default function getListSimulationHistory(param: {params: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_ParcelasFinanceirasController.getAdvisoryFlow" {
  export default function getAdvisoryFlow(param: {numContrato: any}): Promise<any>;
}
