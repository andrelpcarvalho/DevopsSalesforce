public class BankBanrisulDomain extends BankDomain{

    public BankBanrisulDomain(String agencia, String digitoAgencia , String conta , String digitoConta) {
        this.agencia = agencia;
        
        this.digitoAgencia = digitoAgencia;

        this.conta = conta;

        this.digitoConta = digitoConta;
    }

    public override void validate(){
        validatAgenciaAndContaInfo(this.agencia,this.digitoAgencia, this.conta,this.digitoConta );
    }

    public override boolean checkAgencia(string agencia, string digitoAgencia) {
        Integer qtdAngencia = 4;
        boolean retorno = false;
        Integer primeiroDig = 0;
        Integer[] listOfIntegers = new Integer[2];
        String peso = '';
        agencia = campoNumerico(agencia);
        iniciaValidacao(agencia, digitoAgencia);
        Integer erro = 0;
        if (iniciaValidacao(agencia, digitoAgencia) > 0)
          erro++; 
        if (validaQtdNumero(agencia.length(), qtdAngencia) > 0)
          erro++; 
        if (validaTamanhoNumero(zeroLeft(agencia, qtdAngencia).length(), qtdAngencia) > 0)
          erro++; 
        peso = '1212';
        primeiroDig = primeiroDigBanrisul(zeroLeft(agencia, qtdAngencia), peso, qtdAngencia);
        peso = '65432';
        listOfIntegers = segundoDigBanrisul(zeroLeft(agencia, qtdAngencia), peso, primeiroDig, qtdAngencia);
        if (erro == 0 && Long.valueof(String.valueOf(listOfIntegers[0]) + listOfIntegers[1]) == Long.valueof(digitoAgencia))
          retorno = true; 
        return retorno;
      }

      private Integer primeiroDigBanrisul(String ag, String peso, Integer cont) {
        ag = campoNumerico(ag);
        Integer res = 0;
        Integer primeiroDig = 0;
        for (Integer i = 0; i < cont; i++) {
          String str = String.valueOf(Integer.valueOf(ag.substring(i, i + 1)) * Integer.valueOf(peso.substring(i, i + 1)));
          if (str.length() > 1) {
            for (Integer y = 0; y < str.length(); y++)
                res += Integer.valueOf(str.substring(y, y + 1));
          } else {
              res += Integer.valueOf(ag.substring(i, i + 1)) * Integer.valueOf(peso.substring(i, i + 1));
          } 
        } 
        if (Math.mod(res , 10) != 0)
          primeiroDig = res = 10 - Math.mod(res , 10) ; 
        return primeiroDig;
      }
      
      private Integer[] segundoDigBanrisul(String ag, String peso, Integer primeiroDig, Integer cont) {
        Integer res = 0;
        Integer segundoDig = 0;
        Integer[] listOfIntegers = new Integer[2];
        ag = String.valueOf(ag) + primeiroDig;
        for (Integer i = 0; i < cont; i++)
            res += Integer.valueOf(ag.substring(i, i + 1)) * Integer.valueOf(peso.substring(i, i + 1));
        if (Math.mod(res , 11 ) == 1 && primeiroDig != 9)
          segundoDig++; 
        if (Math.mod(res , 11 ) == 1 && primeiroDig == 9)
          primeiroDig = 0; 
        if (Math.mod(res , 11 ) == 0)
          segundoDig = 0; 
        if (Math.mod(res , 11 ) != 1 && Math.mod(res , 11 ) != 0)
          segundoDig = 11 - Math.mod(res , 11 ); 
        listOfIntegers[0] = primeiroDig;
        listOfIntegers[1] = segundoDig;
        return listOfIntegers;
      }     
      
      
      public override Boolean checkConta (string conta, string digitoConta) {
        conta = campoNumerico(conta);
        iniciaValidacao(conta, digitoConta);
        boolean retorno = false;
        String peso = '324765432';
        Integer qtdConta = 9;
        Integer erro = 0;
        if (iniciaValidacao(conta, digitoConta) > 0)
          erro++; 
        if (validaQtdNumero(conta.length(), qtdConta) > 0)
          erro++; 
        if (validaTamanhoNumero(zeroLeft(conta, qtdConta).length(), qtdConta) > 0)
          erro++; 
        if (erro == 0)
          retorno = validaCtBanrisu(zeroLeft(conta, qtdConta), digitoConta, peso, qtdConta); 
        return retorno;
      }
      
      private boolean validaCtBanrisu(String ct, String d, String peso, Integer cont) {
        Integer res = 0;
        Integer dig = 0;
        boolean retorno = false;
        for (Integer i = 0; i < cont; i++)
            res += Integer.valueOf(ct.substring(i, i + 1)) * Integer.valueOf(peso.substring(i, i + 1));  
        res = Math.mod(res, 11);
        if (res == 0)
          dig = 0; 
        if (res == 1)
          dig = 6; 
        if (res != 0 && res != 1)
          dig = 11 - res; 
        if (dig == Long.valueof(d))
          retorno = true; 
        return retorno;
      }
}