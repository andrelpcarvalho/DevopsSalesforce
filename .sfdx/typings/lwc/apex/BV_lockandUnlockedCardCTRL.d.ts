declare module "@salesforce/apex/BV_lockandUnlockedCardCTRL.CalloutLockCards" {
  export default function CalloutLockCards(param: {RecordId: any, ultimosQuatroDigitosCartao: any, funcionalidade: any}): Promise<any>;
}
declare module "@salesforce/apex/BV_lockandUnlockedCardCTRL.calloutUpdateCreditStatus" {
  export default function calloutUpdateCreditStatus(param: {contaCartao: any, correlativo: any, emissor: any, filial: any, produto: any, statusCredito: any}): Promise<any>;
}
declare module "@salesforce/apex/BV_lockandUnlockedCardCTRL.inserirLogDesbloqueio" {
  export default function inserirLogDesbloqueio(param: {caseId: any, motivo: any, submotivo: any, numeroCartao: any, funcionalidade: any, statusServico: any, key: any, estadoCartao: any}): Promise<any>;
}
declare module "@salesforce/apex/BV_lockandUnlockedCardCTRL.verificaBackOffice" {
  export default function verificaBackOffice(): Promise<any>;
}
declare module "@salesforce/apex/BV_lockandUnlockedCardCTRL.isN1OrEpecialistaOrBKO" {
  export default function isN1OrEpecialistaOrBKO(): Promise<any>;
}
