//
//  UIView+HQFrame.h
//  CustomToolDemo
//
//  Created by 胡忠立 on 16/9/19.
//  Copyright © 2016年 胡忠立. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HQFrame)

/**
 左边
 */
@property (nonatomic,readwrite)CGFloat left;

/**
 右边
 */
@property (nonatomic,readwrite)CGFloat right;

/**
 顶部
 */
@property (nonatomic,readwrite)CGFloat top;

/**
 底部
 */
@property (nonatomic,readwrite)CGFloat bottom;

/**
 横坐标x
 */
@property (nonatomic,readwrite)CGFloat x;

/**
 横坐标y
 */
@property (nonatomic,readwrite)CGFloat y;

/**
 高度
 */
@property (nonatomic,readwrite)CGFloat height;

/**
 宽度
 */
@property (nonatomic,readwrite)CGFloat width;

/**
 表示一个二维坐标系中的点
 */
@property (nonatomic,readwrite)CGPoint origin;

/**
 表示一个矩形的宽度和高度
 */
@property (nonatomic,readwrite)CGSize size;

/**
 表示一个横坐标中心点
 */
@property (nonatomic,readwrite)CGFloat centerX;

/**
 表示一个纵坐标中心点
 */
@property (nonatomic,readwrite)CGFloat centerY;

@end
