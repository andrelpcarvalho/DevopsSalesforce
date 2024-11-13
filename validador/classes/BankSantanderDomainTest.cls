@isTest
public class BankSantanderDomainTest {
    @isTest
    static void validateBankSantanderCheckContaWhenSuccess() {
        Test.startTest();
            String agencia = '1257';
            String conta = '596731';
            String digitoConta = '0';
            
            BankSantanderDomain santanderBank = new BankSantanderDomain ( agencia ,  conta ,  digitoConta);
            Boolean contaValidation = santanderBank.checkContaWithAgencia( agencia ,conta, digitoConta);
            
            Assert.areEqual(true, contaValidation, 'Esperado que a conta esteja correta');
        Test.stopTest();
    }

    @isTest
    static void validateBankSantanderCheckContaWhenEmptyAgenciaEContaError() {
        Test.startTest();
            String agencia = '';
            String conta = '';
            String digitoConta = '0';
            
            BankSantanderDomain santanderBank = new BankSantanderDomain ( agencia ,  conta ,  digitoConta);
            Boolean contaValidation = santanderBank.checkContaWithAgencia( agencia ,conta, digitoConta);
            
            Assert.areEqual(false, contaValidation, 'Esperado que a conta esteja incorreta');
        Test.stopTest();
    }

    @isTest
    static void validateBankSantanderCheckContaWhenQuantidadeCaracteresAgenciaError() {
        Test.startTest();
            String agencia = '12345';
            String conta = '596731';
            String digitoConta = '0';
            
            BankSantanderDomain santanderBank = new BankSantanderDomain ( agencia ,  conta ,  digitoConta);
            Boolean contaValidation = santanderBank.checkContaWithAgencia( agencia ,conta, digitoConta);
            
            Assert.areEqual(false, contaValidation, 'Esperado que a conta esteja incorreta');
        Test.stopTest();
    }

    @isTest
    static void validateBankSantanderCheckContaWhenQuantidadeCaracteresContaError() {
        Test.startTest();
            String agencia = '1257';
            String conta = '12345678901';
            String digitoConta = '0';
            
            BankSantanderDomain santanderBank = new BankSantanderDomain ( agencia ,  conta ,  digitoConta);
            Boolean contaValidation = santanderBank.checkContaWithAgencia( agencia ,conta, digitoConta);
            
            Assert.areEqual(false, contaValidation, 'Esperado que a conta esteja incorreta');
        Test.stopTest();
    }

    @isTest
    static void validateBankSantanderWhenValidateException() {
        String agencia = '0352';
        String conta = '01039171';
        String digitoConta = '9';

        try{
            Test.startTest();
            BankSantanderDomain bank = new BankSantanderDomain ( agencia,  conta ,  digitoConta);
            bank.validate();
            Test.stopTest();
            Assert.fail('Era esperado uma mensagem de exceção');
        } catch(Exception e){
            Assert.areEqual('Dados de Agência e Conta inválidos', e.getMessage());     
        }
    }

    
}