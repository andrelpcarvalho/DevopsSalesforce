declare module "@salesforce/apex/BV_ControleQtdChatsUsuariosCTRL.getAllUsersData" {
  export default function getAllUsersData(): Promise<any>;
}
declare module "@salesforce/apex/BV_ControleQtdChatsUsuariosCTRL.getUsersDataWithFilter" {
  export default function getUsersDataWithFilter(param: {filaSelecionada: any, EPSSelecionada: any, searchByName: any, selectedUsersIds: any}): Promise<any>;
}
declare module "@salesforce/apex/BV_ControleQtdChatsUsuariosCTRL.deletarPUCUsExistentes" {
  export default function deletarPUCUsExistentes(param: {usersIdList: any, qtdChats: any}): Promise<any>;
}
declare module "@salesforce/apex/BV_ControleQtdChatsUsuariosCTRL.alterarQtdChatsUsers" {
  export default function alterarQtdChatsUsers(param: {usersIdList: any, qtdChats: any, tokenFoiAtualizado: any}): Promise<any>;
}
