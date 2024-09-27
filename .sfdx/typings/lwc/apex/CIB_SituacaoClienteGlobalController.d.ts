declare module "@salesforce/apex/CIB_SituacaoClienteGlobalController.filtrarGrupoComercial" {
  export default function filtrarGrupoComercial(param: {jsonContasGC: any}): Promise<any>;
}
declare module "@salesforce/apex/CIB_SituacaoClienteGlobalController.obterRegionaisLista" {
  export default function obterRegionaisLista(): Promise<any>;
}
declare module "@salesforce/apex/CIB_SituacaoClienteGlobalController.obterMembrosFiltro" {
  export default function obterMembrosFiltro(): Promise<any>;
}
declare module "@salesforce/apex/CIB_SituacaoClienteGlobalController.obterGrupoComercialPorNome" {
  export default function obterGrupoComercialPorNome(param: {tipoRegistro: any}): Promise<any>;
}
declare module "@salesforce/apex/CIB_SituacaoClienteGlobalController.obterFaroisGrupoComercial" {
  export default function obterFaroisGrupoComercial(param: {statusFarol: any}): Promise<any>;
}
declare module "@salesforce/apex/CIB_SituacaoClienteGlobalController.obterGCPorOFficer" {
  export default function obterGCPorOFficer(param: {idsOfficer: any, statusFarol: any}): Promise<any>;
}
declare module "@salesforce/apex/CIB_SituacaoClienteGlobalController.obterGCPorRegional" {
  export default function obterGCPorRegional(param: {nomesRegionais: any, statusFarol: any}): Promise<any>;
}
declare module "@salesforce/apex/CIB_SituacaoClienteGlobalController.estruturaPaginacao" {
  export default function estruturaPaginacao(param: {jsonSituacao: any, quantidadeRegistros: any, pagina: any, flagLastPage: any, proximoOuAnterior: any, idsUsuariosSelecionados: any, semSaldo: any}): Promise<any>;
}
declare module "@salesforce/apex/CIB_SituacaoClienteGlobalController.retoronoLWC" {
  export default function retoronoLWC(param: {jsonSituacao: any, quantidadeRegistros: any, pagina: any, flagLastPage: any, proximoOuAnterior: any, idsUsuariosSelecionados: any, semSaldo: any}): Promise<any>;
}
declare module "@salesforce/apex/CIB_SituacaoClienteGlobalController.obterFarolEmpresaFiltro" {
  export default function obterFarolEmpresaFiltro(param: {tipo: any, valor: any, statusFarol: any}): Promise<any>;
}
