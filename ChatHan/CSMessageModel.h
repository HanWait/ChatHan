//
//  CSMessageModel.h
//  XMPPChat
//
//  Created by 123 on 2017/12/14.
//  Copyright © 2017年 123. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*
 消息类型
 */
typedef NS_OPTIONS(NSUInteger, MessageType) {
    MessageTypeText=1,
    MessageTypeVoice,
    MessageTypeImage
    
    
};


/*
 消息发送方
 */
typedef NS_OPTIONS(NSUInteger, MessageSenderType) {
    MessageSenderTypeMe=1,
    MessageSenderTypeOther
    
};



/*
 消息发送状态
 */

typedef NS_OPTIONS(NSUInteger, MessageSentStatus) {
    MessageSentStatusSended=1,//送达
    MessageSentStatusUnSended, //未发送
    MessageSentStatusSending, //正在发送
    
};

/*
 消息接收状态
 */

typedef NS_OPTIONS(NSUInteger, MessageReadStatus) {
    MessageReadStatusRead=1,//消息已读
    MessageReadStatusUnRead //消息未读
    
};


/*
 
 只有当消息送达的时候，才会出现 接收状态，
 消息已读 和未读 仅仅针对自己
 
 
 未送达显示红色，
 发送中显示菊花
 送达状态彼此互斥
 
 
 
 */




@interface CSMessageModel : NSObject


@property (nonatomic, assign) MessageType         messageType;
@property (nonatomic, assign) MessageSenderType   messageSenderType;
@property (nonatomic, assign) MessageSentStatus   messageSentStatus;
@property (nonatomic, assign) MessageReadStatus   messageReadStatus;
/*
 是否显示小时的时间
 */
@property (nonatomic, assign) BOOL   showMessageTime;

/*
 消息时间  2017-09-11 11:11
 */
@property (nonatomic, retain) NSString    *messageTime;


/*
 图像url
 */
@property (nonatomic, retain) NSString    *logoUrl;

/*
 消息文本内容
 */
@property (nonatomic, retain) NSString    *messageText;


/*
 音频时间
 */

@property (nonatomic, assign) NSInteger   duringTime;
/*
 消息音频url
 */
@property (nonatomic, retain) NSString    *voiceUrl;


/*
 图片文件
 */
@property (nonatomic, retain) NSString    *imageUrl;

/*
 图片文件
 */
@property (nonatomic, retain) UIImage    *imageSmall;


- (CGRect)timeFrame;
- (CGRect)logoFrame;
- (CGRect)messageFrame;
- (CGRect)voiceFrame;
- (CGRect)voiceAnimationFrame;
- (CGRect)bubbleFrame;
- (CGRect)imageFrame;
- (CGFloat)cellHeight;


@end
