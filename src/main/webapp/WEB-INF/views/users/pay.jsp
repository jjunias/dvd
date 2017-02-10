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
  img{
    width: 100%;
  }
  .line_area{
    border-bottom: 1px solid gray;
  }
  .payCart{
    border:1px solid gray;
    height: 307px;
    overflow-y:scroll;
  }
  .control-label{
    padding-right: 20px;
  }
  .form-control{
    width: 70%;
    display: inline;
  }
  #buy_phone, #shipping_phone, #email, #pwd, #addrNum{
    margin-left: 32px;
  }
  #pwd2{
  	margin-left: 23px;
  }
  .buy_name{
    margin-right: 14px;
  }
  .cart_bar{
    border-bottom:1px solid #EAE1E1;
  }
  .col-xs-3{

  }
  .shippingBtn{
    position: absolute;
    margin-right: 45px;
    top: 0;
    right: 0;
  }
  .shippingAddr{
    position: relative;
  }
  #addrNum{
    width:30%;
  }
  #addr, #addrDetail{
    margin-left: 112px;
  }
  .payment{
    border:2px double blue;
    height: 250px;
  }
  .priceBox, .couponBox{
    float: right;
    margin-right: 15px;
  }
  ul{
    padding-left: 20px;
  }
  li{
    margin: 10px;
  }
  .pay_font{
    font-size: 20px;
  }
  #pay_result{
    font-size: 20px;
    color: red;
  }
  .paymentBtn{
    margin-left: 10%;
    width: 80%;
  }
  .help-block{
  	display:none;
  }
  .feedback-span{
  
  }

</style>
<body>
	<jsp:include page="/WEB-INF/views/catalog.jsp"/>
<div class="content">
  <div class="col-xs-7">
    <div class="car_info">
      <h3>주문자 정보</h3>
      <div class="line_area"></div><br/><br/>
      <div class="form-group">
        <label for="buy_name" class="control-label buy_name">주문자 이름</label>
        <input type="text" class="form-control"  name="name"  id="buy_name" value="dto.name"/><br/>
      </div>
      <div class="form-group">
        <label for="buy_phone" class="control-label">휴대전화</label>
        <input type="text" class="form-control"" name="phone"  id="buy_phone" placeholder="비밀번호(영문,숫자혼합,6자 이상)"  value="dto.phone"/><br/>
      </div>
      <div class="form-group">
        <label for="email" class="control-label">메일주소</label>
        <input type="text" class="form-control"  name="email"  id="email" value="dto.mail"/><br/>
      </div>
      <div class="form-group has-feedback">
			<label for="pwd" class="control-label">비밀번호</label>
			<input type="password" class="form-control" name="pwd"  id="pwd"  placeholder="비밀번호(영문,숫자혼합,6자 이상)"/>
			<p class="help-block"> 비밀번호를 확인하세요.(영문,숫자를 혼합하여 6~20자 이내)</p>
		</div>
		<div class="form-group has-feedback">
			<label for="pwd2" class="ontrol-label">비밀번호확인</label>
			<input type="password" class="form-control" name="pwd2"  id="pwd2" placeholder="비밀번호 확인"/><br/>
			<p class="help-block"> 비밀번호를 확인하세요.</p>
		</div>
    </div>
    <br/>
    <div class="shipping">
      <div class="line_area"></div><br/>
      <div class="shippingAddr"> 
        <h3>배송지 정보</h3><br/>
        <button class="btn btn-default shippingBtn">주문자 정보와 동일</button>
      </div>
      <div class="form-group">
        <label for="shipping_name" class="control-label buy_name">주문자 이름</label>
        <input type="text" class="form-control"  name="shipping_name"  id="shipping_name"/><br/>
      </div>
      <div class="form-group">
        <label for="shipping_phone" class="control-label">휴대전화</label>
        <input type="text" class="form-control"" name="shipping_phone"  id="shipping_phone" placeholder="비밀번호(영문,숫자혼합,6자 이상)" /><br/>
      </div>
      <div class="form-group">
        <label for="addr" class="control-label">우편번호</label>
        <input type="text"  class="form-control"  name="addrNum"  id="addrNum" placeholder="우편번호">
        <input type="button"  class="btn btn-default"  id="postCodeBtn" onclick="postCode()" value="우편번호 찾기"><br>
        <input type="text"  class="form-control"  name="addr"  id="addr" placeholder="주소">
        <input type="text"  class="form-control"  name="addrDetail"  id="addrDetail" placeholder="상세주소">
      </div>
    </div>
  </div>
  <div class="col-xs-5">
    <h3>주문상품 정보</h3>  
    <div class="payCart">
      <div class="col-xs-4">
        <img src="${pageContext.request.contextPath}/resources/images/rabbit_1.png"/>
      </div>
      <div class="col-xs-8">
        <table>
          <tr>
            <td>
              여기는 제목
            </td>
          </tr>
          <tr>
            <td>
              여기는 콘텐츠
            </td>
          </tr>
        </table>
      </div>
    </div>
    <br/>
    <h3>최종결제 정보</h3>
    <div class="payment">
      <ul>
        <li>
          <span>상품가격</span>
          <div class="priceBox"><strong>{상품가격1000}</strong>원</div>
        </li>
        <li>
          <span>할인가격</span>
          <div class="couponBox"><strong>{할인가격1000}</strong>원</div>
        </li>
      </ul>
      <br/>
      <div class="line_area"></div><br/>
      <ul>
        <li>
          <span class="pay_font"><strong>결제 예정액</strong></span>
          <div class="priceBox"><strong id="pay_result">{상품가격1000}</strong>원</div>
        </li>
      </ul>
      <br/>
      <button class="btn btn-info paymentBtn btn-lg">결제하기</button>
    </div>  
  </div>
</div>
<script>

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
    
    
    $(".shippingBtn").click(function(){
		var name = $("#buy_name").val();
    	var phone = $("#buy_phone").val();
    	
    	$("#shipping_name").val(name);
    	$("#shipping_phone").val(phone);
    	
    	$("#addrNum").val("디티오쩜에이디디알넘");
    	$("#addr").val("dto.addr");
    	$("#addrDetail").val("dto.addrDetail");
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