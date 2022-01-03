
function ajaxpost(){
  var data= new FormData();
  data.append("photoupload",document.getElementById("photoupload").value);
  data.append("identity",document.getElementById("identity").value);
  data.append("identity1",document.getElementById("identity1").value);
  data.append("identity2",document.getElementById("identity2").value);
  data.append("identity3",document.getElementById("identity3").value);
  data.append("identity4",document.getElementById("identity4").value);
  data.append("identity5",document.getElementById("identity5").value);
  

  var xhr = new XMLHttpRequest();
  xhr.open("POST","dummy.html");
  xhr.onload=function(){
    alert(this.response);
  };
  xhr.send(data)
  
  return false;

};


