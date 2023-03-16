import { Component } from '@angular/core';


@Component({
  selector: 'app-emicalculator',
  templateUrl: './emicalculator.component.html',
  styleUrls: ['./emicalculator.component.css']
})
export class EMIcalculatorComponent {


  principal_loan_amount:any = 100000; 
  loan_tenure:any = 120;
  rate:any = 8;

  resultAmount:any;
  PayableAmount:any;
  IntersetAmount:any;
  InterestPercentage:any
   
  result(){
    const temp= this.rate / 1200;
    const temp2 = this.principal_loan_amount * temp * Math.pow(1 + temp, this.loan_tenure);
    const temp3 = Math.pow(1 + temp, this.loan_tenure) - 1;

    this.resultAmount = (temp2 / temp3)
    this.PayableAmount = (this.resultAmount * this.loan_tenure)
    this.IntersetAmount = (this.PayableAmount - this.principal_loan_amount)
    this.InterestPercentage=((this.IntersetAmount/this.PayableAmount)*100).toFixed(2)

  }

  tableData(){
    let tableObj: any[] = [];
      let tableBeginingBalance = this.principal_loan_amount;
      tableBeginingBalance.toFixed(2)
      let tableEMI = this.resultAmount;
      tableEMI.toFixed(2)
      let interestAmount = (this.rate / 1200) * tableBeginingBalance;
      interestAmount.toFixed(2)
      let tablePrincipal = tableEMI - interestAmount;
      tablePrincipal.toFixed(2)
      let tableEndingBalance = tableBeginingBalance - tablePrincipal;
      tableEndingBalance.toFixed(2)

      for (let i = 0; i < this.loan_tenure; i++) {
        let obj = {
          index: i+1,
          one: tableBeginingBalance.toFixed(2),
          two: tableEMI.toFixed(2),
          three: tablePrincipal.toFixed(2),
          four: interestAmount.toFixed(2),
          five: tableEndingBalance.toFixed(2)
        };
        tableObj.push(obj);
        tableBeginingBalance = tableEndingBalance;
        interestAmount = (this.rate / 1200) * tableBeginingBalance;
        tablePrincipal = tableEMI - interestAmount;
        tableEndingBalance = tableBeginingBalance - tablePrincipal;
      }
      return tableObj;
  }
  ngOnInit(){
    this.result();
  }


}
