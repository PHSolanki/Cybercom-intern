let firNum = [1,2,2];
let secNum = [0]

function PowerSet(array) {
    
    const arr = [[]] 
    
    for (let value of array) { 
       const length = arr.length 
            for (let i = 0; i < length; i++){
                let temp = arr[i].slice(0) 
                temp.push(value)
                arr.push(temp)
        }
    }
    
    return arr;
    }
  
    console.log(PowerSet(firNum))
    console.log(PowerSet(secNum))
