declare module "@salesforce/apex/ATD_UpgradeDowngradeCartaoCtrl.callElegibilidadeAPI" {
  export default function callElegibilidadeAPI(param: {cardAccount: any, forceChip: any}): Promise<any>;
}
declare module "@salesforce/apex/ATD_UpgradeDowngradeCartaoCtrl.callApiEfetivar" {
  export default function callApiEfetivar(param: {recordId: any, cardAccount: any, nuCartao: any, statusCartao: any, dadosElegibilidade: any, statusSolicitado: any, upOrDown: any}): Promise<any>;
}
