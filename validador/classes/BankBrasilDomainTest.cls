@isTest
public class BankBrasilDomainTest {
    @isTest
    static void validateBankBrasilCheckAgenciaWhenSuccess() {
        Test.startTest();
            String agencia = '2258';
            String digitoAgencia = '6';
            String conta = '22324';
            String digitoConta = '7';

            BankBrasilDomain brasilBank = new BankBrasilDomain(agencia, digitoAgencia, conta, digitoConta);
            Boolean agenciaValidation = brasilBank.checkAgencia( agencia , digitoAgencia);
            
            Assert.areEqual(true, agenciaValidation, 'Esperado que a agência esteja correta');
        Test.stopTest();
    }

    @isTest
    static void validateBankBrasilCheckAgenciaWhenError() {
        Test.startTest();
            String agencia = '2258';
            String digitoAgencia = '5';
            String conta = '22324';
            String digitoConta = '7';

            BankBrasilDomain brasilBank = new BankBrasilDomain(agencia, digitoAgencia, conta, digitoConta);
            Boolean agenciaValidation = brasilBank.checkAgencia( agencia , digitoAgencia);
            
            Assert.areEqual(false, agenciaValidation, 'Esperado que a agência esteja incorreta');
        Test.stopTest();
    }

    @isTest
    static void validateBankBrasilCheckAgenciaWhenDigitoAgenciaIsNullError() {
        Test.startTest();
            String agencia = '2258';
            String digitoAgencia = null;
            String conta = '22324';
            String digitoConta = '7';

            BankBrasilDomain brasilBank = new BankBrasilDomain(agencia, digitoAgencia, conta, digitoConta);
            Boolean agenciaValidation = brasilBank.checkAgencia( agencia , digitoAgencia);
            
            Assert.areEqual(false, agenciaValidation, 'Esperado que a agência esteja incorreta');
        Test.stopTest();
    }

    @isTest
    static void validateBankBrasilCheckAgenciaWhenQuantidadeCaracteresAgenciaError() {
        Test.startTest();
            String agencia = '225822581';
            String digitoAgencia = null;
            String conta = '22324';
            String digitoConta = '7';

            BankBrasilDomain brasilBank = new BankBrasilDomain(agencia, digitoAgencia, conta, digitoConta);
            Boolean agenciaValidation = brasilBank.checkAgencia( agencia , digitoAgencia);
            
            Assert.areEqual(false, agenciaValidation, 'Esperado que a agência esteja incorreta');
        Test.stopTest();
    }
    

    @isTest
    static void validateBankBrasilCheckContaWhenSuccess() {
        Test.startTest();
            String agencia = '2258';
            String digitoAgencia = '6';
            String conta = '22324';
            String digitoConta = '7';

            BankBrasilDomain brasilBank = new BankBrasilDomain(agencia, digitoAgencia, conta, digitoConta);
            Boolean contaValidation = brasilBank.checkConta( conta , digitoConta);
            
            Assert.areEqual(true, contaValidation, 'Esperado que a conta esteja correta');
        Test.stopTest();
    }

    @isTest
    static void validateBankBrasilCheckContaWhenDigitoContaIsNullError() {
        Test.startTest();
            String agencia = '2258';
            String digitoAgencia = '6';
            String conta = '22324';
            String digitoConta = null;

            BankBrasilDomain brasilBank = new BankBrasilDomain(agencia, digitoAgencia, conta, digitoConta);
            Boolean contaValidation = brasilBank.checkConta( conta , digitoConta);
            
            Assert.areEqual(false, contaValidation, 'Esperado que a conta esteja incorreta');
        Test.stopTest();
    }

    @isTest
    static void validateBankBrasilCheckContaWhenDigitoVerificadorXSuccess() {
        Test.startTest();
            String agencia = '2258';
            String digitoAgencia = '6';
            String conta = '2232433';
            String digitoConta = 'x';

            BankBrasilDomain brasilBank = new BankBrasilDomain(agencia, digitoAgencia, conta, digitoConta);
            Boolean contaValidation = brasilBank.checkConta( conta , digitoConta);
            
            Assert.areEqual(true, contaValidation, 'Esperado que a conta esteja correta');
        Test.stopTest();
    }

    @isTest
    static void validateBankBrasilCheckContaWhenDigitoVerificador0Success() {
        Test.startTest();
            String agencia = '2258';
            String digitoAgencia = '6';
            String conta = '2232438';
            String digitoConta = '0';

            BankBrasilDomain brasilBank = new BankBrasilDomain(agencia, digitoAgencia, conta, digitoConta);
            Boolean contaValidation = brasilBank.checkConta( conta , digitoConta);
            
            Assert.areEqual(true, contaValidation, 'Esperado que a conta esteja correta');
        Test.stopTest();
    }


    @isTest
    static void validateBankBrasilCheckContaWhenErrorQuantidadeCaracteresContaError() {
        Test.startTest();
            String agencia = '2258';
            String digitoAgencia = '6';
            String conta = '223243333';
            String digitoConta = 'x';

            BankBrasilDomain brasilBank = new BankBrasilDomain(agencia, digitoAgencia, conta, digitoConta);
            Boolean contaValidation = brasilBank.checkConta( conta , digitoConta);
            
            Assert.areEqual(false, contaValidation, 'Esperado que a conta esteja incorreta');
        Test.stopTest();
    }

    @isTest
    static void validateBankBrasilWhenValidateException() {
        String agencia = '2258';
        String digitoAgencia = '5';
        String conta = '22324';
        String digitoConta = '6';
        String bankCode = '001';

        try{
            Test.startTest();
            BankBrasilDomain bank = new BankBrasilDomain ( agencia,  digitoAgencia ,  conta ,  digitoConta);
            bank.validate();
            Test.stopTest();
            Assert.fail('Era esperado uma mensagem de exceção');
        } catch(Exception e){
            Assert.areEqual('Dados de Agência e Conta inválidos', e.getMessage());     
        }
    }

}