//
//  Database.h
//  ContactApp
//
//  Created by WF on 2018/6/19.
//  Copyright © 2018年 Victorinox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
#import "Person.h"
@interface Database : NSObject
@property (nonatomic, strong)FMDatabase *db;
+ (Database *)shareManager;

- (void)insertPerson:(Person *)person;

- (void)deletePerson:(Person *)person;

- (void)updatePerson:(Person *)person;

- (NSMutableArray *)queryPersons;


@end
