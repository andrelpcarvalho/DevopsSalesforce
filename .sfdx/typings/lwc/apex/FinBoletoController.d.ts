declare module "@salesforce/apex/FinBoletoController.createBoleto" {
  export default function createBoleto(param: {request: any}): Promise<any>;
}
declare module "@salesforce/apex/FinBoletoController.listHistoryBoleto" {
  export default function listHistoryBoleto(param: {contrato: any, seqFinanceiraContrato: any}): Promise<any>;
}
declare module "@salesforce/apex/FinBoletoController.listRequestsBoleto" {
  export default function listRequestsBoleto(param: {request: any}): Promise<any>;
}
declare module "@salesforce/apex/FinBoletoController.listRastreabilidadeBoleto" {
  export default function listRastreabilidadeBoleto(param: {hashBoleto: any}): Promise<any>;
}
declare module "@salesforce/apex/FinBoletoController.listHistoryBoletoCaseClosed" {
  export default function listHistoryBoletoCaseClosed(param: {caseid: any}): Promise<any>;
}
