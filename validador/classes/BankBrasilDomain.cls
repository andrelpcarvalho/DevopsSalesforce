public class BankBrasilDomain extends BankDomain{
  
    public BankBrasilDomain(String agencia, String digitoAgencia , String conta , String digitoConta) {
        this.agencia = agencia;
        
        this.digitoAgencia = digitoAgencia;

        this.conta = conta;

        this.digitoConta = digitoConta;
    }

    public override void validate(){
        validatAgenciaAndContaInfo(this.agencia,this.digitoAgencia, this.conta,this.digitoConta );
    }

    public override Boolean checkAgencia(String agencia, String digitoAgencia) {
        agencia = campoNumerico(agencia);
        boolean retorno = false;
        String peso = '5432';
        Integer erro = 0;
        if (iniciaValidacao(agencia, digitoAgencia) > 0)
          erro++; 
        if (validaTamanhoNumero(zeroLeft(agencia, 8).length(), 8) > 0)
          erro++; 
        if (erro == 0)
          retorno = validaBB(zeroLeft(agencia, 4), digitoAgencia, peso, 4); 
        return retorno;
      }
      
      public override Boolean checkConta(String conta, String digitoConta) {
        Integer erro = 0;
        Integer qtdConta = 8;
        String peso = '98765432';
        boolean retorno = false;
        conta = campoNumerico(conta);
        if (iniciaValidacao(conta, digitoConta) > 0)
          erro++; 
        if (validaTamanhoNumero(zeroLeft(conta, qtdConta).length(), qtdConta) > 0)
          erro++; 
        if (validaQtdNumero(conta.length(), qtdConta) > 0)
          erro++; 
        if (erro == 0)
          retorno = validaBB(zeroLeft(conta, qtdConta), digitoConta, peso, qtdConta); 
        return retorno;
      }
      
      public boolean validaBB(String n, String d, String peso, Integer cont) {
        String digV = '';
        Integer res = 0;
        Integer resto = 0;
        boolean retorno = false;
        Integer total = 0;
        for (Integer i = 0; i < cont; i++)
          res += Integer.valueOf(n.substring(i, i + 1)) * Long.valueOf(peso.substring(i, i + 1)).intValue();
        resto = Math.mod(res , 11);
        total = 11 - resto;
        if (total == 10 || total == 11) {
          if (total == 10)
            digV = 'x'; 
          if (total == 11)
            digV = '0'; 
        } 
        if (digV.equalsIgnoreCase(d)) {
          retorno = true;
        } else if (!'x'.equalsIgnoreCase(d) && total == Long.valueOf(d)) {
          retorno = true;
        } 
        return retorno;
      }
}