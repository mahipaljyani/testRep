import { LightningElement, track } from 'lwc';
    export default class HelloWorld extends LightningElement {
        @track greeting = 'World';
        @track ShowInfo = true;
        contacts = [
            {
                Id : '1',
                Name : "Mahipal",
                Title : "Sahab" 
            },
            {
                Id : '2',
                Name : "Pratekk",
                Title : "tick" 
            },
            {
                Id : '3',
                Name : "Tarun",
                Title : "Gyan" 
            }
        ]
        changeHandler(event) {
            this.greeting = event.target.value;
    }    
}