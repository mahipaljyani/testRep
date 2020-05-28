import { LightningElement, track, wire, api } from 'lwc';
import getAccounts from '@salesforce/apex/LWCApexMethodDemoController.getAccounts'

export default class TestComp extends LightningElement {
    @track Accounts = []; 
    @track favorite = [];

    @track _selected = [];

    @track AllAccounts = [];

    get options() {
        getAccounts()
            .then(result => { 
                for(let key in result) {
                  if (result.hasOwnProperty(key)) {
                    this.AllAccounts.push({label:result[key].Id, value:result[key] });
                  }
                } 
                return this.AllAccounts;  
            })
    };
    get optionsold() {
        return [
            { label: 'English', value: 'en' },
            { label: 'German', value: 'de' },
            { label: 'Spanish', value: 'es' },
            { label: 'French', value: 'fr' },
            { label: 'Italian', value: 'it' },
            { label: 'Japanese', value: 'ja' },
        ];
    }

    get selected() {
        return this._selected.length ? this._selected : 'none';
    }

    handleChange(e) {
        this._selected = e.detail.value;
    }

}