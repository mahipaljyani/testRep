trigger MyFirstTrigger on Account (before insert) {

    Account a  = trigger.new[0];
    a.name = a.name+' lol';

}