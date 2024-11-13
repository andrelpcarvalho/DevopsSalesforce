@isTest
public class BankServiceTest {
    @isTest
    static void validateBankBrasilWhenSuccess() {
        String agencia = '2258';
        String digitoAgencia = '6';
        String conta = '22324';
        String digitoConta = '7';
        String bankCode = '001';
        try{
            Test.startTest();
            BankService.validateBank( agencia,  digitoAgencia ,  conta ,  digitoConta ,  bankCode);
            Test.stopTest();
            Assert.areEqual('', '', 'Os dados bancários estão corretos');
        } catch(Exception e){
            Assert.fail('Era esperado que os dados de conta estivessem corretos');   
        }       
    }

    @isTest
    static void validateBankBrasilWhenErrorAgencia() {
        String agencia = '2258';
        String digitoAgencia = '5';
        String conta = '22324';
        String digitoConta = '7';
        String bankCode = '001';
        try{
            Test.startTest();
            BankService.validateBank( agencia,  digitoAgencia ,  conta ,  digitoConta ,  bankCode);
            Test.stopTest();
            Assert.fail('Era esperado uma mensagem de exceção');
        } catch(Exception e){
            Assert.areEqual('Agência Inválida', e.getMessage() , 'Os dados bancários estão incorretos');     
        }
    }

    @isTest
    static void validateBankBrasilWhenErrorConta() {
        String agencia = '2258';
        String digitoAgencia = '6';
        String conta = '22324';
        String digitoConta = '8';
        String bankCode = '001';
        try{
            Test.startTest();
            BankService.validateBank( agencia,  digitoAgencia ,  conta ,  digitoConta ,  bankCode);
            Test.stopTest();
            Assert.fail('Era esperado uma mensagem de exceção');
        } catch(Exception e){
            Assert.areEqual('Conta Inválida', e.getMessage() , 'Os dados bancários estão incorretos');     
        }
    }

    @isTest
    static void validateBankBrasilWhenErrorAgenciaAndConta() {
        String agencia = '5257';
        String digitoAgencia = '';
        String conta = '1260109';
        String digitoConta = '9';
        String bankCode = '001';
        try{
            Test.startTest();
            BankService.validateBank( agencia,  digitoAgencia ,  conta ,  digitoConta ,  bankCode);
            Test.stopTest();
            Assert.fail('Era esperado uma mensagem de exceção');
        } catch(Exception e){
            Assert.areEqual('Dados de Agência e Conta inválidos', e.getMessage() , 'Os dados bancários estão incorretos');     
        }        
    }

    @isTest
    static void validateBankBradescoWhenSuccess() {
        String agencia = '2375';
        String digitoAgencia = '2';
        String conta = '0066215';
        String digitoConta = '1';
        String bankCode = '237';
        try{
            Test.startTest();
            BankService.validateBank( agencia,  digitoAgencia ,  conta ,  digitoConta ,  bankCode);
            Test.stopTest();
            Assert.areEqual('', '', 'Os dados bancários estão corretos');
        } catch(Exception e){
            Assert.fail('Era esperado que os dados de conta estivessem corretos');     
        }
    }

    @isTest
    static void validateBankBradescoWhenError() {
        
            String agencia = '3360';
            String digitoAgencia = '';
            String conta = '1726187';
            String digitoConta = '4';
            String bankCode = '237';
            try{
                Test.startTest();
                BankService.validateBank( agencia,  digitoAgencia ,  conta ,  digitoConta ,  bankCode);
                Test.stopTest();
                Assert.fail('Era esperado uma mensagem de exceção');
            } catch(Exception e){
                Assert.areEqual('Dados de Agência e Conta inválidos', e.getMessage() , 'Os dados bancários estão incorretos');     
            }
        Test.stopTest();
    }

    @isTest
    static void validateBankSantanderWhenSuccess() {
            String agencia = '1257';
            String digitoAgencia = '';
            String conta = '596731';
            String digitoConta = '0';
            String bankCode = '033';
            try{
                Test.startTest();
                BankService.validateBank( agencia,  digitoAgencia ,  conta ,  digitoConta ,  bankCode);
                Test.stopTest();
                Assert.areEqual('', '', 'Os dados bancários estão corretos');
            } catch(Exception e){
                Assert.fail('Era esperado que os dados de conta estivessem corretos');    
            }        
    }

    @isTest
    static void validateBankSantanderWhenError() {
        String agencia = '1257';
        String digitoAgencia = '';
        String conta = '12345678901';
        String digitoConta = '9';
        String bankCode = '033';
        try{
            Test.startTest();
            BankService.validateBank( agencia,  digitoAgencia ,  conta ,  digitoConta ,  bankCode);
            Test.stopTest();
            Assert.fail('Era esperado uma mensagem de exceção');
        } catch(Exception e){
            Assert.areEqual('Dados de Agência e Conta inválidos', e.getMessage() , 'Os dados bancários estão incorretos');     
        }
    }

