window.addEventListener('message', (event) => {
    let data = event.data
    if(data.action == 'show') {
     if (data.showks == true) {
        $("#show").css('display', 'flex');
        
    } else {
        $("#show").css('display', 'none');
     }
    }

    if(data.action == 'respawn') {
        if (data.respawn == true) {
            $("#respawn").css('display', 'flex');
           $("#show").css('display', 'flex');
           
       } else {
           $("#respawn").css('display', 'none');
        }
       }

})


$(document).ready(function(){
      $(".resume").click(function () {
        $.post(`https://${GetParentResourceName()}/exit`, JSON.stringify({}));
        $("<audio></audio>").attr({ 
            'src':'sounds/click.mp3', 
            'volume':50.0,
            'autoplay':'autoplay'
          }).appendTo("body");
        return
    })
    $(".map").click(function () {
        $.post(`https://${GetParentResourceName()}/map`, JSON.stringify({}));
        $("<audio></audio>").attr({ 
            'src':'sounds/click.mp3', 
            'volume':50.0,
            'autoplay':'autoplay'
          }).appendTo("body");
        return
    })
    $(".settings").click(function () {
        $.post(`https://${GetParentResourceName()}/settings`, JSON.stringify({}));
        $("<audio></audio>").attr({ 
            'src':'sounds/click.mp3', 
            'volume':50.0,
            'autoplay':'autoplay'
          }).appendTo("body");
    return
    })
    $(".discord").click(function () {
        var url = Config.Discord;
        window.invokeNative('openUrl', 'https://discord.gg/' + url)
        $("<audio></audio>").attr({ 
            'src':'sounds/click.mp3', 
            'volume':50.0,
            'autoplay':'autoplay'
          }).appendTo("body");
    })
    $('.shop').click(function () {
        var url2 = Config.Shop
        window.invokeNative('openUrl', 'https://' + url2)
        $("<audio></audio>").attr({ 
            'src':'sounds/click.mp3', 
            'volume':50.0,
            'autoplay':'autoplay'
          }).appendTo("body");
    })
    $('.disconnect').click(function () {
        $.post(`https://${GetParentResourceName()}/leave`)
        $("<audio></audio>").attr({ 
            'src':'sounds/click.mp3', 
            'volume':50.0,
            'autoplay':'autoplay'
          }).appendTo("body");
    })
    $(".resume").mouseenter(function(){
        $("<audio></audio>").attr({ 
        'src':'sounds/hover.mp3', 
        'volume':50.0,
        'autoplay':'autoplay'
        }).appendTo("body");
    });
    $(".map").mouseenter(function(){
        $("<audio></audio>").attr({ 
        'src':'sounds/hover.mp3', 
        'volume':50.0,
        'autoplay':'autoplay'
        }).appendTo("body");
    });
    $(".settings").mouseenter(function(){
        $("<audio></audio>").attr({ 
        'src':'sounds/hover.mp3', 
        'volume':50.0,
        'autoplay':'autoplay'
        }).appendTo("body");
    });
    $(".discord").mouseenter(function(){
        $("<audio></audio>").attr({ 
        'src':'sounds/hover.mp3', 
        'volume':50.0,
        'autoplay':'autoplay'
        }).appendTo("body");
    });
    $(".shop").mouseenter(function(){
        $("<audio></audio>").attr({ 
        'src':'sounds/hover.mp3', 
        'volume':50.0,
        'autoplay':'autoplay'
        }).appendTo("body");
    });
    $(".disconnect").mouseenter(function(){
        $("<audio></audio>").attr({ 
        'src':'sounds/hover.mp3', 
        'volume':50.0,
        'autoplay':'autoplay'
        }).appendTo("body");
    });

    var documentWidth = document.documentElement.clientWidth;
    var documentHeight = document.documentElement.clientHeight;
    var curTask = 0;
    var processed = []
  
    window.addEventListener('message', function(event){
  
      var item = event.data;
      if (item.Notify === true)
    {
      var msg = item.text;
      var newelement = "<h5 style='position: absolute; color: white; left: 1150px; top: 100px; font-size: 30px; letter-spacing: -1px; text-shadow: 3px 3px 9px #000;'>"+msg+"</h5>";
      $('#notifytext').html(newelement);
      $('.helpnotify').fadeIn(500);

    }

      
    });
  });