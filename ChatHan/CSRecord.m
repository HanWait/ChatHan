//
//  CSRecord.m
//  Voice
//
//  Created by 123 on 2017/12/7.
//  Copyright © 2017年 123. All rights reserved.
//

#import "CSRecord.h"
#import <AVFoundation/AVFoundation.h>


@interface CSRecord()<AVAudioRecorderDelegate,AVAudioPlayerDelegate>
@property (nonatomic,strong)AVAudioRecorder * audioRecorder;//音频录音机
@property (nonatomic,strong)AVAudioPlayer   * audioPlayer;//音频播放器，用于播放录音
@end
@implementation CSRecord
+ (instancetype)ShareCSRecord
{
    static CSRecord *record = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        record = [[CSRecord alloc] init];
    });
    return record;
}
- (instancetype)init
{
    if (self = [super init])
    {
    }
    return self;
}

//录音文件的路径
-(NSURL *)getSavePath
{
    NSString * urlStr = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES ) lastObject];
    urlStr = [urlStr stringByAppendingPathComponent:@"myRecord.caf"];
    NSLog(@"file:path:%@",urlStr);
    NSURL * url = [NSURL fileURLWithPath:urlStr];
    return url;
}
//设置音频格式
-(NSDictionary *)getAudioSettion
{
    NSMutableDictionary * dicM = [NSMutableDictionary dictionary];
    //设置录音格式
    [dicM setObject:@(kAudioFormatLinearPCM) forKey:AVFormatIDKey];
    //设置录音采样率，8000是电话采样率，对于一般的录音已经够了
    [dicM setObject:@(8000) forKey:AVSampleRateKey];
    //设置通道，这里采用单声道
    [dicM setObject:@(1) forKey:AVNumberOfChannelsKey];
    //每个采样点位数，分为8，16，24，32
    [dicM setObject:@(8) forKey:AVLinearPCMBitDepthKey];
    //是否使用浮点数采样
    [dicM setObject:@(YES) forKey:AVLinearPCMIsFloatKey];
    //。。。。是他设置
    return dicM;
}
//获得录音机对象
-(AVAudioRecorder * )audioRecorder
{
    if (!_audioRecorder) {
        //创建录音文件保存路径
        NSURL * url =[self getSavePath];
        //创建录音格式设置
        NSDictionary * setting = [self getAudioSettion];
        //创建录音机
        NSError * error = nil;
        _audioRecorder = [[AVAudioRecorder alloc]initWithURL:url settings:setting error:&error];
        _audioRecorder.delegate = self;
        if(error)
        {
            NSLog(@"创建录音机对象发生错误，错误信息是：%@",error.localizedDescription);
            return nil;
        }
        
    }
    return _audioRecorder;
    
}
-(void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag
{
    AVURLAsset* audioAsset =[AVURLAsset URLAssetWithURL:[self getSavePath] options:nil];
    CMTime audioDuration = audioAsset.duration;
    float audioDurationSeconds =CMTimeGetSeconds(audioDuration);
    NSLog(@"录音完成!-->%f",audioDurationSeconds);
}

//创建播放器
-(AVAudioPlayer *)audioPlayer
{
    
    _audioPlayer = nil;
    NSURL * url = [self getSavePath];
    NSError * error = nil;
    _audioPlayer =[[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
    _audioPlayer.numberOfLoops = 0;
    _audioPlayer.delegate = self;
    [_audioPlayer prepareToPlay];
    if (error) {
        NSLog(@"创建播放器过程出错：错误信息是：%@",error.localizedDescription);
        return nil;
    }
    
    return _audioPlayer;
}
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    NSLog(@"播放完了");
}

- (void)beginRecord
{
    AVAudioSession * audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    [audioSession setActive:YES error:nil];
    if (![self.audioRecorder isRecording])
    {
        [self.audioRecorder record];
    }
}
- (void)endRecord
{
    AVAudioSession *session = [AVAudioSession sharedInstance];
    
    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
    
    [self.audioRecorder stop];
}
- (void)playRecord
{
    
    _audioPlayer = [self audioPlayer];
    [_audioPlayer stop];
    [_audioPlayer play];
}
- (void)stopPlayRecord
{
    _audioPlayer = [self audioPlayer];
    [_audioPlayer stop];
}
@end

