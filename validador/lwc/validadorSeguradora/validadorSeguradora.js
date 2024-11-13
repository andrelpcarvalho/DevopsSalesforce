import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { LightningElement , api} from 'lwc';
import getBanks from '@salesforce/apex/BankDataController.getBanks';
import validateBankData from '@salesforce/apex/BankInfoValidationController.BankInfoValidation';

export default class bankData extends LightningElement {

    @api enablebackbutton = false;
    @api firstbuttonlabel='Confirmar';
    @api secondbuttonlabel='Second button';
    @api backbuttonlabel = 'Voltar';
    @api enableconfirmbutton = false;
    @api enablesecondbutton = false;
    @api recordid;

    banco = 'Banco BV S.A.';
    agencia;
    conta;
    loadingBanks;
    banks;
    selectedBank;
    digitoConta;
    digitoAgencia;
    selectedBankCode
    selectedBankName
    tipoConta;
    contractList;
    loading =false;
    retorno = false;
    banckCode;
    resultadoValidacao;
    retornoTextoValidacao;
    

    connectedCallback() {
        this.getBanks();
    }

    get contaOptions() {
        return [
            { label: 'Corrente', value: 'cc' },
            { label: 'Poupança', value: 'cp' },
        ];
    }        

    validateForm(){
        console.log('Banco : '+this.selectedBankCode);
        console.log('Nome do Banco : '+this.selectedBankName);
        this.validateBankData(this.agencia , this.digitoAgencia , this.conta , this.digitoConta , this.selectedBankCode);      
        
        this.confirmButton();
        this.showSpinner = false;
    }

    validateBankData(agencia, digitoAgencia, conta, digitoConta , bankCode){
        validateBankData({
            agencia : agencia,
            digitoAgencia : digitoAgencia,
            conta : conta,
            digitoConta : digitoConta,
            bankCode : bankCode
        }).then(() => {
            this.showToast("Dados de Agência e Conta validos", "Success");
        }).catch((error) => {
            this.loading = false;
            let errorMessage, errorType;
            errorMessage = error.body.message;
            errorType = 'Error'
            this.showToast(errorMessage, errorType);
            console.error('lwc:bankData.${validateBankData}: ', error);
        })      
    }

    getBanks() {
        if (this.banks) { return; }
        this.loadingBanks = true;
        this.loading = true;
        getBanks()
            .then((result) => {
                const banks = result;
                if(banks!=null && banks!=undefined && banks!=''){
                    this.banks = this.formatBankNames(banks);
                }
            })
            .catch((error) => {
                this.loading = false;
                this.handleError(error,'getBanks',false);
            })
            .finally(() => {
                this.loadingBanks = false;
                this.enableconfirmbutton = true;
                this.loading = false;
            });
    }

    formatBankNames(banks) {
        return banks?.map((bank) => {
            bank = { ...bank, codigoBanco: this.addZero(bank.codigoBanco,3) };

            return { ...bank, nameFmt: bank?.codigoBanco + ' - ' + bank?.nome };
        });
    }

    addZero(value, totalWidth){
        if(value!=null && value!=undefined && value!=''){
            let length = totalWidth - value.toString().length + 1;
            return Array(length).join('0') + value;
        }else{
            return value;
        }
    }
    
    async handleSearch(event,codBanco) {
        let value;
        if(event == null){
            value = codBanco;
        }else{
            value = event.target.value;
        }
        this.selectedBank = undefined;
        this.selectedBank = value;
        if (value) {
            this.openBankSelection = true;
            this.filteredBanks = this.filterSearch(value, this.banks);
        } else {
            this.openBankSelection = false;
        }
        await this.checkFormValidity();

        if(codBanco !=null && codBanco!=undefined && event == null){
            this.handleSelectClick(null,codBanco);
        }
    }

    filterSearch(value, banks) {
        let filtered;
        if (value === '%') {
            filtered = banks;
        } else {
            filtered = banks?.filter(function (item) {
                return (item.nameFmt?.toUpperCase()?.indexOf(value?.toUpperCase()) !== -1);
            });
        }
        return filtered;
    }

    async checkFormValidity() {
        let validity = true;
        const form = this.template.querySelectorAll('.form');
        for (const element of form) {
            const value = element?.value ?? element?.checked;
            if (value === false || value?.trim().length > 0 || value || element.name === 'digit') {
                continue;
            }
            validity = false;
            break;
        }
        this.validForm = validity;
    }

    handleSelectClick(event,codBanco) {
        let selectedBank;
        if(event==null && codBanco!=null){
            this.filteredBanks.forEach((value, index, arr) => {
                if(value.codigoBanco == codBanco){
                    selectedBank = value;
                }
            });
        }else{
            selectedBank = this.filteredBanks[event.target.dataset.index];
        }
        this.selectedBankName = selectedBank?.nome;
        this.selectedBankCode = '' + selectedBank?.codigoBanco;
        this.selectedBank = selectedBank?.nameFmt;
        this.openBankSelection = false;
    }

    defineValues(event){
        var fieldName= event.currentTarget.name;
        if(fieldName=='agency'){
            this.agencia = event.currentTarget.value;
        }else if(fieldName=='agencyDigit'){
            this.digitoAgencia = event.currentTarget.value;
        }else if(fieldName=='accountNumber'){
            this.conta = event.currentTarget.value;
        }else if(fieldName=='accountDigit'){
            this.digitoConta = event.currentTarget.value;
        }else if(fieldName=='accountType'){
            this.tipoConta = event.currentTarget.value;
        }
    }

    handleError(error, functionName = 'handleError', noToast) {
        let errorMessage, errorType;
        errorMessage = error.body.message;
        errorType = 'Error'
        this.loading = false;
        if(noToast!=true) this.showToast(errorMessage, errorType);
        console.error('lwc:bankData.${'+ functionName + '}: ', error);
    }

    backStep(){
        var selectedEvent = new CustomEvent('backbutton', {});
        this.dispatchEvent(selectedEvent);
    }

    confirmButton(){
        let repaymentParams = {
            bankCode: this.selectedBankCode,
            bankName: this.selectedBankName,
            agencyCode: this.agencia,
            agencyDigit: this.digitoAgencia,
            accountNumber: this.conta,
            accountDigit: this.digitoConta,
            accountType: this.tipoConta,
            contractNumberList : this.contractList
        };

        var selectedEvent = new CustomEvent('confirmbutton', {detail: JSON.stringify(repaymentParams)});
        this.dispatchEvent(selectedEvent);
    }

    secondButton(){
        var selectedEvent = new CustomEvent('secondbutton', {});
        this.dispatchEvent(selectedEvent);
    }

    showToast(message, variant = 'info') {
        this.dispatchEvent(
            new ShowToastEvent({
                title: '',
                message: message,
                variant: variant,
                label : ''
            })
        );
    }
}