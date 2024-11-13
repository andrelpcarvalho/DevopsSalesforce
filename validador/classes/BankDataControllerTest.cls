@isTest
public class BankDataControllerTest {

    @testSetup
    public static void setup() {
        Account account = new Account(
            LastName = 'Test',
            BV_CPF_CNPJ__c = '55867049000',
            BvId__c = 'e454d3-hf54dd',
            PersonEmail = 'testeSeguros@testeapexemail.com.br',
            RecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('BV_Cliente_Pessoa_Fisica').getRecordTypeId()
        );
        insert account;

        Id caseRt = Schema.SObjectType.Case.getRecordTypeInfosByDeveloperName().get('AtendimentoUnificadoRecordTypeCase').getRecordTypeId();
        insert new List<Case>{
            new Case(
                BV_Area_Negocio__c = 'Seguros',
                Status = 'Aberto',
                AccountId = account.Id,
                RecordTypeId=caseRt
            )
        };

        List<EndpointIntegracaoBvApi__c> endpoints = new List<EndpointIntegracaoBvApi__c>();
        endpoints.add(new EndpointIntegracaoBvApi__c(Name = 'ListarProdutosContratados', endpoint__c = '/v1/ListarProdutosContratados/test', NamedCredential__c = 'DigitalBaseURL', Method__c = 'GET'));
        endpoints.add(new EndpointIntegracaoBvApi__c(Name = 'ProdutosContratados', endpoint__c = '/v1/banco-digital/atend/vucl/bda/produtos-contratados/listar', NamedCredential__c = 'DigitalBaseURL', Method__c = 'GET'));
        insert endpoints;

        Id rtAccount = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Pessoa Física').getRecordTypeId();
        Account conta = new Account(RecordTypeId=rtAccount, Name='ContaTeste', BV_CPF_CNPJ__c='99253125586', BvId__c = '9f835d3b-f422-4b60-b904-f8ddi87730bc');
        insert conta;

        Contact ctt = new Contact(AccountId=conta.Id, LastName='teste');
        insert ctt;

        Id rtProduct = Schema.SObjectType.BV_Produto_Contratado__c.getRecordTypeInfosByDeveloperName().get('ATD_Conta_Cartao').getRecordTypeId();
        BV_Produto_Contratado__c produto = new BV_Produto_Contratado__c(Name='619', ATD_Tipo_de_Produto__c='15', Conta_Grupo_comercial__c=conta.Id, RecordTypeId=rtProduct);
        insert produto;

        Id rtCase = Schema.SObjectType.Case.getRecordTypeInfosByDeveloperName().get('AtendimentoUnificadoRecordTypeCase').getRecordTypeId();

        ATD_Tabulacao_Pai__c motivoAutomatico2 = new ATD_Tabulacao_Pai__c();
        motivoAutomatico2 = new ATD_Tabulacao_Pai__c(Name = 'Envio de Boleto', Status__c = 'ATIVO', Produtos__c = 'Financeira', Tabulacao_Automatica__c = true);
        insert motivoAutomatico2;

        ATD_Tabulacao_Filho__c submotivoAutomatico2 = new ATD_Tabulacao_Filho__c();
        submotivoAutomatico2 = new ATD_Tabulacao_Filho__c(Name = 'Boleto em dia', Status__c = 'ATIVO', Codigo__c = '3344', Produtos__c = 'Financeira');
        insert submotivoAutomatico2;

        ATD_Lista_Tabulacao__c motivoSubmotivoAutomatico2 = new ATD_Lista_Tabulacao__c(
            Tabulacao_Pai__c = motivoAutomatico2.Id, Tabulacao_Filho__c = submotivoAutomatico2.Id, Classificacao__c = 'ATIVO', Grupo__c = '33', SLA_N2__c = 5);
        insert motivoSubmotivoAutomatico2;

        Case caso = new Case(Status='Aberto', AccountId=conta.Id, ContactId=ctt.Id, BVD_N_Protocolo__c='0123456', ATD_Produto__c=produto.Id, RecordTypeId=rtCase,Tabulacao__c=motivoSubmotivoAutomatico2.Id);
        insert caso;
    }
    
