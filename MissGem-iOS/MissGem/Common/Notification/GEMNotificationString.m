//
//  GEMNotificationString.m
//  MissGem
//
//  Created by Augustus on 08/11/2017.
//  Copyright © 2017 Augustus. All rights reserved.
//
#import "GEMNotificationString.h"

NSString * const kAGTNotification_AppErrorCode = @"kAGTNotification_AppErrorCode";

NSString * const kAGTNotification_SendRequestWithLoading = @"kAGTNotification_SendRequestWithLoading";
NSString * const kAGTNotification_ReceiveResponseCancelLoading = @"kAGTNotification_ReceiveResponseCancelLoading";

NSString * const kAGTNotification_RefreshLoginSuccess = @"AGTRefreshLoginSuccess";
NSString * const kAGTNotification_LoginViaMobileSuccess = @"AGTLoginViaMobileSuccess";
NSString * const kAGTNotification_LogoutSuccess = @"AGTLogoutSuccess";
//订单状态改变通知 object: TIDOrderStatusAndTransactionStatus
NSString * const kAGTNotificaiton_OrderStatusChange = @"kAGTNotificaiton_OrderStatusChange";

NSString * const kAGTNotificaiton_OrderItemReturnStatusChange = @"kAGTNotificaiton_OrderItemReturnStatusChange";
NSString * const kAGTUserInfoKey_OrderItemReturnStatusChange = @"kAGTUserInfoKey_OrderItemReturnStatusChange";
NSString * const kAGTUserInfoKey_OrderStatusAndTransactionStatus = @"kAGTUserInfoKey_OrderStatusAndTransactionStatus";
NSString * const kAGTUserInfoKey_OrderInWhichStore = @"kAGTUserInfoKey_OrderInWhichStore";
// 提交订单, object: nil
NSString * const kAGTNotificaiton_placeOrder = @"kAGTNotificaiton_placeOrder";

NSString * const kAGTNotification_OrderDeletion = @"kAGTNotification_OrderDeletion";

NSString * const kAGTNotificaiton_OrderDelivered = @"kAGTNotificaiton_OrderDelivered";

NSString * const kAGTNotification_CreateStore = @"kAGTNotification_CreateStore";

NSString * const kAGTNotification_AddToCart = @"kAGTNotification_AddToCart";

//别人请求添加我好友通知 object: TIDRequestAddFriendMessageInfo
NSString * const kAGTNotificationOtherRequestAddMeFriendSuccess = @"AGTNotificationOtherRequestAddMeFriendSuccess";
//别人回复添加我为好友通知 object: nil
NSString * const kAGTNotificationOtherReplayAddMeFriendSuccess = @"AGTNotificationOtherReplayAddMeFriendSuccess";
//别人删除我好友通知 object: userId's NSNumber
NSString * const kAGTNotificationOtherDeleteMeFriendSuccess = @"AGTNotificationOtherDeleteMeFriendSuccess";


//我请求添加别人好友通知 object: TIDRequestAddFriendMessageInfo
NSString * const kAGTNotificationMeRequestAddOtherFriendSuccess  = @"AGTNotificationMeRequestAddOtherFriendSuccess";
//我回复添加别人为好友通知 object: nil
NSString * const kAGTNotificationMeReplayAddOtherFriendSuccess  = @"AGTNotificationMeReplayAddOtherFriendSuccess";

//我回复添加别人为好友通知 object: nil
NSString * const kAGTNotificationMeReplayAddOtherFriendFail  = @"AGTNotificationMeReplayAddOtherFriendFail";

//我删除别人好友通知 object: userId's NSNumber
NSString * const kAGTNotificationMeDeleteOtherFriendSuccess  = @"AGTNotificationMeDeleteOtherFriendSuccess";


//别人请求关注我的店铺通知
NSString * const kAGTNotificationOtherRequestAddMeStoreSuccess = @"AGTNotificationOtherRequestAddMeStoreSuccess";
//别人回复添加我的店铺通知
NSString * const kAGTNotificationOtherReplayAddMeStoreSuccess = @"AGTNotificationOtherReplayAddMeStoreSuccess";
//别人删除关注我的店铺通知
NSString * const kAGTNotificationOtherDeleteMeStoreSuccess = @"AGTNotificationOtherDeleteMeStoreSuccess";




//我请求关注别人的店铺通知
NSString * const kAGTNotificationMeRequestAddOtherStoreSuccess = @"AGTNotificationMeRequestAddOtherStoreSuccess";
//我同意回复添加别人的店铺通知
NSString * const kAGTNotificationMeReplayAddOtherStoreSuccess = @"AGTNotificationMeReplayAddOtherStoreSuccess";

//我拒绝回复添加别人的店铺通知
NSString * const kAGTNotificationMeReplayAddOtherStoreFail = @"AGTNotificationMeReplayAddOtherStoreFail";

//我删除关注别人店铺通知
NSString * const kAGTNotificationMeDeleteOtherStoreSuccess = @"AGTNotificationMeDeleteOtherStoreSuccess";

//我定时更新添加好友店铺请求通知
NSString * const kAGTNotificationMeGetRequestAddFriendsAndStoreOnTime = @"AGTNotificationMeGetRequestAddFriendsAndStoreOnTime";

//我修改年龄成功
NSString * const kAGTNotificationMeSetMyAgeSuccess = @"AGTNotificationMeSetMyAgeSuccess";

//我修改地区成功
NSString * const kAGTNotificationMeSetMyAreaSuccess = @"AGTNotificationMeSetMyAreaSuccess";


//我修改我的店铺头像成功 object:TIDBUpdateStoreImgResp
NSString * const kAGTNotificationMeUpdateMyStoreImageSuccess= @"AGTNotificationMeUpdateMyStoreImageSuccess";

//我修改签名成功
NSString * const kAGTNotificationMeSetMySignatureSuccess = @"AGTNotificationMeSetMySignatureSuccess";

//代鼠币充值成功
NSString * const kAGTNotificationCoinRechargeSuccess = @"AGTNotificationCoinRechargeSuccess";


//订单状态改变 object: TIDOrderTransactionStatusChangeNotifyResp
NSString * const kAGTNotificationOrderTransactionStatusChange = @"AGTNotificationOrderTransactionStatusChange";

NSString * const kAGTNotificationNIMLoginSucess = @"AGTNotificationNIMLoginSucess";

//我的订单状态改变 object: nil
NSString * const kAGTNotificationMyOrderStatusChange = @"kAGTNotificationMyOrderStatusChange";

//我的店铺中的订单状态改变 object: nil
NSString * const kAGTNotificationMyStoreOrderStatusChange = @"kAGTNotificationMyStoreOrderStatusChange";


