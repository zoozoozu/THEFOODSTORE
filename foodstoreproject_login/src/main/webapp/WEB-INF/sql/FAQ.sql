use store;

CREATE TABLE IF NOT EXISTS faq(
  no INTEGER AUTO_INCREMENT PRIMARY KEY,
  asking VARCHAR(150) NOT NULL,
  answer VARCHAR(150) NOT NULL  
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO faq(asking, answer) VALUES ("회원아이디/비밀번호를 잊어버렸습니다.","회원아이디 및 비밀번호는 로그인창 아래 아이디/비밀번호 찾기로 확인가능하십니다.");
INSERT INTO faq(asking, answer) VALUES ("고객센터 전화번호를 알려 주세여","홈페이지 하단을 보시면 고객센터 전화번호(000-0000-0000)를 확인하실수 있습니다.");
INSERT INTO faq(asking, answer) VALUES ("이곳은 무엇을 하는 사이트 인가요","저희 사이트는 회원여러분들께 건강하고 신선한 식품을 제공하고자 설립된 홈페이지 입니다.");
INSERT INTO faq(asking, answer) VALUES ("신고는 어떻게 하나요","신고의 경우 홈페이지 하단의 고객센터로 진행해 주시면 신속하고 정확하게 처리해드립니다.");
INSERT INTO faq(asking, answer) VALUES ("게시판에 올린 파일을 지웠는데 복구가 가능한가여?","홈페이지 게시판에 올리신 파일은 따로 빽업하지 않으신 경우 복구가 어렵습니다.");
INSERT INTO faq(asking, answer) VALUES ("환불을 다른사람 명의로 받을수 있나요?","고객님 계좌로만 환불이 가능합니다");
INSERT INTO faq(asking, answer) VALUES ("반품하고 싶어요","고객센터에 전화 후 반품주소를 받으시고 택배로 반품해주시면 감사하겠습니다./n 반품가능기간은 배송완료후 2~3일 이내여야합니다.");
INSERT INTO faq(asking, answer) VALUES ("고객센터 운영시간은 어덯게 되나요","고객센터는 '오전 7시~오후 10시'까지 365일 연중무휴로 운영합니다.");
INSERT INTO faq(asking, answer) VALUES ("회원정보 수정은 어떻게 하나요","홈페이지 상단에 위치한 회원정보 수정을이용하여 수정하실수 있습니다.");
INSERT INTO faq(asking, answer) VALUES ("회원가입은 누구나 가능한가요","네 회원가입 창을 통해 회원 가입이 가능합니다.");
INSERT INTO faq(asking, answer) VALUES ("회원탈퇴하면 모든정보가 사라지나요?","네 회원탈퇴시 완전 삭제되어 회원님의 정보가 남지 않습니다.");
INSERT INTO faq(asking, answer) VALUES ("비밀번호를 찾고싶은데 이메일 주소와 휴대폰 번호가 변경되어 확인할 수 없어요.","홈페이지 하단을 보시면 고객센터 전화번호(000-0000-0000)로 전화주시어 비밀번호를 변경하세요.");


select * from files;