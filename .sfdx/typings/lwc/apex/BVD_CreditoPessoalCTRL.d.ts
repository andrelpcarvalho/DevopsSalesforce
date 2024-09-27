declare module "@salesforce/apex/BVD_CreditoPessoalCTRL.getElebigilidadeEProposta" {
  export default function getElebigilidadeEProposta(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_CreditoPessoalCTRL.getCreditoFacil" {
  export default function getCreditoFacil(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_CreditoPessoalCTRL.getCreditoFacilContratos" {
  export default function getCreditoFacilContratos(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_CreditoPessoalCTRL.getContratos" {
  export default function getContratos(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_CreditoPessoalCTRL.gerarLogElegibilidade" {
  export default function gerarLogElegibilidade(param: {caseId: any, elegivel: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_CreditoPessoalCTRL.gerarLogConsultaContratos" {
  export default function gerarLogConsultaContratos(param: {caseId: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_CreditoPessoalCTRL.gerarLogCancelamentoContrato" {
  export default function gerarLogCancelamentoContrato(param: {caseId: any, numeroContrato: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_CreditoPessoalCTRL.gerarLogCPFacil" {
  export default function gerarLogCPFacil(param: {caseId: any, elegivel: any, valorDisponivel: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_CreditoPessoalCTRL.gerarLogConsultaCPFacil" {
  export default function gerarLogConsultaCPFacil(param: {caseId: any}): Promise<any>;
}
