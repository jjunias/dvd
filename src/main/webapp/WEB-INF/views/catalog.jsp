<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/source.jsp"/>
<style>
	body{
		background-color: #FAFAFA;
		height:0px;
	}
   img{
      width: 100%;
      height: 100%;
   }
   .top_users{
      position:absolute;
      right:1%;
      top:10px;
      font-size:16px;
   }  
   .top_users a{
		color:white;
   }
   .top_users a:ACTIVE, .top_users a:VISITED,.top_users a:HOVER{
		color:white;
		outline: none;
		text-decoration: none;
   }
   .top_catal{
 	  position:fixed;
      width:100%;
      height:40px;
      background-color:#232323;
      z-index:999;
   }
   .search_bar{
   	  position:absolute;
   	  top:40px;
   	  margin-left:7%;
      width:25%;
   }
   .search_bar input{
      height:35px;
   }
   .search_bar button{
      height:35px;
   }
   .main_catal{
      position:absolute;
      top:40px;
      width:20%;
      height:800px;
      z-index:99999;
   }
   ul{
      list-style: none;
   }
   .loginBar{
	   	padding:20px;
		width:300px;
	    position:absolute;
		display:none;
		z-index: 99999999 !important;
		top:30px;
		background-color: white;
		border-radius: 10px 10px 10px 10px;
		left: -85px;
   }
   .login_toggle, .sessionId{
      color:white;
      float:left;
      cursor: pointer;
   }
   .top_area{
      border-bottom: 1px solid gray;
   }
   #loginBtn{
      width:100%;
   }
   .gBtn{
        float: right;
        cursor: pointer;
   }
   .socialBtn{
        width:100%;
        text-align: center;
   }
   .content{
		float:left;
		margin-top:450px;
		margin-left:20%;
		width:60% !important;
		z-index:-1;
	}
	.main_left{
		position:absolute;
		left:0;
		top:410px;
		width:16%;
		height:40px;
		background:#FAFAFA;
	}
	.main_right{
		position:absolute;
		right:0;
		top:410px;
		width:16%;
		height:40px;
		background:#FAFAFA;
	}
	.top_one{
		position:fixed;
	    top:40px;
	    width:68%;
	    height:40px;
	    border-top:40px solid #232323;
	    border-left:60px solid transparent;
	    border-right:60px solid transparent;
	    margin-left:16%;
	}
	.main_tr{
		position:absolute;
		top:410px;
		width:68%;
		height:40px;
		border-top:40px solid transparent;
		border-left:60px solid #FAFAFA;
		border-right:60px solid #FAFAFA;
		margin-left:16%;
	}
	.main_img{
		position:absolute;
		top:0;
		width:100%;
		height:450px;
		background-image:url("${pageContext.request.contextPath}/resources/images/main.jpg");
		z-index: -1;
	}
	.catalog{
		position:absolute;
		height:80px;
		width:60%;
		left:12%;
		z-index:999999;
	}
	.catalog li {
		float:left;
		margin-top:40px;
		margin-right:70px;
		color:white;
		font-size:20px;
	}
	.sub_domestic{
		position:fixed;
		top:80px;
		left:34%;
		background-color : #232323;
		width: 130px;
		padding-left:0px;
		color:white;
		display:none;
	}
	.sub_overseas{
		position:fixed;
		top:80px;
		left:39%;
		background-color : #232323;
		width: 130px;
		padding-left:0px;
		color:white;
		display:none;
	}
	.sub_domestic a{
		color:white;
 	}
 	.sub_overseas a{
 		color:white;
 	}
 	.sub_domestic li{
 		margin-left:-15px;
 	}
 	.sub_overseas li{
 		margin-left:-15px;
 	}
   .sub_domestic a:ACTIVE, .sub_domestic a:VISITED,.sub_domestic a:HOVER,
   .sub_overseas a:ACTIVE, .sub_overseas a:VISITED,.sub_overseas a:HOVER{
		color:white;
		outline: none;
		text-decoration: none;
    }
    .catalog li{
    	cursor: pointer;
    }
    .side_bar{
    	position:absolute;
    	top:100px;
    	right:30%;
		width:100px;
		height:400px;
		border-radius: 15px 15px 15px 15px;
		border:4px solid #cecece;
		box-shadow:4px 4px #cecece;
    }
	.affix{
	  	top:60px;
		right:81px;
	}
	.affix-bottom{
		position: absolute;
	}
	.sideBtn{
		top:-2px;
		text-align:center;
		position:absolute;
		width:97px;
		left:-2px;
		border:4px solid #cecece;
		border:1px 15px 1px 15px;
		border-radius: 15px 15px 15px 15px;	
	}
	.sideBtn:hover{
		cursor: pointer;
	}
	.btnFont{
		font-size:20px;
	}
	.cartImg, .infoImg, .scheduleImg, .questionImg{
		width:80%;
		height: 50px;;	
	}
	.cartUnderline{
		text-decoration: none; !important
	}
	.cartBtn, .infoBtn, .scheduleBtn, .questionBtn{
		margin-left:15px;
		padding-top:20px;
	}
	.help-block{
		display: none;
	}
  .line_area{
    border-bottom: 1px solid gray;
  }
  
  
	/* pay.jsp css  */
	
	
  .payCart-pay{
    border:1px solid gray;
    height: 200px;
    padding-top:26px;
  }
  .control-label-pay{
    padding-right: 20px;
  }
  .form-control-pay{
    width: 70%;
    display: inline;
    margin-left: 4px;
  }
  .pay-phone, .pay-shipping-phone, .pay-email, .pay-pwd, .pay-addrNum{
    margin-left: 32px;
  }
  .pay-name{
    margin-left: 15px;
  }
  .pay-shipping-name{
  	margin-left:34px;
  }
  .pay-shippingBtn{
    position: absolute;
    margin-right: 45px;
    top: 0;
    right: 0;
  }
  .pay-shippingAddr{
    position: relative;
  }
  .pay-addrNum{
    width:30%;
  }
  .pay-addr, .pay-addrDetail{
    margin-left: 112px;
  }
  .pay-payment{
    border:2px double blue;
    height: 250px;
  }
  .pay-priceBox{
    float: right;
    margin-right: 15px;
    padding-left:15px;
  }
  .pay-ul{
    padding-left: 20px;
    margin-bottom:0px;
  }
  .pay-li{
  	padding-top:10px;
    margin: 10px;
    margin-bottom:0px;
  }
  .pay-pay_font{
    font-size: 20px;
  }
  .pay-pay_result{
    font-size: 20px;
    color: red;
  }
  .pay-paymentBtn{
    margin-left: 10%;
    width: 80%;
  }
  .pay-content_box{
  	padding-top:60px;
  }
  .pay-pay_final{
  	margin-top:0px;
  }
  .pay-table-info{
  	text-align: center;
  }
  .pay-dvd_price{
  	padding-top:4px;
  	font-size:20px;
  	float:right;
  }
  .pay-priceTotal{
  	float:right;
  }
  .pay-amount{
  	width:24%;
  }
	
	/* cart_pay.jsp css  */
	
	
  .payCart-cart{
    border:1px solid gray;
    height: 280px;
    padding-top:26px;
    overflow-y: scroll; 
  }
  .control-label-cart{
    padding-right: 20px;
  }
  .form-control-cart{
    width: 70%;
    display: inline;
  }
  .cart-phone, .cart-shipping-phone, .cart-email, .cart-pwd, .cart-addrNum{
    margin-left: 32px;
  }
  .cart-name, .cart-shipping-name{
    margin-left: 15px;
  }
  .cart-shippingBtn{
    position: absolute;
    margin-right: 45px;
    top: 0;
    right: 0;
  }
  .cart-shippingAddr{
    position: relative;
  }
  .cart-addrNum{
    width:30%;
  }
  .cart-addr, .cart-addrDetail{
    margin-left: 112px;
  }
  .cart-pwd2{
  	margin-left:5px;
  }
  .cart-payment{
    border:2px double blue;
    height: 250px;
  }
  .cart-priceBox{
    float: right;
    margin-right: 15px;
    padding-left:15px;
  }
  .ul-cart{
    padding-left: 20px;
    margin-bottom:0px;
  }
  .li-cart{
  	padding-top:10px;
    margin: 10px;
    margin-bottom:0px;
  }
  .cart-pay_font{
    font-size: 20px;
  }
  .cart-pay-result{
    font-size: 20px;
    color: red;
  }
  .cart-paymentBtn{
    margin-left: 5%;
    width: 90%;
  }
  .cart-content_box{
  	padding-top:60px;
  }
  .cart-pay_final{
  	margin-top:0px;
  }
  .cart-table-info{
  	text-align: center;
  	margin-bottom:10px;
  }
  .cart-dvd_price{
  	padding-top:4px;
  	font-size:20px;
  	float:right;
  }
  .cart-priceTotal{
  	float:right;
  }
  .cart-amount{
  	width:24%;
  }
  .cart-col_right{
  	padding-right:0px;
  }

		
