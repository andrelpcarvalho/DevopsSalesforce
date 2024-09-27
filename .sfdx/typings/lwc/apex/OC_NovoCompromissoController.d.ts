declare module "@salesforce/apex/OC_NovoCompromissoController.getUserLogged" {
  export default function getUserLogged(): Promise<any>;
}
declare module "@salesforce/apex/OC_NovoCompromissoController.getCriarCompromisso" {
  export default function getCriarCompromisso(param: {listaConvidados: any, conta: any, dataInicio: any, dataFim: any, assunto: any, local: any, tipo: any, usuario: any, obs: any, idEdit: any}): Promise<any>;
}
declare module "@salesforce/apex/OC_NovoCompromissoController.getListaAssuntosEvent" {
  export default function getListaAssuntosEvent(): Promise<any>;
}
declare module "@salesforce/apex/OC_NovoCompromissoController.getDetalhes" {
  export default function getDetalhes(param: {id_compromisso: any}): Promise<any>;
}