    @isTest
    public static void getBankAccountInfo(){
        QueueHttpMock mock = new QueueHttpMock();

        HttpResponse httpResponse1 = new HttpResponse();
        httpResponse1.setHeader('Content-Type', 'application/json');
        httpResponse1.setBody('{"status": "falha","message": "erro", "access_token": "xxxxxxxxxxxxxxxxxxx", "code": 1}');
        httpResponse1.setStatusCode(200);

        HttpResponse httpResponse2 = new HttpResponse();
        httpResponse2.setHeader('Content-Type', 'application/json');
        httpResponse2.setBody('[{"cdProduto":"8","produto":"Conta Corrente","cdStatus":"1","status":"Aberto","cdBanco":"161","cdAgencia":"2020"},{"cdProduto":"7","produto":"Cartao","cdStatus":"2","status":"Encerrado","cdContaCartaoOrigem":"2408","cdProdutoOrigem":"1","cdEmissorTransacao":"1001","cdFilialEmissorTransacao":"1"},{"cdProduto":"8","produto":"Conta Corrente","cdStatus":"1","status":"Aberto","cdBanco":"436","cdAgencia":"2020","nuConta":"15317941"},{"cdProduto":"7","produto":"Cartao","cdStatus":"1","status":"Aberto","cdContaCartaoOrigem":"4735","cdProdutoOrigem":"2","cdEmissorTransacao":"1001","cdFilialEmissorTransacao":"1"},{"cdProduto":"7","produto":"Cartao","cdStatus":"1","status":"Aberto","cdContaCartaoOrigem":"1891","cdProdutoOrigem":"1","cdEmissorTransacao":"1001","cdFilialEmissorTransacao":"1"},{"cdProduto":"7","produto":"Cartao","cdStatus":"1","status":"Aberto","cdContaCartaoOrigem":"2226","cdProdutoOrigem":"2","cdEmissorTransacao":"1001","cdFilialEmissorTransacao":"1"}]');
        httpResponse2.setStatusCode(200);

        mock.addResponse(httpResponse1);
        mock.addResponse(httpResponse2);
        Test.startTest();
            String recordId = [SELECT Id FROM Case][0].Id;
            Test.setMock(HttpCalloutMock.class, mock);
            Map<String, Object> responseMap = BankDataController.getBankInfo(recordId);
        Test.stopTest();

        System.assertEquals(true, responseMap.containsKey('response'), 'Retorno do serviço OK!');
    }

    @isTest
    public static void getBankAccountInfoError(){
        QueueHttpMock mock = new QueueHttpMock();

        HttpResponse httpResponse1 = new HttpResponse();
        httpResponse1.setHeader('Content-Type', 'application/json');
        httpResponse1.setBody('{"status": "falha","message": "erro", "access_token": "xxxxxxxxxxxxxxxxxxx", "code": 1}');
        httpResponse1.setStatusCode(200);

        HttpResponse httpResponse2 = new HttpResponse();
        httpResponse2.setHeader('Content-Type', 'application/json');
        httpResponse2.setBody('{null}');
        httpResponse2.setStatusCode(200);

        mock.addResponse(httpResponse1);
        mock.addResponse(httpResponse2);
        Test.startTest();
            String recordId = [SELECT Id FROM Case][0].Id;
            Test.setMock(HttpCalloutMock.class, mock);
            Map<String, Object> responseMap = BankDataController.getBankInfo(recordId);
        Test.stopTest();

        System.assertEquals(true, responseMap.containsKey('errorMessage'), 'Retorno do serviço Error!');
    }
    
