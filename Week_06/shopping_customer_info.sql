drop table shopping_customer_info;
CREATE TABLE `shopping_customer_info` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '���',
  `name` varchar(10) DEFAULT NULL COMMENT '����',
  `gender` varchar(10) DEFAULT NULL COMMENT '�Ա�',
  `phone` varchar(50) DEFAULT NULL COMMENT '�绰',
  `address` varchar(100) DEFAULT NULL COMMENT '��ַ',
  `photourl` varchar(100) DEFAULT NULL COMMENT 'ͷ��url',
  `status` varchar(10) DEFAULT NULL COMMENT '�û�״̬',
  `inputdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '��������',
  `updatedate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='�û���'