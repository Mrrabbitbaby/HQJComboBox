//
//  ViewController.m
//  HQJComboBoxDemo
//
//  Created by 胡忠立 on 2017/2/20.
//  Copyright © 2017年 mrrabbitBaby. All rights reserved.
//

#import "ViewController.h"
#import "SelectViewController.h"
#import "RedioViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView* tb_JCB;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"JComboBox";
    
    [self.view addSubview:self.tb_JCB];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark --TableViewDelegate & TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = indexPath.row ? @"Multiselect" : @"Radio";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        RedioViewController* redio = [[RedioViewController alloc]init];
        redio.title = @"Radio";
        [self.navigationController pushViewController:redio animated:YES];
        return;
    }
    SelectViewController* selt = [[SelectViewController alloc]init];
    selt.title = @"Multiselect";
    [self.navigationController pushViewController:selt animated:YES];
}

#pragma mark --lazyload
- (UITableView*)tb_JCB
{
    if (!_tb_JCB) {
        _tb_JCB = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        _tb_JCB.delegate = self;
        _tb_JCB.dataSource = self;
        _tb_JCB.backgroundColor = [UIColor clearColor];
        _tb_JCB.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tb_JCB;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
