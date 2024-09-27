declare module "@salesforce/apex/TelaUnicaController.getInfoCase" {
  export default function getInfoCase(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/TelaUnicaController.prepareInfoCase" {
  export default function prepareInfoCase(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/TelaUnicaController.getProtocolInfo" {
  export default function getProtocolInfo(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/TelaUnicaController.getCaseEnum" {
  export default function getCaseEnum(): Promise<any>;
}
declare module "@salesforce/apex/TelaUnicaController.getProdutosContratadosTelaUnica" {
  export default function getProdutosContratadosTelaUnica(param: {caseId: any}): Promise<any>;
}
declare module "@salesforce/apex/TelaUnicaController.getServicosTelaUnica" {
  export default function getServicosTelaUnica(param: {productType: any, recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/TelaUnicaController.getServicosTelaUnicaAura" {
  export default function getServicosTelaUnicaAura(param: {productType: any, recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/TelaUnicaController.getServicosFilhosTelaUnica" {
  export default function getServicosFilhosTelaUnica(param: {productType: any, cardName: any}): Promise<any>;
}
declare module "@salesforce/apex/TelaUnicaController.searchReason" {
  export default function searchReason(param: {text: any, produto: any, classificacao: any, hasClassificacao: any}): Promise<any>;
}
declare module "@salesforce/apex/TelaUnicaController.searchSubmotifs" {
  export default function searchSubmotifs(param: {idReason: any, produto: any, classificacao: any, hasClassificacao: any}): Promise<any>;
}
declare module "@salesforce/apex/TelaUnicaController.generateChildCase" {
  export default function generateChildCase(param: {caseFields: any, captacao: any}): Promise<any>;
}
declare module "@salesforce/apex/TelaUnicaController.closeCase" {
  export default function closeCase(param: {caseFields: any, captacao: any}): Promise<any>;
}
declare module "@salesforce/apex/TelaUnicaController.validaContratoSelecionado" {
  export default function validaContratoSelecionado(param: {caseId: any, reasonId: any, submotiveId: any}): Promise<any>;
}
declare module "@salesforce/apex/TelaUnicaController.idNamesTabDefault" {
  export default function idNamesTabDefault(): Promise<any>;
}
declare module "@salesforce/apex/TelaUnicaController.automaticTabData" {
  export default function automaticTabData(param: {tabName: any}): Promise<any>;
}
declare module "@salesforce/apex/TelaUnicaController.insertLog" {
  export default function insertLog(param: {caseId: any, logTitle: any, logData: any}): Promise<any>;
}
declare module "@salesforce/apex/TelaUnicaController.insertCaseLog" {
  export default function insertCaseLog(param: {caseFields: any}): Promise<any>;
}
declare module "@salesforce/apex/TelaUnicaController.getAllowedPermissions" {
  export default function getAllowedPermissions(param: {listToCheck: any}): Promise<any>;
}
declare module "@salesforce/apex/TelaUnicaController.populateCaseFieldsOnChange" {
  export default function populateCaseFieldsOnChange(param: {caseId: any, produto: any}): Promise<any>;
}
declare module "@salesforce/apex/TelaUnicaController.getCaseInfos" {
  export default function getCaseInfos(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/TelaUnicaController.getCardType" {
  export default function getCardType(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/TelaUnicaController.getVisibilityInformations" {
  export default function getVisibilityInformations(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/TelaUnicaController.hasRelatedEmail" {
  export default function hasRelatedEmail(param: {caseId: any}): Promise<any>;
}
declare module "@salesforce/apex/TelaUnicaController.closeCurrentCaseAndCreateNewOne" {
  export default function closeCurrentCaseAndCreateNewOne(param: {caseId: any, info: any, captacao: any}): Promise<any>;
}
declare module "@salesforce/apex/TelaUnicaController.getClassification" {
  export default function getClassification(): Promise<any>;
}
declare module "@salesforce/apex/TelaUnicaController.hasClassificationPermission" {
  export default function hasClassificationPermission(): Promise<any>;
}
declare module "@salesforce/apex/TelaUnicaController.isEnabledSeguros" {
  export default function isEnabledSeguros(): Promise<any>;
}
