public abstract class BankDomain {
    public String agencia;
    public String digitoAgencia;
    public String conta;
    public String digitoConta;
    
    public virtual boolean checkAgencia(string agencia, string digitoAgencia){
        return false;
    }

    public virtual boolean checkConta(string conta, string digitoConta){
        return false;
    }         

    public virtual boolean checkContaWithAgencia (String agencia, String conta, String digitoConta) {
        return false;
    } 

    public virtual void validate () {} 
    
     //métodos comuns das validações
     public virtual Integer iniciaValidacao(String n, String d) {
        Integer retorno = 0;
        if (n == null || d == null || '' == d || '' == n)
          retorno++; 
        return retorno;
    }
      
    public virtual Integer validaTamanhoNumero(long n, long v) {
        Integer retorno = 0;
        if (n != v)
            retorno++; 
        return retorno;
    }
      
    public virtual Integer validaQtdNumero(Integer n, Integer v) {
        Integer retorno = 0;
        if (n > v)
            retorno++; 
        return retorno;
    }
  
    public virtual String zeroLeft(String numero, Integer ContCaracter) {
        for (Integer i = 0; i < numero.length(); i++) {
            if (numero.length() < ContCaracter)
            numero = '0' + numero; 
        } 
        return numero;
    }
  
    public virtual String campoNumerico(String n) {
        String numero = '';
        for (Integer i = 0; i < n.length(); i++) {
          if (Pattern.matches('^[0-9]', n.substring(i, i + 1))) {
            numero = String.valueOf(numero) + n.substring(i, i + 1);
            long c = Long.valueOf(numero);
            numero = String.valueOf(c);
          } 
        } 
        return numero;
    }


    public void validatAgenciaAndContaInfo(String agencia, String digitoAgencia , String conta , String digitoConta){
        Boolean agenciaValidation = this.checkAgencia( agencia , digitoAgencia);
        Boolean contaValidation = this.checkConta( conta , digitoConta);
        
        if( !agenciaValidation && contaValidation){
            throw new BankDomainException('Agência Inválida');
        } else if ( agenciaValidation && !contaValidation){
            throw new BankDomainException('Conta Inválida');
        } else if ( !agenciaValidation && !contaValidation){
            throw new BankDomainException('Dados de Agência e Conta inválidos');
        }
    }

    public void validateContaInfo(String agencia  , String conta , String digitoConta){
        Boolean contaValidation = this.checkContaWithAgencia(agencia, conta , digitoConta);
        
        if ( !contaValidation){
            throw new BankDomainException('Dados de Agência e Conta inválidos');
        }
    }

    public class BankDomainException extends BaseException {}
}