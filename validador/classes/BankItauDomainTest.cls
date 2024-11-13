@isTest
public class BankItauDomainTest {
    @isTest
    static void validateBankItauCheckContaWhenSuccess() {
        Test.startTest();
            String agencia = '7380';
            String conta = '02956';
            String digitoConta = '6';
            
            BankItauDomain itauBank = new BankItauDomain ( agencia ,  conta ,  digitoConta);
            Boolean contaValidation = itauBank.checkContaWithAgencia( agencia ,conta, digitoConta);
            
            Assert.areEqual(true, contaValidation, 'Esperado que a conta esteja correta');
        Test.stopTest();
    }

    @isTest
    static void validateBankItauCheckContaWhenDigitoContaIsEmptyError() {
        Test.startTest();
            String agencia = '7380';
            String conta = '02956';
            String digitoConta = '';
            
            BankItauDomain itauBank = new BankItauDomain ( agencia ,  conta ,  digitoConta);
            Boolean contaValidation = itauBank.checkContaWithAgencia( agencia ,conta, digitoConta);
            
            Assert.areEqual(false, contaValidation, 'Esperado que a conta esteja incorreta');
        Test.stopTest();
    }

    @isTest
    static void validateBankItauCheckContaWhenQuantidadeCaracteresAgenciaError() {
        Test.startTest();
            String agencia = '123456';
            String conta = '02956';
            String digitoConta = '6';
            
            BankItauDomain itauBank = new BankItauDomain ( agencia ,  conta ,  digitoConta);
            Boolean contaValidation = itauBank.checkContaWithAgencia( agencia ,conta, digitoConta);
            
            Assert.areEqual(false, contaValidation, 'Esperado que a conta esteja incorreta');
        Test.stopTest();
    }

    @isTest
    static void validateBankItauCheckContaWhenQuantidadeCaracteresContaError() {
        Test.startTest();
            String agencia = '7380';
            String conta = '1234567';
            String digitoConta = '6';
            
            BankItauDomain itauBank = new BankItauDomain ( agencia ,  conta ,  digitoConta);
            Boolean contaValidation = itauBank.checkContaWithAgencia( agencia ,conta, digitoConta);
            
            Assert.areEqual(false, contaValidation, 'Esperado que a conta esteja incorreta');
        Test.stopTest();
    }


    @isTest
    static void validateBankItauWhenValidateException() {
        String agencia = '7380';
        String digitoAgencia = '';
        String conta = '02956';
        String digitoConta = '1';

        try{
            Test.startTest();
            BankItauDomain bank = new BankItauDomain ( agencia,  conta ,  digitoConta);
            bank.validate();
            Test.stopTest();
            Assert.fail('Era esperado uma mensagem de exceção');
        } catch(Exception e){
            Assert.areEqual('Dados de Agência e Conta inválidos', e.getMessage());     
        }
    }

}