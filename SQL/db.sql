CREATE TABLE `t2_account` (
  `u_id` varchar(20) NOT NULL,
  `u_password` varchar(20) NOT NULL,
  `u_name` varchar(20) NOT NULL,
  `u_nickname` varchar(20) NOT NULL,
  `u_tel` varchar(20) NOT NULL,
  `u_email` varchar(50) NOT NULL,
  `u_address` varchar(50) NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changeDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`u_id`,`u_nickname`,`u_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `t2_image` (
  `board_idx` int NOT NULL,
  `img` varchar(100) NOT NULL,
  `thumbnail` varchar(10) DEFAULT NULL,
  `u_id` varchar(45) NOT NULL,
  PRIMARY KEY (`img`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `t2_message` (
  `m_no` int NOT NULL AUTO_INCREMENT,
  `u_sender` varchar(20) NOT NULL,
  `u_recipient` varchar(20) NOT NULL,
  `m_title` varchar(20) NOT NULL,
  `m_content` varchar(300) NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `u_id` varchar(45) NOT NULL,
  PRIMARY KEY (`m_no`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `t2_product` (
  `board_idx` int NOT NULL AUTO_INCREMENT,
  `b_title` varchar(50) NOT NULL,
  `b_content` text NOT NULL,
  `u_nickname` varchar(20) NOT NULL,
  `u_address` varchar(50) NOT NULL,
  `p_price` int NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changeDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `u_id` varchar(45) NOT NULL,
  PRIMARY KEY (`board_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `t_area` (
  `idx` int NOT NULL,
  `si` varchar(45) DEFAULT NULL,
  `gu` varchar(45) DEFAULT NULL,
  `dong` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `` (`u_id`,`u_password`,`u_name`,`u_nickname`,`u_tel`,`u_email`,`u_address`,`createDate`,`changeDate`) VALUES ('leele','1234','이레얀','테스트','01000000000','leele@lee.com','인천광역시 계양구 작전동','2023-03-05 21:28:16','2023-03-05 21:28:16');
INSERT INTO `` (`u_id`,`u_password`,`u_name`,`u_nickname`,`u_tel`,`u_email`,`u_address`,`createDate`,`changeDate`) VALUES ('leele2','1234','eee','test23','01000000000','leele2@lee.com','경상북도 영덕군 영덕읍','2023-03-05 22:59:50','2023-03-05 22:59:50');
INSERT INTO `` (`board_idx`,`img`,`thumbnail`,`u_id`) VALUES (223,'\\img\\292cb85e-5520-4904-82fd-1b5419916bce.avif','y','leele');
INSERT INTO `` (`board_idx`,`img`,`thumbnail`,`u_id`) VALUES (223,'\\img\\3447f53b-ac62-4c46-9546-125bbcf1ae7b.avif','n','leele');
INSERT INTO `` (`board_idx`,`img`,`thumbnail`,`u_id`) VALUES (225,'\\img\\614b8063-37c2-4332-8b7b-097cccc32b95.jpg','y','leele');
INSERT INTO `` (`m_no`,`u_sender`,`u_recipient`,`m_title`,`m_content`,`createDate`,`u_id`) VALUES (113,'test23','테스트','hello','hi','2023-03-05 23:00:59','leele2');
INSERT INTO `` (`board_idx`,`b_title`,`b_content`,`u_nickname`,`u_address`,`p_price`,`createDate`,`changeDate`,`u_id`) VALUES (223,'TEST01','TEST','테스트','서울특별시 종로구 청운동',5000,'2023-03-05 21:53:26','2023-03-05 21:53:26','leele');
INSERT INTO `` (`board_idx`,`b_title`,`b_content`,`u_nickname`,`u_address`,`p_price`,`createDate`,`changeDate`,`u_id`) VALUES (225,'test2','123','테스트','부산광역시 중구 영주동',50000,'2023-03-05 21:59:21','2023-03-05 21:59:21','leele');




