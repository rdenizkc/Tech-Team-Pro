import { publish, MessageContext } from "lightning/messageService"; //info will be published from sa detail parent comp.
import SA_LIST_UPDATE_MESSAGE from "@salesforce/messageChannel/SAListUpdate__c";//message channel name

import { NavigationMixin } from "lightning/navigation";
import { LightningElement, wire } from "lwc";
import searchSas from "@salesforce/apex/SAManager.searchSas";

export default class SAManageApex extends NavigationMixin(LightningElement) {
  searchTerm = ""; //corresponding property of apex search variable

  sadetails;
  
  @wire(MessageContext) messageContext; //message service import...

  @wire(searchSas, { searchTerm: "$searchTerm" })
  loadSAdetails(result) {
    this.sadetails = result; //data is coming from apex class and assign into a local variable...
    //data coming through apex class will be assigned into sadetails property...
//---------------------
   
//..........
if (result.data) {
      const message = {
        sadetails: result.data // message containing data will be published 
      };
      publish(this.messageContext, SA_LIST_UPDATE_MESSAGE, message);
    }
  }


  //this part helps to dislpay records when we comlpete typin in input.. you can modfiy time of delay
  handleSearchTermChange(event) {
    // Debouncing this method: do not update the reactive property as
    // long as this function is being called within a delay of 300 ms.
    // This is to avoid a very large number of Apex method calls.

    window.clearTimeout(this.delayTimeout);
    const searchTerm = event.target.value;
    // eslint-disable-next-line @lwc/lwc/no-async-operation
    this.delayTimeout = setTimeout(() => {
      this.searchTerm = searchTerm;
    }, 3000);
  }

  get hasResults() { //getter: get the property from html, and load the data in it..
    return this.sadetails.data.length > 0; //when there is no data length is 0...returns false
  }

  handleSAView(event) {
    const saId = event.detail;//record Id is assigned here

    this[NavigationMixin.Navigate]({
      type: "standard__recordPage",
      attributes: {
        recordId: saId,
        objectApiName: "SA_details__c",
        actionName: "view"
      }
    });
  }
}