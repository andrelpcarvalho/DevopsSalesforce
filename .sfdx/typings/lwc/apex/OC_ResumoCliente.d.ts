declare module "@salesforce/apex/OC_ResumoCliente.getPermisisonProfile" {
  export default function getPermisisonProfile(): Promise<any>;
}
declare module "@salesforce/apex/OC_ResumoCliente.listarPreferencias" {
  export default function listarPreferencias(param: {tela: any}): Promise<any>;
}
declare module "@salesforce/apex/OC_ResumoCliente.salvarPreferencia" {
  export default function salvarPreferencia(param: {idPref: any, tela: any, subtela: any, preferencia: any, objeto: any}): Promise<any>;
}
declare module "@salesforce/apex/OC_ResumoCliente.pegarListaFiltros" {
  export default function pegarListaFiltros(param: {tela: any}): Promise<any>;
}
declare module "@salesforce/apex/OC_ResumoCliente.pegarListaFarois" {
  export default function pegarListaFarois(param: {recordId: any, somenteMeus: any, listaOfficersJSON: any, listaPreferenciasJSON: any, limitadoPorFiltro: any, privateAllAccounts: any}): Promise<any>;
}
declare module "@salesforce/apex/OC_ResumoCliente.estruturaPaginacao" {
  export default function estruturaPaginacao(param: {jsonSituacao: any, quantidadeRegistros: any, pagina: any, proximoOuAnterior: any, idsUsuariosSelecionados: any}): Promise<any>;
}
declare module "@salesforce/apex/OC_ResumoCliente.pegarListaFaroisPC" {
  export default function pegarListaFaroisPC(param: {recordId: any, somenteMeus: any, listaOfficersJSON: any, listaPreferenciasJSON: any, limitadoPorFiltro: any, privateAllAccounts: any}): Promise<any>;
}
