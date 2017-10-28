//
//  XMPPTools.h
//  helloXMPP
//
//  Created by longgege on 17/10/28.
//  Copyright © 2017年 longgege. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <XMPPFramework/XMPPFramework.h>

@interface XMPPTools : NSObject<XMPPStreamDelegate>

@property(nonatomic,strong)XMPPStream *xmppStream;
//单例方法
+(XMPPTools *)defaultManager;
//登录的方法
-(void)loginwithName:(NSString *)userName andPassword:(NSString *)password;
//注册
-(void)registerWithName:(NSString *)userName andPassword:(NSString *)password;
-(void)logout;

@end
