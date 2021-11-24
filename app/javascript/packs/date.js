let dt = new Date();
let year = dt.getFullYear();
let month = dt.getMonth() + 1;
let day = dt.getDate();

let currentDate = document.getElementById('date');
let selectDate = document.getElementById('date-select');

let text = ``;
let dateArray = [];
for (let i = 0; i < 8; i++) {
    dateArray.push((day+i) + "/" + month + "/" + year);
    text += `<li><button class="dropdown-item" id = "${dateArray[i]}" value="${dateArray[i]}">${dateArray[i]}</button></li>`;
 
}
currentDate.innerHTML= dateArray[0];
const position = "beforeend";
selectDate.insertAdjacentHTML(position,text);

$(function() {
    $('#datepicker').datepicker();
});


for (let i = 0; i < 8; i++) {
    document.getElementById(dateArray[i]).onclick = function () {
        currentDate.innerHTML= dateArray[i];
    };

   
} 

$("#22/11/2021").on('change',function(){
    $('#result').html($(this).val());   
});


