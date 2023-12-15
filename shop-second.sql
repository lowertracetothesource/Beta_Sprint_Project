/*
 Navicat Premium Data Transfer

 Source Server         : localhost5.7
 Source Server Type    : MySQL
 Source Server Version : 50710
 Source Host           : localhost:3306
 Source Schema         : shop-second

 Target Server Type    : MySQL
 Target Server Version : 50710
 File Encoding         : 65001

 Date: 12/12/2023 21:31:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '发布人id',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '分类id',
  `type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '0:闲置 1：求购',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '商品名称',
  `goods_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '简介',
  `goods_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `user_name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '联系人',
  `phone` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '联系电话',
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '图片',
  `wx_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '微信号',
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0:上架 1：下架',
  `sell_status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0:未出售 1：已出售',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `set_index` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0:未推荐 1：推荐到首页',
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '发布/求购地址',
  `delete_status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0:未删除 1：删除',
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (63, 4, 9, '0', '雅迪电动车', '出去实习一个学期，暂且不用', 700.00, '花枝鼠', '15699993210', 'http://localhost:8089/images/6fb272f5-0e88-4acf-8abc-20717c80cb8e.jpg', 'v123', '0', '1', '2023-11-25 20:47:50', '0', '无', '0');
INSERT INTO `goods` VALUES (64, 4, 9, '1', '求出租桌子', '用来打三国杀', 10, '生活一区', '100865772', '', 'v123', '0', '0', '2023-11-26 22:19:26', '0', '没啥说的', '1');
INSERT INTO `goods` VALUES (65, 4, 13, '0', '民国历史剧剧组服装', '社团闲置', 150.00, '吴同学', '18956234578', 'http://192.168.1.4:8089/images/0c8b61d4-cd4a-427e-9bc7-fe882c93676e.webp', 'vx09876', '0', '1', '2023-11-26 23:39:39', '0', '无', '0');
INSERT INTO `goods` VALUES (66, 5, 13, '0', '金丝熊', '最近没空养，有人能帮养一段时间吗', 0, '鼠鼠主人', '1523698745', 'http://192.168.1.4:8089/images/3d5c79d0-7cdd-4a30-bebf-797b53a9a056.jpg', 'V_0987', '0', '0', '2023-11-28 22:02:17', '1', '无', '0');
INSERT INTO `goods` VALUES (67, 5, 13, '0', '中国近代史（附笔记版）', '附带2023年的历史重点，可租可售', 10, 'Jie', '0000000', 'http://192.168.1.4:8089/images/f24c9872-1488-4101-9a78-54f70952b9db.gif', '0000000', '0', '0', '2023-11-28 22:06:06', '1', '无', '0');
INSERT INTO `goods` VALUES (93, 7, 9, '0', '还不错的商品', '很好', 99.00, '5', '5', 'http://192.168.1.4:8089/images/2d6c8bbc-49c2-482a-9380-2f3f2b86f869.webp', '5', '0', '1', '2023-11-30 21:06:13', '0', '5', '0');

-- ----------------------------
-- Table structure for goods_cart
-- ----------------------------
DROP TABLE IF EXISTS `goods_cart`;
CREATE TABLE `goods_cart`  (
  `user_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `create_time` datetime NULL DEFAULT NULL COMMENT '购物车添加时间',
  PRIMARY KEY (`user_id`, `goods_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_cart
-- ----------------------------

-- ----------------------------
-- Table structure for goods_category
-- ----------------------------
DROP TABLE IF EXISTS `goods_category`;
CREATE TABLE `goods_category`  (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '名称',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '序号',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_category
-- ----------------------------
INSERT INTO `goods_category` VALUES (9, '数码设备', 1);
INSERT INTO `goods_category` VALUES (10, '衣服鞋饰', 2);
INSERT INTO `goods_category` VALUES (11, '电器', 3);
INSERT INTO `goods_category` VALUES (12, '食品', 4);
INSERT INTO `goods_category` VALUES (13, '其它', 5);

-- ----------------------------
-- Table structure for goods_collect
-- ----------------------------
DROP TABLE IF EXISTS `goods_collect`;
CREATE TABLE `goods_collect`  (
  `collect_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `collect_time` datetime NULL DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`collect_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_collect
-- ----------------------------
INSERT INTO `goods_collect` VALUES (32, 4, 66, '2023-11-28 22:18:33');
INSERT INTO `goods_collect` VALUES (34, 7, 65, '2023-11-30 21:06:42');

-- ----------------------------
-- Table structure for goods_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `goods_evaluate`;
CREATE TABLE `goods_evaluate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `goods_id` int(11) NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_evaluate
-- ----------------------------
INSERT INTO `goods_evaluate` VALUES (2, 7, 67, '官方商品，不要修改', '2023-11-30 21:04:21');
INSERT INTO `goods_evaluate` VALUES (4, 7, 65, '不错', '2023-11-30 21:06:34');

-- ----------------------------
-- Table structure for goods_order
-- ----------------------------
DROP TABLE IF EXISTS `goods_order`;
CREATE TABLE `goods_order`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `sell_user_id` int(11) NULL DEFAULT NULL COMMENT '出租人id',
  `order_user` int(11) NULL DEFAULT NULL COMMENT '下单人id',
  `order_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `order_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `order_user_mobie` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `order_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单金额',
  `create_time` datetime NULL DEFAULT NULL COMMENT '下单时间',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `pay_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'zfb：支付宝，wx：微信',
  `evaluate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '物品评价',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_order
-- ----------------------------
INSERT INTO `goods_order` VALUES (20, 63, 4, 5, 'root2', 'huarun', '1500000000', '2', 2000.00, '2023-11-26 23:19:58', '2023-11-26 23:19:58', 'zfb', NULL);
INSERT INTO `goods_order` VALUES (22, 65, 4, 7, 'root4', '送宿舍楼下', '11111111111', '4', 200000.00, '2023-11-30 21:12:13', '2023-11-30 21:12:13', 'wx', '还不错啊');
INSERT INTO `goods_order` VALUES (23, 93, 7, 4, 'root', '很好', '15262222222', '1', 99.00, '2023-11-30 21:15:54', '2023-11-30 21:15:54', 'wx', NULL);

-- ----------------------------
-- Table structure for goods_report
-- ----------------------------
DROP TABLE IF EXISTS `goods_report`;
CREATE TABLE `goods_report`  (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `report_user` int(255) NULL DEFAULT NULL COMMENT '举报人id',
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '举报原因',
  `report_time` datetime NULL DEFAULT NULL COMMENT '举报时间',
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0:未处理 1：已处理',
  PRIMARY KEY (`report_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_report
-- ----------------------------

-- ----------------------------
-- Table structure for sys_banner
-- ----------------------------
DROP TABLE IF EXISTS `sys_banner`;
CREATE TABLE `sys_banner`  (
  `ban_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '标题',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '图片路径',
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '0:上架  1：下架',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '序号',
  PRIMARY KEY (`ban_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_banner
-- ----------------------------
INSERT INTO `sys_banner` VALUES (5, 67, '秋季商品上新', 'http://localhost:8089/images/f6bfaf18-1c17-4ed7-8eb8-86920aa35041.gif', '0', 1);
INSERT INTO `sys_banner` VALUES (6, 66, '二手商城震撼来袭', 'http://localhost:8089/images/ad06201f-9e6a-4741-99a7-006bcc7dca92.jpg', '0', 2);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '上级id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '菜单名称',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '权限字段',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '图标',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '序号',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `parent_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '上级菜单名称',
  `type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '1:菜单 2：按钮',
  `path` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '路由名称',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (29, 0, '首页', 'sys:home', 'House', 1, '2023-07-17 09:53:57', '顶级菜单', '1', '/home');
INSERT INTO `sys_menu` VALUES (31, 0, '管理员管理', 'sys:adminUser', 'UserFilled', 2, '2023-07-17 10:58:30', '顶级菜单', '1', '/adminUser');
INSERT INTO `sys_menu` VALUES (32, 0, '用户管理', 'sys:userList', 'Wallet', 3, '2023-07-17 10:59:04', '顶级菜单', '1', '/userList');
INSERT INTO `sys_menu` VALUES (33, 0, '菜单管理', 'sys:menuList', 'Menu', 4, '2023-07-17 11:00:10', '顶级菜单', '1', '/menuList');
INSERT INTO `sys_menu` VALUES (34, 31, '新增', 'sys:adminUser:add', '', 1, '2023-07-17 11:12:03', '管理员管理', '2', '');
INSERT INTO `sys_menu` VALUES (35, 32, '重置密码', 'sys:userList:reset', '', 1, '2023-07-17 11:12:32', '用户管理', '2', '');
INSERT INTO `sys_menu` VALUES (39, 0, '商品分类', 'sys:goodsType', 'UserFilled', 5, '2023-07-20 10:13:00', '顶级菜单', '1', '/goodsType');
INSERT INTO `sys_menu` VALUES (40, 0, '商品管理', 'sys:unusedList', 'Memo', 6, '2023-07-20 10:13:42', '顶级菜单', '1', '/unusedList');
INSERT INTO `sys_menu` VALUES (41, 0, '订单管理', 'sys:unusedOrder', 'Monitor', 7, '2023-07-20 10:14:39', '顶级菜单', '1', '/unusedOrder');
INSERT INTO `sys_menu` VALUES (42, 0, '广告管理', 'sys:bannerList', 'Calendar', 8, '2023-07-20 10:16:09', '顶级菜单', '1', '/bannerList');
INSERT INTO `sys_menu` VALUES (43, 33, '新增', 'sys:menuList:add', '', 1, '2023-07-20 10:16:41', '菜单管理', '2', '');
INSERT INTO `sys_menu` VALUES (44, 33, '编辑', 'sys:menuList:edit', '', 2, '2023-07-20 10:17:00', '菜单管理', '2', '');
INSERT INTO `sys_menu` VALUES (45, 33, '删除', 'sys:menuList:delete', '', 3, '2023-07-20 10:17:23', '菜单管理', '2', '');
INSERT INTO `sys_menu` VALUES (46, 39, '新增', 'sys:goodsType:add', '', 1, '2023-07-20 10:17:43', '商品分类', '2', '');
INSERT INTO `sys_menu` VALUES (47, 39, '编辑', 'sys:goodsType:edit', '', 2, '2023-07-20 10:18:01', '商品分类', '2', '');
INSERT INTO `sys_menu` VALUES (48, 42, '新增', 'sys:bannerList:add', '', 1, '2023-07-20 10:18:24', '广告管理', '2', '');
INSERT INTO `sys_menu` VALUES (49, 42, '编辑', 'sys:bannerList:edit', '', 2, '2023-07-20 10:18:44', '广告管理', '2', '');
INSERT INTO `sys_menu` VALUES (50, 40, '删除', 'sys:unusedList:delete', '', 1, '2023-07-20 10:19:08', '商品管理', '2', '');
INSERT INTO `sys_menu` VALUES (51, 31, '编辑', 'sys:adminUser:edit', '', 2, '2023-08-25 08:54:40', '管理员管理', '2', '');
INSERT INTO `sys_menu` VALUES (52, 31, '删除', 'sys:adminUser:delete', '', 3, '2023-08-25 08:55:00', '管理员管理', '2', '');
INSERT INTO `sys_menu` VALUES (53, 31, '分配菜单', 'sys:adminUser:assign', '', 4, '2023-08-25 08:55:34', '管理员管理', '2', '');
INSERT INTO `sys_menu` VALUES (54, 32, '删除', 'sys:userList:delete', '', 2, '2023-08-25 08:57:25', '用户管理', '2', '');
INSERT INTO `sys_menu` VALUES (56, 39, '删除', 'sys:goodsType:delete', '', 3, '2023-08-25 08:58:22', '商品分类', '2', '');
INSERT INTO `sys_menu` VALUES (57, 42, '删除', 'sys:bannerList:delete', '', 3, '2023-08-25 08:59:02', '广告管理', '2', '');
INSERT INTO `sys_menu` VALUES (59, 0, '投诉管理', 'sys:report:list', 'Edit', 9, '2023-08-25 10:29:29', '顶级菜单', '1', '/report');
INSERT INTO `sys_menu` VALUES (60, 59, '处理', 'sys:report:do', '', 1, '2023-08-25 10:29:56', '投诉管理', '2', '');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '登录账户',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '登录密码',
  `nick_name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '电话',
  `sex` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '性别',
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '状态 0：启用 1：停用',
  `is_admin` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否是超级管理员 0：否 1：是',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '超级管理员', '***********', '0', '0', '1');

-- ----------------------------
-- Table structure for user_menu
-- ----------------------------
DROP TABLE IF EXISTS `user_menu`;
CREATE TABLE `user_menu`  (
  `user_menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `menu_id` int(11) NULL DEFAULT NULL COMMENT '菜单id',
  PRIMARY KEY (`user_menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_menu
-- ----------------------------
INSERT INTO `user_menu` VALUES (18, 3, 39);
INSERT INTO `user_menu` VALUES (19, 3, 46);
INSERT INTO `user_menu` VALUES (20, 3, 47);
INSERT INTO `user_menu` VALUES (21, 3, 42);
INSERT INTO `user_menu` VALUES (22, 3, 48);
INSERT INTO `user_menu` VALUES (23, 3, 49);
INSERT INTO `user_menu` VALUES (34, 2, 29);
INSERT INTO `user_menu` VALUES (35, 2, 51);
INSERT INTO `user_menu` VALUES (36, 2, 52);
INSERT INTO `user_menu` VALUES (37, 2, 35);
INSERT INTO `user_menu` VALUES (38, 2, 54);
INSERT INTO `user_menu` VALUES (39, 2, 33);
INSERT INTO `user_menu` VALUES (40, 2, 43);
INSERT INTO `user_menu` VALUES (41, 2, 44);
INSERT INTO `user_menu` VALUES (42, 2, 45);
INSERT INTO `user_menu` VALUES (43, 2, 31);
INSERT INTO `user_menu` VALUES (44, 2, 32);

-- ----------------------------
-- Table structure for wx_user
-- ----------------------------
DROP TABLE IF EXISTS `wx_user`;
CREATE TABLE `wx_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '昵称',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '姓名',
  `picture` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '头像',
  `phone` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '电话',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '登录账户',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '密码',
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0：启用 1：停用',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wx_user
-- ----------------------------
INSERT INTO `wx_user` VALUES (1, 'user1', 'user1', 'http://192.168.31.70:8089/images/81b92f41-1efe-46dc-9dea-2c78ea94475a.jpeg', '***********', 'root2', 'e10adc3949ba59abbe56e057f20f883e', '0');
INSERT INTO `wx_user` VALUES (4, '电弧星', '富二代', 'http://192.168.1.4:8089/images/f902a986-77a6-4be2-b3ad-9373c2334c9c.webp', '15262222222', 'root', 'e10adc3949ba59abbe56e057f20f883e', '0');
INSERT INTO `wx_user` VALUES (5, 'admin', 'admin', 'http://192.168.1.4:8089/images/f902a986-77a6-4be2-b3ad-9373c2334c9c.webp', '11111111111', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '0');
INSERT INTO `wx_user` VALUES (6, NULL, NULL, NULL, '15236995632', 'root3', 'e10adc3949ba59abbe56e057f20f883e', '0');
INSERT INTO `wx_user` VALUES (7, '冰茶几', '还好', 'http://192.168.1.4:8089/images/cd4796c9-4f4e-4833-b447-f0d01aaaf796.png', '11111111111', 'root4', 'e10adc3949ba59abbe56e057f20f883e', '0');

SET FOREIGN_KEY_CHECKS = 1;
