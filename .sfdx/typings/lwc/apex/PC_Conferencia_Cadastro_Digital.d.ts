declare module "@salesforce/apex/PC_Conferencia_Cadastro_Digital.getDadosBasicosProfFinanCheckbox" {
  export default function getDadosBasicosProfFinanCheckbox(param: {id: any}): Promise<any>;
}
declare module "@salesforce/apex/PC_Conferencia_Cadastro_Digital.getCadastroDigitalRecordType" {
  export default function getCadastroDigitalRecordType(param: {id: any}): Promise<any>;
}
declare module "@salesforce/apex/PC_Conferencia_Cadastro_Digital.getCheckStatusInfo" {
  export default function getCheckStatusInfo(param: {id: any}): Promise<any>;
}
declare module "@salesforce/apex/PC_Conferencia_Cadastro_Digital.confereAprovacao" {
  export default function confereAprovacao(param: {id: any, valor: any, cancelReason: any}): Promise<any>;
}
declare module "@salesforce/apex/PC_Conferencia_Cadastro_Digital.liberarConf" {
  export default function liberarConf(param: {id: any}): Promise<any>;
}
declare module "@salesforce/apex/PC_Conferencia_Cadastro_Digital.updateCheckboxConferencia" {
  export default function updateCheckboxConferencia(param: {id: any, contaDig: any}): Promise<any>;
}
declare module "@salesforce/apex/PC_Conferencia_Cadastro_Digital.getArqConta" {
  export default function getArqConta(param: {id: any}): Promise<any>;
}
declare module "@salesforce/apex/PC_Conferencia_Cadastro_Digital.UpdateDataVigencia" {
  export default function UpdateDataVigencia(param: {idArqConta: any, dataVig: any}): Promise<any>;
}
declare module "@salesforce/apex/PC_Conferencia_Cadastro_Digital.deletaArquivo" {
  export default function deletaArquivo(param: {idConta: any, idArq: any}): Promise<any>;
}
declare module "@salesforce/apex/PC_Conferencia_Cadastro_Digital.validaHashGlobal" {
  export default function validaHashGlobal(param: {hash: any}): Promise<any>;
}
declare module "@salesforce/apex/PC_Conferencia_Cadastro_Digital.gerarHash" {
  export default function gerarHash(param: {contaDig: any}): Promise<any>;
}
declare module "@salesforce/apex/PC_Conferencia_Cadastro_Digital.gerarEmail" {
  export default function gerarEmail(param: {contaID: any, confData: any}): Promise<any>;
}
declare module "@salesforce/apex/PC_Conferencia_Cadastro_Digital.JsonSolicitaArquivos" {
  export default function JsonSolicitaArquivos(param: {IdCad: any, dados: any}): Promise<any>;
}
