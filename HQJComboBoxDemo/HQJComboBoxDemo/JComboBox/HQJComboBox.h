//
//  HQJComboBox.h
//  CustomToolDemo
//
//  Created by 胡忠立 on 2017/2/7.
//  Copyright © 2017年 胡忠立. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 按钮类型枚举
 
 - JComboBoxStyleWithRadio: 单选
 - JComboBoxStyleWithMultiselect: 多选
 - JComboBoxStyleWithDefualt: 默认单选
 */
typedef NS_ENUM(NSInteger, JComboBoxStyle) {
    JComboBoxStyleWithRadio,
    JComboBoxStyleWithMultiselect,
    JComboBoxStyleWithDefualt = JComboBoxStyleWithRadio
};

@protocol JComboBoxDelegate <NSObject>
/**
 点击回调
 
 @param groupId 群组Id
 @param index 点击下标
 @param selected 选中与否状态
 */
- (void)JComboBoxHandleCompleteWithGroupId:(NSString*)groupId index:(NSInteger)index selected:(BOOL)selected;
@end

@interface HQJComboBox : UIView

@property (nonatomic,copy,readonly)NSString* groupId;/**群组ID*/
@property (nonatomic,assign,readonly)NSInteger index;/**点击下标*/
@property (nonatomic,strong,readonly)UIButton* JCButton;/**按钮*/
@property (nonatomic,copy)NSString* descrin;/**描述*/
@property (nonatomic)JComboBoxStyle style;/**多选或单选*/
@property (nonatomic) BOOL isCancel;/**按钮是否可变成不选状态*/

/**
 不可用初始化方法
 */
- (instancetype)initWithFrame:(CGRect)frame __attribute__((unavailable("initWithFrame方法不可用，请用initWithGroupId: index:")));

/**
 初始化方法
 
 @param groupId 群组ID
 @param index 下标
 @return 按钮
 */
- (id)initWithGroupId:(NSString*)groupId index:(NSInteger)index;

/**
 设置按钮图片
 
 @param defualtImage 默认图片，默认为单选图片
 @param selectImage 选中图片
 */
- (void)setButtonDefualtImage:(NSString*)defualtImage selectImage:(NSString*)selectImage;

/**
 设置接收者
 
 @param observer 接收者
 @param groupId 组群ID
 */
+ (void)addObserverWithJComboBoxWithObserver:(id)observer groupId:(NSString*)groupId;

@end
