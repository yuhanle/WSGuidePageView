//
//  WSIntroductionViewController.h
//
//  Created by 温世波 on 15/11/4.
//  Copyright © 2015年 温世波. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^DidSelectedEnter)();

@interface WSIntroductionViewController : UIViewController

@property (nonatomic, strong) UIScrollView *pagingScrollView;
@property (nonatomic, strong) UIButton *enterButton;
@property (nonatomic, assign) CGFloat dotRadius;

@property (nonatomic, copy) DidSelectedEnter didSelectedEnter;

/**åß
 @[@"image1", @"image2"]
 */
@property (nonatomic, strong) NSArray *backgroundImageNames;

/**
 @[@"coverImage1", @"coverImage2"]
 */
@property (nonatomic, strong) NSArray *coverImageNames;


- (id)initWithCoverImageNames:(NSArray*)coverNames backgroundImageNames:(NSArray*)bgNames;


- (id)initWithCoverImageNames:(NSArray*)coverNames backgroundImageNames:(NSArray*)bgNames button:(UIButton*)button;

/**
 *  设置下标索引的现实图片
 *
 *  @param normalImage      正常
 *  @param highlightedImage 选中
 *  @param dotRadius        圆点半径
 */
- (void)setImage:(UIImage *)normalImage highlightedImage:(UIImage *)highlightedImage dotRadius:(CGFloat)dotRadius;

@end
