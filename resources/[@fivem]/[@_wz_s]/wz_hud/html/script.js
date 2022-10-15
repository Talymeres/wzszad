$(function(){
    window.addEventListener("message", function(event){
        if (event.data.pauseMenu == false) {
            $(".ui").fadeIn();
            $(".ui2").fadeIn();
            var armour = event.data.armour;
            $("#armour-percent").html(Math.round(armour) + "%");
            $("#armour-level").css("width", armour + "%");
            var health = event.data.health;
            $("#health-percent").html(Math.round(health) + "%");
            $("#health-level").css("width", health + "%");
        } else {
            $(".ui").fadeOut();
            $(".ui2").fadeOut();
        }
    })
})