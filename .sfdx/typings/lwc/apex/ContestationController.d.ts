declare module "@salesforce/apex/ContestationController.getCardsWithTransactions" {
  export default function getCardsWithTransactions(param: {recordId: any, transactionListRequest: any, contestationTransactionRequest: any}): Promise<any>;
}
declare module "@salesforce/apex/ContestationController.blockCards" {
  export default function blockCards(param: {selectedCardJSON: any}): Promise<any>;
}
declare module "@salesforce/apex/ContestationController.getTransactions" {
  export default function getTransactions(param: {cards: any, cTransactionRequest: any, ltTransactionRequest: any, contestationType: any, product: any}): Promise<any>;
}
declare module "@salesforce/apex/ContestationController.performContestation" {
  export default function performContestation(param: {request: any}): Promise<any>;
}
declare module "@salesforce/apex/ContestationController.registerCaseService" {
  export default function registerCaseService(param: {recordId: any, tabLabel: any, selectedCardJSON: any, cardLockStatus: any, selectedTransactionJSON: any}): Promise<any>;
}
declare module "@salesforce/apex/ContestationController.getLockableCards" {
  export default function getLockableCards(): Promise<any>;
}
declare module "@salesforce/apex/ContestationController.getMaxNumberOfDays" {
  export default function getMaxNumberOfDays(): Promise<any>;
}
declare module "@salesforce/apex/ContestationController.getBlockCode" {
  export default function getBlockCode(param: {complaint: any}): Promise<any>;
}
