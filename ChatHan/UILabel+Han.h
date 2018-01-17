//
//  UILabel+Han.h
//  XMPPChat
//
//  Created by 123 on 2017/12/14.
//  Copyright © 2017年 123. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Han)
- (void)cellType;
- (CGSize)labelAutoCalculateRectWith:(NSString *)text Font:(UIFont *)textFont MaxSize:(CGSize)maxSize;
@end
