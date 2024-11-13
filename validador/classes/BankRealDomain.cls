public  class BankRealDomain extends BankDomain{

    public BankRealDomain (String agencia , String conta , String digitoConta) {
        this.agencia = agencia;
        
        this.conta = conta;

        this.digitoConta = digitoConta;
    }

    public override void validate(){
      validateContaInfo(this.agencia, this.conta,this.digitoConta );
    }

    public override boolean checkContaWithAgencia (String agencia, String conta, String digitoConta) {
        boolean retorno = false;
        String peso = '81472259395';
        conta = campoNumerico(conta);
        agencia = campoNumerico(agencia);
        Integer qtdAngencia = 4;
        Integer qtdConta = 7;
        Integer erro = 0;
        if (iniciaValidacao(agencia, digitoConta) > 0)
          erro++; 
        if (iniciaValidacao(conta, digitoConta) > 0)
          erro++; 
        if (validaQtdNumero(conta.length(), qtdConta) > 0)
          erro++; 
        if (validaQtdNumero(agencia.length(), qtdAngencia) > 0)
          erro++; 
        if (validaTamanhoNumero(zeroLeft(conta, qtdConta).length(), qtdConta) > 0)
          erro++; 
        if (erro == 0)
          retorno = validaReal(zeroLeft(agencia, qtdAngencia), zeroLeft(conta, qtdConta), digitoConta, peso, qtdAngencia + qtdConta); 
        return retorno;
      }
      
      private boolean validaReal(String ag, String ct, String d, String peso, Integer cont) {
        Integer res = 0;
        boolean retorno = false;
        String n = String.valueOf(ag) + ct;
        for (Integer i = 0; i < cont; i++)
            res += Integer.valueOf(n.substring(i, i + 1)) * Integer.valueOf(peso.substring(i, i + 1));
        res = Math.mod(res, 11);
        if (res > 1)
          res = 11 - res; 
        if (res == 1)
          res = 0; 
        if (res == 0)
          res = 1; 
        if (res == Long.valueof(d))
          retorno = true; 
        return retorno;
      }
}