function requestPay(){
	//document.cookie = 'same-site-cookie=foo; SameSite=Lax';
	//document.cookie = 'cross-site-cookie=bar; SameSite=None; Secure';
	var IMP = window.IMP;
	IMP.init('iamport')
	IMP.request_pay({
		pg: "kakaopay",
	    pay_method: "card",
	    merchant_uid: "ORD20180131-0000011",
	    name: "노르웨이 회전 의자",
	    amount: 64900,
	    buyer_email: "gildong@gmail.com",
	    buyer_name: "홍길동",
	    buyer_tel: "010-4242-4242",
	    buyer_addr: "서울특별시 강남구 신사동",
	    buyer_postcode: "01181"
	}, function(rsp){
		if(rsp.success){
			// 결제 성공시
			jQuery.ajax({
				url:"payments/complete",
				type:'POST',
				dataType:'json',
				data:{
					imp_uid : rsp.imp_uid
				}
			}).done(function(data){
				if(everythings_fine){
					msg = '결제가 완료되었습니다.';
					msg += '\n고유ID:' + rsp.imp_uid;
					msg += '\n상점 거래ID:' + rsp.merchant_uid;
					msg += '\n결제 금액:' + rsp.paid_amount;
					msg += '카드 승인번호:' + rsp.apply_num;
					
					alert(msg);
				} else{
					
				}
			});
			location.href="/order/paySuccess?msg=" + msg;
		} else{
			// 결제 실패시
			msg = "결제에 실패하였습니다.";
			msg += "에러내용:" + rsp.error_msg;
			//실패시 이동할 페이지
			location.href="/order/payFail";
			alert(msg);
		}
	});
}