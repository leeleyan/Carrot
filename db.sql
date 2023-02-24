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
