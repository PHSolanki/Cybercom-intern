let array=[
    {
    id:1,
    name: "John",
    age :10
    },
    {
    id:2,
    name: "doe",
    age:40
    },
    {
    id:3,
    name: "Kathy",
    age:29
    }
    ]


function countage(arr,num){
    let count=0
    for(let i=0;i<arr.length;i++){
        if(arr[i].age>num){
            count=count+1;
        }
    }
    return count;
}

console.log(countage(array,5))