</style>
<div class="main_img"></div>
<div class="main_left"></div>
<div class="main_right">
	<div data-spy="affix" data-offset-top="350" data-offset-bottom="300">
		<div class="side_bar">
			<div class="sideBtn">
				<span class="glyphicon glyphicon-chevron-up">Top</span>
			</div>
			<br/>
			<div class="cartBtn">
				<a class="cartUnderline" href="">
					<img class="cartImg" src="/dvd/resources/images/cart1.png" alt="장바구니 사진" />
				</a>
			</div>
			<div class="infoBtn">
				<a href="/dvd/users/info.do">
					<img class="infoImg" src="/dvd/resources/images/users1.png" alt="" />
				</a>
			</div>
			<div class="scheduleBtn">
				<a href="">
					<img class="scheduleImg" src="/dvd/resources/images/schedule1.png" alt="" />
				</a>
			</div>
			<div class="questionBtn">
				<a href="">
					<img class="questionImg" src="/dvd/resources/images/question.png" alt="" />
				</a>
			</div>
		</div>
	</div>
</div>

<div class="main_tr"></div>
<div>
   <div class="top_catal">
          <ul class="catalog">
      		<li style="margin-left:15%">MAIN</li>
      		<li onclick="location.href='/dvd/movie/movie_main.do?type=list&num=1&national=domestic'">한국 영화</li>
      		<li onclick="location.href='/dvd/movie/movie_main.do?type=list&num=1&&national=overseas'">해외 영화</li>
      		<li onclick="location.href='/dvd/movie/movie_main.do?type=list&num=1&&production=new'">최신 영화</li>
      		<li onclick="location.href='/dvd/movie/movie_main.do?type=list&num=1&&grade=1'">인기 영화</li>
      		<li>
      		<form action="/dvd/movie/movie_main.do">
      			<div class="input-group search_bar">
		             <input type="text" class="form-control" name="keyword" placeholder="Search..">
		             <input type="hidden" name="type" value="list" />
		             <input type="hidden" name="num" value="1" />
		             <span class="input-group-btn">
                <button class="btn btn-default"><p class="glyphicon glyphicon-search"></p></button>
		             </span>
		        </div>
      		</li>
      	  </ul>
      </form>
      <div class="top_one"></div>
      <div class="top_users"/>
       <c:choose>
             <c:when test="${id eq null}">
                <div class="login_toggle">로그인</div><span> | </span>
                <a href="/dvd/users/insert_form.do?type=views">회원가입</a><span> | </span>
                <a href="">장바구니</a>
             </c:when>
             <c:otherwise>
                <div class="sessionId"><a href="/dvd/users/info.do">내 정보</a></div><span> | </span>
                <a href="/dvd/basket/list.do?id=${id }">장바구니</a><span> | </span>
                <a href="/dvd/users/logout.do">로그아웃</a>
             </c:otherwise>
       </c:choose>
         <div class="loginBar">
             <div class="gBtn"><span class="glyphicon glyphicon-remove "></span></div>
            <h3 style="text-align: center"><strong>Log in</strong></h3>
            <br/>
            <div class="top_area"></div>
            <br/>
            <form id="login" >
               <div class="form-group">
                  <label for="login_id" >아이디</label>
                  <input type="text" class="form-control"  name="id"  id="login_id" />
               </div>
               <div class="form-group">
                  <label for="login_pwd" >비밀번호</label>
                  <input type="password" class="form-control" name="pwd"  id="login_pwd" />
               </div>
               <button class="btn btn-info btn1"  type="button" id="loginBtn" >로그인</button>
            </form>
            <br/>
            <div class="top_area"></div>
            <h4 style="text-align: center">SNS Log in</h4>
            <div class="buttonGroup">
               <form action="">
                  <button class="btn btn-social btn-facebook socialBtn"><span class="fa fa-facebook"></span>Sign in with <strong style="font-size:16px;">Facebook</strong></button>
                  <button class="btn btn-social btn-twitter socialBtn"><span class="fa fa-twitter"></span>Sign in with <strong style="font-size:16px;">Twitter</strong></button>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(".login_toggle").click(function(){
    $(".loginBar").stop().slideToggle(300);
   });
   
   $(".gBtn").click(function(){
    $(".loginBar").stop().slideToggle(300);  
   });
   
   // 로그인
   $("#loginBtn").click(function(){
      
      var formData = $("#login").serialize();
   
      $.ajax({
         url:"/dvd/users/login.do",
         type:"post",
         data:formData,
         success:function(data){
            if(data){
               location.reload();
            }else{
            }
         }   
      });
   });
   
   $(".sideBtn").click(function(){
	 	$(window).scrollTop(0);
   });
</script>