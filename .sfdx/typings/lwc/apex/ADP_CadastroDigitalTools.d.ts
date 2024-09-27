declare module "@salesforce/apex/ADP_CadastroDigitalTools.gerarHash" {
  export default function gerarHash(param: {gerenteRelacionamento: any, codOfficer: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_CadastroDigitalTools.salvarConta" {
  export default function salvarConta(param: {conta: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_CadastroDigitalTools.recuperaRecordTypeName" {
  export default function recuperaRecordTypeName(param: {recordTypeId: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_CadastroDigitalTools.recordExists" {
  export default function recordExists(param: {cpf: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_CadastroDigitalTools.checkDadosNoGlobal" {
  export default function checkDadosNoGlobal(param: {infoProspect: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_CadastroDigitalTools.AtualizaHashEnviaEmail" {
  export default function AtualizaHashEnviaEmail(param: {IdCD: any, Hash: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_CadastroDigitalTools.ValidaCNPJnoGlobal" {
  export default function ValidaCNPJnoGlobal(param: {CNPJ: any, EmailContato: any, LoginOfficer: any, nomeContato: any, codigoGrupoComercial: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_CadastroDigitalTools.regerarHash" {
  export default function regerarHash(param: {IdCD: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_CadastroDigitalTools.RecuperaGrupoComercial" {
  export default function RecuperaGrupoComercial(param: {LoginOfficer: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_CadastroDigitalTools.RecuperaPerfil" {
  export default function RecuperaPerfil(param: {idOfficer: any}): Promise<any>;
}
