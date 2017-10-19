//
//  UserModel.m
//  YZGL
//
//  Created by Admin on 17/3/2.
//  Copyright © 2017年 Admin. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

+(instancetype)shareManager
{
    static UserModel *manager =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[UserModel alloc]init];
    });
    return manager;
}

- (void)save{
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    if (self.userName) {
        [ud setObject:self.userName forKey:USER_NAME];
    }
    
   
    if (self.userId) {
        [ud setObject:self.userId forKey:USER_ID];
    }
    
  
    if (self.phoneNumber) {
        [ud setObject:self.phoneNumber forKey:USER_PHONE];
    }
   
    [ud synchronize];
}

+ (NSString *)username{
    
    NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:USER_NAME];
    
    return username;
}

+ (NSString *)phoneNumber{
    
    NSString *phoneNumber = [[NSUserDefaults standardUserDefaults] objectForKey:USER_PHONE];
    
    return  phoneNumber;
}

+ (NSString *)userId{
    NSString *userId = [[NSUserDefaults standardUserDefaults] objectForKey:USER_ID];
    return userId;
}

+ (BOOL)didLogin{
    
    BOOL login = NO;
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    if ([ud objectForKey:USER_ID]) {
        login = YES;
    }
    
    return login;
}
+(void)closeVoice{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
     [ud setObject:@0 forKey:@"XT_USERVOICE"];
    [ud synchronize];
}
+(void)openVoice{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:@1 forKey:@"XT_USERVOICE"];
    [ud synchronize];
}
+(BOOL)isVoice{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSLog(@"%@",[ud objectForKey:@"XT_USERVOICE"]);
    if ([[ud objectForKey:@"XT_USERVOICE"]intValue]==1||[ud objectForKey:@"XT_USERVOICE"]==nil) {
        return YES;
    }else{
        return NO;
    }
}
- (void)logOut{
    self.userId = nil;
    self.phoneNumber =nil;
    self.userName = nil;
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:nil forKey:USER_NAME];
    [ud setObject:nil forKey:USER_ID];
    [ud setObject:nil forKey:USER_PHONE];
    [ud synchronize];
    
}



@end
