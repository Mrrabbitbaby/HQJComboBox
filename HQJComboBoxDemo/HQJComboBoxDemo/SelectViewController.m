//
//  SelectViewController.m
//  HQJComboBoxDemo
//
//  Created by 胡忠立 on 2017/2/20.
//  Copyright © 2017年 mrrabbitBaby. All rights reserved.
//

#import "SelectViewController.h"
#import "UIView+HQFrame.h"

@interface SelectViewController ()<JComboBoxDelegate>

@end

@implementation SelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:222 alpha:1];
    
    NSString* desc = @"lksdfklsdflsdfoijsemfsdfls fklsmdklfmsdlkfmlksmflksdmflksdmfklmsklfmklsdmfklsdmfklsdmfklmskdfmlksmfklsdmflksdmfklmsdklfmsdklmfklsdmflk";
    CGSize size = [self getCharactersWithString:desc];
     NSLog(@"box ---height == %f",size.height);
    HQJComboBox* box = [[HQJComboBox alloc]initWithGroupId:@"demo 1.0" index:0];
    box.frame = CGRectMake(0, 84, [UIScreen mainScreen].bounds.size.width, size.height);
    [self.view addSubview:box];
    [HQJComboBox addObserverForJComboBoxWithGroupId:@"demo 1.0" observer:self];
    box.descrin = desc;
    
    NSString* desc1 = @"灵山粮棉原种场炒博格达峰地粗枝大叶熛为极少数 soid 淡专业学校夺油烟机淡远光灯 远光灯 同远光灯 烛瀠要专业学校在";
    CGSize size1 = [self getCharactersWithString:desc1];
     NSLog(@"box1---height == %f",size1.height);
    HQJComboBox* box1 = [[HQJComboBox alloc]initWithGroupId:@"demo 1.0" index:1];
    box1.frame = CGRectMake(0, box.bottom + 10, [UIScreen mainScreen].bounds.size.width, size1.height);
    [self.view addSubview:box1];
    [HQJComboBox addObserverForJComboBoxWithGroupId:@"demo 1.0" observer:self];
    box1.descrin = desc1;
    
    NSString* desc2 = @"灵山粮棉原种场炒博格达峰地粗枝大叶熛为极少数 soid 淡专业困呗圆周别顶别顶机架南顶贺喜困在感动中国唯楚有才别顶布雷顶面碉困在在哪里买慢啊展览中心喝成理顺无以至千里顺大声唱怀哪里有卖民理顺雨辰天黑同贺三都赋唔畀面吃软不吃硬赎回同贺三都赋加压同贺加再历中三都赋别夸大风车中布雷呈见面干嘛国再别三都赋 加压同南车呔 fmlk 国同贺压岁垌加压三都赋十四号唔岩";
    CGSize size2 = [self getCharactersWithString:desc2];
     NSLog(@"box2---height == %f",size2.height);
    HQJComboBox* box2 = [[HQJComboBox alloc]initWithGroupId:@"demo 1.0" index:2];
    box2.frame = CGRectMake(0, box1.bottom + 10, [UIScreen mainScreen].bounds.size.width, size2.height);
    [self.view addSubview:box2];
    [HQJComboBox addObserverForJComboBoxWithGroupId:@"demo 1.0" observer:self];
    box2.descrin = desc2;
    
    NSString* desc3 = @"灵山粮棉原种场炒博格达峰地粗枝大叶熛为极少灵山粮棉原种场炒博格达峰地粗枝大叶熛为极少灵山粮棉原种场炒博格达峰地粗枝大叶熛为极少灵山粮棉原种场炒博格达峰地粗枝大叶熛为极少灵山粮棉原种场炒博格达峰地粗枝大叶熛为极少灵山粮棉原种场炒博格达峰地粗枝大叶熛为极少灵山粮棉原种场炒博格达峰地粗枝大叶熛为极少";
    CGSize size3 = [self getCharactersWithString:desc3];
     NSLog(@"box3----height == %f",size3.height);
    HQJComboBox* box3 = [[HQJComboBox alloc]initWithGroupId:@"demo 1.0" index:3];
    box3.frame = CGRectMake(0, box2.bottom + 10, [UIScreen mainScreen].bounds.size.width, size3.height);
    [self.view addSubview:box3];
    [HQJComboBox addObserverForJComboBoxWithGroupId:@"demo 1.0" observer:self];
    box3.descrin = desc3;
    
    //同一个 groupId 只需要设置一次，任何一个对象都可，只要 groupId相同
    [HQJComboBox setJComboBoxStyle:_style groupId:@"demo 1.0"];
    
    // Do any additional setup after loading the view.
}

- (void)handleJComboBoxTapCompleteIndex:(NSInteger)index groupId:(NSString *)groupId selectStatu:(BOOL)sel
{
    NSLog(@"groupId is %@ for index %@ enable is %@",groupId,@(index),@(sel));
}

- (CGSize)getCharactersWithString:(NSString*)str
{
    return [str boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, MAXFLOAT) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:NULL].size;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
