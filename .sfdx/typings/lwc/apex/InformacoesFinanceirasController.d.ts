declare module "@salesforce/apex/InformacoesFinanceirasController.setDetalhesNegociacao" {
  export default function setDetalhesNegociacao(param: {recordId: any, parcelasNegociadas: any, vencimentoBoleto: any, valorBoleto: any}): Promise<any>;
}
declare module "@salesforce/apex/InformacoesFinanceirasController.getDetalhesDesconto" {
  export default function getDetalhesDesconto(param: {recordId: any, tipoAcordo: any, sqFinanceira: any}): Promise<any>;
}
declare module "@salesforce/apex/InformacoesFinanceirasController.getDetalhesTipoAcordo" {
  export default function getDetalhesTipoAcordo(param: {recordId: any, listaParcelas: any}): Promise<any>;
}
declare module "@salesforce/apex/InformacoesFinanceirasController.getDetalhesParcelasPagas" {
  export default function getDetalhesParcelasPagas(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/InformacoesFinanceirasController.getDetalhesParcelasPendentes" {
  export default function getDetalhesParcelasPendentes(param: {recordId: any, dataAtual: any}): Promise<any>;
}
declare module "@salesforce/apex/InformacoesFinanceirasController.getDetalhesContraOferta" {
  export default function getDetalhesContraOferta(param: {recordId: any, dataVencimento: any, listaParcelas: any, percentualDescontoParcelaProposto: any, percentualDescontoMoraProposto: any, percentualDescontoMultaProposto: any, percentualDescontoDespesaProposto: any, percentualHonorarioProposto: any, percentualDescontoVincendaProposto: any, codigoProduto: any}): Promise<any>;
}
declare module "@salesforce/apex/InformacoesFinanceirasController.getDetalhesBoleto" {
  export default function getDetalhesBoleto(param: {recordId: any, idCache: any}): Promise<any>;
}
declare module "@salesforce/apex/InformacoesFinanceirasController.getGenerateBoletoPDF" {
  export default function getGenerateBoletoPDF(param: {recordId: any, hashBoleto: any}): Promise<any>;
}
declare module "@salesforce/apex/InformacoesFinanceirasController.getDetalhesEnvioEmail" {
  export default function getDetalhesEnvioEmail(param: {recordId: any, hashBoleto: any, email: any}): Promise<any>;
}
declare module "@salesforce/apex/InformacoesFinanceirasController.getDetalhesContatoBoleto" {
  export default function getDetalhesContatoBoleto(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/InformacoesFinanceirasController.getDadosComplementares" {
  export default function getDadosComplementares(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/InformacoesFinanceirasController.getDiasVencimento" {
  export default function getDiasVencimento(): Promise<any>;
}
declare module "@salesforce/apex/InformacoesFinanceirasController.getMetadataLimiteAtraso" {
  export default function getMetadataLimiteAtraso(): Promise<any>;
}
