<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>요청게시판-b_view.jps</title>
     <link rel="stylesheet" href="css/css.css">
     <link href="https://fonts.cdnfonts.com/css/nasa" rel="stylesheet">
    <style>
		footer {margin-top: 20px;padding: 65px 0;border-top: 1px solid #ddd;
		text-align: center; display: flex;  height: 100%; width:100%;
		font-size: 1.4rem; background-color:#003F88; color: #FFD500;}
		header {text-align: center; background-color:#003F88; height: 200px;}
		header .logo {padding: 20px 0; color: #FFD500; font-size: 100px; font-family: 'Nasa', sans-serif; position: relative; top:30px;}
		header .logo img {height: 40px;}
		nav{padding: 25px; position: absolute;top: 0; right: 0;}
		nav li {display: inline-block; margin: 0 20px;}
		nav a {font-size: 1.4rem;color: #FFD500; font-size: 20px;}
		#logo_name{font-size: 1.4rem; color: #FFD500; font-size: 20px;}
		nav a:hover {text-decoration: underline;}
		.border{color: #FFD500; font-weight: 700; font-size: 20px; margin-top: 120px;}
		#team{position: relative; left: 500px;}
		#info_m{width: 350px;}
		/*댓글달기*/			
		.replyWrite{width:100%; margin:20px 0 20px 0; overflow:hidden;}
		.replyWrite ul li{float:left;}
		.replyWrite ul li.in{position:relative; width:88%; padding:25px 0 0 0;}
		.replyWrite ul li.in p.txt{position:absolute; left:0; top:4px; font-size:1.4rem; font-weight:600; color: black;}
		.replyWrite ul li.in p.password{position:absolute; right:-4px; top:0; line-height:20px; font-size: 1.4rem; font-weight:600;} 
		.replyWrite ul li.btn{margin:1px 0 0 10px}
		.replyWrite p.ntic{clear:both; padding:5px 0; font-size: 1.4rem; text-align: center; color: #808080;}	  
		.replyType{width:100%; height:48px; border:2px #003F88 solid; font-size: 1.4rem; float:left; margin-right:10px;}
		.replyBtn{display:block; width:108px; height:74px; line-height:75px; color:#FFD500; font-size:20px; font-weight:600; background:#003F88; text-align:center; border:1px solid black;}
		.replyBtn:hover{color:#fff; text-decoration:none;}
		.replynum{width:120px; height:20px; line-height:20px; border:1px #003F88 solid; padding:0 0 0 5px;}
		/*댓글화면*/
		.replyBox{width:100%; overflow:hidden;}
		.replyBox ul{position:relative; border-bottom:1px #003F88 solid; margin:15px 0 0 0; padding:0 20px 15px 20px;}
		.replyBox ul li.name{font-size:1.4rem; font-weight:600; color:black; padding:0 10px 10px 0; float:left}
		.replyBox ul li.date{font-size:1.4rem; color:black; font-weight:normal; padding: 0 0 10px 0;}
		.replyBox ul li.txt{width:100%; color:black; line-height:1.5; font-size:1.4rem; word-break:keep-all;}
		.replyBox ul li.btn{text-align:right; height:20px; padding:3px 0 0 0;}
		.replyBox ul li.btn .re_edit,.replyBox ul li.btn .e_save,.replyBox ul li.btn .e_cancel{display:inline-block; width:70px; height:25px; line-height:24px; color:#FFD500; font-weight:600; text-align:center; border:1px solid black; background:#003F88;}
		.replyBox ul li.btn .re_edit:hover{color:#fff; text-decoration:none;}
		.replyBox ul li.btn .re_del{display:inline-block; width:70px; height:25px; line-height:24px; color:#FFD500; font-weight:600; text-align:center; border:1px solid black; background:#003F88;}
		.replyBox ul li.btn .re_del:hover{color:#fff; text-decoration:none;}
		.edit{width: 100%;}
	</style>
	
	<script>
		$(function(){
			$("#deleteBtn").click(function(){
				if(confirm("게시글을 삭제하시겠습니까?")){
					location.href="b_delete.do?page=${page}&bsno=${sbdto.bsno}";
				}
			})
		})
	</script>
	
</head>
<!-- 상단 header -->
<header>
   	 <h1 class="logo"><a href="">JJAGEUL</a></h1>
    	<nav>
	    	<ul>
		        <li id="logo_name">${session_name}님</li>
				<li class="border">|</li>
				<li><a href="a_myPage.do">회원정보</a></li>
				<li class="border">|</li>
				<li><a href="a_logout.do">로그아웃</a></li>
				<li class="border">|</li>
				<li><a href="a_main.do">메인페이지</a></li>
	    	</ul>
		</nav>
</header>

<body>
    <div class="board_wrap">
        <div class="board_title">
            <strong>요청게시글 보기</strong>
            <p>해당 요청게시글에 내용있습니다.</p>
        </div>
        <div class="board_view_wrap">
        
<!-- 글보기 -->
            <div class="board_view">
                <div class="title">
                    ${sbdto.btitle}
                </div>
                <div class="info">
                    <dl>
                        <dt>번호</dt>
                        <dd>${sbdto.bsno}</dd>
                    </dl>
                    <dl>
                        <dt>글쓴이</dt>
                        <dd>${sbdto.id}</dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd><fmt:formatDate value="${sbdto.bdate}" pattern="yyyy-MM-dd"/></dd>
                    </dl>
                    <dl>
                        <dt>첨부파일</dt>
                        <dd><a href="upload/${sbdto.bfile}" target="_blank">${sbdto.bfile}</a></dd>
                    </dl>
                </div>
                <div class="cont">
                    ${sbdto.bcontent}
                </div>
            </div>
            
<!-- 댓글 update -->
			<script>
				$(function(){
					$(".replyBtn").click(function(){
						//alert("테스트")
						alert("비밀번호  : "+$(".replynum").val());
						alert("내용  : "+$(".replyType").val());
						//입력 내용 가져오기
						var bsno = "${sbdto.bsno}";
						var spw = $(".replynum").val();
						var scontent = $(".replyType").val();
					
						$.ajax({
							url:"SInsert",
							type:"post",
							data:{"bsno":bsno, "spw":spw, "scontent":scontent},
							dataType:"json",
							success:function(data){
								//alert("성공");
								var htmlData='';
								htmlData += '<ul id="'+data.sno+'">';
								htmlData += '<li class="name">'+data.id+' <span> ['+data.sdate+']</span></li>';
								htmlData += '<li class="txt">'+data.scontent+'</li>';
								htmlData += '<li class="btn">';
								htmlData += '<a class="rebtn">수정</a>&nbsp';
								htmlData += '<a class="rebtn">삭제</a>';
								htmlData += '</li>';
								htmlData += '</ul>';
							$(".replyBox").prepend(htmlData); 
								alert("댓글을 등록합니다.");
								$(".replynum").val("");
								$(".replyType").val("");
							},
							error:function(){
								alert("실패했습니다.")
							}
						})
					})//댓글 등록
					
					//댓글삭제
					$(".re_del").click(function(){
						if(confirm("댓글을 삭제하시겠습니까?")){
							//console.log($(this)); // 클래스가 여러개가 넘어옴. 현재 자기 자신을 가리킴
							//console.log("dataSno : "+$(this).attr("dataSno"));
							alert("삭제번호 : "+$(this).attr("dataDsno"));
							$.ajax({
								url:"ReDelete",
								type:"post",
								data:{"sno":$(this).attr("dataDsno")},
								dataType:"json",
								success:function(data){
									if(data==1){
										$(this).remove();
										alert("성공하셨습니다.");
									}
								},
								error:function(){
									alert("실패하셨습니다.");
								}
							})
						}
					})//댓글 삭제
					 
				var sno=0; //전역변수
				var comm='';   //
				var commName='';   //
				var or_content='';   //
					
				//댓글 수정화면	
				$(".re_edit").click(function(){
					sno = $(this).attr("dataSno");
					//var comm = $(this).closest("ul");
					alert("댓글번호 : "+sno+"를 수정합니다.");
					comm = $("#"+sno);
					commName = comm.find(".name").text();
					
					var currentDate = new Date();
				    var year = currentDate.getFullYear();
				    var month = ('0' + (currentDate.getMonth() + 1)).slice(-2);
				    var day = ('0' + currentDate.getDate()).slice(-2);
				    var hours = ('0' + currentDate.getHours()).slice(-2);
				    var minutes = ('0' + currentDate.getMinutes()).slice(-2);
				    var seconds = ('0' + currentDate.getSeconds()).slice(-2);
				    
				    var re_date = year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;
					
					//re_date = comm.find(".date").text();
					or_content = comm.find(".txt").text();
					//var commDate = comm.find(".txt");
					//var or_content = commTxt.text(); 
					//alert(comm.attr("id"));
					
					var htmlData = "";
					htmlData +='<li class="name">'+commName+'</li>';
					htmlData +='<li class="date">'+re_date+'</li>';
					htmlData +='<li class="txt"><textarea type="text" class="edit" value="'+or_content+'"></textarea></li>';
					htmlData +='<li class="btn">';
					htmlData +='<a class="e_save" dataSno="${s_comment.sno}">저장</a>&nbsp';
					htmlData +='<a class="e_cancel" dataDsno="${s_comment.sno}">취소</a>';
					htmlData +='</li>';
					comm.html(htmlData);
					
					//수정완료 버튼 추가
					//comm.find(".btn").append($('<a class="e_save" dataSno="'+sno+'">저장</a>'));
				});
				
			    // 댓글 저장
				$(document).on("click",'.e_save',function(){
					alert("댓글을 저장합니다.");
					var comm = $("#"+sno);
					var e_content = $(".edit").val();
					//alert("댓글번호 : "+sno);
					//alert("수정글자 : "+e_content);
					var currentDate = new Date();
				    var year = currentDate.getFullYear();
				    var month = ('0' + (currentDate.getMonth() + 1)).slice(-2);
				    var day = ('0' + currentDate.getDate()).slice(-2);
				    var hours = ('0' + currentDate.getHours()).slice(-2);
				    var minutes = ('0' + currentDate.getMinutes()).slice(-2);
				    var seconds = ('0' + currentDate.getSeconds()).slice(-2);
				    
				    var re_date = year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;
					
					var htmlData = "";
					htmlData += '<li class="name">'+commName+'</li>';
					htmlData += '<li class="date">'+re_date+'</li>';
					htmlData += '<li class="txt">'+e_content+'</li>';
					htmlData += '<li class="btn">';
					htmlData += '<a class="re_edit" dataSno="${s_comment.sno}">수정</a>&nbsp';
					htmlData += '<a class="re_del" dataDsno="${s_comment.sno}">삭제</a>';
					htmlData += '</li>';
					comm.html(htmlData);
					
					
					
					$.ajax({
						url:"ReEdit",
						type:"post",
						data:{"sno":sno, "e_content":e_content},
						dataType:"json",
						success:function(data){
							if(data.result==1){
								comm.find(".txt").text(e_content);
								alert("댓글이 수정되었습니다.");
							}
							//수정완료 버튼 제거
							//$(this).remove();
						},
						error:function(){
							alert("댓글 수정이 실패했습니다.")
						}
					});
				});
				
			</script>
			
            <div class="replyWrite">
				<ul>
					<li class="in">
						<p class="txt">총 <span class="orange">${ccount}</span> 개의 댓글이 있습니다.</p>
						<p class="password">비밀번호&nbsp;&nbsp;<input type="password" class="replynum" /></p>
						<textarea class="replyType"></textarea>
					</li>
					<li class="btn"><a style="cursor: pointer;" class="replyBtn">등록</a></li>
				</ul>
				<p class="ntic">*비밀글은 비밀번호를 입력해주세요.*</p>
			</div>

			<div class="replyBox">
				<c:forEach var="s_comment" items="${slist}">
					<ul id="${s_comment.sno}">
						<li class="name">${s_comment.id}</li>
						<li class="date"><span>[${s_comment.sdate}]</span></li>
						<li class="txt">${s_comment.scontent}</li>
						<li class="btn">
							<a class="re_edit" dataSno="${s_comment.sno}">수정</a>
							<a class="re_del" dataDsno="${s_comment.sno}">삭제</a>
						</li>
					</ul>
				</c:forEach>
			</div>

<!-- 하단 button -->
            <div class="bt_wrap">
                <a href="b_reply.do?page=${page}&bsno=${sbdto.bsno}" class="on">답글달기</a>
                <a href="b_edit.do?page=${page}&bsno=${sbdto.bsno}" class="on">작성글 수정</a>
                <a id="deleteBtn" class="on">작성글 삭제</a>
                <a href="b_list.do" class="on">글목록</a>
            </div>
        </div>
    </div>

<!-- 하단 footer -->
    <footer>
		<div id="team">
			<h3>한국 직업전문학교 copyright © ★항공 JAVA 풀스택 개발자 양성과정 5기★ - 2팀( 최창윤 | 조민진 | 정보람 | 김승우 )</h3>
		</div>
	</footer>
</body>
</html>