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
          let siteHtml = newSite.formatSiteIndex()
          $(".js-load-sites").append(siteHtml)
        })
      })
  })
}

function Site(site) {
  this.id = site.id
  this.name = site.name
  this.location = site.location
}

Site.prototype.formatSiteIndex = function() {
  let siteHtml = `
    <ul>
      <li>Name: <a href="/sites/${this.id}"><strong>${this.name}</strong></a></li>
      <li>Location: <strong>${this.location}</strong></li>
    </ul>
    <hr>
  `

  return siteHtml
}
