$(document).on("click", '.put_status', function() {
    var location_id = $(".location_id").val()
    var unit_id = $(".unit_id").val()
    var project_id = $(".project_id").val()
    var transmit_id = $(".transmit_id").val()
    console.log("hi")
    var workflow_state = $(this).attr("workflow_state")
    $.ajax({
      url: "/locations/"+ location_id +"/units/"+ unit_id +"/projects/"+ project_id +"/transmits/"+ transmit_id + "/" + workflow_state,
      type: "put",
      dataType: "script",
    })
  })


