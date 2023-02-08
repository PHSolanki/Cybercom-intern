var numbers =[1,3,5,7];
var sum=0;
var max=numbers[0];
var avg=0;

for(var i=0 ;i<numbers.length;i++){
    sum=sum+numbers[i];
    if(numbers[i]>max){
        max=numbers[i];
    }
}
avg=sum/numbers.length
document.write( "max number:"+ max)
document.write("<br>")
document.write("Sum of array:" + sum)
document.write("<br>")
document.write("Average of array:" + avg)
