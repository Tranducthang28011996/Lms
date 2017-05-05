var ready;
ready = function() {
    $(".btn-enrollment").click(function() {
        console.log('click')
        console.log(this.getAttribute("data-id"))

        courseId = this.getAttribute("data-id")
        $.ajax({
            url: 'courses/' + courseId + '/enroll',
            // dataType: 'json',
            dataType: 'script',
            method: "post",
            data: {},
            success: function(data) {
                console.log('success')
                console.log(data)
            },
            error: function(error) {
                console.log('error')
                console.log(error)
            }

        })
    })

  $(".request-approve").click(function() {
    // alert('request approve clicked: ' + )
    requestId = this.getAttribute("data-id")
    $.ajax({
      url: '/admin/courses/approve',
      // dataType: 'json',
      dataType: 'script',
      method: "patch",
      data: {request_id: requestId},
      success: function(data) {
        console.log('success')
        $("#approve-btn-" + requestId).fadeOut(200)
      },
      error: function(error) {
        console.log('error')
        console.log(error)
      }

    })
  })

};

$(document).on('turbolinks:load', ready);