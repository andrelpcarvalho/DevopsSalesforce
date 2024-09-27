declare module "@salesforce/apex/Form_Cadastro_digital_Tools.getListAtividadeEconomica" {
  export default function getListAtividadeEconomica(): Promise<any>;
}
declare module "@salesforce/apex/Form_Cadastro_digital_Tools.isCNPJ" {
  export default function isCNPJ(param: {CNPJ: any}): Promise<any>;
}
declare module "@salesforce/apex/Form_Cadastro_digital_Tools.isCPF" {
  export default function isCPF(param: {CPF: any}): Promise<any>;
}
declare module "@salesforce/apex/Form_Cadastro_digital_Tools.RecuperaCEP" {
  export default function RecuperaCEP(param: {CEP: any}): Promise<any>;
}
declare module "@salesforce/apex/Form_Cadastro_digital_Tools.RecuperaNaturezaJuridica" {
  export default function RecuperaNaturezaJuridica(): Promise<any>;
}
declare module "@salesforce/apex/Form_Cadastro_digital_Tools.ValidaHashGlobal" {
  export default function ValidaHashGlobal(param: {HASH: any}): Promise<any>;
}
declare module "@salesforce/apex/Form_Cadastro_digital_Tools.getNomeGrRl" {
  export default function getNomeGrRl(param: {ID: any}): Promise<any>;
}
declare module "@salesforce/apex/Form_Cadastro_digital_Tools.getDadosBasicos" {
  export default function getDadosBasicos(param: {ID: any}): Promise<any>;
}
declare module "@salesforce/apex/Form_Cadastro_digital_Tools.UpdateInfoAdicional" {
  export default function UpdateInfoAdicional(param: {ID: any, checkUpd: any}): Promise<any>;
}
declare module "@salesforce/apex/Form_Cadastro_digital_Tools.UpdateDadosbasicos" {
  export default function UpdateDadosbasicos(param: {ID: any, checkUpd: any}): Promise<any>;
}
declare module "@salesforce/apex/Form_Cadastro_digital_Tools.UpdateServicos" {
  export default function UpdateServicos(param: {ID: any, checkUpd: any}): Promise<any>;
}
declare module "@salesforce/apex/Form_Cadastro_digital_Tools.getPPE" {
  export default function getPPE(param: {ID: any}): Promise<any>;
}
declare module "@salesforce/apex/Form_Cadastro_digital_Tools.getIB" {
  export default function getIB(param: {ID: any}): Promise<any>;
}
declare module "@salesforce/apex/Form_Cadastro_digital_Tools.salvarConta" {
  export default function salvarConta(param: {conta: any, PPE: any, IBanking: any, idConta: any}): Promise<any>;
}
declare module "@salesforce/apex/Form_Cadastro_digital_Tools.liberarConf" {
  export default function liberarConf(param: {ID: any}): Promise<any>;
}
declare module "@salesforce/apex/Form_Cadastro_digital_Tools.confereAprovacao" {
  export default function confereAprovacao(param: {ID: any, valor: any}): Promise<any>;
}
declare module "@salesforce/apex/Form_Cadastro_digital_Tools.UpdateDadosCep" {
  export default function UpdateDadosCep(param: {ID: any, conta: any}): Promise<any>;
}
declare module "@salesforce/apex/Form_Cadastro_digital_Tools.updateAtividade" {
  export default function updateAtividade(param: {Id: any, descricao: any, codigo: any}): Promise<any>;
}
declare module "@salesforce/apex/Form_Cadastro_digital_Tools.updateNatureza" {
  export default function updateNatureza(param: {Id: any, descricao: any, Codigo: any}): Promise<any>;
}
declare module "@salesforce/apex/Form_Cadastro_digital_Tools.JsonSolicitaArquivos" {
  export default function JsonSolicitaArquivos(param: {IdCad: any, dados: any, Hashret: any}): Promise<any>;
}
declare module "@salesforce/apex/Form_Cadastro_digital_Tools.regerarHash" {
  export default function regerarHash(param: {IdCD: any}): Promise<any>;
}
declare module "@salesforce/apex/Form_Cadastro_digital_Tools.GerarEmail" {
  export default function GerarEmail(param: {contaID: any}): Promise<any>;
}
