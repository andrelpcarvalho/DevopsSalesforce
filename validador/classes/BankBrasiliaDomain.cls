public class BankBrasiliaDomain extends BankDomain{

    public BankBrasiliaDomain(String agencia , String conta , String digitoConta) {
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
        String peso = '234567892';
        Integer qtdAngencia = 4;
        Integer qtdConta = 9;
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
          retorno = validaBrasilia(zeroLeft(conta, qtdConta), digitoConta, peso, qtdConta); 
        return retorno;
      }
      
      private boolean validaBrasilia(String ct, String d, String peso, Integer qtdConta) {
        Integer qtdp = qtdConta;
        long res = 0L;
        long total = 0L;
        boolean retorno = false;
        for (Integer i = 0; i < qtdp; i++) {
          total += Long.valueOf(ct.substring(i, i + 1)) * Long.valueOf(peso.substring(qtdConta - 1, qtdConta));
          qtdConta--;
        } 
        res = Math.mod(total, 11);
        if (res != 0L)
          res = 11L - res; 
        if (res == Long.valueof(d))
          retorno = true; 
        return retorno;
      }
}