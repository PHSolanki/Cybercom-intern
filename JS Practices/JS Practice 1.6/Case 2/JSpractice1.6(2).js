let firstr = "12"
let secstr = "226"

function countDecoding(digits, n)
    {
 
        if (n == 0 || n == 1)
        {
            return 1;
        }
 
        if (digits[0] == '0')
        {
            return 0;
        }

        let count = 0;

        if (digits[n - 1] > '0')
        {
            count = countDecoding(digits, n - 1);
           
        }
    
        if (digits[n - 2] == '1'
            || (digits[n - 2] == '2'
                && digits[n - 1] < '7'))
        {
            count += countDecoding(digits, n - 2);
        }
        return count;
    }
   
    function countWays(digits, n)
    {
        if (n == 0 || (n == 1 && digits[0] == '0'))
        {
            return 0;
        }
        return countDecoding(digits, n);
    }
     


   console.log("Count is ",countWays(firstr, firstr.length));
   console.log("Count is ",countWays(secstr, secstr.length));
