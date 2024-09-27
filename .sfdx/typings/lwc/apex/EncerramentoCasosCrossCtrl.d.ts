declare module "@salesforce/apex/EncerramentoCasosCrossCtrl.getMotivoSubmotivo" {
  export default function getMotivoSubmotivo(param: {recordId: any, mapTabulacao: any}): Promise<any>;
}
declare module "@salesforce/apex/EncerramentoCasosCrossCtrl.retornaDadosCaso" {
  export default function retornaDadosCaso(param: {caseId: any}): Promise<any>;
}
declare module "@salesforce/apex/EncerramentoCasosCrossCtrl.checkCampoCaptacao" {
  export default function checkCampoCaptacao(param: {mapTabulacao: any}): Promise<any>;
}
declare module "@salesforce/apex/EncerramentoCasosCrossCtrl.getFilaOptions" {
  export default function getFilaOptions(): Promise<any>;
}
declare module "@salesforce/apex/EncerramentoCasosCrossCtrl.getMapValueByNameGrupoLista" {
  export default function getMapValueByNameGrupoLista(): Promise<any>;
}
declare module "@salesforce/apex/EncerramentoCasosCrossCtrl.doSaveCaso" {
  export default function doSaveCaso(param: {recordId: any, fila: any, comentario: any, labelListaTabulacao: any, idListaTabulacao: any, mapTabulacao: any, casoJaTabulado: any, captacao: any, isBancoDigital: any, hasFila: any, areaNegocio: any}): Promise<any>;
}
declare module "@salesforce/apex/EncerramentoCasosCrossCtrl.doSaveCase" {
  export default function doSaveCase(param: {recordId: any, fila: any, comentario: any, labelListaTabulacao: any, idListaTabulacao: any, mapTabulacao: any, casoJaTabulado: any, captacao: any, isBancoDigital: any, hasFila: any, areaNegocio: any, isReclamacao: any, recordTypeName: any}): Promise<any>;
}
declare module "@salesforce/apex/EncerramentoCasosCrossCtrl.doCriarNovoCaso" {
  export default function doCriarNovoCaso(param: {recordId: any, produtoSelecionado: any, status: any, recordTypeName: any}): Promise<any>;
}
declare module "@salesforce/apex/EncerramentoCasosCrossCtrl.getProdutosContratadosByCaseIdService" {
  export default function getProdutosContratadosByCaseIdService(param: {caseId: any}): Promise<any>;
}
declare module "@salesforce/apex/EncerramentoCasosCrossCtrl.geraLog" {
  export default function geraLog(param: {caseId: any, acao: any}): Promise<any>;
}
declare module "@salesforce/apex/EncerramentoCasosCrossCtrl.getListaTabulacaoByCodMotivoESubmotivo" {
  export default function getListaTabulacaoByCodMotivoESubmotivo(param: {codMotivo: any, codSubmotivo: any}): Promise<any>;
}
declare module "@salesforce/apex/EncerramentoCasosCrossCtrl.getListaTabulacao" {
  export default function getListaTabulacao(param: {label: any, ltId: any}): Promise<any>;
}
declare module "@salesforce/apex/EncerramentoCasosCrossCtrl.getFilaDaListaTabulacao" {
  export default function getFilaDaListaTabulacao(param: {idTabPai: any, codTabFilho: any}): Promise<any>;
}
declare module "@salesforce/apex/EncerramentoCasosCrossCtrl.enviaEmailCaptacao" {
  export default function enviaEmailCaptacao(param: {recordId: any, emailAddress: any}): Promise<any>;
}
declare module "@salesforce/apex/EncerramentoCasosCrossCtrl.fecharCasosExtras" {
  export default function fecharCasosExtras(param: {casesToFinish: any, isReclamacao: any}): Promise<any>;
}
