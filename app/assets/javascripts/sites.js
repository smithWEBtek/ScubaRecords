$( document ).ready(function() {
  siteClickEvents();
});

const siteClickEvents = () => {
  $(".js-sites-button").on("click", (e) => {
    e.preventDefault()
    fetch(`/sites.json`)
      .then(res => res.json())
      .then(data => console.log(data))
  })
}
