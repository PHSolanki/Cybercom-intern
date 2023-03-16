import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ContactUsComponent } from './contact-us/contact-us.component';
import { EMIcalculatorComponent } from './emicalculator/emicalculator.component';
import { ErrorComponent } from './error/error.component';

const routes: Routes = [
  {path:'loancalculator' , component:EMIcalculatorComponent},
  {path:'contactus' , component:ContactUsComponent},
  {path:'' , component:ContactUsComponent},
  {path:'**' , component:ErrorComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
