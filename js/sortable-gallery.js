// JavaScript Document

var thumbnailSpacing = 15;


$(document).ready(function(){
	var logo = $(".logoImg");
	var more = $("#more");
	
	function animationOnStart(){	
			 
		logo
		.animate({
			opacity: 1,
			easing: "easein",
			 }, 5000);

		more
		.animate({
			opacity: 1,
			easing: "easein"
			 }, 1000)
		.fadeOut("slow")
		.fadeIn("fast");	
		
		 $("#date").animate({
			 fontSize: '2em'
			 }, "slow");
	};
		
	animationOnStart();
	
	$("#more").click(function(){
			$("#landing").remove();
			$("#nav").animate({
			opacity: 1,
			easing: "easein"
			 }, 800, "swing");	
			});
		
	$("a.sortLink").click(function(e){
		e.preventDefault();
		$("a.sortLink").removeClass("selected");
		$(this).addClass("selected");
		var keyword = $(this).attr("data-keyword");
		sortThunbnails(keyword);
	});
	
	$(".gallery .sorting").css("margin-bottom" , window.thumbnailSpacing+"px");
	$(".thumbnail_container a.thumbnail").addClass("showMe").addClass("fancybox").attr("rel", "group");
	
	positionThumbnails();
});



function sortThunbnails(keyword){
	$(".thumbnail_container a.thumbnail").each(function(){
		var thumbnailsKeywords = $(this).attr("data-keywords");
		if(keyword == "all"){
			$(this).addClass("showMe").removeClass("hideMe").attr("rel", "group");
		}else{
			if(thumbnailsKeywords.indexOf(keyword) != -1){
				$(this).addClass("showMe").removeClass("hideMe").attr("rel", "group");
			}else{
				$(this).addClass("hideMe").removeClass("showMe").attr("rel", "none");
			}
		}
	});
	
	positionThumbnails();
}



function positionThumbnails(){
	$(".thumbnail_container a.thumbnail.hideMe").animate({opacity:0},500,function(){
		$(this).css({"display":"none","top":"0px","left":"0px"});
		
	});
	
	var containerWidth = $(".photos").width();
	var thumbnail_R = 0;
	var thumbnail_C = 0;
	var thumbnailWidth = $("a.thumbnail img:first-child").outerWidth() + window.thumbnailSpacing;
	var thumbnailHeight = $("a.thumbnail img:first-child").outerHeight() + window.thumbnailSpacing;
	var max_C = Math.floor(containerWidth / thumbnailHeight);
	
	$(".thumbnail_container a.thumbnail.showMe").each(function(index){
		var remainder = (index%max_C)/100;
		var maxIndex = 0;
		
		if(remainder == 0){
			if(index !=0){
				thumbnail_R += thumbnailHeight;
			}
			thumbnail_C = 0;
			}else{ thumbnail_C += thumbnailWidth;}
			
		$(this).css("display" , "block").animate({
			"opacity": 1,
			"top":thumbnail_R+"px",
			"left":thumbnail_C+"px",
		}, 500);
		
		var newWidth = max_C * thumbnailWidth;
		var newHeight = thumbnail_R + thumbnailHeight;
		$(".thumbnail_container").css({"width":newWidth+"px" , "height": newHeight+"px"});
	});	
	
	detectFancyboxLinks();

}


function detectFancyboxLinks(){
	$("a.fancybox").unbind("click.fb");
	
	if( $(window).width()<550){
		$(".thumbnail_container a.thumbnail").removeClass("fancybox").attr("target", "_blank");
	}else{
		$(".thumbnail_container a.thumbnail").removeAttr("target");
	}
	
	$("a.fancybox[rel='group']").fancybox({
		'transitionIn'	:	'elastic',
		'transitionOut'	:	'elastic',
		'speedIn'		:	600, 
		'padding'		:	0,
		'titlePosition'	:	'over',
		'overlayColor'	:	'#000', 
		'overlayOpacity':	0.8
	});
}