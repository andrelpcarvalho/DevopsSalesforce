public class BankCaixaEconomicaFederalDomain extends BankDomain{
    
    public BankCaixaEconomicaFederalDomain(String agencia , String conta , String digitoConta) {
        this.agencia = agencia;
        
        this.conta = conta;

        this.digitoConta = digitoConta;
    }

    public override void validate(){
        validateContaInfo(this.agencia, this.conta,this.digitoConta );
    }
    
    public override boolean checkContaWithAgencia(String agencia, String conta, String digitoConta) {
        boolean retorno = false;
        String peso = '876543298765432';
        String pesoNovo = '543298765432';
        boolean contaNova=false;
        Integer qtdAngencia = 4;
        Integer qtdConta = 11; 
        if(conta.length()==12){
            contaNova=true;
            qtdConta=12;
        }else{
            conta = campoNumerico(conta);
    
        }
        Integer erro = 0;
        if (iniciaValidacao(agencia, digitoConta) > 0) 
          erro++; 
        if (iniciaValidacao(conta, digitoConta) > 0) 
          erro++; 
        if (validaQtdNumero(agencia.length(), qtdAngencia) > 0) 
          erro++; 
        if (validaQtdNumero(conta.length(), qtdConta) > 0)
          erro++; 
        if (validaTamanhoNumero((zeroLeft(agencia, qtdAngencia).length() + zeroLeft(conta, qtdConta).length()), (qtdAngencia + qtdConta)) > 0)
          erro++; 
        if (erro == 0){
            if(contaNova){
                retorno = validaCaixaEconomicaFederalNova(conta,digitoConta, pesoNovo, qtdConta);
    
            }else{
                retorno = validaCaixaEconomicaFederal(zeroLeft(agencia, qtdAngencia), zeroLeft(conta, qtdConta), digitoConta, peso, qtdAngencia + qtdConta);
            }
      
        }
        return retorno;
    }
      
    private boolean validaCaixaEconomicaFederal(String ag, String ct, String d, String peso, Integer cont) {
        Integer res = 0;
        Integer total = 0;
        boolean retorno = false;
        String n = String.valueOf(ag) + ct;
        for (Integer i = 0; i < cont; i++)
            res += Integer.valueOf(n.substring(i, i + 1)) * Integer.valueOf(peso.substring(i, i + 1));
        res *= 10;
        total = res / 11;
        total *= 11;
        res -= total;
        if (res == 10)
            res = 0; 
        if (res == Long.valueOf(d))
            retorno = true; 
        return retorno;
    }

    private boolean validaCaixaEconomicaFederalNova( String ct, String d, String peso, Integer cont) {
        Integer res = 0;
        Integer total = 0;
        Boolean retorno = false;
        String n =  ct;
        for (Integer i = 0; i < cont; i++)
            res += Integer.valueOf(n.substring(i, i + 1)) * Integer.valueOf(peso.substring(i, i + 1)); 
        res *= 10;
        total = res / 11;
        total *= 11;
        res -= total;
        if (res == 10)
            res = 0; 
        if (res == Long.valueOf(d))
            retorno = true; 
        return retorno;
    }
}