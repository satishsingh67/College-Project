const prevBtns = document.querySelectorAll(".btn-prev");
const nextBtns = document.querySelectorAll(".btn-next");
const progress = document.getElementById("progress");
const formSteps = document.querySelectorAll(".form-step");
const progressSteps = document.querySelectorAll(".progress-step");

let formStepsNum = 0;

nextBtns.forEach((btn) => {
  btn.addEventListener("click", () => {
    formStepsNum++;
    updateFormSteps();
    updateProgressbar();
  });
});

prevBtns.forEach((btn) => {
  btn.addEventListener("click", () => {
    formStepsNum--;
    updateFormSteps();
    updateProgressbar();
  });
});

function updateFormSteps() {
  formSteps.forEach((formStep) => {
    formStep.classList.contains("form-step-active") &&
      formStep.classList.remove("form-step-active");
  });

  formSteps[formStepsNum].classList.add("form-step-active");
}

function updateProgressbar() {
  progressSteps.forEach((progressStep, idx) => {
    if (idx < formStepsNum + 1) {
      progressStep.classList.add("progress-step-active");
    } else {
      progressStep.classList.remove("progress-step-active");
    }
  });

  const progressActive = document.querySelectorAll(".progress-step-active");

  progress.style.width =
    ((progressActive.length - 1) / (progressSteps.length - 1)) * 100 + "%";
}
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


