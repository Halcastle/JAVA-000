# **2.（必做）**按自己设计的表结构，插入 100 万订单模拟数据，测试不同方式的插入效率



### 一万条数据
PreparedStatement：
2020-12-09 21:42:00.544 [http-nio-8080-exec-3] INFO  com.geekstudy.week7.controller.CommonController - -----------------开始插入-----------------
2020-12-09 21:49:11.002 [http-nio-8080-exec-3] INFO  com.geekstudy.week7.controller.CommonController - -----------------插入结束--------------

用时7min

Statement：
2020-12-09 21:59:02.587 [http-nio-8080-exec-1] INFO  com.geekstudy.week7.controller.CommonController - -----------------开始插入-----------------
2020-12-09 22:06:30.978 [http-nio-8080-exec-1] INFO  com.geekstudy.week7.controller.CommonController - -----------------插入结束--------------

用时7min

addBatch（2000条一提交）：
2020-12-09 22:09:11.582 [http-nio-8080-exec-1] INFO  com.geekstudy.week7.controller.CommonController - -----------------开始批量插入-----------------
2020-12-09 22:09:12.347 [http-nio-8080-exec-1] INFO  com.geekstudy.week7.controller.CommonController - -----------------批量插入结束--------------

用时1s

jpa.save()：

2020-12-09 22:20:49.254 [http-nio-8080-exec-1] INFO  com.geekstudy.week7.controller.CommonController - -----------------开始批量插入-----------------

2020-12-09 22:22:02.254 [http-nio-8080-exec-1] INFO  com.geekstudy.week7.controller.CommonController - 第1000行插入完成

推测一万行用时20min

jpa.saveall():

2020-12-09 22:32:18.102 [http-nio-8080-exec-1] INFO  com.geekstudy.week7.controller.CommonController - -----------------开始jpa插入-----------------
2020-12-09 22:32:20.632 [http-nio-8080-exec-1] INFO  com.geekstudy.week7.controller.CommonController - -----------------jpa插入结束--------------

用时2s

### 一百万条数据

addBatch（2000条一提交）：
2020-12-09 22:12:21.990 [http-nio-8080-exec-2] INFO  com.geekstudy.week7.controller.CommonController - -----------------开始批量插入-----------------
2020-12-09 22:13:15.877 [http-nio-8080-exec-2] INFO  com.geekstudy.week7.controller.CommonController - -----------------批量插入结束--------------

用时54s

jpa.saveall():

2020-12-09 22:33:15.737 [http-nio-8080-exec-1] INFO  com.geekstudy.week7.controller.CommonController - -----------------开始jpa插入-----------------
2020-12-09 22:36:37.623 [http-nio-8080-exec-1] INFO  com.geekstudy.week7.controller.CommonController - -----------------jpa插入结束--------------

用时3min22s

### 在数据库连接上增加&rewriteBatchedStatements=true属性，一百万条数据

addBatch（2000条一提交）：

2020-12-09 22:15:40.050 [http-nio-8080-exec-1] INFO  com.geekstudy.week7.controller.CommonController - -----------------开始批量插入-----------------
2020-12-09 22:16:38.950 [http-nio-8080-exec-1] INFO  com.geekstudy.week7.controller.CommonController - -----------------批量插入结束--------------

用时58s

jpa.saveall():

2020-12-09 22:37:57.916 [http-nio-8080-exec-1] INFO  com.geekstudy.week7.controller.CommonController - -----------------开始jpa插入-----------------
2020-12-09 22:41:30.882 [http-nio-8080-exec-1] INFO  com.geekstudy.week7.controller.CommonController - -----------------jpa插入结束--------------

用时3min33s



