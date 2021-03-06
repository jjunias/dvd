<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/WEB-INF/views/source.jsp"/>
<title>views/basket/basket_list.jsp</title>
<style>
	.basket_hgroup{
		border-bottom: 3px solid #5D5D5D;
		position: relative;
	}

	.basket_head_title{
		font-weight: bold;
		color: #212121;
		width: 20%;
	}

	.thumbnail{
		width: 20%;
	}
	.checkbox_td{
		width: 3%;
	}
	.basket_img{
		width:100px;
		height:150px;
	}
	.btn_float{
		text-align: center;
		margin: 20px 0;
	}
	.btn_float .btn{
		text-align: center;
		margin: 20px 5px;
	}
	input[type="checkbox"]{
		width: 50px;
	}
	
	.basket_no h1{
		font-size: 40px;
		font-weight: bold;
		text-align: center;
		margin: 100px 0 100px 0;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/catalog.jsp"/>
	<div class="content">
		<div class="basket_hgroup">
			<h2 class="basket_head_title">장바구니</h2>		
		</div>
		
		<form name="basketForm" method="get">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>
							<input type="checkbox" name="checkAll" id="checkAll" />
						</th>
						<th></th>
						<th>제목</th>
						<th>가격</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="tmp" items="${list}" varStatus="status">
						<tr>
							<td class="checkbox_td">
								<input type="checkbox" name="check_sub" value="${tmp.num }"/>
							</td>
							<td>
								<input type="hidden" name="basket_num" value="${tmp.basket_num }"/>
							</td>
							<td><img class="basket_img" src="${pageContext.request.contextPath }/upload/${tmp.saveFileName}" class="thumbnail"/></td>
							<td>${tmp.title }</td>
							<td>${tmp.price }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="btn_float">
				<button type="button" class="btn btn-default paymentBtn" onclick="basket(1)">구매하기</button>
				<button type="button" class="btn btn-default deleteBtn" onclick="basket(2)">삭제하기</button>
			</div>
		</form>	
		<div class="del_pay">		
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
<!-- 체크박스 전체선택 및 해제 -->
<script>
	$("#checkAll").click(function(){
		if($(this).is(":checked")){
			$("input[name=check_sub]").prop("checked", true);
		}
		else{
			$("input[name=check_sub]").prop("checked", false);
		}
	});
</script>

<script>
	function basket(index){
		if($("input[name=check_sub]").is(":checked")==0){
			alert("구매 혹은 삭제를 원하시는 상품을 선택해 주세요!");
		}
		else{
			if(index==1){
				document.basketForm.action = "../users/cart_pay.do";
			}
			else{
				document.basketForm.action = "delete.do";
			}
			document.basketForm.submit();
		}
		
	}
</script>
</html>




