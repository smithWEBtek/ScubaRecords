$(document).ready(function() {
  recordClickEvents()
})

const recordClickEvents = () => {
  $(document).on("click", ".js-site-records-btn", function(e) {
    e.preventDefault()
    console.log("hello????")
  })
}
