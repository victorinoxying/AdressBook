//
//  PersonViewController.m
//  ContactApp
//
//  Created by WF on 2018/6/19.
//  Copyright © 2018年 Victorinox. All rights reserved.
//
#import "Database.h"
#import "PersonViewController.h"
#import "Person.h"
@interface PersonViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *numberTF;
@property (weak, nonatomic) IBOutlet UITextField *emailTF;
@property (weak, nonatomic) IBOutlet UITextField *addressTF;
@property (weak, nonatomic) IBOutlet UITextField *weiChatTF;

@end

@implementation PersonViewController
-(IBAction)shareClick:(UIButton*)sender{
    if([self.person.name length]>0&&[self.person.number length]>0){
        NSString* sharename = self.person.name;
        NSString * shareNumber = self.person.number;
        NSArray *ActivityItems =@[sharename,shareNumber];
        UIActivityViewController * activityVC = [[UIActivityViewController alloc] initWithActivityItems:ActivityItems applicationActivities:nil];
        activityVC.excludedActivityTypes = @[UIActivityTypePrint, UIActivityTypeCopyToPasteboard,UIActivityTypeAssignToContact,UIActivityTypeSaveToCameraRoll];
        [self presentViewController:activityVC animated:TRUE completion:nil];
        
    }
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"编辑联系人";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveAction)];
    
    
    if (self.person) {//修改
        self.nameTF.text = self.person.name;
        self.numberTF.text = self.person.number;
        self.addressTF.text =self.person.address;
        self.emailTF.text = self.person.email;
        self.weiChatTF.text =self.person.weiChat;
    }
    
}

- (void)saveAction {
    
    if (self.person) {//修改
        self.person.name = self.nameTF.text;
        self.person.address = self.addressTF.text;
        self.person.email =self.emailTF.text;
        self.person.number = self.numberTF.text;
        self.person.weiChat =self.weiChatTF.text;
        [[Database shareManager]updatePerson:self.person];
        
    }else{
        
        Person *p = [Person new];
        p.name = self.nameTF.text;
        p.number = self.numberTF.text;
        p.address =self.addressTF.text;
        p.email = self.emailTF.text;
        p.weiChat = self.weiChatTF.text;
        [[Database shareManager]insertPerson:p];
    }
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

@end
