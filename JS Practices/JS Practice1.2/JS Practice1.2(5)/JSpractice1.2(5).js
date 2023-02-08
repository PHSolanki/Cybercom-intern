const obj1={
    name:"Priyanshu",
    Age: 20,
    address: "Bhavnagar"
}
const obj2={
    name2:"Dutt",
    age2: 21,
    address2: "Ahmedabad"
}

function newobj(obj1,obj2){
    let obj3 = new Object()
   obj3 = Object.assign(obj1,obj2);
   return obj3;   

}
console.log(newobj(obj1,obj2))