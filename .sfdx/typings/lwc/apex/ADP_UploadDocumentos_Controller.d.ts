declare module "@salesforce/apex/ADP_UploadDocumentos_Controller.integraIGED" {
  export default function integraIGED(param: {Cadastro: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_UploadDocumentos_Controller.verificaArquivosIGED" {
  export default function verificaArquivosIGED(param: {Cadastro: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_UploadDocumentos_Controller.getNomeArquivo" {
  export default function getNomeArquivo(param: {ID: any, tpDoc: any, Data: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_UploadDocumentos_Controller.marcaParaRemover" {
  export default function marcaParaRemover(param: {IdConta: any, IdArq: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_UploadDocumentos_Controller.deletaArquivo" {
  export default function deletaArquivo(param: {IdConta: any, IdArq: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_UploadDocumentos_Controller.getNomeRzSocial" {
  export default function getNomeRzSocial(param: {ID: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_UploadDocumentos_Controller.ValidaHashGlobal" {
  export default function ValidaHashGlobal(param: {HASH: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_UploadDocumentos_Controller.isCPF" {
  export default function isCPF(param: {CPF: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_UploadDocumentos_Controller.getDadosBasicos" {
  export default function getDadosBasicos(param: {ID: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_UploadDocumentos_Controller.getPPE" {
  export default function getPPE(param: {ID: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_UploadDocumentos_Controller.getIB" {
  export default function getIB(param: {ID: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_UploadDocumentos_Controller.salvarBen" {
  export default function salvarBen(param: {conta: any, beneficiario: any, idConta: any, isSA: any, tpConstituicao: any, listaBenAss: any, listaArquivEst: any, listaArquivEle: any, listaArquivBal: any, listaArquivProc: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_UploadDocumentos_Controller.checkFlags" {
  export default function checkFlags(param: {ID: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_UploadDocumentos_Controller.ShowEmailBtn" {
  export default function ShowEmailBtn(param: {ID: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_UploadDocumentos_Controller.changeRecordTypeViewConf" {
  export default function changeRecordTypeViewConf(param: {ID: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_UploadDocumentos_Controller.getDadosContaDig" {
  export default function getDadosContaDig(param: {ID: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_UploadDocumentos_Controller.getRespostaConferente" {
  export default function getRespostaConferente(param: {ID: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_UploadDocumentos_Controller.checkSteps" {
  export default function checkSteps(param: {ID: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_UploadDocumentos_Controller.verificaPerfilAssistenteOuOficcer" {
  export default function verificaPerfilAssistenteOuOficcer(param: {ID: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_UploadDocumentos_Controller.getCadastroDigital" {
  export default function getCadastroDigital(param: {recordId: any}): Promise<any>;
}
