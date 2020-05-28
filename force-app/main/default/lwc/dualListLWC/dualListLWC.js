import { LightningElement, track, wire, api } from 'lwc';
import getAccounts from '@salesforce/apex/LWCApexMethodDemoController.getAccounts'

export default class HelloWorld extends LightningElement {
  greeting = 'World';
  changeHandler(event) {
    this.greeting = event.target.value;
  }

  @track selectedAccounts = [];
  @track AllAccounts = [];

  getallaccounts() {
      getAccounts()
          .then(result => { 
              for(let key in result) {
                if (result.hasOwnProperty(key)) { 
                  this.AllAccounts.push(result[key]);
                }
              }   
              this.Accounts = result;
              /* eslint-disable no-console */
              console.log('All Accounts in Map : ' + JSON.stringify(this.AllAccounts) );
          })
          .catch(error => {
              this.error = error;
              this.accounts = undefined;
          });
  };
  sendRight() {
    var inp = this.template.querySelectorAll("lightning-input");
    inp.forEach(function(element) {
      if (element.name === "Ghumao" && element.checked == true) 
      {
        var selID = element.value;
        /* eslint-disable no-console */
        for(let i=0; i < this.AllAccounts.length; i++) {
          if(this.AllAccounts[i].Id == selID) {
            this.selectedAccounts.push(this.AllAccounts[i]);
            this.AllAccounts.splice(i,1);
          }
        }
      }
    }, this);
    /* eslint-disable no-console */
    console.log('Selected Accounts in Map : ' + JSON.stringify(this.selectedAccounts) );
  };
  sendLeft() {
    var inp = this.template.querySelectorAll("lightning-input");
    inp.forEach(function(element) {
      if (element.name === "GharJanaHai" && element.checked == true) 
      {
        var selID = element.value;
        /* eslint-disable no-console */
        for(let i=0; i < this.selectedAccounts.length; i++) {
          if(this.selectedAccounts[i].Id == selID) {
            this.AllAccounts.push(this.selectedAccounts[i]);
            this.selectedAccounts.splice(i,1);
          }
        }
      }
    }, this);
    /* eslint-disable no-console */
    console.log('All Accounts in Map : ' + JSON.stringify(this.AllAccounts) );
  }
}