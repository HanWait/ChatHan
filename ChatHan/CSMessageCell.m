//
//  CSMessageCell.m
//  XMPPChat
//
//  Created by 123 on 2017/12/14.
//  Copyright © 2017年 123. All rights reserved.
//

#import "CSMessageCell.h"
#import "CSMessageModel.h"
#import "ConstantPart.h"
#import "UILabel+Han.h"
#import "UIImage+Han.h"


@interface CSMessageCell()

@property (nonatomic, strong) UIImageView *logoImageView;
@property (nonatomic, strong) UIImageView *bubbleImageView;
@property (nonatomic, strong) UIImageView *voiceImageView;

@property (nonatomic, strong) UILabel     *messageLabel;
@property (nonatomic, strong) UILabel     *timeLabel;
@property (nonatomic, strong) UIFont      *textFont;




@end
@implementation CSMessageCell

+(instancetype)cellWithTableView:(UITableView *)tableView messageModel:(CSMessageModel *)model{
    
    static NSString *identifier = @"WeChatCell";
    CSMessageCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell ==nil)
    {
        cell = [[CSMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.messageModel = model;
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        //初始化subViews
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        [self creatSubViewTime];
        [self creatSubViewBubble];
        [self creatSubViewLogo];
        [self creatSubViewMessage];
        [self creatSubViewVoice];
        [self creatSubViewAnimationVoice];
        [self creatSubViewImage];
        
    }
    return self;
}
#pragma mark - 创建子视图

- (void)creatSubViewMessage
{
    _messageLabel      = [[UILabel alloc] init];
    _messageLabel.hidden      = YES;
    [self.contentView addSubview:_messageLabel];
    _textFont=[UIFont fontWithName:FONT_REGULAR size:16];
    _messageLabel.numberOfLines=0;
    _messageLabel.lineBreakMode=NSLineBreakByWordWrapping;
    _messageLabel.font = _textFont;
    _messageLabel.textColor=COLOR_444444;
}

- (void)creatSubViewTime
{
    _timeLabel        = [[UILabel alloc] init];
    _timeLabel.hidden        = YES;
    [self.contentView addSubview:_timeLabel];
    _timeLabel.font=[UIFont fontWithName:FONT_REGULAR size:10];
    _timeLabel.backgroundColor=COLOR_cecece;
    _timeLabel.textColor=COLOR_ffffff;
    _timeLabel.textAlignment=NSTextAlignmentCenter;
    _timeLabel.layer.masksToBounds=YES;
    _timeLabel.layer.cornerRadius=4;
    _timeLabel.layer.borderColor=[COLOR_cecece CGColor];
    _timeLabel.layer.borderWidth=1;
}

- (void)creatSubViewLogo
{
    _logoImageView    = [[UIImageView alloc] init];
    _logoImageView.hidden    = YES;
    [self.contentView addSubview:_logoImageView];
}

- (void)creatSubViewBubble
{
    _bubbleImageView  = [[UIImageView alloc] init];
    _bubbleImageView.hidden  = YES;
    _bubbleImageView.userInteractionEnabled = YES;
    [self.contentView addSubview:_bubbleImageView];
    
    UILongPressGestureRecognizer *longPressGesture=[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressBubbleView:)];
    [_bubbleImageView  addGestureRecognizer:longPressGesture];
    
    
    UITapGestureRecognizer * singleTap2    = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap2:)];
    [_bubbleImageView addGestureRecognizer:singleTap2];
}

- (void)creatSubViewVoice
{
    _voiceImageView   = [[UIImageView alloc] init];
    _voiceImageView.hidden   = YES;
    [self.contentView addSubview:_voiceImageView];
}
- (void)creatSubViewAnimationVoice
{
    _voiceAnimationImageView   = [[UIImageView alloc] init];
    _voiceAnimationImageView.hidden   = YES;
    [_voiceImageView addSubview:_voiceAnimationImageView];
}
- (void)creatSubViewImage
{
    _imageImageView   = [[UIImageView alloc] init];
    _imageImageView.hidden   = YES;
    [self.contentView addSubview:_imageImageView];
}



