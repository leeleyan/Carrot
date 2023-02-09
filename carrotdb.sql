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


CREATE TABLE `t2_message` (
  `m_no` int NOT NULL,
  `u_sender` varchar(20) NOT NULL,
  `u_recipient` varchar(20) NOT NULL,
  `m_title` varchar(20) NOT NULL,
  `m_content` text NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`m_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `t2_product` (
  `b_no` int NOT NULL AUTO_INCREMENT,
  `b_title` varchar(50) NOT NULL,
  `b_content` text NOT NULL,
  `u_nickname` varchar(20) NOT NULL,
  `u_address` varchar(50) NOT NULL,
  `p_price` int NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changeDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`b_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `t2_image` (
  `b_no` int NOT NULL,
  `p_image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO t2_account (u_id, u_password, u_name, u_nickname, u_tel, u_email, u_address)
VALUES ('id', 'pwd', 'name', 'nick', '0102222', 'mail@mail.com', 'address');
