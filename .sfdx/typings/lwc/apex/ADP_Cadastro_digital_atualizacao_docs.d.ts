declare module "@salesforce/apex/ADP_Cadastro_digital_atualizacao_docs.getDadosIniciais" {
  export default function getDadosIniciais(param: {IdUrl: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_Cadastro_digital_atualizacao_docs.ValidaHashGlobal" {
  export default function ValidaHashGlobal(param: {HASH: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_Cadastro_digital_atualizacao_docs.marcaParaRemover" {
  export default function marcaParaRemover(param: {IdConta: any, IdArq: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_Cadastro_digital_atualizacao_docs.deleteArquivos" {
  export default function deleteArquivos(param: {IdConta: any, DeletarIds: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_Cadastro_digital_atualizacao_docs.salvarArquivosEmConta" {
  export default function salvarArquivosEmConta(param: {IdConta: any, Estatuto: any, Eleicao: any, Balanco: any, Procuracao: any}): Promise<any>;
}
declare module "@salesforce/apex/ADP_Cadastro_digital_atualizacao_docs.SalvaArqBeneficiarios" {
  export default function SalvaArqBeneficiarios(param: {IdConta: any, Beneficiarios: any}): Promise<any>;
}
