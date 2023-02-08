function spouseyes(){
    var check1= document.getElementById("check1").value
    if (check1.checked == true) {
        subdiv1.style.display = "block";
    }
    else {
        subdiv1.style.display = "none";
    }
}

function expenseYes(){
    var check3 = document.getElementById("expenseyes");
    var expenseshow = document.getElementById("expenseshow");
    if(expenseYes.checked==true){
        expenseshow.style.display="block";
    }
    else{
        expenseshow.style.display="none";
    }
}

function add(){
    
    var row = document.getElementById("drug");
    var add = row.insertRow(-1);
    var x =add.insertCell(0);
    var y =add.insertCell(1);
    var z =add.insertCell(2);
    var w =add.insertCell(3);
    x.innerHTML= document.getElementById("tabletext").value;
    y.innerHTML= document.getElementById("tabledate").value;
    z.innerHTML= document.getElementById("relationtext").value;
    w.innerHTML= document.getElementById("charges").value= "₹ 2,00,000.00" ;
}