- (void)setMessageModel:(CSMessageModel *)messageModel {
    _messageModel = messageModel;

    
    _timeLabel.hidden = !messageModel.showMessageTime;
    _timeLabel.frame = [messageModel timeFrame];
    _timeLabel.text = messageModel.messageTime;
    
    
    
    _logoImageView.hidden = NO;
    _logoImageView.frame = [messageModel logoFrame];
   
    _bubbleImageView.hidden = NO;
    _bubbleImageView.frame = [messageModel bubbleFrame];
    
    if (messageModel.messageSenderType == MessageSenderTypeMe)
    {
        _logoImageView.image = [UIImage imageNamed:@"w"];
        _bubbleImageView.image = [[UIImage imageNamed:@"me"] stretchableImageWithLeftCapWidth:20 topCapHeight:40];
    }
    else
    {
        _logoImageView.image = [UIImage imageNamed:@"m"];
        _bubbleImageView.image = [[UIImage imageNamed:@"other"] stretchableImageWithLeftCapWidth:20 topCapHeight:40];
    }
    
    
    switch (messageModel.messageType)
    {
        case MessageTypeText:
            _messageLabel.hidden = NO;
            _messageLabel.frame = [messageModel messageFrame];
            _messageLabel.text = messageModel.messageText;
             _messageLabel.textAlignment = NSTextAlignmentLeft;
            
            break;
        case MessageTypeVoice:
            _voiceImageView.hidden = NO;
            _voiceImageView.frame = [messageModel voiceFrame];
            _messageLabel.hidden = NO;
            _messageLabel.frame = [messageModel voiceFrame];
            _messageLabel.textAlignment = messageModel.messageSenderType == MessageSenderTypeMe ? NSTextAlignmentLeft:NSTextAlignmentRight;
            _messageLabel.text = [NSString stringWithFormat:@"%ld''",(long)messageModel.duringTime];
            _voiceAnimationImageView.hidden = NO;
            _voiceAnimationImageView.frame = [messageModel voiceAnimationFrame];
            _voiceAnimationImageView.image=[UIImage imageNamed:@"wechatvoice3"];
            _voiceAnimationImageView.animationImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"wechatvoice3"],[UIImage imageNamed:@"wechatvoice3_1"],[UIImage imageNamed:@"wechatvoice3_0"],[UIImage imageNamed:@"wechatvoice3_1"],[UIImage imageNamed:@"wechatvoice3"],nil];
            
            _voiceAnimationImageView.animationDuration = 1;
            _voiceAnimationImageView.transform =messageModel.messageSenderType == MessageSenderTypeMe ?  CGAffineTransformMakeRotation(M_PI) : CGAffineTransformMakeRotation(0);
            _voiceAnimationImageView.animationRepeatCount = -1;
            break;
        case MessageTypeImage:
            _imageImageView.hidden = NO;
            _imageImageView.frame = [messageModel imageFrame];
            _imageImageView.image = messageModel.imageSmall;
            CGSize imageSize = [messageModel.imageSmall imageShowSize];
            UIImageView *imageViewMask = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:_messageModel.messageSenderType == MessageSenderTypeMe ? @"me" :@"other"] stretchableImageWithLeftCapWidth:20 topCapHeight:40]];
            imageViewMask.frame = CGRectMake(0, 0, imageSize.width, imageSize.height);
            _imageImageView.layer.mask = imageViewMask.layer;
            
            break;
//        default:
//            break;
    }
    


}

- (void)prepareForReuse {
    [super prepareForReuse];
    
    //text voice image
    self.frame = CGRectMake(0, 0, AppFrameWidth, 44);
    _logoImageView.hidden = YES;
    _bubbleImageView.hidden = YES;
    _voiceImageView.hidden = YES;
    _messageLabel.hidden = YES;
    _timeLabel.hidden = YES;
    _imageImageView.hidden = YES;
    
    
    
}

#pragma 长按事件
- (void)longPressBubbleView:(UILongPressGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan)
    {
        [self showMenuControllerInView:self bgView:sender.view];
    }
    
}
- (void)showMenuControllerInView:(CSMessageCell *)inView
                          bgView:(UIView *)supView
{
    [self becomeFirstResponder];
    
    CSMessageModel *messageModel=self.messageModel;
    
    UIMenuItem *copyTextItem1 = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copyTextSender1:)];
    UIMenuItem *copyTextItem2 = [[UIMenuItem alloc] initWithTitle:@"保存到相册" action:@selector(copyTextSender2:)];
    UIMenuController *menu = [UIMenuController sharedMenuController];
    [menu setTargetRect:supView.frame inView:inView];
    [menu setArrowDirection:UIMenuControllerArrowDefault];
    if (messageModel.messageType==MessageTypeText)
    {
        [menu setMenuItems:@[copyTextItem1]];
    }
    else if (messageModel.messageType==MessageTypeImage)
    {
         [menu setMenuItems:@[copyTextItem2]];
    }
    else if(messageModel.messageType==MessageTypeVoice)
    {
    }
    
    
    
    
    [menu setMenuVisible:YES animated:YES];
    
}
#pragma mark 剪切板代理方法
-(BOOL)canBecomeFirstResponder {
    NSLog(@"%s",__FUNCTION__);
    return YES;
}

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    if (action == @selector(copyTextSender1:)) {
        return true;
    } else  if (action == @selector(copyTextSender2:)) {
        return true;
    } else {
        return false;
    }
}
-(void)copyTextSender1:(id)sender {
    
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    if (self.messageModel.messageText.length > 0)
    {
        pasteboard.string = self.messageModel.messageText;
    }
}
-(void)copyTextSender2:(id)sender {
     UIImageWriteToSavedPhotosAlbum(self.imageImageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}



-(void)handleSingleTap2:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(messageCellSingleClickedWith:)])
    {
        [self.delegate messageCellSingleClickedWith:self];
    }
}
//开始录音动画
- (void)startVoiceAnimation
{
    [self.voiceAnimationImageView startAnimating];
}
//结束录音动画
- (void)stopVoiceAnimation
{
    [self.voiceAnimationImageView stopAnimating];
}

//保存到相册回调
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
