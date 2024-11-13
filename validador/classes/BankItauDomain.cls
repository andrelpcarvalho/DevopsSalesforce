public class BankItauDomain extends BankDomain{

    public BankItauDomain(String agencia , String conta , String digitoConta) {
        this.agencia = agencia;
        
        this.conta = conta;

        this.digitoConta = digitoConta;
    }

    public override void validate(){
      validateContaInfo(this.agencia, this.conta,this.digitoConta );
    }

    public override boolean checkContaWithAgencia (String agencia, String conta, String digitoConta) {
        conta = campoNumerico(conta);
        iniciaValidacao(conta, digitoConta);
        boolean retorno = false;
        String peso = '212121212';
        Integer qtdAngencia = 4;
        Integer qtdConta = 5;
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
          retorno = validaItau(zeroLeft(agencia, qtdAngencia), zeroLeft(conta, qtdConta), digitoConta, peso, qtdAngencia + qtdConta); 
        return retorno;
      }
      
      private boolean validaItau(String ag, String ct, String d, String peso, Integer cont) {
        Integer res = 0;
        long total = 0L;
        boolean retorno = false;
        String n = String.valueOf(ag) + ct;
        Integer sequencia = 0;
        for (Integer i = 0; i < cont; i++) {
          total = Long.valueOf(n.substring(i, i + 1)) * (Math.mod(i + 1, 2) == 0 ? 1 : 2);
          if (total > 9L) {
            String str = String.valueOf(total);
            for (Integer y = 0; y < str.length(); y++)
              res += Integer.valueOf(str.substring(y, y + 1));
          } else {
            res = (Integer)(res + total);
          } 
        } 
        res = Math.mod(res, 10);
        if (res != 0)
          res = 10 - res; 
        if (res == Long.valueOf(d))
          retorno = true; 
        return retorno;
      }
}
