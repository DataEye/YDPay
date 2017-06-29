//
//  YDTool.h
//  YDTool
//
//  Created by xqwang on 2016/12/16.
//  Copyright © 2016年 xqwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, YDToolStatus)
{
    YD_FAIL = 0,
    YD_SUCCESS,
    YD_CANCEL,
    YD_UNKNOW,
};

@protocol YDToolDelegate <NSObject>

-(void)toolResult:(YDToolStatus)result data:(id)data;

@end

@interface YDTool : NSObject
/** 
 * SDK的初始化接口
 * @param appId 应用在优点后台申请的支付AppID
 * @param developKey 应用在优点后台申请AppID时生成的developId，用于SDK内部加密数据
 *
 **/
+(void)initWithAppId:(NSString*)appId developKey:(NSString*)developKey;

/**
 * 设置应用的跳转URL，用于支付完成后从支付App跳回应用
 * @param scheme 应用对应的Url
 *
 **/
+(void)setAppScheme:(NSString*)scheme;

/**
 *  设置渠道Id
 **/
+(void)setChannelId:(NSString*)channelId;

/**
 * 不定金额的支付接口
 * @param orderId 订单ID，请开发者确保该ID的惟一性，用于与优点核对数据
 * @param orderName 订单名称
 * @param userId 当前支付玩家的账号ID
 * @param producNo 支付的商品在优点后台对应的ID，请确保传入值的正确性
 * @param amount 本次支付的总金额，单位为分
 * @param param 支付成功后，优点后台透传给应用服务器的参数
 **/
+(void)tool:(NSString*)orderId orderName:(NSString*)orderName userId:(NSString*)userId
 productNo:(NSString*)productNo amount:(NSUInteger)amount param:(NSString*)param;

/**
 * 定额的支付接口
 * @param orderId 订单ID，请开发者确保该ID的惟一性，用于与优点核对数据
 * @param orderName 订单名称
 * @param userId 当前支付玩家的账号ID
 * @param producNo 支付的商品在优点后台对应的ID，请确保传入值的正确性
 * @param param 支付成功后，优点后台透传给应用服务器的参数
 **/
+(void)tool:(NSString*)orderId orderName:(NSString*)orderName userId:(NSString*)userId
 productNo:(NSString*)productNo param:(NSString*)param;

/**
 * 支付协议设置接口
 *
 **/
+(void)setDelegate:(id<YDToolDelegate>)delegate;

#if HAS_NATIVE_PAY
/**
 * 支付完成后返回的生命周期接口，用于判断支付是否成功并回调支付协议，请开发者在AppDelegate的对应接口中调用
 *
 **/
+(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options;

+(void)applicationWillEnterForeground:(UIApplication*)app;
#endif

@end
