/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


// script.js

let currentStep = 0;
const steps = document.querySelectorAll('.form-step');
const progressBar = document.getElementById('progress-bar');
const stepIndicators = document.querySelectorAll('.step');

function updateStep() {
  steps.forEach((step, index) => {
    step.classList.toggle('active', index === currentStep);
    stepIndicators[index].classList.toggle('active', index <= currentStep);
  });

  const progressPercent = ((currentStep) / (steps.length - 1)) * 100;
  progressBar.style.width = `${progressPercent}%`;
}

function nextStep() {
  if (currentStep < steps.length - 1) {
    currentStep++;
    updateStep();
  }
}

function prevStep() {
  if (currentStep > 0) {
    currentStep--;
    updateStep();
  }
}

document.addEventListener('DOMContentLoaded', updateStep);