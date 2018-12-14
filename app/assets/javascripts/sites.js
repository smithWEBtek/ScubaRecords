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

  $(document).on("click", ".js-site-link", function(e) {
    e.preventDefault()
    $(".js-load-site-show").html('')
    let siteId = $(this).attr('data-id')
    history.pushState(null, null, "sites/" + siteId)
    fetch(`/sites/${siteId}.json`)
      .then(res => res.json())
      .then(data => {
        let newSite = new Site(data)
        let siteHtml = newSite.formatSiteShow()
        $(".js-load-site-show").append(siteHtml)
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
      <li>Name: <a href="/sites/${this.id}" data-id="${this.id}" class="js-site-link"><strong>${this.name}</strong></a></li>
      <li>Location: <strong>${this.location}</strong></li>
    </ul>
    <hr>
  `
  return siteHtml
}

Site.prototype.formatSiteShow = function() {
  let siteHtml = `
    <h3>Name: <strong><em>${this.name}</em></strong></h3>
    <h4>Location: <strong><em>${this.location}</em></strong></h4>
  `
  return siteHtml
}
