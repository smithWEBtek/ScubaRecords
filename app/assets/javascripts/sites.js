$( document ).ready(function() {
  $(".js-load-records").on("click", function(e) {
    e.preventDefault();
    $.ajax({
      method: "GET",
      url: this.href,
    }).done(function(data) {
      $("div.js-records").html(data);
    });
  });
});
