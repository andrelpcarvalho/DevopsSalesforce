@isTest
public class BankRealDomainTest {
    @isTest
    static void validateBankRealCheckContaWhenError() {
        Test.startTest();
            String agencia = '0083';
            String conta = '7683373264';
            String digitoConta = '1';
            
            BankRealDomain realBank = new BankRealDomain ( agencia ,  conta ,  digitoConta);
            Boolean contaValidation = realBank.checkContaWithAgencia( agencia ,conta, digitoConta);
            
            Assert.areEqual(false, contaValidation, 'Esperado que a conta esteja incorreta');
        Test.stopTest();
    }

    @isTest
    static void validateBankRealCheckContaWhenDigitoContaIsEmptyError() {
        Test.startTest();
            String agencia = '0083';
            String conta = '7683373264';
            String digitoConta = '';
            
            BankRealDomain realBank = new BankRealDomain ( agencia ,  conta ,  digitoConta);
            Boolean contaValidation = realBank.checkContaWithAgencia( agencia ,conta, digitoConta);
            
            Assert.areEqual(false, contaValidation, 'Esperado que a conta esteja incorreta');
        Test.stopTest();
    }

    @isTest
    static void validateBankRealCheckContaWhenQuantidadeCaracteresContaError() {
        Test.startTest();
            String agencia = '123456';
            String conta = '7683373264';
            String digitoConta = '1';
            
            BankRealDomain realBank = new BankRealDomain ( agencia ,  conta ,  digitoConta);
            Boolean contaValidation = realBank.checkContaWithAgencia( agencia ,conta, digitoConta);
            
            Assert.areEqual(false, contaValidation, 'Esperado que a conta esteja incorreta');
        Test.stopTest();
    }

    @isTest
    static void validateBankRealCheckContaWhenQuantidadeCaracteresAgenciaError() {
        Test.startTest();
            String agencia = '0083';
            String conta = '123456789';
            String digitoConta = '1';
            
            BankRealDomain realBank = new BankRealDomain ( agencia ,  conta ,  digitoConta);
            Boolean contaValidation = realBank.checkContaWithAgencia( agencia ,conta, digitoConta);
            
            Assert.areEqual(false, contaValidation, 'Esperado que a conta esteja incorreta');
        Test.stopTest();
    }

    @isTest
    static void validateBankRealCheckContaWhenSuccess() {
        Test.startTest();
            String agencia = '1234';
            String conta = '5678';
            String digitoConta = '4';
            
            BankRealDomain realBank = new BankRealDomain ( agencia ,  conta ,  digitoConta);
            Boolean contaValidation = realBank.checkContaWithAgencia( agencia ,conta, digitoConta);
            
            Assert.areEqual(true, contaValidation, 'Esperado que a conta esteja correta');
        Test.stopTest();
    }
    
    @isTest
    static void validateBankRealCheckContaWhenDigitoVerificador1Success() {
        Test.startTest();
            String agencia = '12';
            String conta = '12345';
            String digitoConta = '1';
            
            BankRealDomain realBank = new BankRealDomain ( agencia ,  conta ,  digitoConta);
            Boolean contaValidation = realBank.checkContaWithAgencia( agencia ,conta, digitoConta);
            
            Assert.areEqual(true, contaValidation, 'Esperado que a conta esteja correta');
        Test.stopTest();
    }

    @isTest
    static void validateBankRealWhenValidateException() {
        String agencia = '0083';
        String digitoAgencia = '';
        String conta = '7683373264';
        String digitoConta = '1';

        try{
            Test.startTest();
            BankRealDomain bank = new BankRealDomain ( agencia,  conta ,  digitoConta);
            bank.validate();
            Test.stopTest();
            Assert.fail('Era esperado uma mensagem de exceção');
        } catch(Exception e){
            Assert.areEqual('Dados de Agência e Conta inválidos', e.getMessage());     
        }
    }
}