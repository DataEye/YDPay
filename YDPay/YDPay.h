//
//  YDPay.h
//  YDPay
//
//  Created by xqwang on 2016/12/16.
//  Copyright © 2016年 xqwang. All rights reserved.
//

#import <Foundation/Foundation.h>

/*typedef NS_OPTIONS(NSUInteger, YDPayStatus)
{
    YD_SUCCESS = 1,
    YD_FAIL,
    YD_CANCEL,
    YD_UNKNOW,
};*/

@protocol YDPayDelegate <NSObject>

-(void)payResult:(BOOL)result data:(id)data;

@end

@interface YDPay : NSObject

+(void)initWithAppId:(NSString*)appId developKey:(NSString*)developKey;

+(void)setAppScheme:(NSString*)scheme;

+(void)pay:(NSString*)orderId orderName:(NSString*)orderName userId:(NSString*)userId
 productNo:(NSString*)productNo amount:(NSUInteger)amount param:(NSString*)param;

+(void)setDelegate:(id<YDPayDelegate>)delegate;

+(void)dealPayUrl:(NSURL*)url;

@end
