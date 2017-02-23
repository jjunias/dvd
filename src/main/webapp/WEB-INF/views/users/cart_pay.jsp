<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 title</title>
<jsp:include page="/WEB-INF/views/catalog.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css_each/users/cart_pay.css" />
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
<div class="content">
	<div class="cart-content_box">
		<div class="col-md-7 col-sm-12 col-xs-12">
			<div class="car_info">
				<h3 class="res_h3">주문자 정보</h3>
				<div class="line_area"></div><br/><br/>
				<div class="form-group">
					<label for="buy_name" class="control-label control-label-cart cart-buy-name">주문자 이름</label>
					<input type="text" class="form-control form-control-cart cart-name"  name="name"  id="buy_name" value="${users.name }"/><br/>
				</div>
				<div class="form-group">
					<label for="buy_phone" class="control-label control-label-cart">휴대전화</label>
					<input type="text" class="form-control form-control-cart cart-phone" name="phone"  id="buy_phone"  value="${users.phone }"/><br/>
				</div>
				<div class="form-group">
					<label for="email" class="control-label control-label-cart">메일주소</label>
					<input type="text" class="form-control form-control-cart cart-email"  name="email"  id="email" value="${users.email }"/><br/>
				</div>
				<div class="form-group has-feedback">
					<label for="pwd" class="control-label control-label-cart">비밀번호</label>
					<input type="password" class="form-control form-control-cart cart-pwd" name="pwd"  id="pwd"  placeholder="비밀번호(영문,숫자,특수문자 혼합,6자 이상)"/>
					<p class="help-block"> 비밀번호를 확인하세요.(영문,숫자,특수문자를 혼합하여 6~20자 이내)</p>
				</div>
				<div class="form-group has-feedback">
					<label for="pwd2" class="control-label control-label-cart">비밀번호확인</label>
					<input type="password" class="form-control form-control-cart cart-pwd2" name="pwd2"  id="pwd2" placeholder="비밀번호 확인"/><br/>
					<p class="help-block"> 비밀번호를 확인하세요.</p>
				</div>
			</div>
			<br/>
			<div class="shipping">
				<div class="line_area"></div><br/>
				<div class="cart-shippingAddr"> 
					<h3 class="res_h3 res_h3_second">배송지 정보</h3><br/>
					<button class="btn btn-default cart-shippingBtn">주문자 정보와 동일</button>
				</div>
				<div class="form-group">
					<label for="shipping_name" class="control-label control-label-cart buy_name">주문자 이름</label>
					<input type="text" class="form-control form-control-cart cart-shipping-name"  name="shipping_name"  id="shipping_name"/><br/>
				</div>
				<div class="form-group">
					<label for="shipping_phone" class="control-label control-label-cart">휴대전화</label>
					<input type="text" class="form-control form-control-cart cart-shipping-phone" name="shipping_phone"  id="shipping_phone"  /><br/>
				</div>
				<div class="form-group addrRelative">
					<label for="addr" class="control-label control-label-cart">우편번호</label>
					<input type="button"  class="btn btn-default"  id="postCodeBtn" onclick="postCode()" value="우편번호 찾기">
					<input type="text"  class="form-control form-control-cart cart-addrNum"  name="addrNum"  id="addrNum" placeholder="우편번호">					
					<input type="text"  class="form-control form-control-cart cart-addr"  name="addr"  id="addr" placeholder="주소">
					<input type="text"  class="form-control form-control-cart cart-addrDetail"  name="addrDetail"  id="addrDetail" placeholder="상세주소">
				</div>
			</div>
		</div>
		<div class="col-md-5 col-sm-12 col-xs-12 cart-col_right">
			<h3>주문상품 정보</h3>  
			<div class="payCart-cart">
				<c:forEach var="tmp" items="${basket_list }">
				<div class="cart-list-box">
					<div class="desc_cart_pay_table">
						<div class="col-xs-4 cart_pay_img">
							<a href="/dvd/movie/detail_form.do?num=${tmp.num }"><img src="${pageContext.request.contextPath }/upload/${tmp.saveFileName}"/></a>
						</div>
						<input type="hidden" class="hidden_num" value="${tmp.num }"/>
						<div class="col-xs-8 cart-table-col">
							<table class="table cart-table-info">
								<thead>
									<tr>
										<td>장르</td>
										<td>제목</td>
										<td>제작년도</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${tmp.genre }</td>
										<td>${tmp.title }</td>
										<td>${tmp.production }</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<div class="dvd_priceBox">
								<div class="dvd_amount">
									수량:<select class="form-control form-control-cart cart-amount" name="amount" >
											<c:forEach begin="1" end="9" var="i">
												<option  name="option" value="${i }">${i }</option>
											</c:forEach>
										</select>
									<div class="cart-dvd_price">가격 : <strong>${tmp.price }</strong>원</div>
								</div>
							</div>
						</div>
					</div>
					<div class="res_cart_pay_table">
						<div class="col-xs-4 cart_pay_img">
							<a href="/dvd/movie/detail_form.do?num=${tmp.num }"><img src="${pageContext.request.contextPath }/upload/${tmp.saveFileName}"/></a>
						</div>
						<input type="hidden" class="hidden_num" value="${tmp.num }"/>
						<div class="col-xs-8 cart-table-col">
							<table class="table cart-table-info">
								<thead>
									<tr>
										<td>장르</td>
										<td>제목</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${tmp.genre }</td>
										<td>${tmp.title }</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<div class="dvd_priceBox">
								<div class="dvd_amount">
									수량:<select class="form-control form-control-cart cart-amount" name="amount" >
											<c:forEach begin="1" end="9" var="i">
												<option  name="option" value="${i }">${i }</option>
											</c:forEach>
										</select>
									<div class="cart-dvd_price">가격 : <strong>${tmp.price }</strong>원</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
			<br/>
			<h3 class="cart-pay_final">최종결제 정보</h3>
			<div class="cart-payment">
				<ul class="ul-cart">
					<li class="li-cart">
						<table class="table table-margin">
							<colgroup>
								<col width="33.333%" />
								<col width="33.333%" />
								<col width="33.333%" />
							</colgroup>
							<thead>
								<tr>
									<th>제목</th>
									<th>수량</th>
									<th>가격</th>
								</tr>
							</thead>
						</table>
						<div class="cart-table-scroll">
							<table class="table">
								<colgroup>
									<col width="33.333%" />
									<col width="33.333%" />
									<col width="33.333%" />
								</colgroup>
								<tbody>
									<c:forEach var="tmp" items="${basket_list }" > 
										<tr class="list_val">
											<td>${tmp.title }</td>
											<td class="ea">1개</td>
											<td class="table_price">${tmp.price }</td>
										</tr>
										<c:set var="sum" value="${sum=sum+tmp.price }"/>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</li>
				</ul>
				<div class="line_area"></div><br/>
				<div class="cart-payBox">
					<ul class="ul-cart">
						<li class="li-cart">
							<span class="cart-pay_font"><strong>결제 예정액</strong></span>
							<div class="cart-priceBox"><strong class="cart-pay-result" >${sum }</strong>원</div>
						</li>
					</ul>			
				</div>
				<button class="btn btn-info cart-paymentBtn btn-lg" onclick="cart_payment()">결제하기</button>
			</div>  
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
<script>
	$(".cart-amount").on("change",function(){
		var index = $(this).parents(".cart-list-box").index();
		var a = $(this).val();
		var price = $(".cart-dvd_price strong").eq(index).text() * a;
		$(".list_val").eq(index).find(".ea").text(a + "개").next().text(price);
		var total = 0;
		var length = "${fn:length(basket_list)}";
		for(i=0; i<length; i++){
			total += parseInt($(".table_price").eq(i).text());
		}
		$(".cart-pay-result").text(total);
	})

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
    
    
	$(".cart-shippingBtn").click(function(){
		var name = $("#buy_name").val();
		var phone = $("#buy_phone").val();

		$("#shipping_name").val(name);
		$("#shipping_phone").val(phone);
		
		$("#addrNum").val("${users.addrNum}");
		$("#addr").val("${users.addr}");
		$("#addrDetail").val("${users.addrDetail}");
	});
    
	function chkPwd(str){
		var reg_pwd = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		if(!reg_pwd.test(str))
		{
		return false;
		}
		return true;
		}
    // 폼 전송
    
	$("#pwd").on("blur",function() {
		$("#pwd").parent().removeClass("has-success has-error");
		$("#pwd2").parent().removeClass("has-success has-error");

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
	var length = "${fn:length(basket_list)}";
	var list = [];
	var list2 = [];
	var list3 = [];
	function cart_payment(){
		for(var i=0;i<length;i++){
			list[i] = $(".hidden_num").eq(i).val();
			list2[i] = $(".cart-amount").eq(i).val();
			list3[i] = $(".hidden_basket_num").eq(i).val();
		};
		location.href="complete_pay.do?scroll=complete"+"&list="+list+'&list2='+list2+'&list3='+list3;
	};
</script>
</body>
</html>