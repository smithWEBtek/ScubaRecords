$(document).ready(function() {
  recordClickEvent()
})

const recordClickEvent = () => {
  $(document).on("click", ".js-site-records-btn", function(e) {
  e.preventDefault()
  $(".js-site-records").html('')
  let siteId = $(this).attr('data-id')
  fetch(`sites/${siteId}/records.json`)
    .then(res => res.json())
    .then(data => {
      data.forEach(record => {
        let newRecord = new Record(record)
        let recordHtml = newRecord.formatRecords()
        $(".js-site-records").append(recordHtml)
      })
    })
  })
}

function Record(record) {
  this.id = record.id
  this.date = record.date
  this.dive_time = record.dive_time
  this.max_depth = record.max_depth
  this.water_temperature = record.water_temperature
  this.notes = record.notes
  this.user_id = record.user_id
}


Record.prototype.formatRecords = function() {
  let recordHtml = `
    <ol class="border rounded justify-content-center">
      <li class="d-flex justify-content-center align-items-center flex-column">
        <p>
          <strong>Created by:</strong> ${this.user_id}
        </p>
        <p>
          <strong>Date:</strong> ${this.date}
        </p>
        <p>
          <strong>Dive Time:</strong> ${this.dive_time}
        </p>
        <p>
          <strong>Max Depth:</strong> ${this.max_depth}(Ft)
        </p>
        <p>
          <strong>Water Temperature:</strong> ${this.water_temperature}(F)
        </p>
        <p>
          <strong>Notes:</strong> ${this.notes}
        </p>
      </li>
    </ol>
  `
  return recordHtml
}
