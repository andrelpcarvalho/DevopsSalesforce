declare module "@salesforce/apex/OC_UPLOAD_CSV_RAR.ValidarCSV" {
  export default function ValidarCSV(param: {text: any}): Promise<any>;
}
declare module "@salesforce/apex/OC_UPLOAD_CSV_RAR.CriarRAR" {
  export default function CriarRAR(param: {dados: any, AccountId: any}): Promise<any>;
}
declare module "@salesforce/apex/OC_UPLOAD_CSV_RAR.pegarListaAprovacoes" {
  export default function pegarListaAprovacoes(): Promise<any>;
}
declare module "@salesforce/apex/OC_UPLOAD_CSV_RAR.pegarIdAnexo" {
  export default function pegarIdAnexo(param: {idParam: any}): Promise<any>;
}
declare module "@salesforce/apex/OC_UPLOAD_CSV_RAR.alterIdDocument" {
  export default function alterIdDocument(param: {ContentDocumentLink: any, ContentDocument: any, LinkedEntity: any, IdRAR: any}): Promise<any>;
}
