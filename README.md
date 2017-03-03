# YDPay
优点付费聚合了支付宝、微信、银联等多家支付渠道，向开发者提供统一的付费功能接入体验，为开发者降低付费功能的接入成本。
## cocoapods接入
```
platform :ios, ‘8.0’
target ‘xxx’ do
pod ‘YDPay’
end
```
## 初始化
```
/**
*  appId:应用在优点后台申请的应用惟一标识ID
*  developKey:优点分配给应用的公钥
**/
+(void)initWithAppId:(NSString*)appId developKey:(NSString*)developKey;
```
## 支付
```
/**
* orderId:本次付费行为的惟一标识，需要开发者确保其值的全局惟一
* orderName:本次付费行为的具体说明
* useId:付费用户的账号Id
* productNo:本次付费购买的具体信息，用于在支付宝、微信等支付界面显示，告知用户购买的具体物品
* amount:本次付费的总金额
* param:付费成功后回调的具体参数信息
**/
+(void)pay:(NSString*)orderId orderName:(NSString*)orderName userId:(NSString*)userId productNo:(NSString*)productNo amount:(NSUInteger)amount param:(NSString*)param;
```
## 其它
在调用付费前，开发者需要调用其它接口设置一些额外的信息，接口定义如下：
```
//设置应用的scheme，用于付费成功后从付费应用（支付宝、微信）跳转回自身
+(void)setAppScheme:(NSString*)scheme;
//设置付费结果回调，开发者需要实现YDPayDelegate协议，具体参见付费回调说明
+(void)setDelegate:(id<YDPayDelegate>)delegate;
//设置渠道ID
+(void)setChannelId:(NSString*)channelId;

```

## 付费回调
开发者需要在自己的代码中实现以下回调协议接口:
```
/**
* result:付费结果，具体值参见YDPayStatus枚举
* data:付费失败时，为字符串类型，表示付费失败的具体原因，付费成功时，为字典型，根据支付的具体方式，其表示支付完成后的具体支付信息，也可能因其它原因导致该值为nil
**/
+(void)payResult:(YDPayStatus)result data:(id)data
```
## 参考示例
```
-(BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions{
  [YDPay initWithAppId:@"testAppId" developKey:@"testDevelopKey"];
  [YDPay setAppScheme:@"YDPayDemo"];
  [YDPay setDelegate:self];
  return YES;
}

-(void)buyGoods{
  NSString* orderID = [self generateTradeNO];
  [YDPay pay:orderID orderName:@"购买元宝" userId:self.account.accountId productNo:@"元宝" amount:1 param:nil];
}

-(void)payResult:(YDPayStatus)result data:(id)data{
  NSLog(@"pay result = %@ reason = %@", (result == YD_SUCCESS)? @"success":@"failed", data);
}
```
