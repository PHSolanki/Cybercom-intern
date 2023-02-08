const obj={
    name:"Priyanshu",
    age: 20,
    address: "Bhavnagar"
}

function prop(obj){
    const newObj = new Object();
    newObj.name=obj.name;
    newObj.age=obj.age;
    return newObj;
}

console.log(prop(obj))
