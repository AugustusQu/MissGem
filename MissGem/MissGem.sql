/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.8.251
 Source Server Type    : MySQL
 Source Server Version : 50173
 Source Host           : 192.168.8.251
 Source Database       : MissGem

 Target Server Type    : MySQL
 Target Server Version : 50173
 File Encoding         : utf-8

 Date: 08/11/2017 16:18:47 PM
*/

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `add_friend_and_store`
-- ----------------------------
DROP TABLE IF EXISTS `add_friend_and_store`;
CREATE TABLE `add_friend_and_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_user_id` bigint(20) NOT NULL COMMENT '请求方ID（请求方可以是买家、卖家）',
  `receive_user_id` bigint(20) NOT NULL COMMENT '接收方ID（接收方可以是买家、卖家）',
  `sharing_friends` varchar(1024) DEFAULT NULL COMMENT '格式：[[<中间好友ID>, <请求方跟中间好友的关系枚举值>, <中间好友跟待添加某人的关系枚举值>]]，例如有2个好友：[[1001, 1, 2],[3002, 3,2]]',
  `why_add` varchar(255) DEFAULT NULL COMMENT '添加原因，特别是当没有任何中间好友时的补充说明',
  `op_ts` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
--  Table structure for `buyer`
-- ----------------------------
DROP TABLE IF EXISTS `buyer`;
CREATE TABLE `buyer` (
  `id` bigint(20) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `photo` varchar(255) DEFAULT NULL COMMENT '头像名称',
  `credit` int(11) DEFAULT NULL COMMENT '信任积分',
  `address` varchar(255) DEFAULT NULL COMMENT '送货地址',
  `favorite_cnt` int(11) DEFAULT NULL COMMENT '收藏数',
  `store_cnt` int(11) DEFAULT NULL COMMENT '关注店铺数',
  `friend_cnt` int(11) DEFAULT NULL COMMENT '好友数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
--  Table structure for `buyer_favorite`
-- ----------------------------
DROP TABLE IF EXISTS `buyer_favorite`;
CREATE TABLE `buyer_favorite` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `buyer_id` bigint(20) NOT NULL COMMENT '买家ID',
  `product_id` bigint(20) NOT NULL COMMENT '商品ID',
  `op_time` datetime NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `buyer_id` bigint(20) DEFAULT NULL COMMENT '买家ID',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品ID',
  `product_cnt` int(11) DEFAULT NULL COMMENT '产品数量',
  `seller_id` bigint(20) DEFAULT NULL COMMENT '卖家ID',
  `seller_nickname` varchar(255) DEFAULT NULL COMMENT '卖家昵称',
  `seller_photo` varchar(255) DEFAULT NULL COMMENT '卖家头像',
  `is_group_buy` varchar(255) DEFAULT NULL COMMENT '是否团购',
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
  `buyer_id` bigint(20) DEFAULT NULL COMMENT '买家ID',
  `seller_id` bigint(20) DEFAULT NULL COMMENT '卖家ID',
  `notification_type` tinyint(4) DEFAULT NULL COMMENT '物流助手、平台活动、交易消息、交易返利',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品ID',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单ID',
  `friend_id` bigint(20) DEFAULT NULL COMMENT '好友ID',
  `credit` int(11) DEFAULT NULL COMMENT '返利积分',
  `op_time` datetime DEFAULT NULL COMMENT '发生时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `buyer_id` bigint(20) DEFAULT NULL COMMENT '买家ID',
  `seller_id` bigint(20) DEFAULT NULL COMMENT '卖家ID',
  `store_name` varchar(255) DEFAULT NULL COMMENT '店铺名称',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品ID',
  `product_pic` varchar(255) DEFAULT NULL COMMENT '产品图片，1张',
  `order_status` varchar(255) DEFAULT NULL COMMENT '订单状态，enum OrderStatus {     ALL = 0; // 全部订单     TO_BE_PAID = 1; // 待付款     TO_BE_DELIVERED = 2; // 待发货     TO_BE_RECEIVED = 3; // 待收货     TO_BE_REVIEWED = 4; // 待评价     REFUND = 5; // 退款 }\n',
  `transaction_status` varchar(255) DEFAULT NULL COMMENT '交易状态，enum TransactionStatus {     PROCESSING = 0;// 交易进行     SUCCESS = 1; // 交易成功     COMMENTED = 2;// 交易已评价     CLOSED = 3;//交易关闭     REFUND_SUCCESS = 4; //退款成功 }\n',
  `product_head` varchar(255) DEFAULT NULL COMMENT '产品标题',
  `product_price` int(11) DEFAULT NULL COMMENT '产品价格。货币单位：分',
  `product_cnt` int(11) DEFAULT NULL COMMENT '产品数量',
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
  `seller_id` bigint(20) DEFAULT NULL COMMENT '卖家ID',
  `product_intro` varchar(255) DEFAULT NULL COMMENT '产品概要描述',
  `product_pic` varchar(255) DEFAULT NULL COMMENT '产品图片，最多9张，格式：[<图片1>,<图片2>,...]',
  `favorite_num` int(11) DEFAULT NULL COMMENT '收藏数',
  `sales_num` int(11) DEFAULT NULL COMMENT '销量数',
  `good_review_num` int(11) DEFAULT NULL COMMENT '好评数',
  `price` int(11) DEFAULT NULL COMMENT '零售价格，仅显示给成员买家，非成员不显示。货币单位：分',
  `promotion_price` int(11) DEFAULT NULL,
  `group_buying_price` int(11) DEFAULT NULL,
  `spike_price` int(11) DEFAULT NULL,
  `manufacturer` varchar(255) DEFAULT NULL COMMENT '生产商信息',
  `manufacturer_logo` varchar(255) DEFAULT NULL COMMENT '生产商Logo',
  `product_tag` varchar(255) DEFAULT NULL COMMENT '热销1、新品2',
  `add_time` datetime DEFAULT NULL COMMENT '上架时间',
  `valid` bit(1) DEFAULT NULL COMMENT '是否下架',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `product_comment`
-- ----------------------------
DROP TABLE IF EXISTS `product_comment`;
CREATE TABLE `product_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `star_num` varchar(255) DEFAULT NULL COMMENT '星级打分1-5，仅允许成交买家填写此项',
  `user_id` bigint(20) DEFAULT NULL COMMENT '发出评论的用户ID，仅允许成功交易买家、卖家',
  `user_nickname` varchar(255) DEFAULT NULL COMMENT '发出评论的用户昵称',
  `comment` varchar(255) DEFAULT NULL COMMENT '评论',
  `replied_user_id` int(11) DEFAULT NULL COMMENT '被回复的用户ID',
  `replied_user_nickname` varchar(255) DEFAULT NULL COMMENT '被回复的用户昵称',
  `op_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `seller`
-- ----------------------------
DROP TABLE IF EXISTS `seller`;
CREATE TABLE `seller` (
  `id` bigint(20) NOT NULL COMMENT '卖家ID',
  `nickname` varchar(255) DEFAULT NULL COMMENT '卖家昵称',
  `store_id` int(11) DEFAULT NULL COMMENT '店铺ID',
  `store_name` varchar(255) DEFAULT NULL COMMENT '店铺名称',
  `photo` varchar(255) DEFAULT NULL COMMENT '卖家/店铺头像url (店主和店铺的头像相同)',
  `product_num` int(11) DEFAULT NULL COMMENT '单品数',
  `good_review_num` int(11) DEFAULT NULL COMMENT '好评数',
  `transaction_num` int(11) DEFAULT NULL COMMENT '交易数',
  `seller_store_intro` varchar(255) DEFAULT NULL COMMENT '卖家店铺简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



SET FOREIGN_KEY_CHECKS = 1;
