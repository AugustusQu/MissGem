/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.8.251
 Source Server Type    : MySQL
 Source Server Version : 50173
 Source Host           : 192.168.8.251
 Source Database       : MissGem

 Target Server Type    : MySQL
 Target Server Version : 5.7.20
 File Encoding         : utf-8

 Date: 08/11/2017 16:18:47 PM
*/

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `app_install_info`
-- ----------------------------
DROP TABLE IF EXISTS `app_install_info`;
CREATE TABLE `app_install_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mobile_num` varchar(11) NOT NULL COMMENT '手机号码（TODO 微信登录）',
  `per_install_uuid` varchar(255) NOT NULL COMMENT '每安装的UUID',
  `first_login_time` datetime NOT NULL COMMENT '首次登录时间，动态ticket鉴权需要',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- ----------------------------
--  Table structure for `column`
-- ----------------------------
DROP TABLE IF EXISTS `column`;
CREATE TABLE `column` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `column_types` varchar(255) DEFAULT NULL COMMENT '专栏类型，enum ColumnTypes {     INTRODUCTION = 0;// APP产品及模式介绍     HOWITWORKS = 1; // 证书及APP用法玩法介绍     TENDYTOPICSFASHIONSHOW = 2;// 潮流展示     OWNPRODUCTRECOMMENDATIONS = 3;//自有产品推荐     SCENE = 4; //场景 }\n',
  `column_items` varchar(255) NOT NULL COMMENT '专栏内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
--  Table structure for `column_item`
-- ----------------------------
DROP TABLE IF EXISTS `column_item`;
CREATE TABLE `column` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `column_pic` varchar(255) DEFAULT NULL COMMENT '专栏图片，1张',
  `column_title` varchar(255) NOT NULL COMMENT '专栏标题',
  `column_subtitle` varchar(255) NOT NULL COMMENT '专栏子标题',
  `column_url` varchar(255) NOT NULL COMMENT '专栏网页地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `renter`
