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
    text += `<li><a class="dropdown-item" href="#" id = "${dateArray[i]}">${dateArray[i]}</a></li>`;
 
}
currentDate.innerHTML= dateArray[0];
const position = "beforeend";
selectDate.insertAdjacentHTML(position,text);

$(function() {
    $('#datepicker').datepicker();
});

$('#date-select').on('change',function(){
    $('#result').html($(this).val());   
});

for (let i = 0; i < 8; i++) {
    document.getElementById(dateArray[i]).onclick = function () {
        currentDate.innerHTML= dateArray[i];
    };
} 



