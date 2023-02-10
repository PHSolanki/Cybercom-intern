let str1 = "25525511135";
let str2 = "0000";
let str3 = "101023";

function validIp(str) {
    let arr=[]
    let temp="";
    for(let i=0;i<str.length;i++){
        if(str[i]=="."){
            arr.push(temp)
            temp="";
        }else{
            temp=temp+str[i];
        }
    }
    arr.push(temp)
    for(let i=0;i<arr.length;i++){
        if(arr[i].length>3 || parseInt(arr[i])>255 || parseInt(arr[i]) < 0){
            return 0;
        }
        if(arr[i].length>1 && parseInt(arr[i])==0){
            return 0;
        }
        if(arr[i].length>1 && parseInt(arr[i])!=0 && arr[i][0]=="0"){
            return 0
        }
    }
    return 1;
}

function strtoarr(str){

    let len=str.length;
    if(len>12 || len<4){
        console.log("IP Address is Invalid")
    }
    let newstr=str;
    let newarr=[]

    for(let i=1;i<str.length-2;i++){
        for(let j=i+1;j<str.length-1;j++){
            for(let k=j+1;k<str.length;k++){
                newstr=newstr.substring(0,k)+"."+newstr.substring(k,newstr.length)
                newstr=newstr.substring(0,j)+"."+newstr.substring(j,newstr.length)
                newstr=newstr.substring(0,i)+"."+newstr.substring(i,newstr.length);
                
                if(validIp(newstr)){
                    newarr.push(newstr);
                    console.log(newstr);
                }
                newstr=str;
            }
        }
        
    }
}

console.log(strtoarr(str1))
console.log(strtoarr(str2))
console.log(strtoarr(str3))

