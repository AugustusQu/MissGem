//
//  GEMNotificationString.h
//  MissGem
//
//  Created by Augustus on 08/11/2017.
//  Copyright © 2017 Augustus. All rights reserved.
//

#import <Foundation/Foundation.h>

// 应用程序的逻辑错误 object: [NSNumber numberWithLongLong:errorCode]
extern NSString * const kAGTNotification_AppErrorCode;

// 需要loading的request
extern NSString * const kAGTNotification_SendRequestWithLoading;
extern NSString * const kAGTNotification_ReceiveResponseCancelLoading;

// 请求超时

// 刷新登录成功后的广播（不是用手机号登录成功)
extern NSString * const kAGTNotification_RefreshLoginSuccess;
// 手机号登录成功
extern NSString * const kAGTNotification_LoginViaMobileSuccess;
// 登出成功
extern NSString * const kAGTNotification_LogoutSuccess;

// 订单状态变更, object: TIDOrderStatusAndTransactionStatus
extern NSString * const kAGTNotificaiton_OrderStatusChange;

// 订单商品的退款信息发生了变更，
// userInfo: { kAGTUserInfoKey_OrderItemReturnStatusChange: TIDOrderItemReturnStatusChange,
//                      kAGTUserInfoKey_OrderStatusAndTransactionStatus : TIDOrderStatusAndTransactionStatus }
// note 如果该key对应的状态没有变化时 userInfo 中的value可能为nil，
extern NSString * const kAGTNotificaiton_OrderItemReturnStatusChange;
extern NSString * const kAGTUserInfoKey_OrderItemReturnStatusChange;
extern NSString * const kAGTUserInfoKey_OrderStatusAndTransactionStatus;
extern NSString * const kAGTUserInfoKey_OrderInWhichStore;
// 提交订单, object: nil
extern NSString * const kAGTNotificaiton_placeOrder;

// 订单删除, object: [NSNumber numberWithInteger:orderId]
extern NSString * const kAGTNotification_OrderDeletion;

// 订单物流发出了 object: TIDBConfirmDeliveredReq
extern NSString * const kAGTNotificaiton_OrderDelivered;

// 创建了一个店铺 object: TIDBCreateStoreResp
extern NSString * const kAGTNotification_CreateStore;

// 商品加入了购物车 object: TIDCartStoreItemInfo
extern NSString * const kAGTNotification_AddToCart;

//别人请求添加我好友通知 object: TIDRequestAddFriendMessageInfo
extern NSString * const kAGTNotificationOtherRequestAddMeFriendSuccess;
//别人回复添加我为好友通知 object: TIDReplayAddFriendNotifyResp
extern NSString * const kAGTNotificationOtherReplayAddMeFriendSuccess;
//别人删除我好友通知 object: userId's NSNumber
extern NSString * const kAGTNotificationOtherDeleteMeFriendSuccess;


//我请求添加别人好友通知 object: TIDRequestAddFriendMessageInfo
extern NSString * const kAGTNotificationMeRequestAddOtherFriendSuccess;
//我同意添加别人为好友通知 object:TIDReplyAddFriendResp
extern NSString * const kAGTNotificationMeReplayAddOtherFriendSuccess;

//我同意添加别人为好友通知 object: nil
extern NSString * const kAGTNotificationMeReplayAddOtherFriendFail;

//我删除别人好友通知 object: userId's NSNumber
extern NSString * const kAGTNotificationMeDeleteOtherFriendSuccess;

//别人请求关注我的店铺通知
extern NSString * const kAGTNotificationOtherRequestAddMeStoreSuccess;
//别人回复添加我的店铺通知
extern NSString * const kAGTNotificationOtherReplayAddMeStoreSuccess;
//别人删除关注我的店铺通知
extern NSString * const kAGTNotificationOtherDeleteMeStoreSuccess;


//我请求关注别人的店铺通知
extern NSString * const kAGTNotificationMeRequestAddOtherStoreSuccess;
//我同意回复添加别人的店铺通知
extern NSString * const kAGTNotificationMeReplayAddOtherStoreSuccess;


//我拒绝回复添加别人的店铺通知
extern NSString * const kAGTNotificationMeReplayAddOtherStoreFail;

//我删除关注别人店铺通知
extern NSString * const kAGTNotificationMeDeleteOtherStoreSuccess;

//我定时更新添加好友店铺请求通知
extern NSString * const kAGTNotificationMeGetRequestAddFriendsAndStoreOnTime;

//我修改年龄成功
extern NSString * const kAGTNotificationMeSetMyAgeSuccess;

//我修改地区成功
extern NSString * const kAGTNotificationMeSetMyAreaSuccess;

//我修改我的店铺头像成功 object:TIDBUpdateStoreImgResp
extern NSString * const kAGTNotificationMeUpdateMyStoreImageSuccess;

//我修改签名成功
extern NSString * const kAGTNotificationMeSetMySignatureSuccess;

//代鼠币充值成功 object: TIDBBuyCoinResp
extern NSString * const kAGTNotificationCoinRechargeSuccess;


//订单状态改变 object: TIDOrderTransactionStatusChangeNotifyResp
extern NSString * const kAGTNotificationOrderTransactionStatusChange;

extern NSString * const kAGTNotificationNIMLoginSucess;


//我的订单状态改变 object: nil
extern NSString * const kAGTNotificationMyOrderStatusChange;

//我的店铺中的订单状态改变 object: nil
extern NSString * const kAGTNotificationMyStoreOrderStatusChange;
