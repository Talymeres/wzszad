$(function() {

    var zoneContainer = $('.zoneOwner');
    var zoneOwner = $('.zoneTeamText');

    window.addEventListener('message', function(event) {

        var item = event.data;

        if(item.type == "newKill") {
            addKill(item.killer, item.killed, item.weapon, item.logorank, item.logorank2);   
        } else if(item.type == "newDeath"){
            newDeath(item.killed);
        }
    })
})

function addKill(killer, killed, weapon, logorank, logorank2) {
    $('<div class="killContainer"><span class="killer"></span><img src="img/' + logorank + '.webp" class="badge">' + killer + '</span><img src="img/' + weapon + '.webp" class="weapon"><span class="killed">' + killed + '</span><img src="img/' + logorank2 + '.webp" class="badge_right"></span></div><br class="clear">').appendTo('.kills')
    .css({'margin-right':-$(this).width()+'px'})
    .animate({'margin-right':'0px'}, 'slow')
    .delay(2500)
    .animate({'margin-right':-$(this).width()+'px'}, 'slow')
    .queue(function() { $(this).remove(); });
}

function newDeath(killed) {
    $('<div class="killContainer"><span class="killer">' + killed + '</span><img src="img/weapon_unarmed.webp" class="weapon"><span class="killed">' + killed + '</span></div><br class="clear">').appendTo('.kills')
    .css({'margin-right':-$(this).width()+'px'})
    .animate({'margin-right':'0px'}, 'slow')
    .delay(5000)
    .animate({'margin-right':-$(this).width()+'px'}, 'slow')
    .queue(function() { $(this).remove(); });
}