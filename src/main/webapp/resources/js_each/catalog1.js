$(".login_toggle").click(function() {
	$(".loginBar").stop().slideToggle(300);
});

$(".gBtn").click(function() {
	$(".loginBar").stop().slideToggle(300);
});

// 로그인
$(".loginBtn").click(function() {
	var formData = $(".login").serialize();
	$.ajax({
		url : "/dvd/users/login.do",
		type : "post",
		data : formData,
		success : function(data) {
			if (data) {
				location.reload();
			} else {
			}
		}
	});
});
$("#response_loginBtn").click(function() {
	var formData = $("#response_login").serialize();
	$.ajax({
		url : "/dvd/users/login.do",
		type : "post",
		data : formData,
		success : function(data) {
			if (data) {
				location.reload();
			} else {
			}
		}
	});
});
$(".sideBtn").click(function() {
	$(window).scrollTop(0);
});
function res_domesticCatal(){
	  $(".response_subDomestic").stop().slideToggle();
	  $(".res_domestic").children("p").toggleClass("glyphicon-menu-up");
}

function res_overseasCatal(){
	  $(".response_subOverseas").stop().slideToggle();
	  $(".res_overseas").children("p").toggleClass("glyphicon-menu-up");
}
$(".toggle_responseDown").click(function(){
	  $(".response_Menu").stop().show();
});
$(".toggle_responseUp").click(function(){
	  $(".response_Menu").stop().hide();
})