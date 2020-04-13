<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	.imeMode{
		-webkit-ime-mode: disabled;
		-moz-ime-mode: disabled;
		-ms-ime-mode: disabled;
		ime-mode: disabled;
		}
</script>
<article>
	<h3 id="joinFormTitle">회원 정보 입력</h3>
	<form action="joinInfo" name="joinForm" method="post" id="joinForm">
		<input type="hidden" name="isIdCheck" id="isIdCheck" value="false" />
		<div id="memberInputDefault">
			<div class="memberInputText">
				<span class="memberSpan">이름 : </span> <input type="text" name="name"
					size="15" style="ime-mode: active" id="name"
					value="${sessionScope.m.name }" />
			</div>
			<div class="memberInputText">
				<span class="memberSpan">아이디 : </span> <input type="text" name="id"
					size="15" id="userId"
					style="-webkit-ime-mode: disabled; -moz-ime-mode: disabled; -ms-ime-mode: disabled; ime-mode: disabled;"
					value="${sessionScope.m.id }" /> <input type="button" value="중복확인"
					id="btnOverlapId" />
			</div>
			<div class="memberInputText">
				<span class="memberSpan">비밀번호 : </span> <input type="password"
					name="pass1" id="pass1" pattern="[A-Za-z0-9]*" class="imeMode"
					size="15" />
			</div>
			<div class="memberInputText">
				<span class="memberSpan">비밀번호 확인: </span> <input type="password"
					name="pass2" id="pass2" size="15" />
			</div>
			<div class="memberInputText">
				<span class="memberSpan">우편번호 : </span> <input type="text"
					name="zipcode" size="6" maxlength="5" readonly id="zipcode"
					value="${sessionScope.m.zipcode }" /> <input type="button"
					value="우편번호 검색" id="btnZipcode" />
			</div>
			<div class="memberInputText">
				<span class="memberSpan">자택주소</span> <input type="text"
					name="address1" size="60" readonly id="address1"
					value="${sessionScope.m.address1 }" />
			</div>
			<div class="memberInputText">
				<span class="memberSpan">상세주소</span> <input type="text"
					name="address2" size="60" id="address2"
					value="${sessionScope.m.address2 }" />
			</div>
			<div class="memberInputText">
				<span class="memberSpan">이메일</span> <input type="text"
					name="emailId" size="10" id="emailId" class="imeMode"
					value="${sessionScope.m.email.split('@')[0]}" /> @<input
					type="text" name="emailDomain" size="10" id="emailDomain"
					class="imeMode" value="${sessionScope.m.email.split('@')[1]}" /> <select
					name="selectDomain" id="selectDomain">
					<option>직접입력</option>
					<option>naver.com</option>
					<option>daum.net</option>
					<option>hanmail.net</option>
					<option>google.com</option>
				</select>
			</div>
			<div class="memberInputText">
				<span class="memberSpan">휴대폰 : </span> <select name="mobile1"
					id="mobile1">
					<option
						${ sessionScope.m.mobile.split('-')[0] == 010 ? "selected" : "" }>
						010</option>
					<option
						${ sessionScope.m.mobile.split('-')[0] == 011 ? "selected" : "" }>
						011</option>
					<option
						${ sessionScope.m.mobile.split('-')[0] == 016 ? "selected" : "" }>
						016</option>
					<option
						${ sessionScope.m.mobile.split('-')[0] == 017 ? "selected" : "" }>
						017</option>
				</select> <input type="text" name="mobile2" size="3" maxlength="4"
					id="mobile2" value="${sessionScope.m.mobile.split('-')[1] }" /> <input
					type="text" name="mobile3" size="3" maxlength="4" id="mobile3"
					value="${sessionScope.m.mobile.split('-')[2] }" />
			</div>
		</div>
		<div id="memberInputOption">
			<div class="memberInputText">
				<span class="memberSpan">메일 수신여부 : </span> <input type="radio"
					name="emailGet" value="true"
					${sessionScope.m.emailGet ? "checked" : "" } />수신함 <input
					type="radio" name="emailGet" value="false"
					${sessionScope.m.emailGet ? "checked" : "" } />수신안함
			</div>
			<div class="memberInputText">
				<span class="memberSpan"> 자택전화 : </span> <select name="phone1">
					<option
						${ sessionScope.m.phone.split('-')[0] == 02 ? "selected" : "" }>
						02</option>
					<option
						${ sessionScope.m.phone.split('-')[0] == 031 ? "selected" : "" }>
						031</option>
					<option
						${ sessionScope.m.phone.split('-')[0] == 032 ? "selected" : "" }>
						032</option>
					<option
						${ sessionScope.m.phone.split('-')[0] == 033 ? "selected" : "" }>
						033</option>
					<option
						${ sessionScope.m.phone.split('-')[0] == 041 ? "selected" : "" }>
						041</option>
					<option
						${ sessionScope.m.phone.split('-')[0] == 042 ? "selected" : "" }>
						042</option>
					<option
						${ sessionScope.m.phone.split('-')[0] == 043 ? "selected" : "" }>
						043</option>
					<option
						${ sessionScope.m.phone.split('-')[0] == 044 ? "selected" : "" }>
						044</option>
					<option
						${ sessionScope.m.phone.split('-')[0] == 051 ? "selected" : "" }>
						051</option>
					<option
						${ sessionScope.m.phone.split('-')[0] == 052 ? "selected" : "" }>
						052</option>
					<option
						${ sessionScope.m.phone.split('-')[0] == 053 ? "selected" : "" }>
						053</option>
					<option
						${ sessionScope.m.phone.split('-')[0] == 054 ? "selected" : "" }>
						054</option>
					<option
						${ sessionScope.m.phone.split('-')[0] == 055 ? "selected" : "" }>
						055</option>
					<option
						${ sessionScope.m.phone.split('-')[0] == 061 ? "selected" : "" }>
						061</option>
					<option
						${ sessionScope.m.phone.split('-')[0] == 062 ? "selected" : "" }>
						062</option>
					<option
						${ sessionScope.m.phone.split('-')[0] == 063 ? "selected" : "" }>
						063</option>
					<option
						${ sessionScope.m.phone.split('-')[0] == 064 ? "selected" : "" }>
						064</option>
				</select>- <input type="text" name="phone2" size="3" maxlength="4"
					value="${ sessionScope.m.phone.split('-')[1] }" />- <input
					type="text" name="phone3" size="3" maxlength="4"
					value="${ sessionScope.m.phone.split('-')[2] }" />
			</div>
		</div>
		<div class="formButton">
			<input type="reset" value="다시쓰기" /> <input type="submit"
				value="가입하기" />
		</div>
	</form>
</article>