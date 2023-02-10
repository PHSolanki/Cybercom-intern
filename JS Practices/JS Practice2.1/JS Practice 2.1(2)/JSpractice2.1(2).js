let arr=[2,4,4,1,0,3]

function largenum(arr,num){
    let a=[]
    for(i=0;i<arr.length;i++){
        if(arr[i]>num){
            a.push(arr[i])
        }
    }
    return a;
}

console.log(largenum(arr,3))