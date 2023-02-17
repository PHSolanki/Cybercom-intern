function subRegister(){
    let name=document.getElementById("name").value
    let email=document.getElementById("email").value
    let pass=document.getElementById("password").value
    let cpass=document.getElementById("cpassword").value
    let city=document.getElementById("city").value
    let state=document.getElementById("state").value
    let checkbox=document.getElementById('checkbox')

    let Obj = {"Name": name, "Email": email, "Password": pass, "State": state, "City": city};

    let Details = JSON.stringify(Obj);
    localStorage.setItem("Admin", Details)
    let str = localStorage.getItem('Admin');
    let obJ = JSON.parse(str);

    let storemail = obJ.email;
    let storepass=obJ.Password
    
    if(name= "" || email=="" || pass=="" || cpass=="" || checkbox.checked==false ){
        alert("Enter correct credentials")
    }else if(storemail==email && storepass==pass){
        alert("Already Register")
        window.location.assign('login.html')
    }else{
        alert("Welcome Admin")
        window.location.assign('login.html')
    }

    }

    

