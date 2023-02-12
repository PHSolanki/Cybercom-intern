let firNums = [-1, 2, 1, -4];
let secNums = [3, 2, -4, -1];

function target(num, target) {
    arr = [];
    for (let i = 0; i < num.length; i++) {
        for (let j = i + 1; j < num.length; j++) {
            for (let k = j + 1; k < num.length; k++) {
                let sum = num[i] + num[j] + num[k];
                arr.push(sum)
                console.log(
                    "sum Of  i = " + i + " ,j = " + j + " ,k = " + k + " th Element" + sum
                );
            }
        }
    }

    console.log(arr);
    let newarr = arr.map((x) => {
        return Math.abs(x - target);
    })
    newarr
    console.log(newarr);
    let x=Math.min.apply(Math, newarr);
    console.log(x)
    console.log(arr[newarr.indexOf(x)])
    


}

target(firNums, 1)
target(secNums, -4)