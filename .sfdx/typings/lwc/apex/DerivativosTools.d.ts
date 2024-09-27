declare module "@salesforce/apex/DerivativosTools.salvarDerivativo" {
  export default function salvarDerivativo(param: {derivativo: any, ids: any}): Promise<any>;
}
declare module "@salesforce/apex/DerivativosTools.RetornaDerivativo" {
  export default function RetornaDerivativo(param: {idDer: any}): Promise<any>;
}
declare module "@salesforce/apex/DerivativosTools.AtualizaDerivativo" {
  export default function AtualizaDerivativo(param: {derivativo: any}): Promise<any>;
}
declare module "@salesforce/apex/DerivativosTools.contasFilhos" {
  export default function contasFilhos(param: {idConta: any, recordTy: any}): Promise<any>;
}
