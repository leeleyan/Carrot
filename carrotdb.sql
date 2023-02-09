CREATE TABLE `t2_account` (
  `u_id` varchar(20) NOT NULL,
  `u_password` varchar(20) NOT NULL,
  `u_name` varchar(20) NOT NULL,
  `u_nickname` varchar(20) NOT NULL,
  `u_tel` varchar(20) NOT NULL,
  `u_email` varchar(50) NOT NULL,
  `u_address` varchar(50) NOT NULL,
  `createDate` date NOT NULL,
  `changeDate` date DEFAULT NULL,
  PRIMARY KEY (`u_id`,`u_nickname`,`u_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `t2_image` (
  `b_no` int NOT NULL,
  `p_image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `t2_message` (
  `m_no` int NOT NULL,
  `u_sender` varchar(20) NOT NULL,
  `u_recipient` varchar(20) NOT NULL,
  `m_title` varchar(20) NOT NULL,
  `m_content` text NOT NULL,
  `createDate` datetime NOT NULL,
  PRIMARY KEY (`m_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `t2_product` (
  `b_no` int NOT NULL AUTO_INCREMENT,
  `b_title` varchar(50) NOT NULL,
  `b_content` text NOT NULL,
  `u_nickname` varchar(20) NOT NULL,
  `u_address` varchar(50) NOT NULL,
  `p_price` int NOT NULL,
  `createDate` datetime NOT NULL,
  `changeDate` datetime DEFAULT NULL,
  PRIMARY KEY (`b_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

