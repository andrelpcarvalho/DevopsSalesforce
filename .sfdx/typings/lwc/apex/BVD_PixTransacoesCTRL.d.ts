declare module "@salesforce/apex/BVD_PixTransacoesCTRL.getTransacoesPix" {
  export default function getTransacoesPix(param: {recordId: any, dataInicial: any, dataFinal: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_PixTransacoesCTRL.contestarPix" {
  export default function contestarPix(param: {recordId: any, nsu: any, motivo: any, jsonQuestionario: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_PixTransacoesCTRL.getEmail" {
  export default function getEmail(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_PixTransacoesCTRL.doSendEmail" {
  export default function doSendEmail(param: {recordId: any, email: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_PixTransacoesCTRL.checktoogle" {
  export default function checktoogle(): Promise<any>;
}
declare module "@salesforce/apex/BVD_PixTransacoesCTRL.geraLogConsulta" {
  export default function geraLogConsulta(param: {caseId: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_PixTransacoesCTRL.geraLogContestacao" {
  export default function geraLogContestacao(param: {caseId: any, nsu: any, status: any, valorTransacao: any, labelListaTabulacao: any, email: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_PixTransacoesCTRL.salvarInformacoesContestacao" {
  export default function salvarInformacoesContestacao(param: {caseId: any, questionarioJSON: any, transacaoJSON: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_PixTransacoesCTRL.getIntervaloMaximoDias" {
  export default function getIntervaloMaximoDias(): Promise<any>;
}
