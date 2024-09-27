declare module "@salesforce/apex/ATD_AvisoViagemCtrl.getListagemCartoesLimites" {
  export default function getListagemCartoesLimites(param: {recordId: any, statusToFilter: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_AvisoViagemCtrl.getServicos" {
  export default function getServicos(param: {nuCartao: any, cpfCliente: any, produto: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_AvisoViagemCtrl.salvarAvisoViagem" {
  export default function salvarAvisoViagem(param: {recordId: any, dataInicio: any, dataFim: any, regiaoCode: any, cartao: any, produto: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_AvisoViagemCtrl.removerAvisoViagem" {
  export default function removerAvisoViagem(param: {recordId: any, notificationID: any, cartao: any, regiao: any, dataInicio: any, dataFim: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_AvisoViagemCtrl.getHistoricoAvisoViagem" {
  export default function getHistoricoAvisoViagem(param: {recordId: any, protocolo: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_AvisoViagemCtrl.getResults" {
  export default function getResults(param: {value: any}): Promise<any>;
}
