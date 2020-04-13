$(function(){
	$("#userId").on("keypress", inputCheck);
	$("#userId").on("keyup", inputCharReplace);
	$("#pass1").on("keypress", inputCheck);
	$("#pass1").on("keyup", inputCharReplace);
	$("#pass2").on("keypress", inputCheck);
	$("#pass2").on("keyup", inputCharReplace);
	$("#emailId").on("keypress", inputCheck);
	$("#emailId").on("keyup", inputCharReplace);
	$("#emailDomain").on("keypress", inputCheck);
	$("#emailDomain").on("keyup", inputCharReplace);
	
	$("#btnOverlapId").on("click", function(){
		var id = $("#userId").val();
		url="overlapIdCheck?id=" + id;
		
		if(id.length == 0){
			alert("아이디를 입력해주세요");
			return false;
		}
		
		if(id.length < 5){
			alert("아이디는 5자 이상 입력해주세요.");
			return false;
		}
		
		window.open(url, "idCheck", "toolbar=no, location=no, "
				+ "status=no, menubar=no, width=400, height=200")
	});
	
	$("#idCheckForm").on("submit", function(){
		var id = $("#checkId").val();
		
		if(id.length == 0){
			alert("아이디를 입력해주세요");
			return false;
		}
		
		if(id.length < 5){
			alert("아이디는 5자 이상 입력해주세요");
			return false;
		}
	});
	
	$("#btnIdCheckClose").on("click", function(){
		var id = $(this).attr("data-id-value");
		opener.document.joinForm.id.value = id;
		opener.document.joinForm.isIdCheck.value = true;
		window.close();
	});	
	
	$("#btnZipcode").click(findZipcode);
	
	$("#selectDomain").on("change", function(){
		var str = $(this).val();
		
		if(str == "직접입력"){
			$("#emailDomain").val("");
			$("#emailDomain").prop("readonly", false);
		} else if(str == "naver.com"){
			$("#emailDomain").val("naver.com");
			$("#emailDomain").prop("readonly", true);
		} else if(str == "daum.net"){
			$("#emailDomain").val("daum.net");
			$("#emailDomain").prop("readonly", true);
		} else if(str == "hanmail.net"){
			$("#emailDomain").val("hanmail.net");
			$("#emailDomain").prop("readonly", true);
		} else if(str == "google.com"){
			$("#emailDomain").val("google.com");
			$("#emailDomain").prop("readonly", true);
		}
	});
	
	$("#joinForm").on("submit", function(){
		return joinFormCheck();
	});
	
	$("#btnPassCheck").click(function(){
		var oldId = $("#userId").val();
		var oldPass = $("#oldPass").val();
		
		if($.trim(oldPass).length == 0){
			alert("기존 비밀번호가 입력되지 않았습니다.\n기존 비밀번호를 입력해주세요");
			return false;
		}
		var data = "id = " + oldId + "&pass="+oldPass;
		$.post("passCheck.ajax", data, function(resultData, status, xhr){
			console.log(resultData.result + (Boolean(resultData.result) == true));
			if(resultData.result){
				alert("비밀번호가 확인되었습니다.\n비밀번호를 수정해주세요");
				$("#btnPassCheck").prop("disabled", true);
				$("#pass1").focus();
			}else{
				alert("비밀번호가 맞지 않습니다.");
			}
		});
	});
	
	$("#oldPass").change(function(){
		$("#btnPassCheck").prop("disabled", false);
	});
	
	$("#memberUpdateForm").on("submit", function(){
		if(! $("#btnPassCheck").prop("disabled")){
			alert("기존 비밀번호를 확인해야 비밀번호를 수정할 수 있습니다.\n"
					+"기존 비밀번호를 입력하고 비밀번호 확인 버튼을 클릭해 주세요");
			return false;
		}
		return joinFormCheck();
	})
	
	/*사용자가 입력한 값이 영문 대소문자, 숫자인지 체크*/
	function inputCheck(){
		if(!(event.keyCode >= 48 && event.keyCode <= 57 ||
				event.keyCode >= 65 && event.keyCode <= 90 ||
				event.keyCode >= 97 && event.keyCode <= 122)){
			alert(this);
			alert("아이디는 영문 대소문자와 숫자만 사용할 수 있습니다.");
			return false;
		}
	}
	
/*	회원 아이디, 비밀번호, 이메일 아이디가 영문 대소문자, 숫자만 입력되도록*/	
	function inputCharReplace(){
		var regExp = /[^A-Za-z0-9]/gi;
		if(regExp.test($(this).val())){
			alert("영문 대소문자, 숫자만 입력할 수 있습니다.");
			$(this).val($(this).val().replace(regExp, ""));
		}
	}
	
	function inputEmailDomainCheck(){
		if(!(event.keyCode >= 48 && event.keyCode <= 57 ||
				event.keyCode >= 97 && event.keyCode <= 122 ||
				event.keyCode == 46)){
			alert("이메일 도메인은 영문 소문자, 숫자, 점(.)만 입력할 수 있습니다.");
			return false;
		}
	}
	
	function inputEmailDommainReplace(){
		var regExp = /[^a-z0-9\.]/gi;
		if(regExp.test($(this).val())){
			alert("이메일 도메인은 영문 소문자, 숫자, 점(.)만 입력할 수 있습니다.");
			$(this).val($(this).val().replace(regExp,""));
		}
	}
	/***********************************************************/
	/*회원 가입 폼과 회원정보 수정 폼의 유효성 검사 함수*/
	function joinFormCheck(){
		var name = $("#name").val();
		var id = $("#userId").val();
		var pass1 = $("#pass1").val();
		var pass2 = $("#pass2").val();
		var zipcode = $("#zipcode").val();
		var address1 = $("#address1").val();
		var emailId = $("#emailId").val();
		var emailDomain = $("#emailDomain").val();
		var mobile2 = $("#mobile2").val();
		var mobile3 = $("#mobile3").val();
		var isIdCheck = $("#isIdCheck").val();
	
		if(name.length == 0){
			alert("이름이 입력되지 않았습니다.\n이름을 입력해주세요");
			return false;
		}
		if(id.length == 0){
			alert("아이디가 입력되지 않았습니다.\n아이디를 입력해주세요");
			return false;
		}
		if(isIdCheck == 'false'){
			alert("아이디 중복 체크를 하지 않았습니다.\n아이디 중복 체크를 해주세요");
			return false;
		}
		if(pass1.length == 0){
			alert("비밀번호가 입력되지 않았습니다.\n비밀번호를 입력해주세요");
			return false;
		}
		if(pass2.length == 0){
			alert("비밀번호 확인이 입력되지 않았습니다.\n비밀번호 확인을 입력해주세요");
			return false;
		}
		if(pass1 != pass2){
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			return false;
		}
		if(zipcode.length == 0){
			alert("우편번호가 입력되지 않았습니다.\n우편번호를 입력해주세요");
			return false;
		}
		if(address1.length == 0){
			alert("주소가 입력되지 않았습니다.\n주소를 입력해주세요");
			return false;
		}
		if(emailId.length == 0){
			alert("이메일 아이디가 입력되지 않았습니다.\n이메일 아이디를 입력해주세요");
			return false;
		}
		if(emailDomain.length == 0){
			alert("이메일 도메인이 입력되지 않았습니다.\n이메일 도메인을 입력해주세요");
			return false;
		}
		if(mobile2.length == 0 || mobile3.length == 0){
			alert("휴대폰 번호가 입력되지 않았습니다.\n휴대폰 번호를 입력해주세요");
			return false;
		}
	}
	
	/*daum 우편번호 찾기 API*/
	function findZipcode(){
			new daum.Postcode({
				oncomplete: function(data){
					var fullAddr = "";
					var extraAddr = "";
					
					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	                
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        fullAddr += (extraAddr = ' (' + extraAddr + ')');
	                    }
	                }
	                    $("#zipcode").val(data.zonecode);
	                    $("#address1").val(fullAddr);
	                    $("#address2").focus();
				}
			}).open();
		}
	
	/*이 함수가 꼭 필요한가?*/
	function passCheckAjax(){
		var oldId = $("#userId").val();
		var oldPass = $("#oldPass").val();
		
		if($.trim(oldPass).length == 0){
			alert("기존 비밀번호가 입력되지 않았습니다.\n기존 비밀번호를 입력해주세요");
			return false;
		}
		var data = "id = " + oldId + "&pass="+oldPass;
		$.post("passCheck.ajax", data, function(resultData, status, xhr){
			console.log(resultData.result + (Boolean(resultData.result) == true));
			if(resultData.result){
				alert("비밀번호가 확인되었습니다.\n비밀번호를 수정해주세요");
				$("#btnPassCheck").prop("disabled", true);
				$("#pass1").focus();
			}else{
				alert("비밀번호가 맞지 않습니다.");
			}
		});
	}
})
