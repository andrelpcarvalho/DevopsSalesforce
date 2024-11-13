public class BankCitibankDomain extends BankDomain{

    public BankCitibankDomain(String agencia , String conta , String digitoConta) {
        this.agencia = agencia;
        
        this.conta = conta;

        this.digitoConta = digitoConta;
    }

    public override void validate(){
        validateContaInfo(this.agencia, this.conta,this.digitoConta );
    }

    public override boolean checkContaWithAgencia (String agencia, String conta, String digitoConta) {
        conta = campoNumerico(conta);
        agencia = campoNumerico(agencia);
        boolean retorno = false;
        Integer[] peso = new Integer[]{11, 10, 9, 8, 7, 6, 5, 4, 3, 2};
        Integer qtdAngencia = 4;
        Integer qtdConta = 10;
        Integer erro = 0;
        if (iniciaValidacao(conta, digitoConta) > 0)
          erro++; 
        if (validaQtdNumero(conta.length(), qtdConta) > 0)
          erro++; 
        if (validaQtdNumero(agencia.length(), qtdAngencia) > 0)
          erro++; 
        if (validaTamanhoNumero(zeroLeft(conta, qtdConta).length(), qtdConta) > 0)
          erro++; 
        if (erro == 0)
          retorno = validaCitibank(zeroLeft(conta, qtdConta), digitoConta, peso, qtdConta); 
        return retorno;
      }
      
      private boolean validaCitibank(String ct, String d, Integer[] peso, Integer cont) {
        Integer res = 0;
        boolean retorno = false;
        String n = ct;
        for (Integer i = 0; i < cont; i++)
            res += Integer.valueOf(n.substring(i, i + 1)) * peso[i];
        res = Math.mod(res, 11);
        if (res > 1)
          res = 11 - res; 
        if (res == 0 || res == 1)
          res = 0; 
        if (res == Long.valueof(d))
          retorno = true; 
        return retorno;
      }

}