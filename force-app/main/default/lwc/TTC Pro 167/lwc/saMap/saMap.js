import { LightningElement, wire } from "lwc";
import {
  subscribe,
  unsubscribe,
  MessageContext
} from "lightning/messageService";
import SA_LIST_UPDATE_MESSAGE from "@salesforce/messageChannel/SAListUpdate__c";
export default class SaMap extends LightningElement {
  mapMarkers = [];//fill this below
  subscription = null;

  @wire(MessageContext) messageContext;

  connectedCallback() { //susbscribe body...
    this.subscription = subscribe(
      this.messageContext,
      SA_LIST_UPDATE_MESSAGE,
      (message) => {
        this.handleSAListUpdate(message); //subscribe syntax ... and we have method "handlesAListUpdate"
      }
    );
  }
  disconnectedCallback() { // when not in use, unsubscribe
    unsubscribe(this.subscription);
    this.subscription = null;
  }

  
  handleSAListUpdate(message) {
    this.mapMarkers = message.sadetails.map((sadetail) => { //location is compound field
      const Latitude = sadetail.Location__Latitude__s; //subfield so __s suffix added..
      const Longitude = sadetail.Location__Longitude__s;
      return {
        location: { Latitude, Longitude },
        title: sadetail.Name__c,
        description: `Coords: ${Latitude}, ${Longitude}`,
        icon: "standard:people"
      };
    });
  }
}