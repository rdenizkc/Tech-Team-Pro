import { LightningElement, wire } from 'lwc';
import getSalesAssociateDetails from '@salesforce/apex/saDetailsController.getSalesAssociateDetails';


export default class SaDetailsInfo extends LightningElement {
    saDetails; 

    @wire(getSalesAssociateDetails)
    wiredSA({ error, data }) {
        if (data) {
            this.saDetails = data;
        } else if (error) {
            console.error('Error fetching SA Details: ', error);
        }
    }
}