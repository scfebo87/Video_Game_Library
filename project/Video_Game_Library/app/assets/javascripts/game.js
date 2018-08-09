function Item(attr){
    this.description = attr.description
}

$(function () {
  $(".js-next").on("click", function() {
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/users/:user_id/consoles/:console_id/games/" + nextId + ".json", function(json) {
      $("#gameTitle").html("<a href=" + json["console_id"] + "/games/" + json["id"]+ ">" + json["title"] + "</a>")
      $(".js-next").attr("data-id", json["id"]);
    });
  });

  $(".listLink").on("click", function(e) {
      e.preventDefault();
    $.get("/users/:user_id/games.json", function(json) {
        json.forEach(function(game){
            $("#gameList").append("<li>" + game.title + "</li>")
        });
    });
  })
