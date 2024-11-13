public class BankSantanderDomain extends BankDomain{

    public BankSantanderDomain(String agencia , String conta , String digitoConta) {
        this.agencia = agencia;
        
        this.conta = conta;

        this.digitoConta = digitoConta;
    }

    public override void validate(){
        validateContaInfo(this.agencia, this.conta,this.digitoConta );
    }

    public override boolean checkContaWithAgencia (String agencia, String conta, String digitoConta) {
        agencia = campoNumerico(agencia);
        conta = campoNumerico(conta);
        boolean retorno = false;
        String peso = '97310097131973';
        Integer qtdAngencia = 4;
        Integer qtdConta = 10;
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
        if (erro == 0)
            retorno = validaAgSantander(zeroLeft(agencia, qtdAngencia), zeroLeft(conta, qtdConta), digitoConta, peso, qtdAngencia + qtdConta); 
        return retorno;
    }
      
    public boolean validaAgSantander(String ag, String ct, String d, String peso, Integer cont) {
        Integer res = 0;
        boolean retorno = false;
        String n = '';
        n = String.valueOf(ag) + ct;
        for (Integer i = 0; i < cont; i++){
            res += Math.mod( (Integer.valueOf(n.substring(i, i + 1)) * Integer.valueOf(peso.substring(i, i + 1))) , 10); 
        }            
        if ( Math.mod(res , 10) == 0)
            retorno = true; 
        res = 10 - Math.mod(res , 10);
        if (!retorno && res == Long.valueOf(d))
            retorno = true; 
        return retorno;
    }
}