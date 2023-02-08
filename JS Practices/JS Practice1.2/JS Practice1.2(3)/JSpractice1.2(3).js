var mob= [{ 
    Company:"vivo",
    Model:"x1",
    Price:15000
},{
    Company:"Samsung",
    Model:"A1",
    Price:20000
},{
    Company:"Redmi",
    Model:"C1",
    Price:18000
    },
];

for(let a of mob){
    let value= "Company:" +a.Company+"<br>"+"Model:" +a.Model+"<br>"+"Price:"+a.Price+"<br>"+"<br>";
    document.write(value);
}