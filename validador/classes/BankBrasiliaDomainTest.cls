@isTest
public class BankBrasiliaDomainTest {
    @isTest
    static void validateBankBrasiliaCheckContaWhenError() {
        Test.startTest();
            String agencia = '0083';
            String conta = '7683373264';
            String digitoConta = '1';
            
            BankBrasiliaDomain brasiliaBank = new BankBrasiliaDomain ( agencia ,  conta ,  digitoConta);
            Boolean contaValidation = brasiliaBank.checkContaWithAgencia( agencia ,conta, digitoConta);
            
            Assert.areEqual(false, contaValidation, 'Esperado que a conta esteja incorreta');
        Test.stopTest();
    }
    
    @isTest
    static void validateBankBrasiliaCheckContaWhenDigitoContaIsEmptyError() {
        Test.startTest();
            String agencia = '0083';
            String conta = '7683373264';
            String digitoConta = '';
            
            BankBrasiliaDomain brasiliaBank = new BankBrasiliaDomain ( agencia ,  conta ,  digitoConta);
            Boolean contaValidation = brasiliaBank.checkContaWithAgencia( agencia ,conta, digitoConta);
            
            Assert.areEqual(false, contaValidation, 'Esperado que a conta esteja incorreta');
        Test.stopTest();
    }
    
    @isTest
    static void validateBankBrasiliaCheckContaWhenQuantidadeCaracteresAgenciaError() {
        Test.startTest();
            String agencia = '12345';
            String conta = '7683373264';
            String digitoConta = '6';
            
            BankBrasiliaDomain brasiliaBank = new BankBrasiliaDomain ( agencia ,  conta ,  digitoConta);
            Boolean contaValidation = brasiliaBank.checkContaWithAgencia( agencia ,conta, digitoConta);
            
            Assert.areEqual(false, contaValidation, 'Esperado que a conta esteja incorreta');
        Test.stopTest();
    }

    @isTest
    static void validateBankBrasiliaCheckContaWhenSuccess() {
        Test.startTest();
            String agencia = '0083';
            String conta = '768337326';
            String digitoConta = '6';
            
            BankBrasiliaDomain brasiliaBank = new BankBrasiliaDomain ( agencia ,  conta ,  digitoConta);
            Boolean contaValidation = brasiliaBank.checkContaWithAgencia( agencia ,conta, digitoConta);
            
            Assert.areEqual(true, contaValidation, 'Esperado que a conta esteja correta');
        Test.stopTest();
    }

    @isTest
    static void validateBankBrasiliaWhenValidateException() {
        String agencia = '0083';
        String digitoAgencia = '';
        String conta = '7683373264';
        String digitoConta = '1';

        try{
            Test.startTest();
            BankBrasiliaDomain bank = new BankBrasiliaDomain ( agencia,  conta ,  digitoConta);
            bank.validate();
            Test.stopTest();
            Assert.fail('Era esperado uma mensagem de exceção');
        } catch(Exception e){
            Assert.areEqual('Dados de Agência e Conta inválidos', e.getMessage());     
        }
    }
}