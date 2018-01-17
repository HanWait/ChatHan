//
//  CSRecord.h
//  Voice
//
//  Created by 123 on 2017/12/7.
//  Copyright © 2017年 123. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSRecord : NSObject
+ (instancetype)ShareCSRecord;
- (void)beginRecord;
- (void)endRecord;
//- (void)getVoicePath;
//- (void)getVoiceFile;
- (void)playRecord;
@end
