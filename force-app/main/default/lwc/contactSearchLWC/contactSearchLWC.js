import { LightningElement, wire, track } from 'lwc';
import getContactList from '@salesforce/apex/ContactsSearchLWC.getContactList';
import searchContact from '@salesforce/apex/ContactsSearchLWC.searchContact';


export default class ContactSearchLWC extends LightningElement {
    @track searchKey;
    @track error;
    //@track contacts;
    @wire(getContactList) 
    wiredContact({error, data}){
        if(data){
            this.contacts = data;
        }
        if(error){
            this.error = error;
        }
    }
}


    // @wire(searchContact , {conName:'$searchKey'} )
    // handleKeyChange(event) {
    //     searchContact({ searchKey })
    //     .then(result => {
    //         this.accounts = result;
    //         this.error = undefined;
    //     })
    //     .catch(error => {
    //         this.error = error;
    //         this.accounts = undefined;
    //     });

    // }

    // handleChange(event){
    //     event.preventDefault();
    //     /* eslint-disable no-console */
    //     console.log('value' + event.target.value);
    //     console.log(this.searchKey);
    //     console.log(this.contacts);
    // }
// }