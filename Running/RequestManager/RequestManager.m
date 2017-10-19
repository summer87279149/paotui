
//
//  RequestManager.m
//  HLDriver
//
//  Created by Admin on 2017/4/12.
//  Copyright © 2017年 Admin. All rights reserved.
//
#import "XTRequestManager.h"
#import "RequestManager.h"

@implementation RequestManager


+(void)loginWithPhoneNumber:(NSString *)tel password:(NSString *)psw success:(Success)xt_success error:(Error)xt_error{
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:tel,@"mobile",psw,@"code",@" ",@"device_id", nil];
    [XTRequestManager POST:XT_REQUEST_URL(@"/api/driver/login") parameters:dic responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)getVerifyPhoneNum:(NSString*)phone success:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager POST:XT_REQUEST_URL(@"/api/index/getCode") parameters:@{@"mobile":phone} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)verifyWithPhoneNum:(NSString*)phone code:(NSString*)code success:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager POST:XT_REQUEST_URL(@"/api/index/verifiCode") parameters:@{@"mobile":phone,@"code":code} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}

@end
