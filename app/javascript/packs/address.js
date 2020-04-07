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
})