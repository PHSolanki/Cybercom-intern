function validate(){
    var x = document.getElementById("fname").value;
    var y = document.getElementById("email").value;
    var z = document.getElementById("phone").value;
    if(x==""){
       document.getElementById("validator").innerHTML= "Please Enter Name";
    }
    if(y==""){
       document.getElementById("validator2").innerHTML="Please Enter valid Email";
    }
    if(z=="" || 8<=phone.length<=10){
        document.getElementById("validator3").innerHTML="Please Enter valid phone";
     }

}