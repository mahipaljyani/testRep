import {LightningElement, api, track} from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent'; // import toast message event .
 
// import apex class and it's methods. 
import getAccounts from '@salesforce/apex/LWCApexMethodDemoController.getAccounts'
 
export default class LWCApexMethodDemo extends LightningElement {
 
    @track Accounts; // return Accounts from apex class.
    @api Account;
    @track error; // to show error message from apex controller.
    @track success; // to show succes message in ui.
    // method for get  accounts.
    getallaccounts() {
        getAccounts()
            .then(result => {
                this.Accounts = result;
                this.error = undefined;
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: ' Accounts Retrieve successfully',
                        message: 'Accounts Retrieve success, no of records-->' + result.length,
                        variant: 'success',
                    }),
                );
            })
            .catch(error => {
                this.error = error;
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error while getting Accounts',
                        message: error.message,
                        variant: 'error',
                    }),
                );
                this.accounts = undefined;
            });
    } 
}