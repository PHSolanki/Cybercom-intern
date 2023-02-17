loginStr = localStorage.getItem('Admin');
loginObj = JSON.parse(loginStr);

let storeEmail = loginObj.Email;
let storePass = loginObj.Password;

if (storeEmail!="" && storePass!="") {
    document.getElementById("register").style.display="none";
    document.getElementById("or").style.display="none";
}


function login() {
    let email = document.getElementById('Email').value;
    let pwd = document.getElementById('pass').value;
    loginStr = localStorage.getItem('Admin');
    loginObj = JSON.parse(loginStr);
    
    userloginStr = localStorage.getItem('Users');
    userloginObj = JSON.parse(userloginStr);
    
    let storeEmail = loginObj.Email;
    let storePass = loginObj.Password;

    if (email != "" || pwd != "") {
        if (email == storeEmail && pwd == storePass) {
           alert("Welcome Admin");
            for (i = 0; i < userloginObj.length; i++) {
                let userstoreName=userloginObj[i].Name;
                localStorage.setItem("SessionUser", userstoreName);
            }
            window.location.href=("Dashboard.html")
        }else{
            for (i = 0; i < userloginObj.length; i++) {
                let userstoreEmail = userloginObj[i].Email;
                let userstorePass = userloginObj[i].Password;
                let userstoreName=userloginObj[i].Name;
                const date = new Date();
                SessObj = { "Name": userstoreName, "login_date_time": date};
                let x = JSON.stringify([]);
                if (!localStorage.getItem('Session')) {
                localStorage.setItem('Session', x);
                }
                let withDate = JSON.parse(localStorage.getItem('Session'));
                withDate.push(SessObj);
                localStorage.setItem("Session", JSON.stringify(withDate));
                if (userstoreEmail == email && userstorePass == pwd) {
                   alert("Welcome User");
                    window.location.href = "sub-userlogin.html";
                }
                localStorage.setItem("SessionUser", userstoreName);
            }
        }
    } else {
        alert("Please Enter All data"); 
    }
}

// function login(){
//     let gmail=document.getElementById("Email").value
//     let pass=document.getElementById("pass").value

//     let gitem_mail=localStorage.getItem("Email")
//     let gitem_pass=localStorage.getItem("Password")

//     if(gmail==gitem_mail && pass==gitem_pass){ 
//         window.location.href="Dashboard.html";
//         alert("You have successfully logged in ")
//     }else{
//         alert("Enter valid credentials")
//     }
// }

function onRegister(){
    window.location.href="Registration.html";
}

