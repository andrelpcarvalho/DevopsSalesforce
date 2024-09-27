declare module "@salesforce/apex/BVD_ConsultaLancamentosFuturosCTRL.consultaLancamentos" {
  export default function consultaLancamentos(param: {caseId: any, dataInicio: any, dataFim: any}): Promise<any>;
}
declare module "@salesforce/apex/BVD_ConsultaLancamentosFuturosCTRL.gerarLog" {
  export default function gerarLog(param: {caseId: any, tipoLancamento: any, dataDe: any, dataAte: any}): Promise<any>;
}
