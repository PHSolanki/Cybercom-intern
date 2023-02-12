var str=["Dutt","Priyanshu","Kunj","Darshan","Dhyey"]
var max=""

for(var i of str){
    if(i.length>max.length){
        max=i
    }
}

document.write("Max string of array is:" + max)
document.write("<br>")
document.write("Max length of string is:" + max.length)

