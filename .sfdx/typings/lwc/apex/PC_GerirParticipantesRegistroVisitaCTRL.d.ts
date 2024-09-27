declare module "@salesforce/apex/PC_GerirParticipantesRegistroVisitaCTRL.createTask" {
  export default function createTask(param: {task: any}): Promise<any>;
}
declare module "@salesforce/apex/PC_GerirParticipantesRegistroVisitaCTRL.getRecordTypeId" {
  export default function getRecordTypeId(): Promise<any>;
}
declare module "@salesforce/apex/PC_GerirParticipantesRegistroVisitaCTRL.getParticipantesExistentes" {
  export default function getParticipantesExistentes(param: {registroVisita: any}): Promise<any>;
}
declare module "@salesforce/apex/PC_GerirParticipantesRegistroVisitaCTRL.getUsuarios" {
  export default function getUsuarios(param: {existentes: any}): Promise<any>;
}
declare module "@salesforce/apex/PC_GerirParticipantesRegistroVisitaCTRL.getUsuariosPesquisa" {
  export default function getUsuariosPesquisa(param: {name: any, selecionados: any}): Promise<any>;
}
declare module "@salesforce/apex/PC_GerirParticipantesRegistroVisitaCTRL.gerirParticipantes" {
  export default function gerirParticipantes(param: {registroVisita: any, usuariosNovos: any}): Promise<any>;
}
