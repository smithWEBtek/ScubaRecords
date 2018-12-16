$(document).ready(function() {
  recordClickEvents()
})

const recordClickEvents = () => {
  $(document).on("click", ".js-site-records-btn", function(e) {
    e.preventDefault()
    $(".js-site-records").html('')
    let siteId = $(this).attr('data-id')
    fetch(`sites/${siteId}/records.json`)
      .then(res => res.json())
      .then(data => {
        console.log(data)
      })
  })
}
