<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/source.jsp"/><!-- jquery , boostrap -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<style>

</style>
<body>
<jsp:include page="/WEB-INF/views/catalog.jsp"/>
<div class="content">
	<div class="cart-content_box">
	  <div class="col-xs-7">
	    <div class="car_info">
	      <h3>주문자 정보</h3>
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
				<input type="password" class="form-control form-control-cart cart-pwd" name="pwd"  id="pwd"  placeholder="비밀번호(영문,숫자혼합,6자 이상)"/>
				<p class="help-block"> 비밀번호를 확인하세요.(영문,숫자를 혼합하여 6~20자 이내)</p>
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
	        <h3>배송지 정보</h3><br/>
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
	      <div class="form-group">
	        <label for="addr" class="control-label control-label-cart">우편번호</label>
	        <input type="text"  class="form-control form-control-cart cart-addrNum"  name="addrNum"  id="addrNum" placeholder="우편번호">
	        <input type="button"  class="btn btn-default"  id="postCodeBtn" onclick="postCode()" value="우편번호 찾기"><br>
	        <input type="text"  class="form-control form-control-cart cart-addr"  name="addr"  id="addr" placeholder="주소">
	        <input type="text"  class="form-control form-control-cart cart-addrDetail"  name="addrDetail"  id="addrDetail" placeholder="상세주소">
	      </div>
	    </div>
	  </div>
	  <div class="col-xs-5 cart-col_right">
	    <h3>주문상품 정보</h3>  
	    <div class="payCart-cart">
	      <div class="col-xs-4">
	        <a href="/dvd/movie/detail_form.do?num=${dvd.num }"><img src="${pageContext.request.contextPath }/upload/${dvd.saveFileName}"/></a>
	      </div>
	      <div class="col-xs-8">
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
	        			<td>${dvd.genre }</td>
	        			<td>${dvd.title }</td>
	        			<td>${dvd.production }</td>
	        		</tr>
	        	</tbody>
	        </table>
	        <br/>
	        <div class="dvd_priceBox">
	        	<div class="dvd_amount">
			        수량:<select class="form-control form-control-cart cart-amount"  name="amount" id="cart-amount" >
								<c:forEach begin="1" end="10" var="i">
									<option  name="option" value="${i }">${i }</option>
								</c:forEach>
						   </select>
					<div class="cart-dvd_price">가격 : <strong>${dvd.price }</strong>원</div>
	        	</div>
	        </div>
	      </div>
	    </div>
	    <br/>
	    <h3 class="cart-pay_final">최종결제 정보</h3>
	    <div class="cart-payment">
	      <ul class="ul-cart">
	        <li class="li-cart">
	          <span final_price>상품가격</span>
	          <div class="cart-priceBox"><strong>${dvd.price }</strong>원</div>
	          <div class="cart-priceTotal">${dvd.price } <span>1개</span></div>
	        </li>
	      </ul>
	      <br/>
	      <div class="line_area"></div><br/>
	      <ul class="ul-cart">
	        <li class="ul-cart">
	          <span class="cart-pay_font"><strong>결제 예정액</strong></span>
	          <div class="cart-priceBox"><strong class="cart-pay-result" >${dvd.price }</strong>원</div>
	        </li>
	      </ul>
	      <br/>
	      <button class="btn btn-info cart-paymentBtn btn-lg">결제하기</button>
	    </div>  
	  </div>
	</div>
</div>
<script>

$("#cart-amount").on("change",function(){
	var a =  $(this).val();
	$(".cart-priceBox").find("strong").text("${dvd.price}"*a);
	$(".cart-priceTotal").find("span").text("*"+a+"개");
	
	
})


    function postCode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('addrNum').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
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
    
$("#pwd").on("blur", function(){
    	
        var inputVal1 = $("#pwd").val().trim();
    	$("#pwd")
		.parent()
		.removeClass("has-success has-error")
    	
		if(inputVal1==""){
			$("#pwd")
			.parent()
			.addClass("has-success")
			.find(".help-block")
			.hide()
		}else{
			$("#pwd")
			.parent()
			.addClass("has-error")
			.find(".help-block")
			.show()
		}
    	
    });
    

    
    
</script>
</body>
</html>