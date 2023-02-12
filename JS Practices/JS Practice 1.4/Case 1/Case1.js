var height = [1,8,6,2,5,4,8,3,7]

function mostwater(array) {
    
    var max=0;
    for(var i=0;i<array.length;i++){
        for(var j=i+1;j<array.length;j++){
           max = Math.max(max,Math.min((array[i],array[j])*(j-1)))
        }
    }
    console.log( "maximum amount of water a container can store = "+max);
}
    

mostwater(height)