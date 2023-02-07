function add(){
    var li=document.createElement("li");
    li.innerHTML="item";
    document.getElementById('mylist').appendChild(li);
}

function remove(){
    var mylist=document.getElementById("mylist");
    var items= document.querySelectorAll("#mylist li")
    mylist.removeChild(items[0]);
    mylist.removeChild(items[items.length - 1]);
}