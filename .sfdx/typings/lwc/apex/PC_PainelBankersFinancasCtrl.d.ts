declare module "@salesforce/apex/PC_PainelBankersFinancasCtrl.getMesesReferencia" {
  export default function getMesesReferencia(): Promise<any>;
}
declare module "@salesforce/apex/PC_PainelBankersFinancasCtrl.getFilters" {
  export default function getFilters(param: {mesReferencia: any, bancada: any, banker: any, produto: any, cliente: any}): Promise<any>;
}
declare module "@salesforce/apex/PC_PainelBankersFinancasCtrl.getCarteirasBankers" {
  export default function getCarteirasBankers(param: {mesReferencia: any, bancada: any, banker: any, cliente: any, produto: any, bancadacheck: any, pageNumber: any, recordToDisplay: any, defaultSortDirection: any, sortedDirection: any, sortedBy: any}): Promise<any>;
}
declare module "@salesforce/apex/PC_PainelBankersFinancasCtrl.getAuM" {
  export default function getAuM(param: {filterQuery: any, filters: any}): Promise<any>;
}
declare module "@salesforce/apex/PC_PainelBankersFinancasCtrl.getAuMGraficos" {
  export default function getAuMGraficos(param: {filterQuery: any}): Promise<any>;
}
declare module "@salesforce/apex/PC_PainelBankersFinancasCtrl.getClientesGraficos" {
  export default function getClientesGraficos(param: {filterQuery: any}): Promise<any>;
}
declare module "@salesforce/apex/PC_PainelBankersFinancasCtrl.getApliResGraficos" {
  export default function getApliResGraficos(param: {filterQuery: any}): Promise<any>;
}
