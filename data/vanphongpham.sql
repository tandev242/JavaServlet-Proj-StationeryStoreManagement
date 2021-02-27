###############################################
CREATE TABLE `CATEGORY` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NameCategory` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
###############################################
#Đưa dữ liệu vào Table.Category
INSERT INTO `CATEGORY`(`NameCategory`) VALUES ('Sách');
INSERT INTO `CATEGORY`(`NameCategory`) VALUES ('Giấy vở ');
INSERT INTO `CATEGORY`(`NameCategory`) VALUES ('Đồ dùng văn phòng');
INSERT INTO `CATEGORY`(`NameCategory`) VALUES ('Bút và dụng cụ học tập');
INSERT INTO `CATEGORY`(`NameCategory`) VALUES ('Sản phẩm khác');
##############################################


Create table `SUBCATEGORY` (
`ID` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
`NameSubCategory` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`IDCategory` int references `category`(`ID`)
);
################################################
#Đưa dữ liệu vào Table.SubCategory
INSERT INTO `SUBCATEGORY`(`ID`,`NameSubCategory`,`IDCategory`) VALUES(1,'Sách giáo khoa',1);
INSERT INTO `SUBCATEGORY`(`NameSubCategory`,`IDCategory`) VALUES('Truyện tranh',1);
INSERT INTO `SUBCATEGORY`(`NameSubCategory`,`IDCategory`) VALUES('Tiểu thuyết',1);
INSERT INTO `SUBCATEGORY`(`NameSubCategory`,`IDCategory`) VALUES('Sách tham khảo',1);
INSERT INTO `SUBCATEGORY`(`NameSubCategory`,`IDCategory`) VALUES('Vở ô ly',2);
INSERT INTO `SUBCATEGORY`(`NameSubCategory`,`IDCategory`) VALUES('Vở kẻ ngang',2);
INSERT INTO `SUBCATEGORY`(`NameSubCategory`,`IDCategory`) VALUES('Sổ các loại',2);
INSERT INTO `SUBCATEGORY`(`NameSubCategory`,`IDCategory`) VALUES('Cặp càng cua',3);
INSERT INTO `SUBCATEGORY`(`NameSubCategory`,`IDCategory`) VALUES('Cặp trình ký',3);
INSERT INTO `SUBCATEGORY`(`NameSubCategory`,`IDCategory`) VALUES('Giấy in - photo',3);
INSERT INTO `SUBCATEGORY`(`NameSubCategory`,`IDCategory`) VALUES('Túi đựng tài liệu',3);
INSERT INTO `SUBCATEGORY`(`NameSubCategory`,`IDCategory`) VALUES('Bút bi',4);
INSERT INTO `SUBCATEGORY`(`NameSubCategory`,`IDCategory`) VALUES('Bút chì',4);
INSERT INTO `SUBCATEGORY`(`NameSubCategory`,`IDCategory`) VALUES('Bút máy',4);
INSERT INTO `SUBCATEGORY`(`NameSubCategory`,`IDCategory`) VALUES('Dụng cụ học sinh',4);
INSERT INTO `SUBCATEGORY`(`NameSubCategory`,`IDCategory`) VALUES('Ba lô - Túi - Cặp',5);
INSERT INTO `SUBCATEGORY`(`NameSubCategory`,`IDCategory`) VALUES('Bảng - Bàn học ',5);
INSERT INTO `SUBCATEGORY`(`NameSubCategory`,`IDCategory`) VALUES('Kệ sách, vở ',5);
################################################





CREATE TABLE `PRODUCT` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IDSubCategory` int references `subcategory`(`ID`),
  `Name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `Price` decimal(18,0) DEFAULT NULL,
  `PromotionPrice` decimal(18,0) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `product_chk_1` CHECK ((`Price` > 0)),
  CONSTRAINT `product_chk_2` CHECK ((`PromotionPrice` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#################################################
#Đưa dữ liệu vào Table.Product
#### Sách giáo khoa #########
INSERT INTO `PRODUCT` VALUES (1,1,' Bộ Sách giáo khoa toán lớp 1','Bộ Sách giáo khoa lớp 1, bao gồm:
Tiếng Việt 1 – Tập 1
Tiếng Việt 1- Tập 2
Toán 1
Tự nhiên và xã hội 1
Tập viết 1 – Tập 1
Tập viết 1 – Tập 1','sgk1.jpg',54600,1000,current_timestamp,'Lê Đức Tân');
INSERT INTO `PRODUCT` VALUES (2,1,' Bộ Sách giáo khoa toán lớp 2','Bộ Sách giáo khoa lớp 2, bao gồm:
Tiếng Việt 2 – Tập 1
Tiếng Việt 2- Tập 2
Toán 2
Tự nhiên và xã hội 2
Tập viết 2 – Tập 1
Tập viết 2 – Tập 2','sgk2.jpg',53000,1000,current_timestamp,'Lê Đức Tân');
INSERT INTO `PRODUCT` VALUES (3,1,' Bộ Sách giáo khoa toán lớp 3','Bộ Sách giáo khoa lớp 3, bao gồm:
Tiếng Việt 3 – Tập 1
Tiếng Việt 3- Tập 2
Toán 3
Tự nhiên và xã hội 3
Tập viết 3 – Tập 1
Tập viết 3 – Tập 1','sgk3.jpg',58000,1000,current_timestamp,'Lê Đức Tân');
INSERT INTO `PRODUCT` VALUES (4,1,' Bộ Sách giáo khoa toán lớp 4','Bộ Sách giáo khoa lớp 4, bao gồm:
Tiếng Việt 4/1
Tiếng Việt 4/2
Toán 4
Khoa học 4
Lịch sử và Địa lí 4
Âm nhạc 4
Mĩ thuật 4
Đạo đức 4
Kĩ thuật 4','sgk4.jpg',54600,1000,current_timestamp,'Lê Đức Tân');
####### Truyện Tranh ##############
INSERT INTO `PRODUCT` VALUES (5,2,'Doreamon Truyện Ngắn - Tập 33','Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita,
 Shizuka, Suneo, Jaian, Dekisugi .','doreamon33.jpg',18000,1000,current_timestamp,'Lê Đức Tân');
 INSERT INTO `PRODUCT` VALUES (6,2,'Doreamon Truyện Ngắn - Tập 45','Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita,
 Shizuka, Suneo, Jaian, Dekisugi.','doreamon45.jpg',18000,1000,current_timestamp,'Lê Đức Tân');
 INSERT INTO `PRODUCT` VALUES (7,2,'Trạng Quỷnh - Tập 336','Trạng Quỷnh là một bộ truyện tranh thiếu nhi nhiều tập của Việt Nam,
 tập truyện đầu tiên mang tên Sao sáng xứ Thanh được Nhà xuất bản Đồng Nai phát hành giữa tháng 6 năm 2003'
 ,'tq336.jpg',13000,1000,current_timestamp,'Lê Đức Tân');
 ##########Tiểu thuyết ##############
  INSERT INTO `PRODUCT` VALUES (8,3,'Hoàng Tử Bé - Antoine de Saint-Exupéry (1943)','Hoàng tử bé” kể về sự tò mò, cái đẹp, tình yêu, sự mất mát… 
  được nhìn từ đôi mắt ngây thơ của Hoàng tử bé sống trên một tiểu hành tinh, chàng đã đem lòng yêu một đóa hồng.'
 ,'htb.jpg',113000,1000,current_timestamp,'Lê Đức Tân');
 INSERT INTO `PRODUCT` VALUES (9,3,'Mối tình đầu của nàng Bọ Cạp','Mối tình đầu của nàng Bọ Cạp là câu chuyện kể về Kỳ Quyên – “cô nàng hổ báo” trong bộ ba Kỳ Quyên,
 Tiêu Tinh (trong tác phẩm “Chờ một ngày nắng”) và Vệ Nam (trong tác phẩm “Ốc sên chạy”).'
 ,'mtd.jpg',96000,1000,current_timestamp,'Lê Đức Tân');
 ############ Sách tham khảo ############
 INSERT INTO `PRODUCT` VALUES (10,4,'Tài Liệu Chuyên Văn 7','Sách tham khảo viết văn hay dành cho học sinh THCS tham khảo , nhất là học sinh lớp 7.'
 ,'stk7.jpg',23000,1000,current_timestamp,'Lê Đức Tân');
INSERT INTO `PRODUCT` VALUES (11,4,'Hướng dẫn học Tin Học lớp 5 - Sách bài tập','Sách bài tập hướng dẫn nhằm nâng cao hiểu biết cho học sinh về Tin học.'
 ,'stk5.jpg',30000,1000,current_timestamp,'Lê Đức Tân');

 ########## Vở ô ly ##############
INSERT INTO `PRODUCT` VALUES (12,5,'Vở South Star Kpop','Số trang	96 trang cả bìa.'
 ,'vol1.jpg',9000,1000,current_timestamp,'Lê Đức Tân');
INSERT INTO `PRODUCT` VALUES (13,5,'Vở Cocktail','Số trang	200 trang không kể bìa.'
 ,'vol2.jpg',20000,1000,current_timestamp,'Lê Đức Tân');
INSERT INTO `PRODUCT` VALUES (14,5,'Vở School Joyful','Số trang	80 trang.'
 ,'vol3.jpg',8700,1000,current_timestamp,'Lê Đức Tân');
 ########## Vở kẻ ngang ##############
INSERT INTO `PRODUCT` VALUES (15,6,'Vở Study Oringa','Số trang	120 trang không kể bìa'
 ,'vkn1.jpg',13000,1000,current_timestamp,'Lê Đức Tân');
INSERT INTO `PRODUCT` VALUES (17,6,'Vở kẻ ngang Pattern','Số trang	72 trang'
 ,'vkn2.jpg',8700,1000,current_timestamp,'Lê Đức Tân');
INSERT INTO `PRODUCT` VALUES (16,6,'Vở Pupil Oxygen','Công nghệ	Gáy vuông - vào keo lạnh - dán gáy'
 ,'vkn3.jpg',19000,1000,current_timestamp,'Lê Đức Tân');
 ########## Sổ các loại  ##############
INSERT INTO `PRODUCT` VALUES (18,7,'Sổ bìa bồi Subject A4','Công nghệ sản xuất	Bìa bồi - may gáy - dán gáy'
 ,'s1.jpg',39000,1000,current_timestamp,'Lê Đức Tân');
INSERT INTO `PRODUCT` VALUES (19,7,'Sổ lịch da Edition Daily Book','Công nghệ sản xuất	Khâu gáy - vào keo lạnh - cài bìa da'
 ,'s2.jpg',52000,1000,current_timestamp,'Lê Đức Tân');
 INSERT INTO `PRODUCT` VALUES (20,7,'Sổ Hồng Hà OFFICE A4','Công nghệ sản xuất	May gáy - bồi bìa da'
 ,'s3.jpg',60000,1000,current_timestamp,'Lê Đức Tân');
 ########## Cặp càng cua ##############
INSERT INTO `PRODUCT` VALUES (21,8,'Cặp càng cua 7P Eagle','Cặp càng cua A4 được làm từ nguyên liệu nhựa PP cao cấp bọc bìa cứng
Có khóa còng lớn bằng thép mạ chắc chắn
Thuận tiện trong việc lưu trữ và bảo quản tài liệu lâu dài
Có thể lưu giữ được tối đa 470 tờ giấy A4'
 ,'ccc1.jpg',49000,1000,current_timestamp,'Lê Đức Tân');
INSERT INTO `PRODUCT` VALUES (22,8,'Cặp càng cua Office 5P','Cặp càng cua A4 được làm từ nguyên liệu nhựa PP cao cấp bọc bìa cứng
Có khóa còng lớn bằng thép mạ chắc chắn
Thuận tiện trong việc lưu trữ và bảo quản tài liệu lâu dài
Có thể lưu giữ được tối đa 300 tờ giấy A4'
 ,'ccc2.jpg',47000,1000,current_timestamp,'Lê Đức Tân');
######### Cặp trình ký ##############
INSERT INTO `PRODUCT` VALUES (23,9,'Cặp trình ký Plastic S10 - A4',
'Cặp trình ký Plastic S10 được làm từ nguyên liệu nhựa PS không độc hại - thân thiện môi trường
Sản phẩm có độ bền cao - thêm tính năng thước kẻ thuận tiện cho việc kẻ vẽ đo đạc
Lưu trữ được 100 tờ giấy A4'
 ,'ctk1.jpg',47000,1000,current_timestamp,'Lê Đức Tân');
 INSERT INTO `PRODUCT` VALUES (24,9,'Cặp trình ký Office bìa da khổ F','Cặp trình ký chất liệu bìa da cao cấp sang trọng
Là sản phẩm phù hợp với các hội nghị hay các buổi hội thảo
Kẹp giữ tài liệu bằng inox chắc chắn có độ bền cao
Có thể lưu giữ được tối đa 100 tờ giấy A4'
 ,'ctk2.jpg',76000,1000,current_timestamp,'Lê Đức Tân');
 INSERT INTO `PRODUCT` VALUES (25,9,'Trình ký office A4','Cặp trình ký Office được làm từ nguyên liệu nhựa PP cao cấp
Còng inox chắc chắn giúp có độ bền cao
Có thể lưu giữ được tối đa 80 tờ giấy A4
Sản phẩm có móc treo phù hợp để dùng treo các thông báo - quyết định..'
 ,'ctk3.jpg',24000,1000,current_timestamp,'Lê Đức Tân');
######### Giấy in - photo ##############
INSERT INTO `PRODUCT` VALUES (26,10,'Giấy in Hồng Hà Copy Paper A4 80gsm','Giấy in cao cấp xuất xứ Indonesia
Không sử dụng chất tẩy trắng gốc Clo - bảo vệ môi trường - an toàn khi sử dụng
Mặt giấy láng mịn - Chất lượng bản in đạt độ sắc nét cao - thích hợp các loại máy in - máy photocopy'
 ,'gi1.jpg',96000,1000,current_timestamp,'Lê Đức Tân');
 INSERT INTO `PRODUCT` VALUES (27,10,'Giấy in Hồng Hà Copy Paper A4','Giấy in cao cấp xuất xứ Indonesia
Không sử dụng chất tẩy trắng gốc Clo - bảo vệ môi trường - an toàn khi sử dụng
Mặt giấy láng mịn - Chất lượng bản in đạt độ sắc nét cao - thích hợp các loại máy in - máy photocopy'
 ,'gi2.jpg',22000,1000,current_timestamp,'Lê Đức Tân');
######### Túi đựng tài liệu ##############
 INSERT INTO `PRODUCT` VALUES (28,11,'Túi My Clear Hồng Hà F','Được làm từ vật liệu màng PP trong - độ dày 0.15 mm
Sử dụng để đựng tài liệu - hồ sơ tránh bị cong vênh - bám bụi
Nút bấm có độ bền cao – đường hàn nhiệt chắc chắn
Có thể lưu giữ được tối đa 300 tờ giấy A4'
 ,'td1.jpg',5000,1000,current_timestamp,'Lê Đức Tân');
 INSERT INTO `PRODUCT` VALUES (29,11,'Túi 2 ngăn','Sử dụng để đựng tài liệu - hồ sơ tránh bị cong vênh - bám bụi
Nút bấm có độ bền cao – đường hàn nhiệt chắc chắn
Có thể lưu giữ được tối đa 500 tờ giấy A4'
 ,'td2.jpg',7500,1000,current_timestamp,'Lê Đức Tân');
######### Bút bi ##############
INSERT INTO `PRODUCT` VALUES (30,12,'Bút bi Thiên Long TL-031','Bút bi Thiên Long TL-031 màu xanh'
 ,'bi1.jpg',8000,1000,current_timestamp,'Lê Đức Tân');
 INSERT INTO `PRODUCT` VALUES (31,12,'Bút bi Thiên Long TL-079 màu đen','Bút bi Thiên Long TL-079 màu đen'
 ,'bi2.jpg',5000,1000,current_timestamp,'Lê Đức Tân');
  INSERT INTO `PRODUCT` VALUES (32,12,'Bút bi Thiên Long TL-061 màu đỏ','Bút bi Thiên Long TL-061 màu đỏ'
 ,'bi3.jpg',5000,1000,current_timestamp,'Lê Đức Tân');
######### Bút chì ##############
 INSERT INTO `PRODUCT` VALUES (33,13,'Bút chì gỗ Điểm 10 TP-GP08','Bút chì gỗ Điểm 10 TP-GP08 được sử dụng phổ biến tại các văn phòng,
 công sở và hữu ích cho học sinh, sinh viên.
 Bút chì nhỏ gọn, có tính ứng dụng cao và màu viết đẹp nên được tin dùng trong thời gian vừa qua.'
 ,'chi1.jpg',4500,1000,current_timestamp,'Lê Đức Tân');
  INSERT INTO `PRODUCT` VALUES (34,13,'Bút chì gỗ Thiên Long GP - 03','Bút chì thích hợp cho các hoạt động như ghi chép, vẽ nháp, 
  học tập. Ngoài ra khá hữu dụng trong việc tô đậm vào ô trả lời trắc nghiệm.'
 ,'chi2.jpg',4000,1000,current_timestamp,'Lê Đức Tân');
INSERT INTO `PRODUCT` VALUES (35,13,'Bút Chì Kim Pentel - PD275T','Bút chì bấm hiện nay đã trở thành một công cụ hỗ trợ không thể thiếu đối với mọi người.
 Một cây bút tốt sẽ giúp các bạn rất nhiều trong học tập và công việc. '
 ,'chi3.jpg',37000,1000,current_timestamp,'Lê Đức Tân');
 ######### Bút máy ##############
 INSERT INTO `PRODUCT` VALUES (36,14,'Bút máy nét hoa Tom & Jerry','Bút máy nét hoa Tom & Jerry luyện chữ viết đẹp dùng cho học sinh tiểu học '
 ,'bm1.jpg',37000,1000,current_timestamp,'Lê Đức Tân');
 INSERT INTO `PRODUCT` VALUES (37,14,'Bút máy Hồng Hà nét hoa 300','Bút luyện viết chữ đẹp dùng cho học sinh - sinh viên - văn phòng
Phong cách thiết kế sang trọng độc đáo. '
 ,'bm2.jpg',95000,1000,current_timestamp,'Lê Đức Tân');
 ######### Dụng cụ học sinh ##############
 INSERT INTO `PRODUCT` VALUES (38,15,'Mực ống Hồng Hà','Ống mực Hồng Hà cao cấp
Phù hợp với học sinh tiểu học '
 ,'dd1.jpg',3000,1000,current_timestamp,'Lê Đức Tân');
 INSERT INTO `PRODUCT` VALUES (39,15,'Compa SM03','Compa Hồng Hà cao cấp tiện dụng dành cho học sinh - sinh viên
Bề mặt thép sơn tĩnh điện kết cấu vững chắc - độ bền cao
Thiết kế nhỏ gọn - dễ cầm - dễ sử dụng
Đa dạng kiểu dáng - màu sắc trang nhã bắt mắt '
 ,'dd2.jpg',25000,1000,current_timestamp,'Lê Đức Tân');
 ######### Ba lô - Túi - Cặp ##############
 INSERT INTO `PRODUCT` VALUES (40,16,'Cặp học sinh Happy Bird','Sản phẩm cặp nhựa dành cho học sinh'
 ,'c1.jpg',100000,1000,current_timestamp,'Lê Đức Tân');
 INSERT INTO `PRODUCT` VALUES (41,16,'Balo Rainbow LS5092S','Balo Trẻ Em Rainbow LS5092S  được làm từ chất liệu Polyester 600D với đặc tính bền bỉ và giữ được màu sắc tươi sáng theo thời gian.
 Hơn nữa trọng lượng balo cũng rất nhẹ, đảm bảo sức khoẻ và sự phát triển chiều cao cho các bé đang đi học. '
 ,'c2.jpg',200000,1000,current_timestamp,'Lê Đức Tân');
 ######### Bảng - Bàn học ##############
 INSERT INTO `PRODUCT` VALUES (42,17,'Bàn học sinh thông minh BHS20','Hiện đại, thông minh, có thể điều chỉnh độ cao bàn, ghế, độ nghiêng mặt bàn.'
 ,'bh1.jpg',1800000,1000,current_timestamp,'Lê Đức Tân');
 INSERT INTO `PRODUCT` VALUES (43,17,'Bàn học sinh thông minh BHS26X','Hiện đại, thông minh, có thể điều chỉnh độ cao bàn, ghế phù hợp với mọi lứa tuổi '
 ,'bh2.jpg',2900000,1000,current_timestamp,'Lê Đức Tân');
 ######### Kệ Sách, vở ##############
 INSERT INTO `PRODUCT` VALUES (44,18,'Kệ đựng sách trang trí trưng bày sản phẩm lắp ghép thông minh',
 'Những tấm lưới sắt kết hợp vưới chốt nhựa 8 chiều ABS tạo thành những ô vuông với kích thước 350 x 350 x 350 mm. 
 Có thể xếp bao nhiêu tầng, bao nhiêu ô tùy thích vào kích thước phòng, nhu cầu sử dụng, tính sáng tạo.  '
 ,'ks1.jpg',200000,1000,current_timestamp,'Lê Đức Tân');
#################################################



CREATE TABLE `INVENTORY` (
  `IDProduct` int references `product`(`ID`),
  `IDSubCategory` int references `subcategory`(`ID`) ,
  `PriceBuy` int NOT NULL,
  `Quantity` int DEFAULT '0',
  PRIMARY KEY (`IDProduct`,`IDSubCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
