@isTest
public class BankBradescoDomainTest {
    
        @isTest
        static void validateBankBradescoCheckAgenciaWhenSuccess() {
            Test.startTest();
                String agencia = '2375';
                String digitoAgencia = '2';
                String conta = '0066215';
                String digitoConta = '1';
    
                BankBradescoDomain bradescoBank = new BankBradescoDomain(agencia, digitoAgencia, conta, digitoConta);
                Boolean agenciaValidation = bradescoBank.checkAgencia( agencia , digitoAgencia);
                
                Assert.areEqual(true, agenciaValidation, 'Esperado que a agência esteja correta');
            Test.stopTest();
        }

        @isTest
        static void validateBankBradescoCheckAgenciaWhenDigitoAgenciaIsNullError() {
            Test.startTest();
                String agencia = '2375';
                String digitoAgencia = null;
                String conta = '0066215';
                String digitoConta = '1';
    
                BankBradescoDomain bradescoBank = new BankBradescoDomain(agencia, digitoAgencia, conta, digitoConta);
                Boolean agenciaValidation = bradescoBank.checkAgencia( agencia , digitoAgencia);
                
                Assert.areEqual(false, agenciaValidation, 'Esperado que a agência esteja incorreta');
            Test.stopTest();
        }

        @isTest
        static void validateBankBradescoCheckAgenciaWhenQuantidadeCaracteresAgenciaError() {
            Test.startTest();
                String agencia = '237533';
                String digitoAgencia = '1';
                String conta = '0066215';
                String digitoConta = '1';
    
                BankBradescoDomain bradescoBank = new BankBradescoDomain(agencia, digitoAgencia, conta, digitoConta);
                Boolean agenciaValidation = bradescoBank.checkAgencia( agencia , digitoAgencia);
                
                Assert.areEqual(false, agenciaValidation, 'Esperado que a agência esteja incorreta');
            Test.stopTest();
        }

        @isTest
        static void validateBankBradescoCheckContaWhenSuccess() {
            Test.startTest();
                String agencia = '2375';
                String digitoAgencia = '2';
                String conta = '0066215';
                String digitoConta = '1';
    
                BankBradescoDomain bradescoBank = new BankBradescoDomain(agencia, digitoAgencia, conta, digitoConta);
                Boolean contaValidation = bradescoBank.checkConta( conta , digitoConta);
                
                Assert.areEqual(true, contaValidation, 'Esperado que a conta esteja correta');
            Test.stopTest();
        }

        @isTest
        static void validateBankBradescoCheckContaWhenDigitoContaIsNullError() {
            Test.startTest();
                String agencia = '2375';
                String digitoAgencia = '2';
                String conta = '0066215';
                String digitoConta = null;
    
                BankBradescoDomain bradescoBank = new BankBradescoDomain(agencia, digitoAgencia, conta, digitoConta);
                Boolean contaValidation = bradescoBank.checkConta( conta , digitoConta);
                
                Assert.areEqual(false, contaValidation, 'Esperado que a conta esteja incorreta');
            Test.stopTest();
        }

        @isTest
        static void validateBankBradescocheckContaWhenQuantidadeCaracteresContaError() {
            Test.startTest();
                String agencia = '2375';
                String digitoAgencia = '2';
                String conta = '123456789';
                String digitoConta = '1';
    
                BankBradescoDomain bradescoBank = new BankBradescoDomain(agencia, digitoAgencia, conta, digitoConta);
                Boolean contaValidation = bradescoBank.checkConta( conta , digitoConta);
                
                Assert.areEqual(false, contaValidation, 'Esperado que a conta esteja incorreta');
            Test.stopTest();
        }

        @isTest
        static void validateBankBradescoInstaceWhenContaEAgenciaException() {
            String agencia = '2258';
            String digitoAgencia = '1';
            String conta = '22324';
            String digitoConta = '0';
    
            try{
                Test.startTest();
                BankBradescoDomain bank = new BankBradescoDomain ( agencia,  digitoAgencia ,  conta ,  digitoConta);
                bank.validate();
                Test.stopTest();
                Assert.fail('Era esperado uma mensagem de exceção');
            } catch(Exception e){
                Assert.areEqual('Dados de Agência e Conta inválidos', e.getMessage());     
            }
        }
}