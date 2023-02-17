loginStr = localStorage.getItem('Admin');
loginObj = JSON.parse(loginStr);
console.log(loginObj.Name)
document.getElementById('username').innerHTML = loginObj.Name;
getData = JSON.parse(localStorage.getItem('Users'))

let date = new Date();
    
    for (i = 0; i < getData.length; i++) {
        strDate = JSON.stringify(date);
        currentDate = strDate.slice(6, 11)
        let bDate = (getData[i].Birthdate).slice(5, 11);
       
        if (currentDate == bDate) {
            document.getElementById('displayBirthday').innerHTML = "Today is " + getData[i]
            .Name + " Birthday."
        }
        
    }

var Arr=[];
    for (i = 0; i < getData.length; i++) {
        strDate = JSON.stringify(date);
        let temp=getData[i].Birthdate.slice(0,4);
        let currDate = strDate.slice(1, 5)
        let Age=currDate-temp;
        Arr.push(Age)   
    }
    console.log(Arr)
    
    var count_50=0;
    var count=0;
    var count18_50=0;
    for(let i=0;i<Arr.length;i++){
        if(Arr[i]<18){
            count+=1;
        }else if(18<Arr[i] && Arr[i]<50){
            count18_50+=1;
        }else{
            count_50+=1;
        }
    }
    document.getElementById('less18').innerHTML=count;
    document.getElementById('18to50').innerHTML=count18_50;
    document.getElementById('above50').innerHTML=count_50
    console.log(count_50)
    console.log(count18_50)
    console.log(count)