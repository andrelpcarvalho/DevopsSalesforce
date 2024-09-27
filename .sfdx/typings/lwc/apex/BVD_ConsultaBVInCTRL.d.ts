declare module "@salesforce/apex/BVD_ConsultaBVInCTRL.consultaBVIn" {
  export default function consultaBVIn(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_ConsultaBVInCTRL.simularResgate" {
  export default function simularResgate(param: {caseId: any, investId: any, valorResgate: any, tipoInvestimento: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_ConsultaBVInCTRL.resgatarInvestimento" {
  export default function resgatarInvestimento(param: {caseId: any, investId: any, valorResgate: any, simulacaoJSON: any, resgateTotal: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_ConsultaBVInCTRL.gerarLogResgate" {
  export default function gerarLogResgate(param: {caseId: any, tipoInvest: any, tipoResgate: any, produtoNome: any, valorResgate: any}): Promise<any>;
}
