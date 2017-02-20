$(".login_toggle").click(function() {
	$(".loginBar").stop().slideToggle(300);
});

$(".gBtn").click(function() {
	$(".loginBar").stop().slideToggle(300);
});

// 로그인
$("#loginBtn").click(function() {
	var formData = $("#login").serialize();
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