var dt = new Date();
    year = dt.getFullYear();
    month = dt.getMonth() + 1;
    day = dt.getDate();
    document.getElementById('date').innerHTML=day + "/" + month + "/" + year;

$(function() {
    $('#datepicker').datepicker();
});