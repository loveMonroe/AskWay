//
//  UIView+FrameGeometry.h
//  LPUIKitDemo
//
//  Created by cs on 2017/2/10.
//  Copyright © 2017年 BestFace. All rights reserved.
//

#import <UIKit/UIKit.h>

CGPoint CGRectGetCenter(CGRect rect);
CGRect  CGRectMoveToCenter(CGRect rect, CGPoint center);

@interface UIView (FrameGeometry)

@property CGPoint origin;
@property CGSize size;

@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;

@property CGFloat x;
@property CGFloat y;
@property CGFloat height;
@property CGFloat width;

@property CGFloat top;
@property CGFloat left;

@property CGFloat bottom;
@property CGFloat right;

@property CGFloat centerX;
@property CGFloat centerY;

- (void)moveBy:(CGPoint) delta;
- (void)scaleBy:(CGFloat) scaleFactor;
- (void)fitInSize:(CGSize) aSize;


@end
