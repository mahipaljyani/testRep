import {
    LightningElement,
    track,
    wire,
    api
} from 'lwc';
import getStudents from '@salesforce/apex/LWCStudentsDetails.getStudents';
import getClasses from '@salesforce/apex/LWCStudentsDetails.getClasses';

export default class ClassroomAssignment extends LightningElement {
    @track value = 'inProgress';
    @track graphicalView = true;
    @track tabularView = true;
    @track AllStudents = [];
    @track assignedStudents = [];
    @track assignedSeats = [];
    @track error = '';
    @track AllClasses = [];
    @track colCount = 2;
    @track totalStudents = 10;
    @track colCounter = 0;
    @track selectedStudent = '';
    @track singleStudent;

    getallstudents() {
        getStudents()
            .then(result => {
                for (let key in result) {
                    if (result.hasOwnProperty(key)) {
                        this.AllStudents.push(result[key]);
                        if (result[key].mahijat__Seat_Assigned__c == true) {
                            this.assignedSeats.push(result[key].Id);
                        }
                    }
                }
                this.assignedStudents = JSON.parse(JSON.stringify(this.AllStudents));
                /* eslint-disable no-console */
                console.log('All Students in Map : ' + JSON.stringify(this.AllStudents));
                console.log('assignedSeats : ' + JSON.stringify(this.assignedSeats));
            })
            .catch(error => {
                this.error = error;
            });
        this.getAllClasses();
    };

    getAllClasses() {
        getClasses()
            .then(result => {
                for (let key in result) {
                    if (result.hasOwnProperty(key)) {
                        this.AllClasses.push(result[key]);
                    }
                }
                /* eslint-disable no-console */
                console.log('All Classes in Map : ' + JSON.stringify(this.AllClasses));
            })
            .catch(error => {
                this.error = error;
            });
    };

    get options() {
        return [{
                label: 'New',
                value: 'new'
            },
            {
                label: 'In Progress',
                value: 'inProgress'
            },
            {
                label: 'Finished',
                value: 'finished'
            },
        ];
    };

    classChanged(event) {
        this.value = event.detail.value;
    };
    enableGraphical() {
        if (this.graphicalView == true)
            this.graphicalView = false;
        else
            this.graphicalView = true;
    };
    enableTabular() {
        if (this.tabularView == true)
            this.tabularView = false;
        else
            this.tabularView = true;
    };


    connectedCallback() {
        this.getallstudents();
    };

    selectStudent(event) {
        /* eslint-disable no-console */
        this.selectedStudent = event.target.value;
        console.log(this.selectedStudent);
    };

    assignSeat(event) {
        //let tempAllStudents = JSON.parse(JSON.stringify(this.assignedStudents));
        let seatNo = event.target.dataset.seatno;
        /* eslint-disable no-console */
        console.log('seatNo : ' + (parseInt(seatNo)+1));
        let assignResult = this.assignedSeats.indexOf(this.selectedStudent);
        alert(assignResult);

        if (this.selectedStudent != '') {
            for (let i = 0; i < this.AllStudents.length; i++) {
                if (this.AllStudents[i].Id == this.selectedStudent) {
                    /* eslint-disable no-console */
                    console.log('found : ' + this.AllStudents[i].Id);
                    this.singleStudent = JSON.parse(JSON.stringify(this.AllStudents[i]));
                    console.log('sigle studnet : ' + JSON.stringify(this.singleStudent));
                    this.singleStudent.mahijat__SittingPosition__c = parseInt(seatNo) + 1;
                    this.singleStudent.mahijat__Seat_Assigned__c = true;
                    this.assignedStudents.splice(parseInt(seatNo), 1, this.singleStudent);
                    //break;
                }
            }
        }
        if (this.selectedStudent != '') {
            for (let i = 0; i < this.assignedStudents.length; i++) {
                if ((this.assignedStudents[i].Id == this.selectedStudent) && (this.assignedStudents[i].mahijat__SittingPosition__c != (parseInt(seatNo) + 1) ) ) {
                    console.log('Duplicate found : ' + this.assignedStudents[i].Id);
                    this.assignedStudents[i].mahijat__Seat_Assigned__c = false;
                }
            }
        }
        //this.assignedStudents = tempAllStudents;
        /* eslint-disable no-console */
        console.log('assigned students : ' + JSON.stringify(this.assignedStudents));

        /*for (let i = 0; i < this.assignedStudents.length - 1; i++) {
            for (let j = i + 1; j < this.assignedStudents.length; j++) {
                if (this.assignedStudents[j].mahijat__SittingPosition__c < this.assignedStudents[i].mahijat__SittingPosition__c) {
                    let tempvarofJ = this.assignedStudents[j];
                    let tempvarofI = this.assignedStudents[i];
                    this.assignedStudents.splice(i, 1, tempvarofJ);
                    this.assignedStudents.splice(j, 1, tempvarofI);
                }
            }
        }  */

    };
}