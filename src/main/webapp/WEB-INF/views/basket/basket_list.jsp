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
	
	.basket_head_list{
		list-style: none;
		margin-left: 10px;
		padding: 0;
		text-align: right;
		font-wight: bold;
		width: 80%;
	}
	
	.basket_head_list li{
		display: inline;
		font-size: 15px;
		margin: 3px;
	}
	.thumbnail{
		width: 20%;
	}
	.checkbox_td{
		width: 3%;
	}
	td{
		width: 15%;
	}
</style>
</head>
<body>
	<div class="contents">
		<div class="basket_hgroup">
			<ol class="basket_head_list">
				<li>장바구니1</li>
				<li> | </li>
				<li>주문결제</li>
				<li> | </li>
				<li>주문완료</li>
			</ol>
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
					<c:forEach var="tmp" items="${list}">
						<tr>
							<td class="checkbox_td">
								<input type="checkbox" name="check_sub" value="${tmp.num }"/>
							</td>
							<td><img src="${pageContext.request.contextPath }/upload/${tmp.saveFileName}" class="thumbnail"/></td>
							<td>${tmp.title }</td>
							<td>${tmp.price }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<button type="button" class="btn btn-default paymentBtn" onclick="basket(1)">구매하기</button>
			<button type="button" class="btn btn-default deleteBtn" onclick="basket(2)">삭제하기</button>
		</form>	
		
		<div class="del_pay">
			
		</div>
	</div>
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
		if(index==1){
			document.basketForm.action = "cart_pay.do";
		}
		else{
			document.basketForm.action = "delete.do";
		}
		document.basketForm.submit();
	}
</script>
</html>




