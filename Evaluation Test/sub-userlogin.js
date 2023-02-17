currUser = localStorage.getItem('SessionUser');
document.getElementById("username").innerHTML = currUser;

getData = JSON.parse(localStorage.getItem('Users'));

let date = new Date();
for (i = 0; i < getData.length; i++) {
    strDate = JSON.stringify(date);
    currentDate = strDate.slice(6, 11)
    let bDate = (getData[i].Birthdate).slice(5, 11);
    console.log(bDate)
    console.log(currentDate)
    if (currentDate == bDate) {
    document.getElementById('displayBirthday').innerHTML = "HAPPY BIRTHDAY"
}

}


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