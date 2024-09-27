declare module "@salesforce/apex/CustomLookupAuraService.getRecordList" {
  export default function getRecordList(param: {ObjectName: any, sreachText: any, fieldInSearch: any}): Promise<any>;
}
declare module "@salesforce/apex/CustomLookupAuraService.obterListaOfficers" {
  export default function obterListaOfficers(): Promise<any>;
}
declare module "@salesforce/apex/CustomLookupAuraService.obterListaRegional" {
  export default function obterListaRegional(): Promise<any>;
}
declare module "@salesforce/apex/CustomLookupAuraService.filtrarListaGC" {
  export default function filtrarListaGC(param: {nomeOfficer: any, idsUsuariosSelecionados: any}): Promise<any>;
}
declare module "@salesforce/apex/CustomLookupAuraService.filtrarListaRegional" {
  export default function filtrarListaRegional(param: {nomeRegional: any, regionaisSelecionadas: any}): Promise<any>;
}
declare module "@salesforce/apex/CustomLookupAuraService.obterRotulosOfficers" {
  export default function obterRotulosOfficers(param: {idsOfficers: any}): Promise<any>;
}
declare module "@salesforce/apex/CustomLookupAuraService.obterOfficerPorRegional" {
  export default function obterOfficerPorRegional(param: {nomesPapeis: any}): Promise<any>;
}
