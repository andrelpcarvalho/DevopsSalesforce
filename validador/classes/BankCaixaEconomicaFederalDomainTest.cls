@isTest
public class BankCaixaEconomicaFederalDomainTest {
    @isTest
    static void validateBankCaixaEconomicaFederalCheckContaAntigaWhenSuccess() {
        Test.startTest();
            String agencia = '0867';
            String conta = '00100026763';
            String digitoConta = '8';
            
            BankCaixaEconomicaFederalDomain caixaEconomicaBank = new BankCaixaEconomicaFederalDomain ( agencia ,  conta ,  digitoConta);
            Boolean contaValidation = caixaEconomicaBank.checkContaWithAgencia( agencia ,conta, digitoConta);
            
            Assert.areEqual(true, contaValidation, 'Esperado que a conta esteja correta');
        Test.stopTest();
    }

    @isTest
    static void validateBankCaixaEconomicaFederalCheckContaNovaWhenSuccess() {
        Test.startTest();
            String agencia = '0867';
            String conta = '000100026763';
            String digitoConta = '3';
            
            BankCaixaEconomicaFederalDomain caixaEconomicaBank = new BankCaixaEconomicaFederalDomain ( agencia ,  conta ,  digitoConta);
            Boolean contaValidation = caixaEconomicaBank.checkContaWithAgencia( agencia ,conta, digitoConta);
            
            Assert.areEqual(true, contaValidation, 'Esperado que a conta esteja correta');
        Test.stopTest();
    }

    @isTest
    static void validateBankCaixaEconomicaFederalCheckContaWhenDigitoContaIsEmptyError() {
        Test.startTest();
            String agencia = '0867';
            String conta = '000100026763';
            String digitoConta = '';
            
            BankCaixaEconomicaFederalDomain caixaEconomicaBank = new BankCaixaEconomicaFederalDomain ( agencia ,  conta ,  digitoConta);
            Boolean contaValidation = caixaEconomicaBank.checkContaWithAgencia( agencia ,conta, digitoConta);
            
            Assert.areEqual(false, contaValidation, 'Esperado que a conta esteja incorreta');
        Test.stopTest();
    }


    @isTest
    static void validateBankCaixaEconomicaFederalCheckContaWhenQuantidadeCaracteresContaError() {
        Test.startTest();
            String agencia = '0867';
            String conta = '1234567890123';
            String digitoConta = '8';
            
            BankCaixaEconomicaFederalDomain caixaEconomicaBank = new BankCaixaEconomicaFederalDomain ( agencia ,  conta ,  digitoConta);
            Boolean contaValidation = caixaEconomicaBank.checkContaWithAgencia( agencia ,conta, digitoConta);
            
            Assert.areEqual(false, contaValidation, 'Esperado que a conta esteja incorreta');
        Test.stopTest();
    }

    @isTest
    static void validateBankCaixaEconomicaFederalCheckContaWhenQuantidadeCaracteresAgenciaError() {
        Test.startTest();
            String agencia = '12345';
            String conta = '00100026763';
            String digitoConta = '8';
            
            BankCaixaEconomicaFederalDomain caixaEconomicaBank = new BankCaixaEconomicaFederalDomain ( agencia ,  conta ,  digitoConta);
            Boolean contaValidation = caixaEconomicaBank.checkContaWithAgencia( agencia ,conta, digitoConta);
            
            Assert.areEqual(false, contaValidation, 'Esperado que a conta esteja incorreta');
        Test.stopTest();
    }

    @isTest
    static void validateBankCaixaEconomicaFederalWhenValidateException() {
        String agencia = '0867';
        String digitoAgencia = '';
        String conta = '00100026763';
        String digitoConta = '9';

        try{
            Test.startTest();
            BankCaixaEconomicaFederalDomain bank = new BankCaixaEconomicaFederalDomain ( agencia,  conta ,  digitoConta);
            bank.validate();
            Test.stopTest();
            Assert.fail('Era esperado uma mensagem de exceção');
        } catch(Exception e){
            Assert.areEqual('Dados de Agência e Conta inválidos', e.getMessage());     
        }
    }
}