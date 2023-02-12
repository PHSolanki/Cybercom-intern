var obj=[{
    name:"zutt",
    age:47
},{
    name:"Priyanshu",
    age:22,
},{
    name:"Dhyey",
    age:32
}]

let sorte = obj.sort(
    function (r1,r2){
        if(r1.name>r2.name){
            return 1
        }
        else if(r1.name<r2.name){
            return -1
        }
        else{
            return 0
        }
    }

)
console.log(sorte)

    