#Đưa dữ liệu vào Table.Inventory 
INSERT INTO `INVENTORY` VALUES (1,1,40000,100);
INSERT INTO `INVENTORY` VALUES (2,1,40000,100);
INSERT INTO `INVENTORY` VALUES (3,1,40000,100);
INSERT INTO `INVENTORY` VALUES (4,1,40000,100);
INSERT INTO `INVENTORY` VALUES (5,2,15000,100);
INSERT INTO `INVENTORY` VALUES (6,2,15000,100);
INSERT INTO `INVENTORY` VALUES (7,2,10000,100);
INSERT INTO `INVENTORY` VALUES (8,3,100000,50);
INSERT INTO `INVENTORY` VALUES (9,3,90000,50);
INSERT INTO `INVENTORY` VALUES (10,4,15000,100);
INSERT INTO `INVENTORY` VALUES (11,4,20000,100);
INSERT INTO `INVENTORY` VALUES (12,5,5000,200);
INSERT INTO `INVENTORY` VALUES (13,5,15000,100);
INSERT INTO `INVENTORY` VALUES (14,5,5000,200);
INSERT INTO `INVENTORY` VALUES (15,6,1000,200);
INSERT INTO `INVENTORY` VALUES (16,6,1000,200);
INSERT INTO `INVENTORY` VALUES (17,6,5000,200);
INSERT INTO `INVENTORY` VALUES (18,7,30000,150);
INSERT INTO `INVENTORY` VALUES (19,7,40000,150);
INSERT INTO `INVENTORY` VALUES (20,7,50000,150);
INSERT INTO `INVENTORY` VALUES (21,8,40000,245);
INSERT INTO `INVENTORY` VALUES (22,8,40000,155);
INSERT INTO `INVENTORY` VALUES (23,9,40000,155);
INSERT INTO `INVENTORY` VALUES (24,9,70000,240);
INSERT INTO `INVENTORY` VALUES (25,9,20000,200);
INSERT INTO `INVENTORY` VALUES (26,10,86000,100);
INSERT INTO `INVENTORY` VALUES (27,10,15000,200);
INSERT INTO `INVENTORY` VALUES (28,11,2500,300);
INSERT INTO `INVENTORY` VALUES (29,11,4500,300);
INSERT INTO `INVENTORY` VALUES (30,12,5000,250);
INSERT INTO `INVENTORY` VALUES (31,12,2500,300);
INSERT INTO `INVENTORY` VALUES (32,12,2500,310);
INSERT INTO `INVENTORY` VALUES (33,13,2000,200);
INSERT INTO `INVENTORY` VALUES (34,13,2000,200);
INSERT INTO `INVENTORY` VALUES (35,13,30000,150);
INSERT INTO `INVENTORY` VALUES (36,14,80000,100);
INSERT INTO `INVENTORY` VALUES (37,14,30000,210);
INSERT INTO `INVENTORY` VALUES (38,15,1500,150);
INSERT INTO `INVENTORY` VALUES (39,15,20000,100);
INSERT INTO `INVENTORY` VALUES (40,16,70000,100);
INSERT INTO `INVENTORY` VALUES (41,16,150000,75);
INSERT INTO `INVENTORY` VALUES (42,17,1500000,20);
INSERT INTO `INVENTORY` VALUES (43,17,2500000,15);
INSERT INTO `INVENTORY` VALUES (44,18,150000,20);
#################################################




