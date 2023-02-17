loginStr = localStorage.getItem('Admin');
loginObj = JSON.parse(loginStr);
document.getElementById('username').innerHTML = loginObj.Name;

function cells(){ 
        
    getData = JSON.parse(localStorage.getItem('Session'));
    let myTable = document.getElementById('myTable');

    for (i = 0; i < getData.length; i++) {
    
    let row = myTable.insertRow(-1)

    let cell1 = row.insertCell(0);
    let cell2 = row.insertCell(1);
    let cell3 = row.insertCell(2);
   

    cell1.innerHTML = getData[i].Name;
    cell2.innerHTML = getData[i].login_date_time;
    cell3.innerHTML=getData[i].logout_date_time;
   
   
}}
function logOut() {

    getData = JSON.parse(localStorage.getItem('Session'));
    currUser = localStorage.getItem('SessionUser');
    for (let i = 0; i < getData.length; i++) {  
        let logoutTime = new Date();
  
    if (currUser == getData[i].Name) {
        getData[i].logout_date_time = logoutTime;
        console.log(typeof(JSON.stringify(getData)));
    }
}
localStorage.setItem('Session', JSON.stringify(getData));
window.location.href = 'Login.html';
localStorage.removeItem('SessionUser');
}
