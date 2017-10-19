//
//  UserModel.h
//  YZGL
//
//  Created by Admin on 17/3/2.
//  Copyright © 2017年 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#define USER_NAME                           @"ud_user_name"
#define USER_ID                             @"ud_user_id"
#define USER_PHONE                          @"phoneNumber"

@interface UserModel : NSObject
@property (copy, nonatomic) NSString *userName;
//用户id
@property (copy, nonatomic) NSString *userId;
//手机号
@property (copy, nonatomic) NSString *phoneNumber;
//headimg
@property (nonatomic, copy) NSString *headimg;

+(instancetype)shareManager;
- (void)save;
+ (NSString *)userId;
+ (BOOL)didLogin;
- (void)logOut;

+(void)closeVoice;
+(void)openVoice;
+(BOOL)isVoice;
@end
