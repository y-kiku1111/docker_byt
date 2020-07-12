$(document).ready(function() {
  //==================================
  // #Slideshow with jQuery
  //==================================

  // id generator
  function idGenerator() {
    $(".slides__img").each(function(index, el) {
      $(this).attr("id", "slide_" + index);
    });
    $(".dots__single").each(function(index, el) {
      $(this).attr("id", "dot_" + index);
    });
  }

  // id extractor
  // at the end it focuses the current dot
  function dotsFocus() {
    $("[id^='dot_']").removeClass("dots__current");
    var id = $(".slides__img:eq(1)").attr("id");
    var n = Number(id.substr(-1));
    if (n === 0) {
      n = $(".slides__img").length;
    }
    $("#dot_" + (n - 1)).addClass("dots__current");
  }

  // slide up caption
  function captionSlideUp(d, e) {
    var $cap1 = $(".slide__caption:eq(1)");
    $cap1.animate(
      {
        bottom: "20%",
        opacity: 1
      },
      {
        duration: d,
        easing: e,
        complete: dotsFocus()
      }
    );
  }

  // slide down caption
  function captionSlideDown(d, e) {
    $(".slide__caption").animate(
      {
        bottom: "5%",
        opacity: 0
      },
      {
        duration: d,
        easing: e
      }
    );
  }

  // slide movement
  function slideMove(t) {
    if (t === "prev") {
      return $(".slides__img")
        .first()
        .before($(".slides__img").last());
    }
    if (t === "next") {
      return $(".slides__img")
        .last()
        .after($(".slides__img").first());
    }
  }

  // slide images
  function slideIt(l, d, e, t) {
    var $slides = $(".slides");
    captionSlideDown(150, "linear");
    $slides.animate(
      {
        left: l
      },
      {
        duration: d,
        easing: e,
        complete: function() {
          $slides.css("left", "-100%");
          slideMove(t);
          captionSlideUp(1700, "swing");
        }
      }
    );
  }

  // slide with dots
  function dotsControl(d, e) {
    $(".dots__single").click(function() {
      var currentId = parseInt(
        $(".dots__current")
          .attr("id")
          .substr(-1)
      );
      var clickId = parseInt(
        $(this)
          .attr("id")
          .substr(-1)
      );
      var max = $(".dots__single").length - 1;
      var half = Math.floor($(".dots__single").length / 2);
      var diff;
      if (currentId > clickId) {
        diff = currentId - clickId;
        if (diff === max) {
          diff = 1;
          l = "-200%";
          t = "next";
        } else if (diff <= half) {
          l = "0%";
          t = "prev";
        } else {
          diff--;
          l = "-200%";
          t = "next";
        }
      }
      if (currentId < clickId) {
        diff = clickId - currentId;
        if (diff === max) {
          diff = 1;
          l = "0%";
          t = "prev";
        } else if (diff <= half) {
          l = "-200%";
          t = "next";
        } else {
          diff--;
          l = "0%";
          t = "prev";
        }
      }
      for (var i = 0; i < diff; i++) {
        slideIt(l, d, e, t);
      }
    });
  }

  // slideshow
  function slideShow(d, e) {
    $("#prev").click(function() {
      var t = $(this).attr("id");
      slideIt("0%", d, e, t);
    });
    $("#next").click(function() {
      var t = $(this).attr("id");
      slideIt("-200%", d, e, t);
    });
    dotsControl(d, e);
  }

  idGenerator();
  captionSlideUp(1700, "swing");
  slideShow(800, "swing");


  $(function () {
    $(".slides__img").eq(0).click( function() {
      $(".image_send").val("/photo/cafe.jpg");
      $(".send_job").val("ホールスタッフ");
      $(".target").val("20代/学生向け");
      $(".pay").val("時給1,100円");
      $(".shift").val("17:00〜22:00");
      $(".commuting").val("新宿駅から徒歩5分");
    });
  });

  $(function () {
    $(".slides__img").eq(1).click( function() {
      $(".image_send").val("/photo/cashier.jpg");
      $(".send_job").val("レジ打ちスタッフ");
      $(".target").val("30代/主婦(夫)向け");
      $(".pay").val("時給1,100円");
      $(".shift").val("10:00〜15:00");
      $(".commuting").val("三軒茶屋から徒歩10分");
    });
  });

  $(function () {
    $(".slides__img").eq(2).click( function() {
      $(".image_send").val("/photo/driver.jpg");
      $(".send_job").val("ドライバー・運転手");
      $(".target").val("40代/ドライバー経験者向け");
      $(".pay").val("時給1,300円");
      $(".shift").val("7:00〜16:00");
      $(".commuting").val("葛西駅から車で10分");
    });
  });

  $(function () {
    $(".slides__img").eq(3).click( function() {
      $(".image_send").val("/photo/data.jpg");
      $(".send_job").val("データ入力スタッフ");
      $(".target").val("30代/主婦(夫)向け");
      $(".pay").val("時給1,100円");
      $(".shift").val("10:00〜18:00");
      $(".commuting").val("渋谷駅から徒歩10分");
    });
  });

  $(function () {
    $(".slides__img").eq(4).click( function() {
      $(".image_send").val("/photo/moving.jpg");
      $(".send_job").val("移転・引っ越しスタッフ");
      $(".target").val("20代/フリーター向け");
      $(".pay").val("時給1,300円");
      $(".shift").val("10:00〜17:00");
      $(".commuting").val("新小岩駅から徒歩5分");
    });
  });


});
