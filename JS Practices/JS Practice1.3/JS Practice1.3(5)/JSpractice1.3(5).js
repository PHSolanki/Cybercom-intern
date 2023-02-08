var arr1=["Priyanshu","Devam","Virat","Priyanshu"]
var arr2=["Kunj","Dutt","Jay","Kirtan"]

function Marray(arr1,arr2){
    var array =arr1.concat(arr2);
    for(var i=0;i<array.length;i++){
        for(var j=0;j<i;j++){
            if(array[i]==array[j]){
                array.splice(i,1);
            }
        }
       }
    console.log(array)
}

Marray(arr1,arr2);