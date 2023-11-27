<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/style_header.css">
		<link rel="stylesheet" type="text/css" href="css/style_join01_terms.css">
		<link rel="stylesheet" type="text/css" href="css/style_footer.css">
		<title>회원가입 - 약관동의</title>
		<script>
			$(function(){
				$("#memBtn").click(function(){
					alert("다음으로 진행합니다.")
					//alert("radio 개수 : "+$("input[type=radio]").length);  -전체개수 확인
					//alert("radio 버튼 체크된 개수 : "+$("input[type=radio]:checked").length);  -체크된 개수 확인
					//alert("agree 체크된 개수 : "+$(".agree:checked").length);
					if($(".agree:checked").length<3){
						alert("모두 동의하셔야 다음으로 진행가능합니다.")
						return false;
					}
					agreeFrm.submit();
				})
			})
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
			<form name="agreeFrm" method="get" action="join02_info_input.do">
				<div id="subBanner"></div>
				<div id="locationN">
					<ul>
						<li>HOME</li>
						<li>회원가입</li>
						<li>약관동의</li>
					</ul>
				</div>
				
				<div id="sub_top_area">
					<h3>회원가입</h3>
				</div>
				
				<div id="join_step_div">
					<ul>
						<li>
							<span>STEP.1</span>
							<p>약관동의</p>
						</li>
						<li>
							<span>STEP.2</span>
							<p>회원정보</p>
						</li>
						<li>
							<span>STEP.3</span>
							<p>회원가입완료</p>
						</li>
					</ul>
				</div>
				
				<h4>
					이용약관 동의 
					<span>(필수동의)</span>
					<a href="#">전체보기</a>
				</h4>
				<div class="agreebox">
					<article>
						<div>
							<h5>제1조 (목적)</h5>
							<ul>
								<li>이 약관은 호반호텔리조트(이하"회사"라 표기합니다)가 제공하는 사이버 회원에 대한 서비스 제공 및 이용조건, 회원가입에 관련된 사항 및 절차 그리고 기타 필요한 사항의 규정을 목적으로 합니다.</li>
							</ul>
							<h5>제2조 (약관의 효력)</h5>
							<ul>
								<li>1. 이 약관은 전기통신사업법 제31조, 동법 시행규칙 제21조의 2에 따라 공시절차를 거친 후 서비스 화면에 게시하거나 전자우편, 기타의 방법으로 회원에게 통지함 으로써 효력을 발생합니다.</li>
								<li>2. 회사는 이 약관을 변경할 수 있으며, 변경된 약관은 변경된 사항에 대하여 공지 또는 통지함으로써 효력을 발생합니다.</li>
							</ul>
							<h5>제3조 (약관 이외의 준칙)</h5>
							<ul>
								<li>이 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신 사업법 및 기타 관련법령에 규정되어있는 경우 그 규정에 따릅니다.</li>
							</ul>
							<h5>제4조 (용어의 정의)</h5>
							<ul>
								<li>이 약관에서 사용하는 용어의 정의는 다음과 같습니다.</li>
								<li><strong>1. 호반호텔리조트</strong> 사이버회원(이하"회원"이라 표기합니다) 호반호텔리조트(오션캐슬,스파캐슬,포레스트) 홈페이지를 통해 사이버 회원에 회원등록 하신 고객</li>
								<li><strong>2. 아이디(ID)</strong> 회원 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 회사가 승인하는 문자와 숫자의 조합</li>
								<li><strong>3. 비밀번호</strong> 회원의 비밀보호를 위하여 회원 자신이 설정한 문자와 숫자의 조합</li>
								<li><strong>4. 해지</strong> 회사 또는 회원이 서비스 이용 후 이용계약을 종료시키는 의사표시</li>
							</ul>
							
						</div>
					</article>
				</div>
				<div class="agreeRadio">
					<input type="radio" name="f_agree" class="agree" id="f_agree" value="agree" />
					<label for="f_agree">이용약관에 동의합니다.</label>
					<input type="radio" name="f_agree" id="f_disagree" value="disagree" />
					<label for="f_disagree">동의하지 않습니다.</label>
				</div>
				<div class="strong_div">
					<strong>※ 이용자는 해당 약관 대한 동의를 거부할 권리가 있으나, 미 동의시 회원가입을 하실 수 없습니다.</strong>
				</div>
				
				<h4>
					개인정보 수집, 이용 동의 
					<span>(필수동의)</span>
					<a href="#">전체보기</a>
				</h4>
				<div class="agreebox">
					<article>
						<div>
							<h5>[수집하는 개인정보의 항목 및 수집방법]</h5>
							<ul>
								<li>이 약관은 호반호텔리조트(이하"회사"라 표기합니다)가 제공하는 사이버 회원에 대한 서비스 제공 및 이용조건, 회원가입에 관련된 사항 및 절차 그리고 기타 필요한 사항의 규정을 목적으로 합니다.</li>
							</ul>
							<ul>
								<li>1.이 약관은 전기통신사업법 제31조, 동 법 시행규칙 제21조의 2에 따라 공시절차를 거친 후 서비스 화면에 게시하거나 전자우편, 기타의 방법으로 회원에게 통지함으로써 효력을 발생합니다.</li>
								<li>2.회사는 이 약관을 변경할 수 있으며, 변경된 약관은 변경된 사항에 대하여 공지 또는 통지함으로써 효력을 발생합니다.</li>
							</ul>
							<h5>* 개인정보의 수집 및 이용목적</h5>
							<ul>
								<li><strong>1) 호반호텔리조트 웹사이트는 다음과 같은 목적을 위하여 개인정보를 수집하고 있습니다.</strong></li>
								<li>가. 성명, 생년월일, ID, 비밀번호, 이동전화번호: 회원제 서비스 이용에 따른 본인 식별 절차에 이용</li>
								<li>나. 주소, 유선전화번호, e-mail 주소 : 고지사항 전달, 본인 의사 확인, 불만 처리 등 원활한 의사소통 경로의 확보, 새로운 서비스/신상품/이벤트 정보의 안내, 경품 등 물품 배송에 대한 정확한 배송의 확보</li>
								<li>다. 생년월일, 주소 : 인구통계학적 분석 자료(회원의 연령별, 성별, 지역별 통계분석)</li>
								<li>라. 그 외 선택항목 : 개인맞춤 서비스를 제공하기 위한 자료</li>
								<li><strong>2) 단, 이용자의 기본적 인권 침해의 우려가 있는 민감한 개인정보(인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록, 건강상태 및 성생활 등)는 수집하지 않습니다.</strong></li>
							</ul>
						</div>
					</article>
				</div>
				<div class="agreeRadio">
					<input type="radio" name="s_agree" class="agree" id="s_agree" value="agree" />
					<label for="s_agree">개인정보 보호를 위한 이용자 동의사항에 동의합니다.</label>
					<input type="radio" name="s_agree" id="s_disagree" value="disagree" />
					<label for="s_disagree">동의하지 않습니다.</label>
				</div>
				<div class="strong_div">
					<strong>※ 이용자는 해당 개인정보 수집, 이용 동의를 거부할 권리가 있으나, 미 동의시 회원가입을 하실 수 없습니다.</strong>
				</div>
				
				<h4>
					개인정보 취급위탁 동의 
					<span>(필수동의)</span>
					<a href="#">전체보기</a>
				</h4>
				<div class="agreebox">
					<article>
						<div>
							<h5>[개인정보 취급 위탁 안내]</h5>
							<ul>
								<li>이 약관은 주식회사 디자인팝(이하"회사"라 표기합니다)가 제공하는 사이버 회원에 대한 서비스 제공 및 이용조건, 회원가입에 관련된 사항 및 절차 그리고 기타 필요한 사항의 규정을 목적으로 합니다.</li>
							</ul>
							<ul>
								<li>1) 디자인팝 : 웹사이트 관리</li>
								<li>2) ㈜한도정보통신 : 전산시스템 구축 및 유지보수</li>
								<li>4) ㈜다우기술 : 회사 문자 메시지 전송</li>
							</ul>
						</div>
					</article>
				</div>
				<div class="agreeRadio">
					<input type="radio" name="t_agree" class="agree" id="t_agree" value="agree" />
					<label for="t_agree">개인정보 취급위탁에 동의합니다.</label>
					<input type="radio" name="t_agree" id="t_disagree" value="disagree" />
					<label for="t_disagree">동의하지 않습니다.</label>
				</div>
				<div class="strong_div">
					<strong>※ 이용자는 해당 개인정보 취급위탁 동의를 거부할 권리가 있으나, 미 동의시 회원가입을 하실 수 없습니다.</strong>
				</div>
				
				<div id="terms_button">
					<input type="reset" value="취소하기" />
					<input type="button" id="memBtn" value="가입하기" />
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