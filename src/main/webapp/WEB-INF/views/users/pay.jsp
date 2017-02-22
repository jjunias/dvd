<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<style>
	.payCart-pay {
		border: 1px solid gray;
		height: 200px;
		padding-top: 26px;
	}
	
	.control-label-pay {
		padding-right: 20px;
	}
	
	.form-control-pay {
		width: 70%;
		display: inline;
		margin-left: 4px;
	}
	
	.pay-phone, .pay-shipping-phone, .pay-email, .pay-pwd, .pay-addrNum {
		margin-left: 32px;
	}
	
	.pay-name {
		margin-left: 15px;
	}
	
	.pay-shipping-name {
		margin-left: 34px;
	}
	
	.pay-shippingBtn {
		position: absolute;
		margin-right: 45px;
		top: 0;
		right: 0;
	}
	
	.pay-shippingAddr {
		position: relative;
	}
	
	.pay-addrNum {
		width: 30%;
	}
	
	.pay-addr, .pay-addrDetail {
		margin-left: 112px;
	}
	
	.pay-payment {
		border: 2px double blue;
		height: 250px;
	}
	
	.pay-priceBox {
		float: right;
		margin-right: 15px;
		padding-left: 15px;
	}
	
	.pay-ul {
		padding-left: 20px;
		margin-bottom: 0px;
	}
	
	.pay-li {
		padding-top: 10px;
		margin: 10px;
		margin-bottom: 0px;
	}
	
	.pay-pay_font {
		font-size: 20px;
	}
	
	.pay-pay_result {
		font-size: 20px;
		color: red;
	}
	
	.pay-paymentBtn {
		margin-left: 10%;
		width: 80%;
	}
	
	.pay-content_box {
		padding-top: 60px;
	}
	
	.pay-pay_final {
		margin-top: 0px;
	}
	
	.pay-table-info {
		text-align: center;
	}
	
	.pay-dvd_price {
		padding-top: 4px;
		font-size: 20px;
		float: right;
	}
	
	.pay-priceTotal {
		float: right;
	}
	
	.pay-amount {
		width: 24%;
	}
	
	.pay_img {
		height: 140px;
	}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/catalog.jsp"/>
