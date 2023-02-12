function calAge(DD,MM,YY){
    let cuDay=13
    let cuMonth=2
    let cuYear=2023

    var yearAge=cuYear-YY
    if (cuMonth >= MM)    
      var monthAge = cuMonth - MM;  
    else {  
      yearAge--;  
      var monthAge = 12 + cuMonth - MM;  
    }  
    if (cuDay >= DD)    
      var dateAge = cuDay - DD;  
    else {  
      monthAge--;  
      var dateAge = 31 + cuDay - DD;  
    }

    console.log("You are "+ yearAge + " years " + monthAge + " months " + dateAge + " days older");

}

console.log(calAge(5,11,2001))