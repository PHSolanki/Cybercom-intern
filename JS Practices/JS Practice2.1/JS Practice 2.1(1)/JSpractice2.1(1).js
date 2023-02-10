
function palindrome(str){
    let y=str.toLowerCase()
    let str1="";
    for(let i=str.length-1;i>=0;i--){
        str1=str1+str[i];
    }
    console.log(str1);
    
    if(y==str1){
        return true;
    }
    else{
        return false;
    }  
}

console.log(palindrome("madam"))