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

/**
 点击回调Block
 
 @param groupId 群组Id
 @param index 点击下标
 @param selected 选中与否状态
 */
typedef void(^JComboBoxHandleCompleteBlock)(NSString* groupId, NSInteger index, BOOL selected);

@interface HQJComboBox : UIView

/**
 群组ID
 */
@property (nonatomic,copy,readonly)NSString* groupId;

/**
 点击下标
 */
@property (nonatomic,assign,readonly)NSInteger index;

/**
 按钮
 */
@property (nonatomic,strong,readonly)UIButton* JCButton;

/**
 描述
 */
@property (nonatomic,copy)NSString* descrin;

/**
 多选或单选
 */
@property (nonatomic)JComboBoxStyle style;

/**
 按钮是否可变成不选状态
 */
@property (nonatomic) BOOL isCancel;

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
 点击回调方法
 
 @param finish 完成回调Block
 */
+ (void)JComboBoxHandleCompleteFinish:(JComboBoxHandleCompleteBlock)finish;

@end
