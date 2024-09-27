declare module "@salesforce/apex/ATD_PID_Controller.checkCanalOrProcesso" {
  export default function checkCanalOrProcesso(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_PID_Controller.getCanal" {
  export default function getCanal(): Promise<any>;
}
declare module "@salesforce/apex/ATD_PID_Controller.getProcessos" {
  export default function getProcessos(param: {canal: any, areaNegocio: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_PID_Controller.getPerguntas" {
  export default function getPerguntas(param: {recordId: any, canal: any, processo: any, productMap: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_PID_Controller.getRespostas" {
  export default function getRespostas(param: {caso: any, perguntas: any, productMap: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_PID_Controller.updateCase" {
  export default function updateCase(param: {recordId: any, statusRespostas: any, codProcesso: any, tipoPID: any, ignoredQuestions: any}): Promise<any>;
}
