//
//  Database.m
//  ContactApp
//
//  Created by WF on 2018/6/19.
//  Copyright © 2018年 Victorinox. All rights reserved.
//

#import "Database.h"

static Database *database;
@implementation Database
+(Database *)shareManager{
    
    if (!database) {
        database = [Database new];
        NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Persons.db"];
        database.db = [FMDatabase databaseWithPath:path];
        
        if ([database.db open]) {
            NSLog(@"打开数据库文件成功");
            
            
            if ([database.db executeUpdate:@"create table if not exists persons (name text,number text,email text, address text, weiChat text, pid integer primary key autoincrement)"]) {
                NSLog(@"创建表成功！");
            }else NSLog(@"创建表失败");
            
            
        }
        
    }
    
    return database;
}

-(void)insertPerson:(Person *)person{
    
    NSString *sql = [NSString stringWithFormat:@"insert into persons (name,number,email,address,weiChat) values ('%@','%@','%@','%@','%@')",person.name,person.number,person.email,person.address,person.weiChat];
    if ([self.db executeUpdate:sql]) {
        NSLog(@"插入数据成功！");
    }else NSLog(@"插入数据失败");
    
}
-(void)deletePerson:(Person *)person{
    
    NSString *sql = [NSString stringWithFormat:@"delete from persons where pid=%d",person.pid];
    if ([self.db executeUpdate:sql]) {
        NSLog(@"删除数据成功！");
    }else NSLog(@"删除数据失败！");
    
}
-(void)updatePerson:(Person *)person{
    
    NSString *sql = [NSString stringWithFormat:@"update persons set name='%@', number='%@', email='%@', address='%@', weiChat='%@' where pid=%d",person.name,person.number,person.email,person.address,person.weiChat,person.pid];
    
    
    if ([self.db executeUpdate:sql]) {
        NSLog(@"修改数据成功！");
    }else NSLog(@"修改数据失败！");
    
}

-(NSMutableArray *)queryPersons{

    NSMutableArray *persons = [NSMutableArray array];
    
    FMResultSet *result = [self.db executeQuery:@"select * from persons"];
    while ([result next]) {
        Person *p = [Person new];
        p.name = [result stringForColumn:@"name"];
        NSLog(@"DatebaseName: %@",p.name);
        p.number = [result stringForColumn:@"number"];
        p.email = [result stringForColumn:@"email"];
        p.address =[result stringForColumn:@"address"];
        p.weiChat = [result stringForColumn:@"weiChat"];
        p.pid = [result intForColumn:@"pid"];
        
        [persons addObject:p];
    }
    
    return  persons;
    
}
@end
