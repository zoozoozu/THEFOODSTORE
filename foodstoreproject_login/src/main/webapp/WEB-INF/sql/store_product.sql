use spring;

DROP TABLE procode;
CREATE TABLE procode(
    gcode VARCHAR(6) PRIMARY KEY,
    codename VARCHAR(10) NOT NULL
);

INSERT INTO procode VALUES('c1000', '치킨/함박/돈까스');
INSERT INTO procode VALUES('c1001', '스낵');
INSERT INTO procode VALUES('c1002', '과일/채소');
INSERT INTO procode VALUES('c1003', '축산');
COMMIT;
SELECT * FROM procode;

DROP TABLE progoods;
CREATE TABLE progoods(
    gno INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    gcode VARCHAR(6) NOT NULL,
    gname VARCHAR(70) NOT NULL,
    intro VARCHAR(300) NOT NULL,
    sell INTEGER NOT NULL,
    price INTEGER NOT NULL,
    stock INTEGER NOT NULL,
    file_path VARCHAR(100) NOT NULL,
    CONSTRAINT progoods_fk FOREIGN KEY(gcode) REFERENCES procode(gcode)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1000','밀당의고수 바삭한 김말이 400g','쌀가루를 얇게 입혀 기름흡수는 줄이고 더욱 바삭합니다.',50,4500,100,'resources/images/20190703161353659.png');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1000','숯불향 닭강정 <br>200g','올리고당을 넣어 맛있는 강정소스 간식 및 술안주용으로 좋아요!',20,3825,100,'resources/images/20191224175445398.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1000','밀당의고수 바삭한 김말이 400gX2개','쌀가루를 얇게 입혀 기름흡수는 줄이고 더욱 바삭합니다.',10,9000,100,'resources/images/CJON20180330111157_1_01.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1000','숯불향 닭강정 아찔하게 매운맛 200g','빵가루로 두번 튀김옷을 입혀 바삭바삭한 식감',10,4500,100,'resources/images/20200130102944189.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1000','밀당의고수 바삭한 김말이 400gX4개','쌀가루를 얇게 입혀 기름흡수는 줄이고 더욱 바삭합니다.',10,18000,100,'resources/images/CJON20181128152237_1_01.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1000','왕새우튀김 <br>300g(10미)','빵가루 날이 살아 있어 더욱 바삭바삭한',10,9990,100,'resources/images/CJON20150626154513_2_01.png');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1000','고메 바삭튀겨낸 모짜렐라 돈카츠 450g','외식에서 즐기던 일본 정통돈카츠의 맛 그대로!',10,8480,100,'resources/images/20191213165502281.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1000','고메 치킨박스 스윗허니 300g','달달한 허니소스에 특제양념을 더해 단짠단짠 환상의 맛의 조화',10,5933,100,'resources/images/20191231100413912.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1000','고메 바삭튀겨낸 통등심 돈카츠 450g','외식에서 즐기던 일본 정통돈카츠의 맛 그대로!',10,8480,100,'resources/images/20191218130900314.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1000','고메 치킨박스 고추크런치 300g','특제 고추 시즈닝으로 알싸한 매운맛',10,5933,100,'resources/images/20191231100640343.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1000','고메 크리스피 너겟 <br>230g','국내산 닭고기에 현미감자플레이크로 옷을 입혀 노릇노릇 구워진 너겟',10,4200,100,'resources/images/20191226102741979.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1000','고메 바삭튀겨낸 꼬마돈카츠 450g ','생빵가루를 입혀 더욱 고소하고 바삭바삭한 맛!',10,3298,100,'resources/images/20200107183015994.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1000','고메 멘치 돈카츠 480g <br>','외식에서 즐기던 일본 정통돈카츠의 맛 그대로!',10,8480,100,'resources/images/20191213165933259.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1000','고메함박스테이크 540gX2개','겉은 바삭, 속은 육즙으로 촉촉한 함박스테이크',10,15960,100,'resources/images/CJON20190430102016_1_01.jpg');

INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1001','맛군밤 <br>60g','불에 직접 구워 고소한 향 그대로',10,3150,100,'resources/images/20200102101035685.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1001','맛밤 <br>80gX3개','엄선된 밤 100% 그대로',10,8750,100,'resources/images/20200102093303150.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1001','맛밤 <br>80g','엄선된 밤 100% 그대로',10,3150,100,'resources/images/20191231142534831.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1001','비비고칩 오리지널 <br>40g','바삭한 현미칩과 짭쪼름한 김맛의 조화',10,2780,100,'resources/images/20191226145704927.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1001','비비고칩 스위트콘 <br>40g','고소한 옥수수칩과 짭쪼름한 김맛의 조화',10,2780,100,'resources/images/20191226150217266.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1001','이츠웰 허니버터아몬드 10gX40봉','달콤한 꿀과 고소한 아몬드의 환상조합',10,17250,100,'resources/images/20191115171314423.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1001','비비고칩 오리지널 <br>20g','바삭한 현미칩과 짭쪼름한 김맛의 조화',10,1440,100,'resources/images/20191226151327134.png');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1001','누가 크래커 파우치 140gX3팩','야채비스킷 사이에 달콤하고 쫀득한 누가가 쏙!',10,13300,100,'resources/images/CJON20170718171905_1_01.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1001','이츠웰 콘시리얼 견과바 <br>15gX12개','바쁜 아침 거르지말고 하루 한봉지씩!',10,8300,100,'resources/images/20190703113848275.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1001','비비고 김스낵 오리지날 <br>36g','김의 고소함과 현미의 바삭바삭함!',10,3500,100,'resources/images/20200102100540228.jpg');

INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1002','자몽 <br>3kg(9~11과)','달콤쌉살,오묘한 맛을 가진 자몽',10,16500,100,'resources/images/img_fruit_자몽.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1002','석류 <br>2.5kg(7~8개입)','탱글탱글한 알맹이,새콤달콤한 맛',10,26000,100,'resources/images/img_fruit_석류.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1002','블루베리 <br>300g 2개','새콤달콤,입안에서 톡톡 터지는 상큼함!',10,23000,100,'resources/images/img_fruit_블루베리.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1002','신고 배 <br>7.5kg(13~14개입)','사각사각 베어물 때 마다 나오는 시원한 달콤함',10,29800,100,'resources/images/img_fruit_배.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1002','세척사과 <br>2.5kg','지구를 지키는 달콤한 사과',10,20500,100,'resources/images/img_fruit_apple.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1002','19년 햇 꿀 고구마 <br>2kg','입안 가득 촉촉하게 달콤함이 감도는 햇 꿀고구마',10,12300,100,'resources/images/img_fruit_sweetpotato.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1002','무농약 양파 <br>3kg','영양 가득,맛도 좋은 무농약 양파',10,12800,100,'resources/images/img_fruit_onion.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1002','친환경 감자 <br>3kg','영양 가득,맛도 좋은 감자',10,12200,100,'resources/images/img_fruit_potato.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1002','친환경 대추방울토마토 <br>1kg','검증 받은 무농약 대추 방울토마토',10,14500,100,'resources/images/img_fruit_대추방울토마토.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1002','친환경 토마토 <br>3kg','휴작기에 벼농사를 지어, 더 맛있는 토마토',10,26000,100,'resources/images/img_fruit_tomato.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1002','무농약 상주곶감 <br>10입 2개','자연 그대로의 단 맛',10,23000,100,'resources/images/img_fruit_곶감.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1002','아보카도 <br>1.1kg','세계인이 선택한 슈퍼푸드 대표과일',10,27400,100,'resources/images/img_fruit_avocado.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1002','레몬 <br>1.4kg','상큼하고 신선한 과즙이 가득',10,13000,100,'resources/images/img_fruit_lemon.jpg');

INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1003','찜갈비 <br>1kg(호주산)','합리적인 가격으로 실속있게 즐기는 호주산 청정우',10,25900,100,'resources/images/CJON20161216093022_3_01.png');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1003','오아로 수육용 <br>목심 500g + 삼겹 500g','제대로 키운 한돈의 품격, 오아로',10,30800,100,'resources/images/20191108161248996.png');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1003','오아로 수육용 목심 500g <br>2팩','제대로 키운 한돈의 품격, 오아로',10,30800,100,'resources/images/20191108160927588.png');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1003','오아로 수육용 삼겹 500g <br>2팩','제대로 키운 한돈의 품격, 오아로',10,30800,100,'resources/images/20191211102903086.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1003','정품진 1+ <br>등심 300g+갈비살 300g','스킨팩 포장으로 살린 한우의 깊은 풍미',10,97000,100,'resources/images/20190719172120103.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1003','정품진 1+ 갈비살 <br>600g','스킨팩 포장으로 살린 한우의 깊은 풍미',10,103000,100,'resources/images/20190719171920299.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1003','정품진 1+ <br>등심 300g + 채끝300g + 갈비살300g','스킨팩 포장으로 살린 한우의 깊은 풍미',10,135000,100,'resources/images/20190719171651440.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1003','정품진 1++ <br>등심 300gX2팩 + 채끝300g','스킨팩 포장으로 살린 한우의 깊은 풍미',10,134000,100,'resources/images/CJON20180517184112_5_01.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1003','정품진 1++ 채끝 <br>600g','스킨팩 포장으로 살린 한우의 깊은 풍미',10,98000,100,'resources/images/CJON20180517185755_2_01.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1003','정품진 1++ 등심 <br>900g','스킨팩 포장으로 살린 한우의 깊은 풍미',10,133000,100,'resources/images/CJON20180517183259_3_01.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1003','정품진 1++ <br>등심 300g + 채끝300g','스킨팩 포장으로 살린 한우의 깊은 풍미',10,94000,100,'resources/images/CJON20180517190248_2_01.jpg');
INSERT INTO progoods (gcode, gname, intro, sell, price, stock, file_path) VALUES('c1003','정품진 1++ 등심 <br>600g','스킨팩 포장으로 살린 한우의 깊은 풍미',10,91000,100,'resources/images/CJON20180517185231_1_01.jpg');

commit;

select * from progoods;

SELECT * FROM progoods WHERE gcode ='c1000' AND gno = 3;

DROP TABLE product_reply;
CREATE TABLE product_reply(
    no INTEGER AUTO_INCREMENT PRIMARY KEY,
    writer VARCHAR(16) NOT NULL,
    reply VARCHAR(200) NOT NULL,
    gno INTEGER(10) NOT NULL,
    gcode VARCHAR(6) NOT NULL,
    CONSTRAINT fk_reply_gno FOREIGN KEY(gno) REFERENCES progoods(gno),
    CONSTRAINT fk_reply_gcode FOREIGN KEY(gcode) REFERENCES procode(gcode)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO product_reply(writer, reply, gno, gcode) VALUES('admin', '감사합니다.', 1, 'c1000');
commit;

select * from product_reply;
select * from product_reply where gcode = 'c1000' and gno=1;
