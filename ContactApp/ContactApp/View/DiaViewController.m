//
//  DiaViewController.m
//  ContactApp
//
//  Created by WF on 2018/6/19.
//  Copyright © 2018年 Victorinox. All rights reserved.
//

#import "DiaViewController.h"
@interface DiaViewController()
@property (weak, nonatomic) IBOutlet UILabel* numberTF;
@end

@implementation DiaViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"拨号";
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemUndo target:self action:@selector(backAction)];
    self.number =[[NSMutableString alloc]init];
    self.numberTF.text = self.number;
    
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)numberClick:(UIButton*)sender{
    [self.number appendString:sender.titleLabel.text];
    self.numberTF.text = self.number;
    
}
-(IBAction)delete:(UIButton*)sender{
    if([self.number length]<=0)
        return;
    [self.number deleteCharactersInRange:NSMakeRange([self.number length]-1, 1)];
    NSLog(@"%@",self.number);
    self.numberTF.text =self.number;
    
}


@end
