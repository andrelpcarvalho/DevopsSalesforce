declare module "@salesforce/apex/BV_EncerramentoCasosCrossCtrl.getMotivoSubmotivo" {
  export default function getMotivoSubmotivo(param: {recordId: any, mapTabulacao: any}): Promise<any>;
}
declare module "@salesforce/apex/BV_EncerramentoCasosCrossCtrl.retornaDadosCaso" {
  export default function retornaDadosCaso(param: {caseId: any}): Promise<any>;
}
declare module "@salesforce/apex/BV_EncerramentoCasosCrossCtrl.checkCampoCaptacao" {
  export default function checkCampoCaptacao(param: {mapTabulacao: any}): Promise<any>;
}
declare module "@salesforce/apex/BV_EncerramentoCasosCrossCtrl.getFilaOptions" {
  export default function getFilaOptions(): Promise<any>;
}
declare module "@salesforce/apex/BV_EncerramentoCasosCrossCtrl.getMapValueByNameGrupoLista" {
  export default function getMapValueByNameGrupoLista(): Promise<any>;
}
declare module "@salesforce/apex/BV_EncerramentoCasosCrossCtrl.doSaveCaso" {
  export default function doSaveCaso(param: {recordId: any, fila: any, comentario: any, motivo: any, submotivo: any, mapTabulacao: any, casoJaTabulado: any, captacao: any, isBancoDigital: any, hasFila: any, areaNegocio: any, idTabulacao: any}): Promise<any>;
}
declare module "@salesforce/apex/BV_EncerramentoCasosCrossCtrl.doSaveCase" {
  export default function doSaveCase(param: {recordId: any, fila: any, comentario: any, motivo: any, submotivo: any, mapTabulacao: any, casoJaTabulado: any, captacao: any, isBancoDigital: any, hasFila: any, areaNegocio: any, isReclamacao: any, idTabulacao: any}): Promise<any>;
}
declare module "@salesforce/apex/BV_EncerramentoCasosCrossCtrl.doCriarNovoCaso" {
  export default function doCriarNovoCaso(param: {recordId: any, produtoSelecionado: any, status: any, recordTypeName: any}): Promise<any>;
}
declare module "@salesforce/apex/BV_EncerramentoCasosCrossCtrl.getProdutosContratadosByCaseIdService" {
  export default function getProdutosContratadosByCaseIdService(param: {caseId: any}): Promise<any>;
}
declare module "@salesforce/apex/BV_EncerramentoCasosCrossCtrl.geraLog" {
  export default function geraLog(param: {CaseId: any, acao: any}): Promise<any>;
}
declare module "@salesforce/apex/BV_EncerramentoCasosCrossCtrl.getListaTabulacaoByCodMotivoESubmotivo" {
  export default function getListaTabulacaoByCodMotivoESubmotivo(param: {codMotivo: any, codSubmotivo: any}): Promise<any>;
}
declare module "@salesforce/apex/BV_EncerramentoCasosCrossCtrl.getFilaDaListaTabulacao" {
  export default function getFilaDaListaTabulacao(param: {idTabPai: any, codTabFilho: any}): Promise<any>;
}
declare module "@salesforce/apex/BV_EncerramentoCasosCrossCtrl.enviaEmailCaptacao" {
  export default function enviaEmailCaptacao(param: {recordId: any, emailAddress: any}): Promise<any>;
}
declare module "@salesforce/apex/BV_EncerramentoCasosCrossCtrl.fecharCasosExtras" {
  export default function fecharCasosExtras(param: {casesToFinish: any, isReclamacao: any}): Promise<any>;
}
