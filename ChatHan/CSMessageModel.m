//
//  CSMessageModel.m
//  XMPPChat
//
//  Created by 123 on 2017/12/14.
//  Copyright © 2017年 123. All rights reserved.
//

#import "CSMessageModel.h"
//#import "MessageHeader.h"
#import "ConstantPart.h"
#import "UIImage+Han.h"

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHight [UIScreen mainScreen].bounds.size.height



@implementation CSMessageModel


- (CGRect)timeFrame
{
    CGRect rect  = CGRectZero;
    if (self.showMessageTime)
    {
        CGSize size = [self labelAutoCalculateRectWith:self.messageTime Font:[UIFont fontWithName:FONT_REGULAR size:10] MaxSize:CGSizeMake(MAXFLOAT, 17)];
        rect = CGRectMake((ScreenWidth - size.width)/2, 0, size.width + 10, 17);
    }

    return rect;
}

- (CGRect)logoFrame
{
    
    CGRect timeRect = [self timeFrame];
   
    CGRect rect = CGRectZero;
    if (self.messageSenderType == MessageSenderTypeMe)
    {
        rect = CGRectMake(ScreenWidth - 50,timeRect.size.height + 10, 40, 40);
    }
    else
    {
        rect = CGRectMake(10, timeRect.size.height + 10, 40, 40);
    }
    return rect;
}


- (CGRect)messageFrame
{
    CGRect timeRect = [self timeFrame];
    CGRect rect = CGRectZero;
    CGFloat maxWith = ScreenWidth * 0.7 - 60;
     CGSize size = [self labelAutoCalculateRectWith:self.messageText Font:[UIFont fontWithName:FONT_REGULAR size:16] MaxSize:CGSizeMake(maxWith, MAXFLOAT)];
    if (self.messageText == nil)
    {
        return rect;
    }
    if (self.messageSenderType == MessageSenderTypeMe)
    {
        rect = CGRectMake(ScreenWidth * 0.3, timeRect.size.height + 10, maxWith - 5, size.height > 44 ? size.height : 44);;
    }
    else
    {
        rect = CGRectMake(65 , timeRect.size.height + 10 , maxWith, size.height > 44 ? size.height : 44);
    }
    return rect;
}

- (CGRect)voiceFrame
{
    
    
    CGRect timeRect = [self timeFrame];
    CGFloat timeLabelHeight = timeRect.size.height ;
    CGRect rect = CGRectZero;
    CGFloat maxWith = ScreenWidth * 0.7 - 60;
    if (self.duringTime <= 0)
    {
        return rect;
    }
    if (self.messageSenderType == MessageSenderTypeMe)
    {
        rect = CGRectMake(AppFrameWidth * 0.3 + 10 + maxWith - maxWith *(self.duringTime/20.0 > 1? 1 :self.duringTime/20.0), timeLabelHeight + 10, maxWith *(self.duringTime/20.0 > 1? 1 :self.duringTime/20.0), 44);
    }
    else
    {
        rect = CGRectMake(50, timeLabelHeight + 10 , maxWith *(self.duringTime/20.0 > 1? 1 :self.duringTime/20.0), 44);
    }
    return rect;
}
- (CGRect)voiceAnimationFrame
{
    //12, 16
    CGRect voiceRect = [self voiceFrame];
    CGRect rect = CGRectZero;
    if (self.messageSenderType == MessageSenderTypeMe)
    {
        rect.origin.x = voiceRect.size.width - 24;
        rect.origin.y = 14;
        rect.size.width = 12;
        rect.size.height = 16;
        
    }
    else
    {
        rect.origin.x = 12;
        rect.origin.y = 14;
        rect.size.width = 12;
        rect.size.height = 16;
    }
    return rect;
}
- (CGRect)imageFrame
{
    CGRect timeRect = [self timeFrame];
    CGFloat timeLabelHeight = timeRect.size.height;
    CGRect rect = CGRectZero;
    
    CGSize imageSize = [self.imageSmall imageShowSize];
    
    if (self.imageSmall == nil)
    {
        return rect;
    }
    
    if (self.messageSenderType == MessageSenderTypeMe)
    {
        rect = CGRectMake(ScreenWidth - imageSize.width - 50, timeLabelHeight + 10, imageSize.width, imageSize.height);
    }
    else
    {
        rect = CGRectMake(50, timeLabelHeight + 10, imageSize.width, imageSize.height);
    }
    return rect;
}
- (CGRect)bubbleFrame
{
    CGRect rect = CGRectZero;
    switch (self.messageType)
    {
        case MessageTypeText:
            rect = [self messageFrame];
            rect.origin.x =  rect.origin.x + (self.messageSenderType == MessageSenderTypeMe? -10 : -15);
            rect.size.width =  rect.size.width + 25;
            break;
        case MessageTypeVoice:
            rect = [self voiceFrame];
            break;
        case MessageTypeImage:
            rect = [self imageFrame];
            
            break;
        default:
            break;
    }
    
    return rect;
}
- (CGFloat)cellHeight
{
    return [self timeFrame].size.height + [self messageFrame].size.height + [self voiceFrame].size.height + [self imageFrame].size.height + 15;
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
