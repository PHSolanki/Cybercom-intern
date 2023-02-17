loginStr = localStorage.getItem('Admin');
loginObj = JSON.parse(loginStr);
console.log(loginObj.Name)
document.getElementById('username').innerHTML = loginObj.Name;

function add(){
    let username = document.getElementById('tname').value
    let useremail = document.getElementById('temail').value
    let userpass = document.getElementById('tpass').value
    let userdob = document.getElementById('tdate').value
    
    let userObj = {
    "Name": username,
    "Email": useremail,
    "Password": userpass,
    "Birthdate": userdob
    }

    let x = JSON.stringify([]);
    if (!localStorage.getItem('Users')) {
        localStorage.setItem('Users', x);
    }
    let userData = JSON.parse(localStorage.getItem('Users'));
    userData.push(userObj);
    localStorage.setItem("Users", JSON.stringify(userData));

    window.location.reload();
}

function cells(){
    getData = JSON.parse(localStorage.getItem('Users'));
    let records = document.getElementById('records');

    for(i = 0; i < getData.length; i++){

        let arr=[];
        arr.push(parseInt(getData[i].Birthdate.split("/")));
        let row = records.insertRow(-1)
        
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        var cell3 = row.insertCell(2);
        var cell4 = row.insertCell(3);
        var cell5 = row.insertCell(4);
        var cell6 = row.insertCell(5);

        
        cell1.innerHTML = getData[i].Name;
        cell2.innerHTML = getData[i].Email;
        cell3.innerHTML = getData[i].Password;
        cell4.innerHTML = getData[i].Birthdate.split("-").reverse().join("-")
        cell5.innerHTML = 2023 - arr[0];
        cell6.innerHTML = "<button type='button' onclick='edit'>Edit</button><button type='button' onclick='deleteUser()'>Delete</button>";
        let Age= 2023-arr[0]
        
    }
}

function edit(){
    document.getElementById("addUser").innerText = "Update User";
    getData = JSON.parse(localStorage.getItem('Users'));
}

function deleteUser(item){
    getData = JSON.parse(localStorage.getItem('Users'));
    getData.splice(item,1)

    localStorage.setItem("Users", JSON.stringify(getData))
    window.location.reload() 

   
}
