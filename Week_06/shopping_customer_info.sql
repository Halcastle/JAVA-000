drop table shopping_customer_info;
CREATE TABLE `shopping_customer_info` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(10) DEFAULT NULL COMMENT '姓名',
  `gender` varchar(10) DEFAULT NULL COMMENT '性别',
  `phone` varchar(50) DEFAULT NULL COMMENT '电话',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `photourl` varchar(100) DEFAULT NULL COMMENT '头像url',
  `status` varchar(10) DEFAULT NULL COMMENT '用户状态',
  `inputdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入日期',
  `updatedate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表'