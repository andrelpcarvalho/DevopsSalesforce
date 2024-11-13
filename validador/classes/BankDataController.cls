public class BankDataController {

    @AuraEnabled(cacheable=true)
    public static Map<String,Object> getBankInfo(String recordId){
         return ProductService.getProducts(recordId);
    }

    @AuraEnabled(cacheable=true)
    public static List<BancoDigitalCardViewModel.Banco> getBanks(){
        try{
            List<BancoDigitalCardViewModel.Banco> retorno = LoanContractService.getBanks();
            return retorno;
        }catch(LoanContractAPIService.LoanContractAPIServiceException e){
            System.debug('ERROR: ' + e.getMessage() + '\n\n' + e.getStackTraceString());
            throw new AuraHandledException(e.getMessage());
        }catch(Exception e){
            System.debug('ERROR: ' + e.getMessage() + '\n\n' + e.getStackTraceString());
            throw new AuraHandledException('Falha ao tentar contactar o serviço de lista bancária.');
        }
    }
    
    @AuraEnabled
    public static Case getCaseInfo(String recordId) {
        Case caso;
        try {
            caso = (Case)new CaseSelector().getById('Id,BV_Area_Negocio__c,CPF_CNPJ__c', recordId).get(0);
        } catch (Exception e) {
            System.debug('ERROR: ' + e.getMessage() + '\n\n' + e.getStackTraceString());
            throw new AuraHandledException('Info: BankDataController.getCaseInfo [' + e.getMessage() + ']');
        }
        return caso;
    }

    @AuraEnabled
    public static void validateBankInfo(String agencia, String digitoAgencia , String conta , String digitoConta , String bankCode) {
        try{
            BankService.validateBank(agencia,  digitoAgencia ,  conta ,  digitoConta , bankCode );
        }catch (BankDomain.BankDomainException e) {
            System.debug('ERROR: ' + e.getMessage() + '\n\n' + e.getStackTraceString());
            throw new AuraHandledException(e.getMessage());
        }
        
    }
}