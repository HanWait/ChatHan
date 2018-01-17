//
//  UILabel+Han.m
//  XMPPChat
//
//  Created by 123 on 2017/12/14.
//  Copyright © 2017年 123. All rights reserved.
//

#import "UILabel+Han.h"

@implementation UILabel (Han)
- (void)cellType
{
    
}
- (CGSize)labelAutoCalculateRectWith:(NSString *)text Font:(UIFont *)textFont MaxSize:(CGSize)maxSize
{
    NSDictionary *attributes = @{NSFontAttributeName: textFont};
    CGRect rect = [text boundingRectWithSize:maxSize
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:attributes
                                     context:nil];
    return rect.size;
}
@end
