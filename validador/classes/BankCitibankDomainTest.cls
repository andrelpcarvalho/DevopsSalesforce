@isTest
public class BankCitibankDomainTest {
    @isTest
    static void validateBankCitibankCheckContaWhenSuccess() {
        Test.startTest();
            String agencia = '0083';
            String conta = '7683373264';
            String digitoConta = '7';
            
            BankCitibankDomain citibankBank = new BankCitibankDomain ( agencia ,  conta ,  digitoConta);
            Boolean contaValidation = citibankBank.checkContaWithAgencia( agencia ,conta, digitoConta);
            
            Assert.areEqual(true, contaValidation, 'Esperado que a conta esteja correta');
        Test.stopTest();
    }
    
    @isTest
    static void validateBankCitibankCheckContaWhenDigitoContaIsEmptyError() {
        Test.startTest();
            String agencia = '0083';
            String conta = '7683373264';
            String digitoConta = '';
            
            BankCitibankDomain citibankBank = new BankCitibankDomain ( agencia ,  conta ,  digitoConta);
            Boolean contaValidation = citibankBank.checkContaWithAgencia( agencia ,conta, digitoConta);
            
            Assert.areEqual(false, contaValidation, 'Esperado que a conta esteja incorreta');
        Test.stopTest();
    }
    
    @isTest
    static void validateBankCitibankCheckContaWhenQuantidadeCaracteresAgenciaError() {
        Test.startTest();
            String agencia = '12345';
            String conta = '7683373264';
            String digitoConta = '7';
            
            BankCitibankDomain citibankBank = new BankCitibankDomain ( agencia ,  conta ,  digitoConta);
            Boolean contaValidation = citibankBank.checkContaWithAgencia( agencia ,conta, digitoConta);
            
            Assert.areEqual(false, contaValidation, 'Esperado que a conta esteja incorreta');
        Test.stopTest();
    }
    
    @isTest
    static void validateBankCitibankCheckContaWhenQuantidadeCaracteresContaError() {
        Test.startTest();
            String agencia = '0083';
            String conta = '12345678901';
            String digitoConta = '7';
            
            BankCitibankDomain citibankBank = new BankCitibankDomain ( agencia ,  conta ,  digitoConta);
            Boolean contaValidation = citibankBank.checkContaWithAgencia( agencia ,conta, digitoConta);
            
            Assert.areEqual(false, contaValidation, 'Esperado que a conta esteja incorreta');
        Test.stopTest();
    }

    @isTest
    static void validateBankCitibankWhenValidateException() {
        String agencia = '0083';
        String digitoAgencia = '';
        String conta = '7683373264';
        String digitoConta = '1';

        try{
            Test.startTest();
            BankCitibankDomain bank = new BankCitibankDomain ( agencia,  conta ,  digitoConta);
            bank.validate();
            Test.stopTest();
            Assert.fail('Era esperado uma mensagem de exceção');
        } catch(Exception e){
            Assert.areEqual('Dados de Agência e Conta inválidos', e.getMessage());     
        }
    }
}