     @isTest
    public static void getBanks() {
        EndpointIntegracaoBvApi__c endpoint = new EndpointIntegracaoBvApi__c(
            Name = 'ObterBancos',
            endpoint__c = '/v1/banco-digital/atend/glob/bdc/bancos?tipoOrdenacao=RELEVANCIA',
            Method__c = 'GET'
        );
        
        insert endpoint;

        QueueHttpMock mock = new QueueHttpMock();
        
        HttpResponse res1 = new HttpResponse();
        res1.setHeader('Content-Type', 'application/json');
        res1.setBody('{"access_token":"b3PF7lNL38k-27wHvg5j6Ecwucz8Yw","token_type":"Bearer","expires_in":3600,"scope":"oob"}');
        res1.setStatusCode(200);

        HttpResponse res2 = new HttpResponse();
        res2.setHeader('Content-Type', 'application/json');
        res2.setBody('[{"ordem":0,"identificador":0,"codigoBanco":"0","nome":"BANCO TESTE","nomeAbreviado":"TESTE","codigoIspb":"0"}]');
        res2.setStatusCode(200);

        mock.addResponse(res1);
        mock.addResponse(res2);

        Map<String,String> result;

        Test.startTest();
        Test.setMock(HttpCalloutMock.class, mock);
        List<BancoDigitalCardViewModel.Banco> resultList = BankDataController.getBanks();
        Test.stopTest();
        Assert.areEqual('BANCO TESTE', resultList[0].nome, 'Erro ao enviar renegociação');
    }

    @isTest
    public static void getBanksError() {
		QueueHttpMock mock = new QueueHttpMock();
        
        HttpResponse res1 = new HttpResponse();
        res1.setHeader('Content-Type', 'application/json');
        res1.setBody('{"access_token":"b3PF7lNL38k-27wHvg5j6Ecwucz8Yw","token_type":"Bearer","expires_in":3600,"scope":"oob"}');
        res1.setStatusCode(200);

        HttpResponse res2 = new HttpResponse();
        res2.setHeader('Content-Type', 'application/json');
        res2.setBody('[]');
        res2.setStatusCode(400);

        mock.addResponse(res1);
        mock.addResponse(res2);

        Test.startTest();
        Exception error=null;
        Test.setMock(HttpCalloutMock.class, mock);
        try {
            List<BancoDigitalCardViewModel.Banco> resultList = BankDataController.getBanks();
        } catch(Exception e) {
            error = e;
        }
        Test.stopTest();
        
        Assert.isNotNull(error, 'Não gerou exception');
    }
    
    @isTest
    public static void getCaseInfoTest() {
		Case caso = [SELECT Id FROM Case LIMIT 1];
        
        Test.startTest();
        caso = BankDataController.getCaseInfo(caso.Id);
        Test.stopTest();
        
        Assert.isNotNull(caso.BV_Area_Negocio__c, 'Não consultou caso');
    }
    
    @isTest
    public static void getCaseInfoErrorTest() {
		Exception error = null;
        Test.startTest();
        try{
        	BankDataController.getCaseInfo(null);
        }catch(Exception e){
            error = e;
        }
        Test.stopTest();
        
        Assert.isNotNull(error, 'Não gerou exception');
    }

    @isTest
    static void validateBankWhenSuccess() {
        String agencia = '2258';
        String digitoAgencia = '6';
        String conta = '22324';
        String digitoConta = '7';
        String bankCode = '001';
        try{
            Test.startTest();
            BankDataController.validateBankInfo( agencia,  digitoAgencia ,  conta ,  digitoConta ,  bankCode);
            Test.stopTest();
            Assert.areEqual('', '', 'Os dados bancários estão corretos');
        } catch(AuraHandledException e){
            Assert.fail('Era esperado que os dados de conta estivessem corretos');   
        }       
    }

    @isTest
    static void validateBankWhenError() {
        String agencia = '2258';
        String digitoAgencia = '5';
        String conta = '22324';
        String digitoConta = '7';
        String bankCode = '001';
        try{
            Test.startTest();
            BankDataController.validateBankInfo( agencia,  digitoAgencia ,  conta ,  digitoConta ,  bankCode);
            Test.stopTest();
            Assert.fail('Era esperado uma mensagem de exceção');
        } catch(AuraHandledException e){
            Assert.areEqual('Script-thrown exception', e.getMessage() , 'Os dados bancários estão incorretos');     
        }
    }
}