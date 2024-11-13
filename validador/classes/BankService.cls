public class BankService {

    public static void validateBank (String agencia, String digitoAgencia , String conta , String digitoConta , String bankCode)
    { 
        BankDomain bank;
        switch on string.valueof(bankCode) {
            when '001' {
                bank = new BankBrasilDomain ( agencia,  digitoAgencia ,  conta ,  digitoConta);
            }
            when '237' {
                bank = new BankBradescoDomain ( agencia,  digitoAgencia ,  conta ,  digitoConta);
            }
            when '033'{
                bank = new BankSantanderDomain ( agencia ,  conta ,  digitoConta);
            }
            when '341'{
                bank = new BankItauDomain ( agencia ,  conta ,  digitoConta);
            }
            when '104'{
                bank = new BankCaixaEconomicaFederalDomain ( agencia ,  conta ,  digitoConta);
            }
            when '041'{
                bank = new BankBanrisulDomain ( agencia,  digitoAgencia ,  conta ,  digitoConta);
            }
            when '275'{
                bank = new BankRealDomain ( agencia ,  conta ,  digitoConta);
            }
            when '070'{
                bank = new BankBrasiliaDomain ( agencia ,  conta ,  digitoConta);
            }
            when '745'{
                bank = new BankCitibankDomain ( agencia ,  conta ,  digitoConta);
            }
        }
        bank.validate();

    }
}