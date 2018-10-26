//
//  ViewController.m
//  ContactApp
//
//  Created by WF on 2018/6/18.
//  Copyright © 2018年 Victorinox. All rights reserved.
//
#import "Person.h"
#import "Database.h"
#import "TableViewController.h"
#import "PersonViewController.h"
#import "DiaViewController.h"
@interface TableViewController ()
@property (nonatomic, strong)NSMutableArray *persons;
@end

@implementation TableViewController

-(IBAction)URLButton:(UIButton *)sender{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.baidu.com"]];
}
-(IBAction)DioButton:(UIButton*)sender{
    DiaViewController* dv = [DiaViewController new];
    [self.navigationController pushViewController:dv animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"通讯录";
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAction)];
    
}

- (void)addAction {
    
    PersonViewController *vc = [PersonViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}
#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    self.persons = [[Database shareManager]queryPersons];
    return self.persons.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Person *p = self.persons[indexPath.row];
    cell.textLabel.text = p.name;
    cell.detailTextLabel.text = p.number;
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        Person *p = self.persons[indexPath.row];
        
        [[Database shareManager]deletePerson:p];
        
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Person *p = self.persons[indexPath.row];
    PersonViewController *vc = [PersonViewController new];
    vc.person = p;
    [self.navigationController pushViewController:vc animated:YES];
    
}



@end
