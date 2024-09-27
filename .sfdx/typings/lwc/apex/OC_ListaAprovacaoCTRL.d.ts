declare module "@salesforce/apex/OC_ListaAprovacaoCTRL.getListaAprovacao" {
  export default function getListaAprovacao(param: {statusType: any}): Promise<any>;
}
declare module "@salesforce/apex/OC_ListaAprovacaoCTRL.getRARProducts" {
  export default function getRARProducts(param: {rarId: any}): Promise<any>;
}
declare module "@salesforce/apex/OC_ListaAprovacaoCTRL.getApprovalStatus" {
  export default function getApprovalStatus(param: {processId: any}): Promise<any>;
}
declare module "@salesforce/apex/OC_ListaAprovacaoCTRL.aprovarOuRejeitarProcesso" {
  export default function aprovarOuRejeitarProcesso(param: {jsonRAR: any, action: any}): Promise<any>;
}
