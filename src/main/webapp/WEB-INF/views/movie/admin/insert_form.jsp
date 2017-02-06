<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script> <!-- 스마트 에디터 -->
<jsp:include page="/WEB-INF/views/source.jsp"/><!-- jquery , boostrap -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css_each/movie/insert_form.css"/>
<!DOCTYPE html>
<html>
<style>
	.filebox input[type="file"] {
	  position: absolute;
	  width: 1px;
	  height: 1px;
	  padding: 0;
	  margin: -1px;
	  overflow: hidden;
	  clip:rect(0,0,0,0);
	  border: 0;
	}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>상품</h3>
<div class="container">
	<form class="form-horizontal" action="insert.do" method="post" id="insertForm" enctype="multipart/form-data">
		<div class="form-group">	
		<label class="control-label" for="genre">장 르:</label>
		<select class="selectpicker" name="genre" id="genre">
			<option value="">장르 선택</option>
			<option value="action">액션</option>
			<option value="romance">로맨스</option>
			<option value="comedy">코미디</option>
			<option value="horror">공포</option>
			<option value="darama">드라마</option>
			<option value="etc">기타</option>
		</select><br/>
		<label class="control-label" for="title">제 목:</label>
		<input class="form-control" type="text" name="title" id="title"/><br/>
		<label class="control-label" for="production">제작년도:</label>
		<input class="form-control" type="text" name="production" id="production" /><br/>
		<label class="control-label" for="actor">출연 배우:</label>
		<input class="form-control" type="text" name="actor" id="actor" /><br/>
		<label class="control-label" for="price">가 격:</label>
		<input class="form-control" type="text" numberonly="true" name="price" id="price" /><br/>
		<label class="control-label" for="trailer">동영상:</label>
		<input class="form-control" type="text" name="trailer" id="trailer" /><br/>
		<label class="control-label" for="picture">메인 사진</label>
		<input type="hidden" name="national" value="${param.national}" />
		<div class="filebox">
			<label for="ex_filename">업로드</label>
			<input class="upload-name" type="text" id="upload_" placeholder="파일을 선택해주세요" disabled="disabled"/> 
			<input type="file" id="ex_filename" accept=".gif,.jpg,.png" name="myFile" class="upload-hidden"/>
		</div>
		<textarea name="content" id="content" style="width:766px;height:412px;display:none"></textarea>
		<input class="btn btn-default" type="button" onclick="submitContents(this);" value="등록" />
		</div>	
	</form>
</div>
</body>
</html>
<script>
//네이버 스마트 에디터
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "content",
		sSkinURI: "${pageContext.request.contextPath}/SmartEditor/SmartEditor2Skin.html",	
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:d사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
			fOnBeforeUnload : function(){
				//alert("완료!");
			}
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["content"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});
	
	function pasteHTML() {
		var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
		oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
	}
	
	function showHTML() {
		var sHTML = oEditors.getById["content"].getIR();
		alert(sHTML);
	}
		
	function submitContents(elClickedObj) {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
		try {
			elClickedObj.form.submit();
		} catch(e) {}
	}
	//네이버 스마트 에디터 끝
	
	//input file
	$(function(){
		var fileTarget = $('.filebox .upload-hidden');
    	fileTarget.on('change', function(){  // 값이 변경되면
    		if(window.FileReader){  // modern browser
      			var filename = $(this)[0].files[0].name;
    		} 
    		else{  // old IE
      			var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
    		}
    	// 추출한 파일명 삽입
    	$(this).siblings('.upload-name').val(filename);
  		});
    	//DATE PICKER
    	$( "#production").datepicker({
        });
    	$(document).on("keyup", "input:text[numberOnly]",function(){
    			$(this).val($(this).val().replace(/[^0-9]/gi,""))
    	});
	});
	//input file 끝
	 $.datepicker.setDefaults({
		    dateFormat: 'y.mm.dd',
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		    showMonthAfterYear: true,
		    yearSuffix: '년'
	});
</script>