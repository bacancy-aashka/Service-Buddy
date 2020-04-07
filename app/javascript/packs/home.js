$(document).ready(function () {
    $("#city").on("change",function () {
        $.ajax({
            type: "GET",
            url: "/home/filter_for_cities",
            data: {city:  $("#city").val() },
            ContentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(data){

                document.getElementById("provider-detail").innerHTML=data.provider_detail;
                
            }
        });
    });
});