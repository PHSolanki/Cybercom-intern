import { Component } from '@angular/core';
import { FormControl, FormGroup , Validators } from '@angular/forms';

@Component({
  selector: 'app-contact-us',
  templateUrl: './contact-us.component.html',
  styleUrls: ['./contact-us.component.css']
})
export class ContactUsComponent {

  contactUsform = new FormGroup({
    userName: new FormControl('' , [Validators.required]),
    userEmail: new FormControl('' , [Validators.email,Validators.required]),
    userPhone : new FormControl('' ,[Validators.required,Validators.pattern('[7-9]{1}[0-9]{9}')]),
    userMessage : new FormControl('',[Validators.required , Validators.minLength(15)]),
  })

  contactUs(){
    console.log(this.contactUsform.value)
  }

  get Name(){
    return this.contactUsform.get('userName')
  }

  get Email(){
    return this.contactUsform.get('userEmail')
  }

  get phone(){
    return this.contactUsform.get('userPhone')
  }

  get message(){
    return this.contactUsform.get('userMessage')
  }
  

}
