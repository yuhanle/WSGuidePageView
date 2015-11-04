//
//  WSPagerView.h
//  WSPagerView
//
//  Created by 温世波 on 15/11/4.
//  Copyright © 2015年 温世波. All rights reserved.
//

#import <UIKit/UIKit.h>

#define WSPAGERVIEW_DID_UPDATE_NOTIFICATION @"WSPageViewDidUpdate"

@protocol WSPagerViewDelegate;

@interface WSPagerView : UIView

- (void)setImage:(UIImage *)normalImage highlightedImage:(UIImage *)highlightedImage forKey:(NSString *)key;

@property (nonatomic,assign) NSInteger page;
@property (nonatomic,assign) CGFloat dotRadius;/** 圆点半径 */
@property (nonatomic,readonly) NSInteger numberOfPages;
@property (nonatomic,copy) NSString *pattern;
@property (nonatomic,assign) id<WSPagerViewDelegate>delegate;

@end

@protocol WSPagerViewDelegate <NSObject>

@optional
- (BOOL)pageView:(WSPagerView *)pageView shouldUpdateToPage:(NSInteger)newPage;
- (void)pageView:(WSPagerView *)pageView didUpdateToPage:(NSInteger)newPage;

@end