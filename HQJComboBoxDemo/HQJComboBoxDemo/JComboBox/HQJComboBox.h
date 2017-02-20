//
//  HQJComboBox.h
//  CustomToolDemo
//
//  Created by 胡忠立 on 2017/2/7.
//  Copyright © 2017年 胡忠立. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JComboBoxStyle) {
    JComboBoxStyleWithRadio,
    JComboBoxStyleWithMultiselect,
    JComboBoxStyleWithDefualt = JComboBoxStyleWithRadio
};

@protocol JComboBoxDelegate <NSObject>
- (void)handleJComboBoxTapCompleteIndex:(NSInteger)index groupId:(NSString*)groupId selectStatu:(BOOL)sel;

@end

@interface HQJComboBox : UIView

@property (nonatomic,copy,readonly)NSString* groupId;
@property (nonatomic,copy)NSString* descrin;
@property (nonatomic,assign,readonly)NSInteger index;
@property (nonatomic,strong,readonly)UIButton* JCButton;
//@property (nonatomic,assign)JComboBoxStyle style;

- (instancetype)initWithFrame:(CGRect)frame __attribute__((unavailable("initWithFrame方法不可用，请用initWithGroupId: index:")));

- (id)initWithGroupId:(NSString*)groupId index:(NSInteger)index;
- (void)setButtonDefualtImage:(NSString*)defualtImage selectImage:(NSString*)selectImage;
+ (void)addObserverForJComboBoxWithGroupId:(NSString*)groupId observer:(id)observer;
+ (void)setJComboBoxStyle:(JComboBoxStyle)style groupId:(NSString*)groupId;

@end
