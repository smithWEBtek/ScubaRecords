$( document ).ready(function() {
  siteClickEvents();
});

const siteClickEvents = () => {
  $(".js-sites-button").on("click", (e) => {
    e.preventDefault()
    fetch(`/sites.json`)
      .then(res => res.json())
      .then(data => {
        $(".js-load-sites").html('')
        data.forEach(site => {
          let newSite = new Site(site)
          console.log(newSite)
        })
      })
  })
}

function Site(site) {
  this.id = site.id
  this.name = site.name
  this.location = site.location
}
