<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@page import="com.member.dto.MemberDto"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link href="resource/css/custom.css" rel="stylesheet">
    <link rel="stylesheet" href="resource/css/header_main.css">
    <link rel="stylesheet" href="resource/css/footer_main.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.13.0/css/all.css">
    <link rel="stylesheet" type="text/css" href="resource/css/style.css" >
    <link rel="stylesheet" type="text/css" href="resource/css/style_main.css" >
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&amp;display=swap" rel="stylesheet">
  <script type="text/javascript">
  $(function(){
	  var days_js = $('#days').children('li');
	  days_js.click(function(){
		  if($(this).is('.js_chkbtn')){
			  $(this).removeClass('js_chkbtn');
		  }else{
			  $(this).addClass('js_chkbtn');
		  }
	  });
	  
	  var times_js = $('#times').children('li');
	  times_js.click(function(){
		 if($(this).is('.js_chkbtn')){
			 $(this).removeClass('js_chkbtn');
		 }else{
			 $(this).addClass('js_chkbtn');
		 }
	  });
	  
	  var tTypes_js = $('#tTypes').children('li');
	  tTypes_js.click(function(){
		 if($(this).is('.js_chkbtn')){
			 $(this).removeClass('js_chkbtn');
		 }else{
			 $(this).addClass('js_chkbtn');
		 }
	  });
	  
	  var js_chkbtn_btn = $('#js_chkbtn_btn').click(function(){		  
		  var days_value_arr = 0;
		  var times_value_arr = 0;
		  var tTypes_value_arr = 0;
		  var loc_value = $('#regionSubLayer'+$('#region').val()).val();
		  loc_value = (loc_value!=undefined?loc_value:'0');
		 
		  
		  for(var cnt=0,cnt2=1;cnt<days_js.length;cnt++){
			  if($(days_js[cnt]).is('.js_chkbtn')){
				  days_value_arr+=cnt2;}cnt2*=2;
		  }
		  for(var cnt=0,cnt2=1;cnt<times_js.length;cnt++){
			  if($(times_js[cnt]).is('.js_chkbtn')){
				  times_value_arr+=cnt2;}cnt2*=2;
		  }
		  for(var cnt=0,cnt2=1;cnt<tTypes_js.length;cnt++){
			  if($(tTypes_js[cnt]).is('.js_chkbtn')){
				  tTypes_value_arr+=cnt2;}cnt2*=2;
		  }
		  var url = "main.do?command=customselect"
			  url+="&days="+days_value_arr;;
			  url+="&times="+times_value_arr;
			  url+="&tTypes="+tTypes_value_arr;
			  url+="&loc="+loc_value;
			 // alert(url);
			  location.href=url;
	  });
	  
	  var url= location.href; //현재주소 가지고옴
	  var error = url.indexOf('?'); //-1:parameter가 없다는 의미
	  if(error != -1){
		  var param = (url.slice(url.indexOf('?')+1,url.length)).split('&');
		  var key = param[1].split('=')[1];
			for(var i=0;i<8;i++){
				$('#categorylist'+i).removeClass('selectyi');
			}
			$('#categorylist'+key).addClass('selectyi');
	  }
	  
	$('#region').change(function(){
		var num = this.value;
		for(var i=0;i<8;i++){
			$('#regionSubLayer'+i).addClass('hiide');// 전체숨김
		}
		$('#regionSubLayer'+num).removeClass('hiide'); //숨김용 클래스빼주는거(.hdiien{display:none;})
	});
	
	  $('#categorylist1').click(function(){
		  location.href="main.do?command=category&key=1";
	  });
	  $('#categorylist2').click(function(){
		  location.href="main.do?command=category&key=2";
	  });
	  $('#categorylist3').click(function(){
		  location.href="main.do?command=category&key=3";
	  });
	  $('#categorylist4').click(function(){
		  location.href="main.do?command=category&key=4";
	  }); 
	  $('#categorylist5').click(function(){
		  location.href="main.do?command=category&key=5";
	  });  
	  $('#categorylist6').click(function(){
		  location.href="main.do?command=category&key=6";
	  });
	  $('#categorylist7').click(function(){
		  location.href="main.do?command=category&key=7";
	  });
		  
  });
  
  </script>
  <style type="text/css"> 	
	.star {
	   display: inline-block;
	   width: 20px;
	   height: 60px;
	   cursor: pointer;
		}
	
	.star_left {
	   background: url(http://gahyun.wooga.kr/main/img/testImg/star.png)
	      no-repeat 0 0;
	   background-size: 40px;
	   margin-right: -3px;	   
		}
	
	.star_right {
	   background: url(http://gahyun.wooga.kr/main/img/testImg/star.png)
	      no-repeat -20px 0;
	   background-size: 40px;
	   margin-left: -3px;
		}
	.star.on {
	    background-image: url(http://gahyun.wooga.kr/main/img/testImg/star_on.png);
		}
  </style>
</head>
<% 	MemberDto member = (MemberDto) session.getAttribute("member"); %>
<body>
  <body id="body">
    <div style="position: fixed; bottom: 190px; right: 24px; z-index: 1;">
        <a href="#body" class="top"><img src="" /></a>
     </div>
     <div style="position: fixed; bottom: 105px; right: 24px; z-index: 1;">
        <a href="#fh5co-footer"><img src="" /></a>
     </div>
  

    <nav class="navbar navbar-expand-lg" style="background-color: white" id="main-nav" style="padding-top:250px;">
        <div class="container">
            <div class= "navbar-left">
                <h2 class="logotitlee" style="text-align:center;font-family: 'Black Han Sans', sans-serif; ">
                <a class="navbar-brand " href="main.do">HARU
                </a></h2>
            </div>
            <div class="navbar-right">
                <ul class="nav navbar-nav">
                    <li class="nav-item topLi" style="margin: 20PX;"><a href="#" class="menulink" style="color: black;"></a>
                       
                    </li>
                    <li class="nav-item topLi" style="margin: 20PX;"><a href="board.jsp" class="menulink" style="color: black; background-color:white;">FAQ</a>
                       
                    </li>
                    <li class="nav-item topLi" style="margin: 20PX;"><a class= "menulink" href="profile.do?command=mypage" style="color: black; background-color:white;">마이페이지</a>
                        <ul class="submenu" id="topul"> 
                            
                        </ul>
                    </li>
                    <li class="nav-item topLi" style="margin: 13PX;">
                   <a class= "menulink" href="<%=(member==null)?"sign.do":"sign.do?command=signout" %>"style="background-color:white;" >
                    	<button type="button" class="btn btn-outline-secondary">&nbsp; &nbsp;<%=(member==null)?"로그인":"로그아웃" %>&nbsp;&nbsp;&nbsp;</button>
                    </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <nav
   class="navbar navbar-expand-lg navbar-dark bg-dark"
   style="display: none; height: 50px; padding: 20px; border: 1px solid lightgray">
   <!-- id="ftco-navbar" -->
  </nav>
  <div style="border-top:1px solid #c9c9c9;"></div>
  <div id="cate_conteiner" style="border-bottom: 1px solid #c9c9c9; padding-left:360px;" class="cate_wrap">
    <div class="fixed_cate" id="menu_back_fixed" style="display:none;"></div>
      <!-- MENU -->
      <div class="dropdown2">
        <button class="dropbtn2" value="popular" id="categorylist1">인기수업</button>
        <div class="dropdown2-content">
          <a href="#">투잡</a>
          <a href="#">퍼스널컬러</a>
          <a href="#">엑셀</a>
          <a href="#">댄스</a>
          <a href="#">메이크업</a>
          <a href="#">포토샵</a>
          <a href="#">방송댄스</a>
          <a href="#">보컬</a>
          <a href="#">PT</a>
          <a href="#">WEB개발</a>
          <a href="#">영어회화</a>
          <a href="#">핸드메이드</a>
          <a href="#">마케팅</a>
        </div>
      </div>

        <div class="dropdown2">
          <button class="dropbtn2" id="categorylist2" >디자인</button>
          <div class="dropdown2-content">
            <a href="#">포토샵</a>
            <a href="#">일러스트레이더</a>
            <a href="#">제품디자인</a>
            <a href="#">건축</a>
            <a href="#">UX/UI디자인</a>
            <a href="#">편집디자인</a>
            <a href="#">라이트룸</a>
            <a href="#">애니메이션</a>
          </div>
        </div>

        <div class="dropdown2">
          <button class="dropbtn2"  id="categorylist3">음악</button>
          <div class="dropdown2-content">
            <a href="#">보컬</a>
            <a href="#">피아노</a>
            <a href="#">미디작곡</a>
            <a href="#">기타연주</a>
            <a href="#">드럼</a>
            <a href="#">국악</a>
            <a href="#">랩</a>
            <a href="#">디제잉</a>
            <a href="#">바이올린</a>
            <a href="#">오케스트라</a>
            <a href="#">성악</a>
            <a href="#">우쿨렐레</a>
            <a href="#">첼로</a>
          </div>
        </div>

        <div class="dropdown2">
          <button class="dropbtn2"  id="categorylist4">영상</button>
          <div class="dropdown2-content">
            <a href="#">프리미어</a>
            <a href="#">영상기획/촬영</a>
            <a href="#">영상(기타)</a>
            <a href="#">에프터이펙트</a>
            <a href="#">파이널컷</a>
            <a href="#">여행영상</a>
            <a href="#">시포디</a>
            <a href="#">VJ</a>
          </div>
        </div>

          <div class="dropdown2">
            <button class="dropbtn2"  id="categorylist5">외국어</button>
            <div class="dropdown2-content">
              <a href="#">영상회화</a>
              <a href="#">중국어</a>
              <a href="#">일본어</a>
              <a href="#">외국어(기타)</a>
              <a href="#">토익/토플</a>
              <a href="#">스페인어</a>
              <a href="#">프랑스어</a>
              <a href="#">비즈니스</a>
              <a href="#">여행 외국어</a>
              <a href="#">독일어</a>
              <a href="#">Writing</a>
              <a href="#">오픽/토스</a>
              <a href="#">언어교환</a>
            </div>
          </div>

            <div class="dropdown2">
              <button class="dropbtn2"  id="categorylist6">라이프스타일</button>
              <div class="dropdown2-content">
                    <a href="?cateSub=81">핸드메이드</a>
                    <a href="?cateSub=79">사진</a>
                    <a href="?cateSub=125">플라워</a>
                    <a href="?cateSub=84">요리/베이킹</a>
                    <a href="?cateSub=123">연기</a>
                    <a href="?cateSub=83">커피/차</a>
                    <a href="?cateSub=82">여행/투어</a>
                    <a href="?cateSub=127">사주/타로</a>
                    <a href="?cateSub=88">반려동물</a>
                    <a href="?cateSub=86">술</a>
                    <a href="?cateSub=126">가죽공예</a>
                    <a href="?cateSub=227">도예/물레</a>
                    <a href="?cateSub=124">마술</a>
                    <a href="?cateSub=212">바둑</a>
                    <a href="?cateSub=246">집꾸미기</a>  
              </div>
            </div>

      <div class="dropdown2">
          <button class="dropbtn2"  id="categorylist7">내 근처</button>
          <div class="dropdown2-content">
            <a href="#"></a>
          </div>
        </div>
    </div>
    <div style="background-color: #f1f1f1;">
      <div class="filter"style= "max-width:1000; margin-left:350px; padding-bottom:10px;  ">
        <table style="height: 190px;">
          <col width="100px">
          <tr>
             <th>지역</th>
            <td>
              <!--<select onchange="regionSelect(this.value)">  -->
              <select id="region">
                <option value="">지역</option>
                <option value="0">서울</option>
                <option value="1">경기</option>
                <option value="2">인천</option>
                <option value="3">부산</option>
                <option value="4">경상,대구,울산</option>
                <option value="5">대전,충청</option>
                <option value="6">광주,전라,제주</option> 
                <option value="7">온라인</option>
            </select>
            <select class="hiide"  id="regionSubLayer0" style="margin-left:10px;"  onchange="regionSubSelect(this.value)">
              <option value="100">서울 전체</option>
                  <option value="1">강남</option>
                  <option value="2">신촌홍대</option>
                  <option value="3">건대</option>
                  <option value="4">사당</option>
                  <option value="5">잠실</option>
                  <option value="6">종로</option>
                  <option value="7">신림</option>
                  <option value="8">마포</option>
                  <option value="9">영등포</option>
                  <option value="10">성북</option>
                  <option value="11">목동</option>
                  <option value="12">구로</option>
                  <option value="13">왕십리</option>
                  <option value="14">혜화</option>
                  <option value="15">노원</option>
                  <option value="16">용산</option>
                  <option value="17">수유</option>
                  <option value="18">신사</option>
                  <option value="19">충무로</option>
                  <option value="20">미아</option>
                  <option value="21">동작</option>
                  <option value="22">은평</option>
                  <option value="23">강서</option>
                  <option value="24">마곡더랜드타워</option>
                  <option value="25">청량리</option>
                  <option value="26">회기</option>
             </select>
             <select class="hiide"  id="regionSubLayer1" style="margin-left:10px;"  onchange="regionSubSelect(this.value)">
				<option value="200">경기 전체</option>
					<option value="27">분당</option>
					<option value="28">수원</option>
					<option value="29">일산</option>
					<option value="30">서현</option>
					<option value="31">의정부</option>
					<option value="32">광명</option>
			</select>
             <select class="hiide" id="regionSubLayer2" style="margin-left:10px;"  onchange="regionSubSelect(this.value)">
              <option value="300">인천 전체</option>
                  <option value="33">부평</option>
                  <option value="34">구월동</option>
                  <option value="35">송도</option>
                  <option value="36">계양</option>
            </select>
            <select  class="hiide" id="regionSubLayer3" style="margin-left:10px;"  onchange="regionSubSelect(this.value)">
			<option value="400">부산 전체</option>
				<option value="37">부산서면</option>
				<option value="38">부산부경대</option>
				<option value="39">부산해운대</option>
				<option value="40">부산동래</option>
				<option value="41">부산남포</option>
				<option value="42">수영구</option>
				<option value="43">부산대</option>
				<option value="44">광안리</option>										
			</select>
            <select class="hiide"  id="regionSubLayer4" style="margin-left:10px;"  onchange="regionSubSelect(this.value)">
              <option value="500">경상,대구,울산 전체</option>
                  <option value="45">대구중앙</option>
                  <option value="46">대구동성로</option>
                  <option value="47">대구수성구</option>
                  <option value="48">대구경북대</option>
                  <option value="49">창원</option>
                  <option value="50">경산영남대</option>
                  <option value="51">구미</option>
                  <option value="52">울산대</option>
                  <option value="53">성서계대</option>
             </select>
             <select class="hiide"  id="regionSubLayer5" style="margin-left:10px;"  onchange="regionSubSelect(this.value)">
              <option value="600">대전,충청 전체</option>
                  <option value="54">대전역</option>
                  <option value="55">천안</option>
                  <option value="56">둔산</option>
                  <option value="57">청주</option>
                  <option value="58">유성구</option>           
              </select>
              <select class="hiide"  id="regionSubLayer6" style="margin-left:10px;"  onchange="regionSubSelect(this.value)">
                <option value="700">광주,전라,제주 전체</option>
                    <option value="59">전남대</option>
                    <option value="60">전주</option>
                    <option value="61">제주</option>
                    <option value="62">동명</option>
                    <option value="63">첨단지구</option>
                    <option value="64">상무지구</option>          
             </select>
             <select class="hiide"  id="regionSubLayer7" style="margin-left:10px;"  onchange="regionSubSelect(this.value)">
              <option value="800">온라인 전체</option>
                  <option value="65">온라인</option>                 
            </select>
             </td>
          </tr>
          <tr>
           <th>요일/시간</th>
           <td>
            <div class="days">
              <ul id="days">
                <li day="1" class="">월</li>
                <li day="2" class="">화</li>
                <li day="3" class="">수</li>
                <li day="4" class="">목</li>
                <li day="5" class="">금</li>
                <li day="6" class="">토</li>
                <li day="0" class="">일</li>
              </ul>
              <ul id="times">
                <li time="1" style="margin-left:15px;" class="">오전 (06:00~12:00)</li>
                <li time="2" class="">오후 (12:00~24:00)</li>
              </ul>
            </div>
           </td>
           </tr>
           <tr>
             <th>수업형태</th>
             <td>
              <div class="days">
                <ul id="tTypes">
                  <li ttype="0" class="">1:1수업</li>
                  <li ttype="1" class="">그룹</li>
                  <li ttype="3" class="">원데이클래스</li>
                </ul>
              </div>
             </td>
           </tr>
         </table> 
         <div class="button_class" style="padding:0px 690px;">
          <button type="button" class="btn btn-dark" style="background-color: rgb(105, 105, 105); padding:15px; color:white" id="js_chkbtn_btn" onclick="location.href='main.do?command=customselect'">&nbsp;내게 맞는 수업보기&nbsp;</button>
         </div>
       </div>
    </div>
     <jsp:useBean id="dto" class="com.classinfo.dto.ClassInfoDto" scope="request"></jsp:useBean>
     <div style="border-bottom: 1px solid #c9c9c9;" ></div>
  <div style="width:100%;height: 60px;"></div>
  <div class="content_wrap">
    <div class="container">

      <div class="row">
                <div class="row">
                <c:choose>
        			<c:when test="${empty list }">
        				<h4 style="text-align:center;'">등록된 게시글이 없습니다.</h4>
        			</c:when>
        			<c:otherwise>
        			<c:forEach var="dto" items="${list }">
                  <div class="col-lg-4 col-md-4 mb-4">
                    <div class="card h-100">
                      <a href="./classinfo.do?command=detailclass&classpk=${dto.classpk}"><img class="card-img-top col-lg-12 col-md-12 mb-12 " src="${dto.pubImg}" alt="" style="padding: 0px; height : 200px;"></a>
                      <div class="card-body">
                        <h4 class="card-title">
                          <a href="./classinfo.do?command=detailclass&classpk=${dto.classpk}">${dto.title }</a>
                        </h4>
                          <span>￦</span><fmt:formatNumber value="${dto.price }" pattern="#,###" />
                      </div>
                      <div class="card-footer">
                      
                      <fmt:parseNumber var="mulrank" integerOnly="true" value="${dto.rankcnt!=0?(dto.rank/dto.rankcnt):0}" />
                      <small  style="font-size:12pt;"class="text-muted">${mulrank/2}
                      
                     <div class="star-box">
                     <c:forEach var="i" begin="${1 }" end="${10 }">
                   	    <c:if test="${(i%2) ne 0}"><span class="star star_left <c:if test="${i<=mulrank}">on</c:if>"></span></c:if>
                     	<c:if test="${(i%2) eq 0}"><span class="star star_right <c:if test="${i<=mulrank}">on</c:if>"></span></c:if>
                     </c:forEach>
			         </div>
                      </small>                     
                      </div>
                    </div>
                  </div>
                  </c:forEach>
     			 </c:otherwise>
      		  </c:choose>
              </div>
            </div>    
      </div>     
    </div>

<div style="width: 100%; height:100px;"></div>   

   <div style="width: 100%; height:70px;"></div>   
       

 <footer id="fh5co-footer" class="fh5co-bg" role="contentinfo">
    <div class="overlay"></div>
		<div class="container">
			<div class="row row-pb-md">
				<div class="col-md-4 fh5co-widget">
					<div class="intro">
					<h3>HARU</h3>
					<ul style="padding: 10px 0px;">
						<li style="color:white;" ><i class="fas fa-map-marked-alt" style="color:white;padding-right:10px; "></i>서울 강남구 테헤란로14길 6 남도빌딩</li>
						<li style="color:white;"><i class="fas fa-home" style="color:white; padding:15px 10px 15px 0px;"></i>실제로 운영되지 않는 사이트 입니다.</li>
						<li style="color:white;"><i class="far fa-comment-alt" style="color:white; padding:15px 10px 15px 0px;"></i>때때로 손에서 일을 놓고 휴식을 취해야 한다. 잠시 일에서 벗어나 거리를 두고 보면 자기 삶의 조화로운 균형이 어떻게 깨져 있는지 분명히 보인다.</li>
					</ul>
					</div>
				</div>
				<div class="col-md-4">
					<div class="devel" style="text-align:center;">
                        <h3>사이트 개발자</h3>
						<p style="color:white;">정승주 박초롱 이병호 주수현 김건영 </p>
							<div style="height:60px"></div>
						<i class="fas fa-laptop fa-2x" style="color:white;"></i>
						<i class="fas fa-mouse fa-2x" style="color:white;"></i>
					</div>
                </div>
                <div>
    					<div class="col-md-4" style="text-align:center;">
                        <div>
                            <h3>HARU가 참조한 사이트</h3>
                        </div>
						<ul class="fh5co-footer-links">
							<button style="background-color: #9BDAF2;cursor: pointer; width:250px; height:50px; margin-bottom:20px;"><a href="https://taling.me/" style="color: white; text-decoration:none;">탈잉</a></button>
							<button style="background-color: #9BDAF2;color: white;cursor: pointer; width:250px; height:50px;"><a href="https://booking.naver.com/" style="color: white; text-decoration:none;">네이버 예약</a></button>
					
						</ul>
					</div>

					
				</div>
			</div>

			<div class="row copyright">
				<div class="col-md-12 text-center">
					<p>
						<h5 class="block" style="color:#f1f1f1;">&copy; 2020 | All Rights Reserved.</h5> 
						<h5 class="block" style="color:#f1f1f1;">HARU.com</h5>
					</p>
				</div>
			</div>

		</div>
</footer>
</body>
</body>
</html> 