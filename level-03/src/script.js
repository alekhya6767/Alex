// This is a closure function https://medium.com/javascript-scene/master-the-javascript-interview-what-is-a-closure-b2f0d2152b36
(function() {

  let inputs = document.getElementsByTagName("input");
  let name=inputs[0];
  let phone=inputs[1];
  let email=inputs[2];

  let selects = document.getElementsByTagName("select");
  let department1 = selects[0];
  let department2=selects[1];

  var initialize = function() {
  var button=document.querySelector("button");
  button.addEventListener("click", onSubmit);
  department1.addEventListener("change", disableDuplicateSecondaryDepartment);
  };

  var disableDuplicateSecondaryDepartment = function() {
    for(var i=0;i<department2.length;i++)
    {
      if(department2.options[i].value===department1.value)
        {
          department2.options[i].disabled=true;
        }
      else
        {
          department2.options[i].disabled=false;
        }
    }
  }

  var constructData = function() {
    var data = {};
	data[name.name]=name.value;
    data[phone.name]=phone.value;
    data[email.name]=email.value;
    data[department1.name]=department1.value;
    data[department2.name]=department2.value;
    return data;
  }

  var validateResults = function(data) {
    var isValid = true;
    var reg = /^[A-Za-z0-9.]+@college.edu$/;
    if(data[name.name].length>100){
    isValid =false;}
    else if(data[phone.name].length>10){
    isValid=false;}
    else if(!reg.test(data[email.name])){
    isValid=false;}
    else if(department1.value===department2.value){
      isValid=false;
    }
    else{
    isValid=true;}
    console.log(reg.test(data[email.name]));
    return isValid;
  };

  var onSubmit = function(event) {
    event.preventDefault()
    var data = constructData();
    if (validateResults(data)) {
      printResults(data);
      console.log(data);
    } else {
      var resultsDiv = document.getElementById("results");
      resultsDiv.innerHTML = '';
      resultsDiv.classList.add("hide");
    }
  };

  var printResults = function(data) {
    var constructElement = function([key, value]) {
      return `<p class='result-item'>${key}: ${value}</p>`;
    };

    var resultHtml = (Object.entries(data) || []).reduce(function(innerHtml, keyValuePair) {
      debugger
      return innerHtml + constructElement(keyValuePair);
    }, '');
    var resultsDiv = document.getElementById("results");
    resultsDiv.innerHTML = resultHtml;
    resultsDiv.classList.remove("hide");
  };
  document.addEventListener('DOMContentLoaded', initialize);
})();