//
//  RequestManager.h
//  HLDriver
//
//  Created by Admin on 2017/4/12.
//  Copyright © 2017年 Admin. All rights reserved.
//

#import "BaseRequestManager.h"
typedef NS_ENUM(NSUInteger ,WorkStateType){
    WorkStateTypeWokring,
    WorkStateTypeRest
};
@interface RequestManager : BaseRequestManager
/**
 *  登入
 *
 *  @param tel        手机号
 *  @param psw        密码
 *  @param xt_success 成功回调
 *  @param xt_error   失败回调
 */
+(void)loginWithPhoneNumber:(NSString *)tel password:(NSString *)psw success:(Success)xt_success error:(Error)xt_error;
//得到验证码
+(void)getVerifyPhoneNum:(NSString*)phone success:(Success)xt_success error:(Error)xt_error;
//验证验证码
+(void)verifyWithPhoneNum:(NSString*)phone code:(NSString*)code success:(Success)xt_success error:(Error)xt_error;
//获得车型数据
+(void)getVehicleTypeSuccess:(Success)xt_success error:(Error)xt_error;
//注册
/**
 注册
 */
+(void)registWithSuccess:(Success)xt_success error:(Error)xt_error;
//上传图片
+(void)uploadImg:(UIImage*)image success:(Success)xt_success error:(Error)xt_error;

@end
