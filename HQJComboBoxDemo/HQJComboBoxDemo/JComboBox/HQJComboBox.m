//
//  HQJComboBox.m
//  CustomToolDemo
//
//  Created by 胡忠立 on 2017/2/7.
//  Copyright © 2017年 胡忠立. All rights reserved.
//

#import "HQJComboBox.h"

static const CGFloat kJComboBoxButtonWidth = 25.0;
static const CGFloat kJComboBoxButtonHeight = 25.0;

static NSMutableArray* _ary_JComboBox;
static NSMutableDictionary* _dict_observers;
static NSMutableDictionary* _dict_style;
static JComboBoxStyle _style;

@interface HQJComboBox()
@property (nonatomic,strong)UILabel* lbl_descrin;

@end

@implementation HQJComboBox
//@synthesize style = _style;

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
      
        if (!_ary_JComboBox)
            _ary_JComboBox = [NSMutableArray array];
        
        _JCButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _JCButton.frame = CGRectMake(20, 0,kJComboBoxButtonWidth, kJComboBoxButtonHeight);
        _JCButton.backgroundColor = [UIColor clearColor];
        //按钮高亮显示。
        _JCButton.adjustsImageWhenHighlighted = NO;
        [_JCButton setImage:[UIImage imageNamed:@"RadioButton-Unselected"] forState:UIControlStateNormal];
        [_JCButton setImage:[UIImage imageNamed:@"RadioButton-Selected"] forState:UIControlStateSelected];
        [_JCButton addTarget:self action:@selector(clickActionButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_JCButton];
        
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
        _style = JComboBoxStyleWithDefualt;
    }
    return self;
}

- (void)setDescrin:(NSString *)descrin
{
    _descrin = descrin;
    if (!_lbl_descrin) {
        _lbl_descrin = [UILabel new];
        _lbl_descrin.textColor = [UIColor colorWithRed:128 / 255.0 green:128 / 255.0 blue:128 / 255.0 alpha:1];        _lbl_descrin.font = [UIFont systemFontOfSize:(16)];
        _lbl_descrin.numberOfLines = 0;
        _lbl_descrin.backgroundColor = [UIColor clearColor];
        [self addSubview:_lbl_descrin];
    }
    _lbl_descrin.text = _descrin;
    _lbl_descrin.frame = CGRectMake(_JCButton.frame.origin.x + _JCButton.frame.size.width + 5, _JCButton.frame.origin.y, self.frame.size.width - kJComboBoxButtonWidth - 35, self.frame.size.height);
}

+ (void)setJComboBoxStyle:(JComboBoxStyle)style groupId:(NSString *)groupId
{
    _style = style;
    if (!_dict_style)
        _dict_style = [NSMutableDictionary dictionary];
    [_dict_style setObject:@(_style) forKey:groupId];
}

- (void)setButtonDefualtImage:(NSString *)defualtImage selectImage:(NSString *)selectImage
{
    [_JCButton setImage:[UIImage imageNamed:defualtImage] forState:UIControlStateNormal];
    [_JCButton setImage:[UIImage imageNamed:selectImage] forState:UIControlStateSelected];
}

- (void)clickActionButton:(id)sender
{
    _JCButton.selected = !_JCButton.selected;
    [HQJComboBox buttonSelect:self];
}

+ (void)buttonSelect:(HQJComboBox*)JCBox
{
    if (_dict_observers) {
        id observer = [_dict_observers objectForKey:JCBox.groupId];
        if (observer && [observer respondsToSelector:@selector(handleJComboBoxTapCompleteIndex:groupId:selectStatu:)])
            [observer handleJComboBoxTapCompleteIndex:JCBox.index groupId:JCBox.groupId selectStatu:JCBox.JCButton.selected];
    }
    
    if (_dict_style)
        if ([[_dict_style objectForKey:JCBox.groupId] integerValue] == JComboBoxStyleWithMultiselect)
            return;
    
    if (_ary_JComboBox) {
        [_ary_JComboBox enumerateObjectsUsingBlock:^(HQJComboBox* otherJComboxBox, NSUInteger idx, BOOL * _Nonnull stop) {
            if (![otherJComboxBox isEqual:JCBox])
                [otherJComboxBox otherJComboBoxButtonStatus:JCBox];
        }];
    }
}

- (void)otherJComboBoxButtonStatus:(HQJComboBox*)JCBox
{
    if (_JCButton.selected)
        _JCButton.selected = NO;
}

+ (void)addObserverForJComboBoxWithGroupId:(NSString*)groupId observer:(id)observer
{
    if (!_dict_observers)
        _dict_observers = [NSMutableDictionary dictionary];
    [_dict_observers setObject:observer forKey:groupId];
}

@end
