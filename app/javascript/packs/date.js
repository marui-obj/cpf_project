$(document).ready(function(){
    var dt = new Date();
    year = dt.getFullYear();
    month = dt.getMonth() + 1;
    day = dt.getDate();
    document.getElementById('date').innerHTML=day + "/" + month + "/" + year;
    $('#datepicker').datepicker()
    .on('changeDate', function(e) {
        var dateObject = $("#datepicker").datepicker("getDate");
        var dateString = dateObject.getDate() + '-' + (dateObject.getMonth() + 1) + '-' + dateObject.getFullYear();
        // console.log(dateString);
        $('input[name="date"]').val(dateString);
        
    });


});