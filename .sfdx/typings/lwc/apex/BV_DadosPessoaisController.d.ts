declare module "@salesforce/apex/BV_DadosPessoaisController.consultaDadosPessoais" {
  export default function consultaDadosPessoais(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/BV_DadosPessoaisController.updateEmail" {
  export default function updateEmail(param: {cpfCnpj: any, email: any}): Promise<any>;
}
declare module "@salesforce/apex/BV_DadosPessoaisController.getRelatedCase" {
  export default function getRelatedCase(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/BV_DadosPessoaisController.atualizarDadosContato" {
  export default function atualizarDadosContato(param: {recordId: any, emissor: any, filialEmissor: any, codigoProduto: any, numeroConta: any, dadosAtualizacaoContatoJson: any, alterouEndereco: any, alterouCelular: any, alterouEmail: any}): Promise<any>;
}
declare module "@salesforce/apex/BV_DadosPessoaisController.atualizarDadosPessoais" {
  export default function atualizarDadosPessoais(param: {recordId: any, nomeSocial: any}): Promise<any>;
}
declare module "@salesforce/apex/BV_DadosPessoaisController.getEndereco" {
  export default function getEndereco(param: {cep: any}): Promise<any>;
}
declare module "@salesforce/apex/BV_DadosPessoaisController.getNewCase" {
  export default function getNewCase(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/BV_DadosPessoaisController.updateAccountName" {
  export default function updateAccountName(param: {recordId: any, name: any}): Promise<any>;
}
declare module "@salesforce/apex/BV_DadosPessoaisController.checkPermissionCobranca" {
  export default function checkPermissionCobranca(): Promise<any>;
}
declare module "@salesforce/apex/BV_DadosPessoaisController.checkPermissionGR" {
  export default function checkPermissionGR(param: {squad: any}): Promise<any>;
}
declare module "@salesforce/apex/BV_DadosPessoaisController.inBlackList" {
  export default function inBlackList(param: {nomeSocial: any}): Promise<any>;
}
declare module "@salesforce/apex/BV_DadosPessoaisController.gerarLogAlteracaoDadosPessoais" {
  export default function gerarLogAlteracaoDadosPessoais(param: {caseId: any, nomeSocialDE: any}): Promise<any>;
}
declare module "@salesforce/apex/BV_DadosPessoaisController.getIstVICbyCPF" {
  export default function getIstVICbyCPF(param: {accId: any, CPF: any, caseId: any}): Promise<any>;
}
