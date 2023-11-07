import { LightningElement, wire } from 'lwc';
import searchSA from '@salesforce/apex/saDetailsController.searchSA';



export default class SaSearchL extends LightningElement {
    searchWord;
    saDetails;
    


    seacrhHandler(event) {
        this.searchWord = event.target.value;
    }



    @wire (searchSA, { searchKey: '$searchWord' })

    SaDetailsinfo({ error, data }) {
        if (data) {
            this.saDetails = data;
            console.log(this.saDetails);
             
        } else if (error) {
            console.error(error);
        }
    } 
}