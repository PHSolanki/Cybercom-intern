loginStr = JSON.parse(localStorage.getItem('Users'));
loginObj = JSON.parse(loginStr);
document.getElementById('username').innerHTML = loginObj.Name;
getData = JSON.parse(localStorage.getItem('Users'));
