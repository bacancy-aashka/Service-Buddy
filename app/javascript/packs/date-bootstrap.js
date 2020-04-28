document.addEventListener("turbolinks:load", function(){

  $('body').on('shown.bs.modal', '.modal', function () {

    //Or perhaps any other initializer.
    $('.startDate').datepicker({
      format: 'dd-mm-yyyy',
      autoclose: true,
      startDate: '-d',
      endDate: '+6m'
    });
  });


  $('.start_graph').datepicker({
    format: 'dd-mm-yyyy',
    autoclose: true,
    todayBtn: 'linked'
  })
  .on('changeDate', function (selected) {
    $(".end_graph").val("");
    var minDate = new Date(selected.date.valueOf());
    $('.end_graph').datepicker('setStartDate', minDate);
  });
  
  $('.end_graph').datepicker({
    format: 'dd-mm-yyyy',
    autoclose: true,
    todayBtn: 'linked'
  })
})