<div class="content">
	<div class="pay-content_box">
		<div class="col-xs-7">
			<div class="car_info">
				<h3>주문자 정보</h3>
				<div class="line_area"></div><br/><br/>
				<div class="form-group">
					<label for="buy_name" class="control-label control-label-pay buy_name">주문자 이름</label>
					<input type="text" class="form-control form-control-pay pay-name"  name="name"  id="buy_name" value="${users.name }"/><br/>
				</div>
				<div class="form-group">
					<label for="buy_phone" class="control-label control-label-pay">휴대전화</label>
					<input type="text" class="form-control form-control-pay pay-phone" name="phone"  id="buy_phone"  value="${users.phone }"/><br/>
				</div>
				<div class="form-group">
					<label for="email" class="control-label control-label-pay">메일주소</label>
					<input type="text" class="form-control form-control-pay pay-email"  name="email"  id="email" value="${users.email }"/><br/>
				</div>
				<div class="form-group has-feedback">
					<label for="pwd" class="control-label control-label-pay">비밀번호</label>
					<input type="password" class="form-control form-control-pay pay-pwd" name="pwd"  id="pwd"  placeholder="비밀번호(영문,숫자,특수문자 혼합,6자 이상)"/>
					<p class="help-block"> 비밀번호를 확인하세요.(영문,숫자,특수문자를 혼합하여 6~20자 이내)</p>
				</div>
				<div class="form-group has-feedback">
					<label for="pwd2" class="control-label control-label-pay">비밀번호확인</label>
					<input type="password" class="form-control form-control-pay pay-pwd2" name="pwd2"  id="pwd2" placeholder="비밀번호 확인"/><br/>
					<p class="help-block"> 비밀번호를 확인하세요.</p>
				</div>
			</div>
			<br/>
			<div class="shipping">
				<div class="line_area"></div><br/>
				<div class="pay-shippingAddr"> 
					<h3>배송지 정보</h3><br/>
					<button class="btn btn-default pay-shippingBtn">주문자 정보와 동일</button>
				</div>
				<div class="form-group">
					<label for="shipping_name" class="control-label control-label buy_name">주문자 이름</label>
					<input type="text" class="form-control form-control-pay pay-shipping-name"  name="shipping_name"  id="shipping_name"/><br/>
				</div>
				<div class="form-group">
					<label for="shipping_phone" class="control-label control-label-pay">휴대전화</label>
					<input type="text" class="form-control form-control-pay pay-shipping-phone" name="shipping_phone"  id="shipping_phone"  /><br/>
				</div>
				<div class="form-group">
					<label for="addr" class="control-label control-label-pay">우편번호</label>
					<input type="text"  class="form-control form-control-pay pay-addrNum"  name="addrNum"  id="addrNum" placeholder="우편번호">
					<input type="button"  class="btn btn-default pay-postCodeBtn"  id="postCodeBtn" onclick="postCode()" value="우편번호 찾기"><br>
					<input type="text"  class="form-control form-control-pay pay-addr"  name="addr"  id="addr" placeholder="주소">
					<input type="text"  class="form-control form-control-pay pay-addrDetail"  name="addrDetail"  id="addrDetail" placeholder="상세주소">
				</div>
			</div>
		</div>
		<div class="col-xs-5">
			<h3>주문상품 정보</h3>  
			<div class="payCart-pay">
				<div class="col-xs-4 pay_img">
					<a href="/dvd/movie/detail_form.do?num=${dvd.num }"><img src="${pageContext.request.contextPath }/upload/${dvd.saveFileName}"/></a>
				</div>
				<div class="col-xs-8">
					<input type="hidden" class="hidden_num" value="${dvd.num }"/>
					<table class="table pay-table-info">
						<thead>
							<tr>
								<td>장르</td>
								<td>제목</td>
								<td>제작년도</td>
							</tr>
						</thead>
						<tbody>
							<tr>
							<td>${dvd.genre }</td>
							<td>${dvd.title }</td>
							<td>${dvd.production }</td>
						</tr>
						</tbody>
					</table>
					<br/>
					<div class="dvd_priceBox">
						<div class="dvd_amount">
							수량:<select class="form-control form-control-pay pay-amount" name="amount" id="amount" >
									<c:forEach begin="1" end="10" var="i">
										<option  name="option" value="${i }">${i }</option>
									</c:forEach>
								</select>
							<div class="pay-dvd_price">가격 : <strong>${dvd.price }</strong>원</div>
						</div>
					</div>
				</div>
			</div>
			<br/>
			<h3 class="pay-pay_final">최종결제 정보</h3>
			<div class="pay-payment">
				<ul class="pay-ul">
					<li class="pay-li">
						<span final_price>상품가격</span>
						<div class="pay-priceBox"><strong>${dvd.price }</strong>원</div>
						<div class="pay-priceTotal">${dvd.price } <span>1개</span></div>
					</li>
				</ul>
				<br/>
				<div class="line_area"></div><br/>
				<ul class="pay-ul">
					<li class="pay-li">
						<span class="pay-pay_font"><strong>결제 예정액</strong></span>
						<div class="pay-priceBox"><strong class="pay-pay_result" >${dvd.price }</strong>원</div>
					</li>
				</ul>
				<br/>
				<button class="btn btn-info pay-paymentBtn btn-lg">결제하기</button>
			</div>  
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
<script>
	$(".pay-amount").on("change", function() {
		var a = $(this).val();
		$(".pay-priceBox").find("strong").text("${dvd.price}" * a);
		$(".pay-priceTotal").find("span").text("*" + a + "개");
	});

	function postCode() {
		new daum.Postcode({oncomplete : function(data) {
				var fullAddr = ''; 
				var extraAddr = ''; 
				
				if (data.userSelectedType === 'R') {
					fullAddr = data.roadAddress;
				} else { 
					fullAddr = data.jibunAddress;
				}
				if (data.userSelectedType === 'R') {
					if (data.bname !== '') {
						extraAddr += data.bname;
					}
					if (data.buildingName !== '') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					fullAddr += (extraAddr !== '' ? ' (' + extraAddr+ ')' : '');
				}
				document.getElementById('addrNum').value = data.zonecode; 
				document.getElementById('addr').value = fullAddr;
				document.getElementById('addrDetail').focus();
			}
		}).open();
	}

	$(".pay-shippingBtn").click(function() {

		var name = $("#buy_name").val();
		var phone = $("#buy_phone").val();

		$("#shipping_name").val(name);
		$("#shipping_phone").val(콜);

		$("#addrNum").val("${users.addrNum}");
		$("#addr").val("${users.addr}");
		$("#addrDetail").val("${users.addrDetail}");
	});

	function chkPwd(str) {
		var reg_pwd = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		if (!reg_pwd.test(str)) {
			return false;
		}
		return true;
	}
	// 폼 전송
	$("#pwd").on("blur",function() {
		$("#pwd")
		.parent()
		.removeClass("has-success has-error");
		
		$("#pwd2")
		.parent()
		.removeClass("has-success has-error");

		var inputVal1 = $("#pwd").val().trim();
		var inputVal2 = $("#pwd2").val().trim();
		if (inputVal1 == inputVal2 && !inputVal1 == "") {
			$("#pwd2")
			.parent()
			.addClass("has-success")
			.find(".help-block")
			.hide();
		} else {
			$("#pwd2")
			.parent()
			.addClass("has-error")
			.find(".help-block")
			.show();
		}

		// 확인 : 비밀번호
		$('#pwd').val($('#pwd').val().trim()); 
		if (!chkPwd($('#pwd').val().trim())) {
			$("#pwd")
			.parent()
			.addClass("has-error")
			.find(".help-block")
			.show()
			$('#pwd').val('');
			return false;
		} else {
			$("#pwd")
			.parent()
			.addClass("has-success")
			.find(".help-block")
			.hide();
		}
	});

	// 비밀번호 확인
	$("#pwd2").on("blur",function() {
		var inputVal1 = $("#pwd").val().trim();
		var inputVal2 = $("#pwd2").val().trim();
		$("#pwd2")
		.parent()
		.removeClass("has-success has-error");

		if (inputVal1 == inputVal2 && !inputVal2 == "") {
			$("#pwd2")
			.parent()
			.addClass("has-success")
			.find(".help-block")
			.hide();
		} else {
			$("#pwd2")
			.parent()
			.addClass("has-error")
			.find(".help-block")
			.show();
		}
	});
</script>
<script>
	$(".pay-paymentBtn").click(function(){
		var dvd_num = $(".hidden_num").val();
		var count = $(".pay-amount").val();
		location.href="complete_pay2.do?scroll=complete" + "&dvd_num=" + dvd_num + "&count=" + count;
	});
</script>
</body>
</html>