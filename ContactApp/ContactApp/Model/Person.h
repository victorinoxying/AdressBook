//
//  Person.h
//  ContactApp
//
//  Created by WF on 2018/6/19.
//  Copyright © 2018年 Victorinox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic)int pid;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *number;
@property(nonatomic,copy)NSString* address;
@property(nonatomic,copy)NSString* email;
@property(nonatomic,copy)NSString* weiChat;
@end
