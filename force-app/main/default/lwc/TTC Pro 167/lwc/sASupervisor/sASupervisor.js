import { LightningElement, api, wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import SUPERVISOR_FIELD from '@salesforce/schema/SA_Detail__c.Supervisor__c';

const saFields = [SUPERVISOR_FIELD];
export default class sASupervisor extends LightningElement {
    @api recordId;
    @wire(getRecord, { recordId: '$recordId', fields: saFields })
  sadetail;
    get supervisorId() {
        return getFieldValue(this.sadetail.data, SUPERVISOR_FIELD);
    }
}