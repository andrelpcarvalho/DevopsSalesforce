declare module "@salesforce/apex/RAInteracoesController.enviarMensagemPublica" {
  export default function enviarMensagemPublica(param: {ticketId: any, caseId: any, textMessage: any}): Promise<any>;
}
declare module "@salesforce/apex/RAInteracoesController.enviarMensagemPrivada" {
  export default function enviarMensagemPrivada(param: {ticketId: any, caseId: any, textMessage: any, userMail: any, contentDocumentIds: any}): Promise<any>;
}
declare module "@salesforce/apex/RAInteracoesController.solicitarModeracao" {
  export default function solicitarModeracao(param: {ticketId: any, caseId: any, textMessage: any, reason: any, contentDocumentIds: any}): Promise<any>;
}
declare module "@salesforce/apex/RAInteracoesController.retornaInteracoes" {
  export default function retornaInteracoes(): Promise<any>;
}
declare module "@salesforce/apex/RAInteracoesController.retornaListaRazoesModeracao" {
  export default function retornaListaRazoesModeracao(): Promise<any>;
}
declare module "@salesforce/apex/RAInteracoesController.getRASettings" {
  export default function getRASettings(): Promise<any>;
}
declare module "@salesforce/apex/RAInteracoesController.deleteDocuments" {
  export default function deleteDocuments(param: {documentIds: any}): Promise<any>;
}
declare module "@salesforce/apex/RAInteracoesController.getAttachmentLink" {
  export default function getAttachmentLink(param: {linkId: any}): Promise<any>;
}
