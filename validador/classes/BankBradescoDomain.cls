public class BankBradescoDomain extends BankDomain{
    
    public BankBradescoDomain(String agencia, String digitoAgencia , String conta , String digitoConta) {
        this.agencia = agencia;
        
        this.digitoAgencia = digitoAgencia;

        this.conta = conta;

        this.digitoConta = digitoConta;
    }

    public override void validate(){
        validatAgenciaAndContaInfo(this.agencia,this.digitoAgencia, this.conta,this.digitoConta );
    }

    public override Boolean checkAgencia (string agencia, string digitoAgencia) {
        agencia = campoNumerico(agencia);
        boolean retorno = false;
        String peso = '5432';
        Integer qtdAngencia = 4;
        Integer erro = 0;
        if (iniciaValidacao(agencia, digitoAgencia) > 0)
          erro++; 
        if (validaQtdNumero(agencia.length(), qtdAngencia) > 0)
          erro++; 
        if (validaTamanhoNumero(zeroLeft(agencia, qtdAngencia).length(), qtdAngencia) > 0)
          erro++; 
        if (erro == 0)
          retorno = validaNumAgBradesco(zeroLeft(agencia, qtdAngencia), digitoAgencia, peso, qtdAngencia); 
        return retorno;
    }
        
    public boolean validaNumAgBradesco(String ag, String d, String peso, Integer cont) {
        Integer res = 0;
        String digV = '';
        boolean retorno = false;
        for (Integer i = 0; i < cont; i++)
            res += Integer.valueOf(ag.substring(i, i + 1)) * Long.valueOf(peso.substring(i, i + 1)).intValue();
        res = 11 -  Math.mod(res, 11);
        if (res == 10)
            digV = 'P'; 
        if (res == 11)
            res = 0; 
        if (digV.equalsIgnoreCase(d)) {
            retorno = true;
        } else if (campoNumerico(d).length() > 0 && res == Long.valueOf(d)) {
            retorno = true;
        } 
        return retorno;
    }

    public override Boolean checkConta (string conta, string digitoConta) {
        conta = campoNumerico(conta);
        iniciaValidacao(conta, digitoConta);
        boolean retorno = false;
        Integer qtdConta = 8;
        Integer erro = 0;
        if (iniciaValidacao(conta, digitoConta) > 0)
          erro++; 
        if (validaQtdNumero(conta.length(), qtdConta) > 0)
          erro++; 
        if (validaTamanhoNumero(zeroLeft(conta, qtdConta).length(), qtdConta) > 0)
          erro++; 
        if (erro == 0)
          retorno = validaNumCtBradesco(zeroLeft(conta, qtdConta), digitoConta, qtdConta); 
        return retorno;
      }
        
      public boolean validaNumCtBradesco(String ct, String d, Integer contCt) {
        Integer res = 0;
        String peso = '';
        String digV = '';
        boolean retorno = false;
        Integer cont = 0;
        cont = 2;
        Integer i;
        for (i = 0; i < contCt; i++) {
          if (cont == 8)
            cont = 2; 
          peso = String.valueOf(cont) + peso;
          cont++;
        } 
        for (i = 0; i < ct.length(); i++)
            res += Integer.valueOf(ct.substring(i, i + 1)) * Integer.valueOf(peso.substring(i, i + 1)); 
        res = Math.mod(res , 11);
        if (res == 1)
          digV = '0'; 
        if (res == 0)
          res = 0; 
        if (res != 0 && res != 1)
          res = 11 - Math.mod(res , 11); 
        if (digV.equalsIgnoreCase(d)) {
          retorno = true;
        } else if (campoNumerico(d).length() > 0 && res == Long.valueOf(d)) {
          retorno = true;
        } 
        return retorno;
      }
}