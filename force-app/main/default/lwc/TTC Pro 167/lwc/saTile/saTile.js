import { LightningElement, api } from "lwc";


export default class saTile extends LightningElement {
  @api sadetail; //public property coming from parent
  //THİS PUBLİC PROPERTY will be loaded with data in parent html
  //and we will be able to display sadetail records in tile cars...

  handleOpenRecordClick() { //custom event will get Id of SA; by the ID go to the record page
    const selectEvent = new CustomEvent("saview", {
      detail: this.sadetail.Id
    });
    this.dispatchEvent(selectEvent);
  }
}