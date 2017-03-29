//
//  HQJComboBox.m
//  CustomToolDemo
//
//  Created by 胡忠立 on 2017/2/7.
//  Copyright © 2017年 胡忠立. All rights reserved.
//

#import "HQJComboBox.h"
#import <objc/runtime.h>

static const CGFloat kJComboBoxButtonWidth = 25.0;
static const CGFloat kJComboBoxButtonHeight = 25.0;

static NSMutableArray* _ary_JComboBox;
static const char completeBlockKey;

@interface HQJComboBox()
@property (nonatomic,strong)UILabel* lbl_descrin;

@end

@implementation HQJComboBox

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    if (self = [super initWithFrame:frame]) {
//        @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"must use - (id)initWithGroupId: index: init." userInfo:nil];
//    }
//    return self;
//}

- (id)init
{
    if (self = [super init]) {
        _JCButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _JCButton.frame = CGRectMake(0, 0, kJComboBoxButtonWidth, kJComboBoxButtonHeight);
        _JCButton.backgroundColor = [UIColor clearColor];
        //按钮高亮显示。
        _JCButton.adjustsImageWhenHighlighted = NO;
        [_JCButton setImage:[UIImage imageNamed:@"redio_nomarl"] forState:UIControlStateNormal];
        [_JCButton setImage:[UIImage imageNamed:@"redio_selected"] forState:UIControlStateSelected];
        [_JCButton addTarget:self action:@selector(clickActionButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_JCButton];
        
        if (!_ary_JComboBox)
            _ary_JComboBox = [NSMutableArray array];
        [_ary_JComboBox addObject:self];
    }
    return self;
}

- (id)initWithGroupId:(NSString *)groupId index:(NSInteger)index
{
    self = [self init];
    if (self) {
        _groupId = groupId;
        _index = index;
        _isCancel = NO;
        _style = JComboBoxStyleWithDefualt;
    }
    return self;
}

- (void)setDescrin:(NSString *)descrin
{
    _descrin = descrin;
    CGSize size = [self getCharactersWithFont:[UIFont systemFontOfSize:18] str:_descrin];
    
    if (!_lbl_descrin) {
        _lbl_descrin = [UILabel new];
        _lbl_descrin.font = [UIFont systemFontOfSize:18];
        _lbl_descrin.numberOfLines = 0;
        _lbl_descrin.backgroundColor = [UIColor clearColor];
        [self addSubview:_lbl_descrin];
    }
    _lbl_descrin.text = _descrin;
    _lbl_descrin.frame = CGRectMake(_JCButton.frame.origin.x + _JCButton.frame.size.width + 5, _JCButton.frame.origin.y, size.width + 10, size.height);//[UIScreen mainScreen].bounds.size.width - 50 - kJComboBoxButtonWidth
}

/*
 + (void)setJComboBoxStyle:(JComboBoxStyle)style
 {
 _style = style;
 }
 */
- (void)setStyle:(JComboBoxStyle)style
{
    _style = style;
}

- (void)setIsCancel:(BOOL)isCancel
{
    _isCancel = isCancel;
}

- (void)setButtonDefualtImage:(NSString *)defualtImage selectImage:(NSString *)selectImage
{
    [_JCButton setImage:[UIImage imageNamed:defualtImage] forState:UIControlStateNormal];
    [_JCButton setImage:[UIImage imageNamed:selectImage] forState:UIControlStateSelected];
}

- (void)clickActionButton:(id)sender
{
    _JCButton.selected = _isCancel ? !_JCButton.selected : YES;
    [HQJComboBox buttonSelect:self];
}

+ (void)buttonSelect:(HQJComboBox*)JCBox
{
    JComboBoxHandleCompleteBlock block = objc_getAssociatedObject(JCBox.groupId, &completeBlockKey);
    if (block)
        block(JCBox.groupId, JCBox.index, JCBox.JCButton.isSelected);
    
    if (JCBox.style == JComboBoxStyleWithMultiselect)
        return;
    
    if (_ary_JComboBox)
        [_ary_JComboBox enumerateObjectsUsingBlock:^(HQJComboBox* otherJComboxBox, NSUInteger idx, BOOL * _Nonnull stop) {
            if (![otherJComboxBox isEqual:JCBox] && [otherJComboxBox.groupId isEqualToString:JCBox.groupId])
                [otherJComboxBox otherJComboBoxButtonStatus:JCBox];
        }];
}

- (void)otherJComboBoxButtonStatus:(HQJComboBox*)JCBox
{
    if (_JCButton.selected)
        _JCButton.selected = NO;
}

+ (void)JComboBoxHandleCompleteWithGroupId:(NSString*)groupId finish:(JComboBoxHandleCompleteBlock)finish
{
    objc_setAssociatedObject(groupId, &completeBlockKey, finish, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGSize)getCharactersWithFont:(UIFont *)font str:(NSString*)str
{
    CGSize size = [str boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - kJComboBoxButtonWidth - 20, MAXFLOAT) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine attributes:@{NSFontAttributeName:font} context:NULL].size;
    return size;
}

@end

