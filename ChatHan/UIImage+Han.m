//
//  UIImage+Han.m
//  XMPPChat
//
//  Created by 123 on 2017/12/15.
//  Copyright © 2017年 123. All rights reserved.
//

#import "UIImage+Han.h"
#define MAX_IMAGE_W 141.0
#define MAX_IMAGE_H 228.0
@implementation UIImage (Han)
/*
 判断图片长度&宽度
 
 */
-(CGSize)imageShowSize{
    
    CGFloat imageWith=self.size.width;
    CGFloat imageHeight=self.size.height;
    
    
    //宽度大于高度
    if (imageWith >= imageHeight) {
        // 宽度超过标准宽度
        /**/
         if (imageWith > MAX_IMAGE_W)
         {
             return CGSizeMake(MAX_IMAGE_W, imageHeight*MAX_IMAGE_W/imageWith);
         }
         else
         {
             return self.size;
         }
    }
    else
    {
        /**/
         if (imageHeight > MAX_IMAGE_H)
         {
             return CGSizeMake(imageWith*MAX_IMAGE_W/imageHeight, MAX_IMAGE_W);
         }
         else
         {
             return self.size;
         }
    }
    
    
    
    
    
    return CGSizeZero;
}
@end