CREATE TABLE `USERINFO` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `UserName` varchar(30) DEFAULT NULL,
  `Password` varchar(255) NOT NULL,
  `FirstName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LastName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Phone` varchar(30) NOT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `Role` bit default 0,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `UserName` (`UserName`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
####################################################
#Đưa dữ liệu vào Table.userInfo
############### Admin #################
INSERT INTO `USERINFO` VALUES (1,'user01','123456','Nguyễn','Minh Hoàng','Nha Trang','minhhoang@gmail.com','0123456789',NULL,1);
INSERT INTO `USERINFO` VALUES (2,'user02','123456','Lê','Đức Tân','Quảng Ngãi','tanle@gmail.com','0987654321',NULL,1);
INSERT INTO `USERINFO` VALUES (3,'user03','123456','Nguyễn','Văn Tân','Kon Tum','tannguyen@gmail.com','0123498765',NULL,1);
INSERT INTO `USERINFO` VALUES (4,'user04','123456','Mai','Đăng Khoa','Lâm Đồng','dangkhoa@gmail.com','0987612345',NULL,1);
INSERT INTO `USERINFO` VALUES (5,'tannguyen82','123456','Phan','Khắc Chí','Bình Dương','khacchi@gmail.com','0367612345',NULL,0);
############### Customer ###############
####################################################cartitemcart




CREATE TABLE `BILLDETAIL` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IDBill` int DEFAULT NULL,
  `IDProduct` int DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  `Amount` decimal(18,0) NOT NULL,
  `Description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `billdetail_chk_1` CHECK ((`Amount` > 0)),
  CONSTRAINT `billdetail_chk_2` CHECK ((`Quantity` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
######################################################
# Đưa dữ liệu vào Table.billdetail
INSERT INTO `BILLDETAIL` VALUES (1,1,1,5,54600,NULL,1);
######################################################



CREATE TABLE `BILL` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Confirmed` bit(1) DEFAULT b'0',
  `Completed` bit(1) DEFAULT b'0',
  `Canceled` bit(1) DEFAULT b'0',
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
#################################################
# Đưa dữ liệu vào #Table.bill 
INSERT INTO `BILL` VALUES (1,_binary '\0',_binary '\0',_binary '',current_timestamp);
#################################################