-- ----------------------------
DROP TABLE IF EXISTS `renter`;
CREATE TABLE `renter` (
  `id` bigint(20) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `photo` varchar(255) DEFAULT NULL COMMENT '头像名称',
  `credit` int(11) DEFAULT NULL COMMENT '信任积分',
  `address` varchar(255) DEFAULT NULL COMMENT '送货地址',
  `favorite_cnt` int(11) DEFAULT NULL COMMENT '收藏数',
  `merchant_cnt` int(11) DEFAULT NULL COMMENT '关注店铺数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
--  Table structure for `renter_favorite`
-- ----------------------------
DROP TABLE IF EXISTS `renter_favorite`;
CREATE TABLE `renter_favorite` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `renter_id` bigint(20) NOT NULL COMMENT '租客ID',
  `product_id` bigint(20) NOT NULL COMMENT '商品ID',
  `op_time` datetime NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jewel_box`
-- ----------------------------
DROP TABLE IF EXISTS `jewel_box`;
CREATE TABLE `jewel_box` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `renter_id` bigint(20) DEFAULT NULL COMMENT '租客ID',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品ID',
  `product_cnt` int(11) DEFAULT NULL COMMENT '产品数量',
  `merchant_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `merchant_nickname` varchar(255) DEFAULT NULL COMMENT '商家昵称',
  `merchant_photo` varchar(255) DEFAULT NULL COMMENT '商家头像',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `login_mobile_verify_code`
-- ----------------------------
DROP TABLE IF EXISTS `login_mobile_verify_code`;
CREATE TABLE `login_mobile_verify_code` (
  `id` int(11) NOT NULL,
  `mobile_num` varchar(11) NOT NULL COMMENT '手机号码（TODO 微信登录）',
  `verify_code` smallint(4) NOT NULL COMMENT '手机短信验证码，4位数字',
  `op_time` datetime NOT NULL COMMENT '短信发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `message_notification`
-- ----------------------------
DROP TABLE IF EXISTS `message_notification`;
CREATE TABLE `message_notification` (
  `id` bigint(20) NOT NULL,
  `renter_id` bigint(20) DEFAULT NULL COMMENT '租客ID',
  `merchant_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `notification_type` tinyint(4) DEFAULT NULL COMMENT '物流助手、交易消息',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品ID',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单ID',
  `op_time` datetime DEFAULT NULL COMMENT '发生时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `renter_id` bigint(20) DEFAULT NULL COMMENT '租客ID',
  `merchant_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `store_name` varchar(255) DEFAULT NULL COMMENT '店铺名称',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品ID',
  `product_pic` varchar(255) DEFAULT NULL COMMENT '产品图片，1张',
  `order_status` varchar(255) DEFAULT NULL COMMENT '订单状态，enum OrderStatus {     ALL = 0; // 全部订单     TO_BE_PAID = 1; // 待付款     TO_BE_DELIVERED = 2; // 待发货     TO_BE_RECEIVED = 3; // 待收货     TO_BE_REVIEWED = 4; // 待评价     REFUND = 5; // 退款 }\n',
  `transaction_status` varchar(255) DEFAULT NULL COMMENT '交易状态，enum TransactionStatus {     PROCESSING = 0;// 交易进行     SUCCESS = 1; // 交易成功     COMMENTED = 2;// 交易已评价     CLOSED = 3;//交易关闭     REFUND_SUCCESS = 4; //退还成功 }\n',
  `product_cnt` int(11) DEFAULT NULL COMMENT '产品数量，合租的为三个商品，单品的只能一个',
  `product_price_total` int(11) DEFAULT NULL COMMENT '合计（含运费）',
  `product_shipping` int(11) DEFAULT NULL COMMENT '运费',
  `logistics_info` varchar(255) DEFAULT NULL COMMENT '物流信息',
  `pickup_name` varchar(255) DEFAULT NULL COMMENT '收货人',
  `pickup_phone_num` int(11) DEFAULT NULL COMMENT '收货人电话',
  `pickup_address` varchar(255) DEFAULT NULL COMMENT '收货人地址',
  `pay_tx_id` int(11) DEFAULT NULL COMMENT '支付交易号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `paid_time` datetime DEFAULT NULL COMMENT '付款时间',
  `delivery_time` datetime DEFAULT NULL COMMENT '发货时间',
  `close_deal_time` datetime DEFAULT NULL COMMENT '成交时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- ----------------------------
--  Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '产品ID',
  `product_title` varchar(255) DEFAULT NULL COMMENT '产品标题',
  `product_types` varchar(255) DEFAULT NULL COMMENT '产品类型，enum ProductTypes {     COMBINE = 0;// 合租商品     SINGLE = 1; // 单品    CUSTOMIZED = 2;//定制饰品 }\n',
  `merchant_id` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `product_intro` varchar(255) DEFAULT NULL COMMENT '产品概要描述',
  `product_pic` varchar(255) DEFAULT NULL COMMENT '产品图片，最多9张，格式：[<图片1>,<图片2>,...]',
  `market_price` int(11) DEFAULT NULL COMMENT '市场参考价格。货币单位：分',
  `price` int(11) DEFAULT NULL COMMENT '日租价格/参考价格。货币单位：分',
  `promotion_price` int(11) DEFAULT NULL  COMMENT '促销日租价格。货币单位：分',
  `size_id` bigint(20) DEFAULT NULL COMMENT '商品尺码规格ID',
  `my_size_id` bigint(20) DEFAULT NULL COMMENT '我的尺码规格ID',
  `lease_inception` datetime DEFAULT NULL COMMENT '起租日',
  `appointment_return_time` datetime DEFAULT NULL COMMENT '预约返还时间',
  `style_info` varchar(255) DEFAULT NULL COMMENT '商品风格类型信息',
  `manufacturer` varchar(255) DEFAULT NULL COMMENT '生产商信息',
  `color` varchar(255) DEFAULT NULL COMMENT '颜色',
  `material_info` varchar(255) DEFAULT NULL COMMENT '材质信息',
  `manufacturer_logo` varchar(255) DEFAULT NULL COMMENT '生产商Logo',
  `product_tag` varchar(255) DEFAULT NULL COMMENT '合租商品1、单品2',
  `add_time` datetime DEFAULT NULL COMMENT '上架时间',
  `valid` bit(1) DEFAULT NULL COMMENT '是否下架',
  `support_installment_payment`  bit(1) DEFAULT NULL COMMENT '是否支持分期付款',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
--  Table structure for `size`
-- ----------------------------
DROP TABLE IF EXISTS `size`;
CREATE TABLE `size` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '尺码ID',
  `product_info` varchar(255) DEFAULT NULL COMMENT '尺码信息描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
--  Table structure for `product_comment`
-- ----------------------------
DROP TABLE IF EXISTS `product_comment`;
CREATE TABLE `product_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `star_num` varchar(255) DEFAULT NULL COMMENT '星级打分1-5，仅允许成交租客填写此项',
  `user_id` bigint(20) DEFAULT NULL COMMENT '发出评论的用户ID，仅允许成功交易租客、商家',
  `user_nickname` varchar(255) DEFAULT NULL COMMENT '发出评论的用户昵称',
  `comment` varchar(255) DEFAULT NULL COMMENT '评论',
  `replied_user_id` int(11) DEFAULT NULL COMMENT '被回复的用户ID',
  `replied_user_nickname` varchar(255) DEFAULT NULL COMMENT '被回复的用户昵称',
  `op_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `merchant`
-- ----------------------------
DROP TABLE IF EXISTS `merchant`;
CREATE TABLE `merchant` (
  `id` bigint(20) NOT NULL COMMENT '商家ID',
  `store_id` int(11) DEFAULT NULL COMMENT '店铺ID',
  `store_name` varchar(255) DEFAULT NULL COMMENT '店铺名称',
  `photo` varchar(255) DEFAULT NULL COMMENT '商家/店铺头像url (店主和店铺的头像相同)',
  `product_num` int(11) DEFAULT NULL COMMENT '单品数',
  `good_review_num` int(11) DEFAULT NULL COMMENT '好评数',
  `transaction_num` int(11) DEFAULT NULL COMMENT '交易数',
  `merchant_store_intro` varchar(255) DEFAULT NULL COMMENT '商家店铺简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



SET FOREIGN_KEY_CHECKS = 1;
