$(document).on('turbolinks:before-cache', function() {
  $('#city').select2('destroy');
} );
document.addEventListener("turbolinks:load", function(){
  var state = document.getElementById("provider_detail_state");
  var city = document.getElementById("provider_detail_city");

  $("#provider_detail_state").on("change", function() {
    while (city.firstChild) city.removeChild(city.firstChild);
        $.ajax({
          url: "/provider_details",
          type: "GET",
          data: "state=" + state.value,
          success: function (data) {
                  //remove disabled from city and change the options
                  $('select[name="provider_detail[city]"]').prop("disabled", false);
                  $('select[name="provider_detail[city]"]').html(data.response);
          }
        })
  });


  $(".msg_read").click(setTimeout(function() {
    $('.refresh').load(window.location.href + ' .refresh');
    $('.refresh_nav').load(window.location.href + ' .refresh_nav');
  }, 5000)); 


  

  $("#city").select2({
    placeholder: 'Select City',
    theme: "bootstrap",
    width: '200px'
  }).on("change",function () {
    $.ajax({
        type: "GET",
        url: "/home/filter_for_cities",
        data: {city:  $("#city").val() },
        ContentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function(data){
            document.getElementById("provider_detail_for_pagination").innerHTML=data.provider_detail;
        }
    });
  });

})