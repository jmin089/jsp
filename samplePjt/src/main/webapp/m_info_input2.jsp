<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<c:if test="${session_id ==null}">
			<script>
			alert("로그인을 하셔야 접근이 가능합니다.");
			location.href="login.do";
			</script>
		</c:if>
		<meta charset="UTF-8">
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<link rel="stylesheet" type="text/css" href="css/style_join02_info_input.css">
		<title>회원정보수정</title>
		<style>
			.txtOn{color: blue; font-weight: 900;}
			.txtOff{color: red; font-weight: 900;}
		</style>
		<script>
			$(function(){
				var idConfirm = 0;
				$("#insertBtn").click(function(){
					//alert($("#id").val())
					
					/* ? 비교하겠어요 .한개씩 뽑아와 *모든거를 [] 비교데이터 {3,}뒤에 숫자를 안넣으면 3자리 부터 무한대
					var pw = $("#pw1").val();
					var pwPtn = /^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&?]).{3,15}$/;	*/

					/* 전화번호
					var f_tell = $("#f_tell").val();
					var m_tell = $("#m_tell").val();
					var f_tell = /^[0-9]{2,3}$/;  //지역번호, 010
					var m_tell = /^[0-9]{3,4}$/;  //중간번호	*/
					
					/* [a-z]{1} 첫글자는 소문자 a~z  {3,15}:4~16자리까지 첫글자 1자리 포함   첫글자+{3,15} = 4~16
					var idPtn = /^[a-z]{1}[a-zA-Z0-9]{3,15}$/;	*/
					
					/* 이름 - 한글 1~3자리까지
					var name = $("#name").val();
					var namePtn = /^[가-힣]{1,3}$/;	*/
					
					//id - 영문 소대문자 숫자를 4~16자리까지
					var id = $("#id").val();
					var idPtn = /^[a-zA-Z0-9]{4,16}$/;
					//시작은 /^ , 끝은 $/ , [a~z] 소문자 a부터 z까지 , {2~5} 2자리부터 5자리까지
					//[a-z 0-9] - 띄어쓰기하면 띄어쓰기까지 적용됨.
					//[]안에 영문 숫자 특수문자	*/	
					
					if(!idPtn.test(id)){
						alert("영문 a~Z 숫자 0~9가 포함되어 총 4~16자리까지 입력가능합니다.");
						return false;
					}else{
						alert("정상입력되었습니다.");
					}
					agreeFrm.submit();  //전송
				})
				
				//우편번호 검색
				$("#postBtn").click(function(){
					alert("다음 우편번호 창으로 이동")
					new daum.Postcode({
				        oncomplete: function(data) {
				            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
				            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
				            $("#f_postal").val(data.zonecode)
				            $("#address1").val(data.address)
				        }
				    }).open();
				})
			})//function
		</script>
	</head>
	<body>
		<header>
			<div id="nav_up">
				<ul>
					<li><a href="#">회원가입</a></li>
					<li><a href="#">로그인</a></li>
					<li><a href="#">고객행복센터</a></li>
					<li><a href="#">배송지역검색</a></li>
					<li><a href="#">기프트카드 등록</a></li>
				</ul>
			</div>	
			<nav>
				<a href="#"></a>
				<ul>
					<li><a href="#">COOKIT소개</a></li>
					<li><a href="#">COOKIT메뉴</a></li>
					<li><a href="#">리뷰</a></li>
					<li><a href="#">이벤트</a></li>
					<li><a href="#">MY쿡킷</a></li>
				</ul>
				<ul>
					<li>
						<a href="#"><span>장바구니</span></a>
					</li>
					<li>
						<a href="#"><span>메뉴찾기</span></a>
					</li>
				</ul>
			</nav>
		</header>
		
		<section>
			<form name="agreeFrm" method="post" action="doM_info_input.do">
				<div id="subBanner"></div>
				<div id="locationN">
					<ul>
						<li>HOME</li>
						<li>회원수정</li>
					</ul>
				</div>
				
				<div id="sub_top_area">
					<h3>회원수정</h3>
				</div>
				
				<div id="join_step_div">
					<ul>
						<li>
							<span>STEP.1</span>
							<p>약관동의</p>
						</li>
						<li>
							<span>STEP.2</span>
							<p>회원정보수정</p>
						</li>
						<li>
							<span>STEP.3</span>
							<p>회원수정완료</p>
						</li>
					</ul>
				</div>
				
				<h4>
					필수 정보 입력 
					<span>(* 항목은 필수 항목입니다.)</span>
				</h4>
				<fieldset class="fieldset_class">
					<dl id="join_name_dl">
						<dt>
							<div></div>
							<label for="name">이름</label>
						</dt>
						<dd>${mdto.name}</dd>
					</dl>
					<dl id="join_id_dl">
						<dt>
							<div></div>
							<label for="id">아이디</label>
						</dt>
						<dd>${mdto.id}</dd>
					</dl>
					<dl id="join_pw1_dl">
						<dt>
							<div></div>
							<label for="pw1">비밀번호</label>
						</dt>
						<dd>
							<input type="password" id="pw1" name="pw1" minlength="8" required />
							<span>영문, 숫자, 특수문자 중 2종류 조합 시 10자리 이상 입력</span>
							<span>영문, 숫자, 특수문자 모두 조합 시 8자리 이상 입력</span>
						</dd>
					</dl>
					<dl id="join_pw2_dl">
						<dt>
							<div></div>
							<label for="pw2">비밀번호 확인</label>
						</dt>
						<dd>
							<input type="password" id="pw2" name="pw2" minlength="8" required />
							<span id="txtPw">비밀번호를 다시 한번 입력해 주세요.</span>
						</dd>
					</dl>
					<dl id="join_mail_dl">
						<dt>
							<div></div>
							<label for="mail_id">이메일</label>
						</dt>
						<script>
							$(function(){
								$("#chgMail").change(function(){
									if($("#chgMail").val()==""){
										$("#mail_tail").val("");
										$("#mail_tail").prop("readonly",false);
									}else{
										$("#mail_tail").val($("#chgMail").val());
										$("#mail_tail").prop("readonly",true);
									}
								})
							});
						</script>
						<dd>
							<input type="text" id="mail_id" name="mail_id" required />
							<span>@</span>
							<input type="text" id="mail_tail" name="mail_tail" required />
							<select id="chgMail">
								<option value="" selected>직접입력</option>
								<option value="gmail.com">지메일</option>
								<option value="naver.com">네이버</option>
								<option value="daum.net">한메일</option>
								<option value="nate.com">네이트</option>
							</select>
						</dd>
					</dl>
					
					<dl id="join_address_dl">
						<dt> 
							<div></div>
							<label for="">주소</label>
						</dt>
						<dd>
							<input type="text" id="f_postal" name="f_postal" required readonly />
							<input type="button" id="postBtn" value="우편번호"/>
							<input type="text" id="address1" name="address1" required readonly />
							<input type="text" id="address2" name="address2" required />
						</dd>
						
					</dl>
					
					<dl id="join_tell_dl">
						<dt>
							<div></div>
							<label for="f_tell">휴대전화</label>
						</dt>
						<!-- 010-1111-1111  ->  010  /  1111  /  1111 -->
						<!-- split : 분리하는거 '-'이걸로 나누겠다 -->
						<c:set var="phones" value="${fn:split(mdto.phone,'-')}"/>
						<dd>
							<input type="text" id="f_tell" name="f_tell" maxlength="3" value="${phones[0]}" required />
							<span> - </span>
							<input type="text" id="m_tell" name="m_tell" maxlength="4" value="${phones[1]}" required />
							<span> - </span>
							<input type="text" id="l_tell" name="l_tell" maxlength="4" value="${phones[2]}" required />
						</dd>
					</dl>
					<dl id="join_gender_dl">
						<dt>
							<div></div>
							<label for="">성별</label>
						</dt>
						<dd>
							<div>
								<input type="radio" name="gender" id="male" value="Male" 
								 <c:if test="${fn:contains(mdto.gender,'Male')}">checked</c:if>
								 />
								<label for="male">남성</label>
								<input type="radio" name="gender" id="female" value="Female"
								 <c:if test="${fn:contains(mdto.gender,'Female')}">checked</c:if>
								 />
								<label for="female">여성</label>
							</div>
						</dd>
				</fieldset>
				<fieldset class="fieldset_class">
				</fieldset>
				<h4>
					선택 입력 정보 
				</h4>
				<fieldset class="fieldset_class">
					<dl id="join_interests_dl">
						<dt>
							<label for="">취미</label>
						</dt>
						<dd>
							<ul>
								<li>
									<input type="checkbox" name="hobby" id="game" value="game"
									<c:if test="${fn:contains(mdto.hobby,'game')}">checked</c:if>
									/>
									<label for="game">게임</label>
								</li>
								<li>
									<input type="checkbox" name="hobby" id="golf" value="golf"
									<c:if test="${fn:contains(mdto.hobby,'golf')}">checked</c:if>
									/>
									<label for="golf">골프</label>
								</li>
								<li>
									<input type="checkbox" name="hobby" id="run" value="run"
									<c:if test="${fn:contains(mdto.hobby,'run')}">checked</c:if>
									/>
									<label for="run">조깅</label>
								</li>
								<li>
									<input type="checkbox" name="hobby" id="cook" value="cook"
									<c:if test="${fn:contains(mdto.hobby,'cook')}">checked</c:if>
									/>
									<label for="cook">요리</label>
								</li>
								<li>
									<input type="checkbox" name="hobby" id="book" value="book"
									<c:if test="${fn:contains(mdto.hobby,'book')}">checked</c:if>
									/>
									<label for="book">독서</label>
								</li>
								<li>
									<input type="checkbox" name="hobby" id="culture" value="culture"
									<c:if test="${fn:contains(mdto.hobby,'culture')}">checked</c:if>
									/>
									<label for="culture">문화/예술</label>
								</li>
							</ul>
						</dd>
					</dl>
				</fieldset>
				<div id="info_input_button">
					<input type="reset" value="취소하기" />
					<input type="button" id="insertBtn" value="수정하기" />
				</div>
				
			</form>
		</section>
		
		<footer>
			<div id="footer_wrap">
				<div id="footer_cont">
					<div id="fl_l">
						<a href="#"></a>
						<p>© COOKIT ALL RIGHTS RESERVED</p>
					</div>
					<div id="fl_c">
						<ul>
							<li><a href="#">이용약관</a></li>
							<li><a href="#">개인정보처리 방침</a></li>
							<li><a href="#">법적고지</a></li>
							<li><a href="#">사업자정보 확인</a></li>
						</ul>
						<div id="fl_c_info">
							<p>씨제이제일제당(주)</p>
							<p>대표이사 : 손경식,강신호,신현재</p>
							<p>사업자등록번호 : 104-86-09535</p>
							<p>주소 : 서울 중구 동호로 330 CJ제일제당 센터 (우) 04560</p>
							<p>통신판매업신고 중구 제 07767호</p>
							<p>개인정보보호책임자 : 조영민</p>
							<p>이메일 : cjon@cj.net</p>
							<p>호스팅제공자 : CJ올리브네트웍스㈜</p>
							<p>고객님은 안전거래를 위해 현금등으로 결제시 LG U+ 전자 결제의 매매보호(에스크로) 서비스를 이용하실 수 있습니다. <a href="#">가입 사실 확인</a></p>
						</div>
					</div>
					<div id="fl_r">
						<span>cj그룹계열사 바로가기 ▼</span>
						<dl>
							<dt>고객행복센터</dt>
								<dd>1688-1920</dd>
						</dl>
						<a href="#">1:1문의</a>						
					</div>
				</div>
			</div>
		
		</footer>
	</body>
</html>