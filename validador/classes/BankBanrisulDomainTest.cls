@isTest
public class BankBanrisulDomainTest {
    @isTest
    static void validateBankBanrisulCheckAgenciaWhenSuccess() {
        Test.startTest();
            String agencia = '2375';
            String digitoAgencia = '47';
            String conta = '0066215';
            String digitoConta = '1';

            BankBanrisulDomain banrisulBank = new BankBanrisulDomain(agencia, digitoAgencia, conta, digitoConta);
            Boolean agenciaValidation = banrisulBank.checkAgencia( agencia , digitoAgencia);
            
            Assert.areEqual(true, agenciaValidation, 'Esperado que a agência esteja correta');
        Test.stopTest();
    }

    @isTest
    static void validateBankBanrisulCheckAgenciaWhenDigitoAgenciaIsEmptyError() {
        Test.startTest();
            String agencia = '2375';
            String digitoAgencia = '';
            String conta = '0066215';
            String digitoConta = '1';

            BankBanrisulDomain banrisulBank = new BankBanrisulDomain(agencia, digitoAgencia, conta, digitoConta);
            Boolean agenciaValidation = banrisulBank.checkAgencia( agencia , digitoAgencia);
            
            Assert.areEqual(false, agenciaValidation, 'Esperado que a agência esteja incorreta');
        Test.stopTest();
    }


    @isTest
    static void validateBankBanrisulCheckAgenciaWhenQuantidadeCaracteresAgenciaError() {
        Test.startTest();
            String agencia = '123456';
            String digitoAgencia = '47';
            String conta = '0066215';
            String digitoConta = '1';

            BankBanrisulDomain banrisulBank = new BankBanrisulDomain(agencia, digitoAgencia, conta, digitoConta);
            Boolean agenciaValidation = banrisulBank.checkAgencia( agencia , digitoAgencia);
            
            Assert.areEqual(false, agenciaValidation, 'Esperado que a agência esteja incorreta');
        Test.stopTest();
    }

    @isTest
    static void validateBankBanrisulCheckContaWhenSuccess() {
        Test.startTest();
            String agencia = '2375';
            String digitoAgencia = '2';
            String conta = '0066215';
            String digitoConta = '1';

            BankBanrisulDomain banrisulBank = new BankBanrisulDomain(agencia, digitoAgencia, conta, digitoConta);
            Boolean contaValidation = banrisulBank.checkConta( conta , digitoConta);
            
            Assert.areEqual(true, contaValidation, 'Esperado que a conta esteja correta');
        Test.stopTest();
    }

    @isTest
    static void validateBankBanrisulCheckContaWhenDigitoContaIsEmptyError() {
        Test.startTest();
            String agencia = '2375';
            String digitoAgencia = '2';
            String conta = '0066215';
            String digitoConta = '';

            BankBanrisulDomain banrisulBank = new BankBanrisulDomain(agencia, digitoAgencia, conta, digitoConta);
            Boolean contaValidation = banrisulBank.checkConta( conta , digitoConta);
            
            Assert.areEqual(false, contaValidation, 'Esperado que a conta esteja incorreta');
        Test.stopTest();
    }

    @isTest
    static void validateBankBanrisulCheckContaWhenQuantidadeCaracteresContaError() {
        Test.startTest();
            String agencia = '2375';
            String digitoAgencia = '2';
            String conta = '12345678901';
            String digitoConta = '1';

            BankBanrisulDomain banrisulBank = new BankBanrisulDomain(agencia, digitoAgencia, conta, digitoConta);
            Boolean contaValidation = banrisulBank.checkConta( conta , digitoConta);
            
            Assert.areEqual(false, contaValidation, 'Esperado que a conta esteja incorreta');
        Test.stopTest();
    }


    @isTest
    static void validateBankBanrisulWhenValidateException() {
        String agencia = '1234';
        String digitoAgencia = '';
        String conta = '000123456';
        String digitoConta = '7';

        try{
            Test.startTest();
            BankBanrisulDomain bank = new BankBanrisulDomain ( agencia,  digitoAgencia ,  conta ,  digitoConta);
            bank.validate();
            Test.stopTest();
            Assert.fail('Era esperado uma mensagem de exceção');
        } catch(Exception e){
            Assert.areEqual('Dados de Agência e Conta inválidos', e.getMessage());     
        }
    }
}