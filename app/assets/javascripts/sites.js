$( document ).ready(function() {
  siteClickEvents();
});

const siteClickEvents = () => {
  $(".js-sites-button").on("click", (e) => {
    e.preventDefault()
    alert("hello world")
  })
}