    @isTest
    static void validateBankCaixaEconomicaWhenSuccess() {
        String agencia = '0867';
        String digitoAgencia = '';
        String conta = '00100026763';
        String digitoConta = '8';
        String bankCode = '104';
        try{
            Test.startTest();
            BankService.validateBank( agencia,  digitoAgencia ,  conta ,  digitoConta ,  bankCode);
            Test.stopTest();
            Assert.areEqual('', '', 'Os dados bancários estão corretos');
        } catch(Exception e){
            Assert.fail('Era esperado que os dados de conta estivessem corretos');       
        }          
    }

    @isTest
    static void validateBankCaixaEconomicaWhenError() {
            String agencia = '0867';
            String digitoAgencia = '';
            String conta = '00100026763';
            String digitoConta = '9';
            String bankCode = '104';
            try{
                Test.startTest();
                BankService.validateBank( agencia,  digitoAgencia ,  conta ,  digitoConta ,  bankCode);
                Test.stopTest();
                Assert.fail('Era esperado uma mensagem de exceção');
            } catch(Exception e){
                Assert.areEqual('Dados de Agência e Conta inválidos', e.getMessage() , 'Os dados bancários estão incorretos');     
            }
    }

    @isTest
    static void validateBankItauWhenSuccess() {
        String agencia = '7380';
        String digitoAgencia = '';
        String conta = '02956';
        String digitoConta = '6';
        String bankCode = '341';
        try{
            Test.startTest();
            BankService.validateBank( agencia,  digitoAgencia ,  conta ,  digitoConta ,  bankCode);
            Test.stopTest();
            Assert.areEqual('', '', 'Os dados bancários estão corretos');
        } catch(Exception e){
            Assert.fail('Era esperado que os dados de conta estivessem corretos');     
        }
    }

    @isTest
    static void validateBankItauWhenError() {
        String agencia = '7380';
        String digitoAgencia = '';
        String conta = '02956';
        String digitoConta = '1';
        String bankCode = '341';
        try{
            Test.startTest();
            BankService.validateBank( agencia,  digitoAgencia ,  conta ,  digitoConta ,  bankCode);
            Test.stopTest();
            Assert.fail('Era esperado uma mensagem de exceção');
        } catch(Exception e){
            Assert.areEqual('Dados de Agência e Conta inválidos', e.getMessage() , 'Os dados bancários estão incorretos');     
        }
    }


    @isTest
    static void validateBankCitibankWhenSuccess() {
        String agencia = '0083';
        String digitoAgencia = '';
        String conta = '7683373264';
        String digitoConta = '7';
        String bankCode = '745';
        try{
            Test.startTest();
            BankService.validateBank( agencia,  digitoAgencia ,  conta ,  digitoConta ,  bankCode);
            Test.stopTest();
            Assert.areEqual('', '', 'Os dados bancários estão corretos');
        } catch(Exception e){
            Assert.fail('Era esperado que os dados de conta estivessem corretos');     
        }
    }

    @isTest
    static void validateBankCitibankWhenError() {
        String agencia = '0083';
        String digitoAgencia = '';
        String conta = '7683373264';
        String digitoConta = '1';
        String bankCode = '745';
        try{
            Test.startTest();
            BankService.validateBank( agencia,  digitoAgencia ,  conta ,  digitoConta ,  bankCode);
            Test.stopTest();
            Assert.fail('Era esperado uma mensagem de exceção');
        } catch(Exception e){
            Assert.areEqual('Dados de Agência e Conta inválidos', e.getMessage() , 'Os dados bancários estão incorretos');     
        }
    }


    @isTest
    static void validateBankBanrisulWhenError() {
        String agencia = '1234';
        String digitoAgencia = '';
        String conta = '000123456';
        String digitoConta = '7';
        String bankCode = '041';
        try{
            Test.startTest();
            BankService.validateBank( agencia,  digitoAgencia ,  conta ,  digitoConta ,  bankCode);
            Test.stopTest();
            Assert.fail('Era esperado uma mensagem de exceção');
        } catch(Exception e){
            Assert.areEqual('Dados de Agência e Conta inválidos', e.getMessage() , 'Os dados bancários estão incorretos');     
        }
    }


    @isTest
    static void validateBankRealWhenError() {
        String agencia = '0083';
        String digitoAgencia = '';
        String conta = '7683373264';
        String digitoConta = '1';
        String bankCode = '275';
        try{
            Test.startTest();
            BankService.validateBank( agencia,  digitoAgencia ,  conta ,  digitoConta ,  bankCode);
            Test.stopTest();
            Assert.fail('Era esperado uma mensagem de exceção');
        } catch(Exception e){
            Assert.areEqual('Dados de Agência e Conta inválidos', e.getMessage() , 'Os dados bancários estão incorretos');     
        }
    }


    @isTest
    static void validateBankBrasiliaWhenError() {
        String agencia = '0083';
        String digitoAgencia = '';
        String conta = '7683373264';
        String digitoConta = '1';
        String bankCode = '070';
        try{
            Test.startTest();
            BankService.validateBank( agencia,  digitoAgencia ,  conta ,  digitoConta ,  bankCode);
            Test.stopTest();
            Assert.fail('Era esperado uma mensagem de exceção');
        } catch(Exception e){
            Assert.areEqual('Dados de Agência e Conta inválidos', e.getMessage() , 'Os dados bancários estão incorretos');     
        }
    }
}