//
//  ViewController.m
//  XMPPChat
//
//  Created by 123 on 2017/12/14.
//  Copyright © 2017年 123. All rights reserved.
//

#import "ViewController.h"
#import "CSMessageCell.h"
#import "CSMessageModel.h"
#import "CSBigView.h"
#import "EmojiView.h"
#import "CSRecord.h"

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITextViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,CSMessageCellDelegate, EmojiViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, assign) CGFloat nowHeight;
@property (nonatomic, strong) UIImageView *photoImageView;
@property (nonatomic, strong) CSBigView *bigImageView;
@property (nonatomic, strong) EmojiView *ev;
@property (nonatomic, strong) UIImage *photoImage;
@property (nonatomic, strong) NSIndexPath *selectIndex;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableBottomConstraint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _dataArray = [NSMutableArray arrayWithCapacity:0];
    
    _tableView.backgroundColor = [[UIColor alloc] initWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    
    
    _bigImageView = [[CSBigView alloc] init];
    _bigImageView.frame = [UIScreen mainScreen].bounds;
    
    _ev = [[EmojiView alloc] initWithFrame:CGRectMake(0, ScreenHight - 180, ScreenWidth, 180)];
    _ev.hidden = YES;
    _ev.delegate = self;
    [self.view addSubview:_ev];
    
    
    CSMessageModel *model = [[CSMessageModel alloc] init];
    model.showMessageTime=YES;
    model.messageTime = @"2017年12月12日 16:37";
    model.messageSenderType = MessageSenderTypeMe;
    model.messageType = MessageTypeText;
    model.messageText = @"推开窗看见星星依然守在夜空中心中不免多了些暖暖的感动一闪一闪的光努力把黑夜变亮气氛如此安详你在我的生命中是那最闪亮的星一直在无声夜空守护着我们的梦这世界那么大 我的爱只想要你懂 陪伴我孤寂旅程你知道我的梦 你知道我的痛你知道我们感受都相同    就算有再大的风也挡不住勇敢的冲动    努力的往前飞 再累也无所谓    黑夜过后的光芒有多美    分享你我的力量就能把对方的路照亮    我想我们都一样    渴望梦想的光芒    这一路喜悦彷徨    不要轻易说失望    回到最初时光    当时的你多么坚强    那鼓励让我难忘";
    [_dataArray addObject:model];
    
    model = [[CSMessageModel alloc] init];
    model.showMessageTime=YES;
    model.messageSenderType = MessageSenderTypeOther;
    model.messageType = MessageTypeText;
    model.messageText = @"我们都一样";
    model.messageTime = @"16:40";
    [_dataArray addObject:model];
    
    
    model = [[CSMessageModel alloc] init];
    model.showMessageTime=YES;
    model.messageSenderType = MessageSenderTypeMe;
    model.messageType = MessageTypeText;
    model.messageText = @"我们都一样";
    model.messageTime = @"16:40";
    [_dataArray addObject:model];
    
    
    
    model = [[CSMessageModel alloc] init];
    model.showMessageTime=YES;
    model.messageTime = @"2017年12月12日 16:37";
    model.messageSenderType = MessageSenderTypeOther;
    model.messageType = MessageTypeText;
    model.messageText = @"推开窗看见星星依然守在夜空中心中不免多了些暖暖的感动一闪一闪的光努力把黑夜变亮气氛如此安详你在我的生命中是那最闪亮的星一直在无声夜空守护着我们的梦这世界那么大 我的爱只想要你懂 陪伴我孤寂旅程你知道我的梦 你知道我的痛你知道我们感受都相同    就算有再大的风也挡不住勇敢的冲动    努力的往前飞 再累也无所谓    黑夜过后的光芒有多美    分享你我的力量就能把对方的路照亮    我想我们都一样    渴望梦想的光芒    这一路喜悦彷徨    不要轻易说失望    回到最初时光    当时的你多么坚强    那鼓励让我难忘";
    [_dataArray addObject:model];
    
    
    model = [[CSMessageModel alloc] init];
    model.showMessageTime=YES;
    model.messageSenderType = MessageSenderTypeMe;
    model.messageType = MessageTypeVoice;
    model.duringTime = 30;
    model.messageTime = @"16:40";
    [_dataArray addObject:model];
    
    model = [[CSMessageModel alloc] init];
    model.showMessageTime=YES;
    model.messageSenderType = MessageSenderTypeMe;
    model.messageType = MessageTypeVoice;
    model.duringTime = 15;
    model.messageTime = @"16:40";
    [_dataArray addObject:model];
    
    model = [[CSMessageModel alloc] init];
    model.showMessageTime=YES;
    model.messageSenderType = MessageSenderTypeMe;
    model.messageType = MessageTypeVoice;
    model.duringTime = 100;
    model.messageTime = @"16:40";
    [_dataArray addObject:model];
    
    
    model = [[CSMessageModel alloc] init];
    model.showMessageTime=YES;
    model.messageSenderType = MessageSenderTypeOther;
    model.messageType = MessageTypeVoice;
    model.duringTime = 20;
    model.messageTime = @"16:40";
    [_dataArray addObject:model];
    
    model = [[CSMessageModel alloc] init];
    model.showMessageTime=YES;
    model.messageSenderType = MessageSenderTypeOther;
    model.messageType = MessageTypeVoice;
    model.duringTime = 10;
    model.messageTime = @"16:40";
    [_dataArray addObject:model];
    
    model = [[CSMessageModel alloc] init];
    model.showMessageTime=YES;
    model.messageSenderType = MessageSenderTypeOther;
    model.messageType = MessageTypeVoice;
    model.duringTime = 15;
    model.messageTime = @"16:40";
    [_dataArray addObject:model];
    
    model = [[CSMessageModel alloc] init];
    model.showMessageTime=YES;
    model.messageSenderType = MessageSenderTypeMe;
    model.messageType = MessageTypeImage;
    model.imageSmall = [UIImage imageNamed:@"w"];
    model.messageTime = @"16:40";
    [_dataArray addObject:model];
    
    
    model = [[CSMessageModel alloc] init];
    model.showMessageTime=YES;
    model.messageSenderType = MessageSenderTypeOther;
    model.messageType = MessageTypeImage;
    model.imageSmall = [UIImage imageNamed:@"mm"];
    model.messageTime = @"16:40";
    [_dataArray addObject:model];
    
    
    model = [[CSMessageModel alloc] init];
    model.showMessageTime=YES;
    model.messageSenderType = MessageSenderTypeMe;
    model.messageType = MessageTypeImage;
    model.imageSmall = [UIImage imageNamed:@"w"];
    model.messageTime = @"16:40";
    [_dataArray addObject:model];
    
    model = [[CSMessageModel alloc] init];
    model.showMessageTime=YES;
    model.messageSenderType = MessageSenderTypeOther;
    model.messageType = MessageTypeImage;
    model.imageSmall = [UIImage imageNamed:@"m"];
    model.messageTime = @"16:40";
    [_dataArray addObject:model];
    
    model = [[CSMessageModel alloc] init];
    model.showMessageTime=YES;
    model.messageSenderType = MessageSenderTypeMe;
    model.messageType = MessageTypeImage;
    model.imageSmall = [UIImage imageNamed:@"dd"];
    model.messageTime = @"16:40";
    [_dataArray addObject:model];
    
    model = [[CSMessageModel alloc] init];
    model.showMessageTime=YES;
    model.messageSenderType = MessageSenderTypeOther;
    model.messageType = MessageTypeImage;
    model.imageSmall = [UIImage imageNamed:@"ll"];
    model.messageTime = @"16:40";
    [_dataArray addObject:model];
    
    model = [[CSMessageModel alloc] init];
    model.showMessageTime=YES;
    model.messageSenderType = MessageSenderTypeMe;
    model.messageType = MessageTypeImage;
    model.imageSmall = [UIImage imageNamed:@"ss"];
    model.messageTime = @"16:40";
    [_dataArray addObject:model];
    
    model = [[CSMessageModel alloc] init];
    model.showMessageTime=YES;
    model.messageSenderType = MessageSenderTypeOther;
    model.messageType = MessageTypeImage;
    model.imageSmall = [UIImage imageNamed:@"m"];
    model.messageTime = @"16:40";
    [_dataArray addObject:model];
    
    
    _tableView.separatorColor = [UIColor clearColor];
    
    
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
-(void)keyboardWillShow:(NSNotification *)aNotification
{
    _ev.hidden = YES;
    //获取键盘的高度
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    int height = keyboardRect.size.height;
    _tableBottomConstraint.constant = 44 + height;
    UIView *vi = [self.view viewWithTag:100];
    CGRect rec = vi.frame ;
    rec.origin.y = _nowHeight - height;
    vi.frame = rec;
}
- (void)keyboardWillHide:(NSNotification *)aNotification
{
    _ev.hidden = YES;
    _tableBottomConstraint.constant = 44;
    UIView *vi = [self.view viewWithTag:100];
    vi.frame = CGRectMake(0, _nowHeight, [UIScreen mainScreen].bounds.size.width, 44);
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    UIView *vi = [self.view viewWithTag:100];
    if (!vi)
    {
        _nowHeight =  _tableView.frame.size.height;
        [self bottomView];
    }
    
}

#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CSMessageCell *cell=[CSMessageCell cellWithTableView:tableView messageModel:_dataArray[indexPath.row]];
    cell.delegate = self;
//    cell
    cell.backgroundColor = [[UIColor alloc] initWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CSMessageModel *model = _dataArray[indexPath.row];
    return [model cellHeight];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}
- (void)messageCellSingleClickedWith:(CSMessageCell *)cell
{
    
    [self.view endEditing:YES];
    
    
    if (_ev.hidden == NO)
    {
        _ev.hidden = YES;
        _tableBottomConstraint.constant = 44;
        UIView *vi = [self.view viewWithTag:100];
        vi.frame = CGRectMake(0, _nowHeight, [UIScreen mainScreen].bounds.size.width, 44);
    }
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    CSMessageModel *model = _dataArray[indexPath.row];
    if (model.messageType == MessageTypeVoice)
    {
        [[CSRecord ShareCSRecord] playRecord];
        
        if ([_selectIndex isEqual: indexPath] == NO)
        {
            
            CSMessageCell *cell1 = [self.tableView cellForRowAtIndexPath:_selectIndex];
            [cell1 stopVoiceAnimation];
            
            _selectIndex = indexPath;
            [cell startVoiceAnimation];
        }
        else
        {
            if (cell.voiceAnimationImageView.isAnimating)
            {
                [cell stopVoiceAnimation];
            }
            else
            {
                [cell startVoiceAnimation];
            }
        }
    }
    else if (model.messageType == MessageTypeImage)
    {
        _bigImageView.bigImageView.image = model.imageSmall;
        _bigImageView.show = YES;
        
//        [[UIApplication sharedApplication].keyWindow bringSubviewToFront:_bigImageView];
    }
    
}

-(void)bottomView
{
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, _nowHeight, [UIScreen mainScreen].bounds.size.width, 44)];
    bgView.tag = 100;
    bgView.backgroundColor = [[UIColor alloc] initWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    bgView.layer.masksToBounds = YES;
    bgView.layer.borderColor = [[UIColor alloc] initWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1].CGColor;
    bgView.layer.borderWidth = 1;
    [self.view addSubview:bgView];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(49, 0, bgView.bounds.size.width - 152, 44)];
    textView.delegate = self;
    textView.tag = 101;
    textView.returnKeyType = UIReturnKeySend;
    textView.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
    textView.text = @"hello world";
    [bgView addSubview:textView];


    
    UIButton *recordBtn = [[UIButton alloc] init];
    recordBtn.frame = CGRectMake(10, 5, 34, 34);
    [recordBtn setBackgroundImage:[UIImage imageNamed:@"record"] forState:UIControlStateNormal];
    [recordBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [recordBtn addTarget:self action:@selector(leaveBtnClicked:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    [recordBtn addTarget:self action:@selector(touchDown:)forControlEvents: UIControlEventTouchDragInside];
    [bgView addSubview:recordBtn];
    
    UIButton *emojiBtn = [[UIButton alloc] init];
    emojiBtn.frame = CGRectMake(bgView.frame.size.width - 83, 5, 34, 34);
    [emojiBtn setBackgroundImage:[UIImage imageNamed:@"emoji"] forState:UIControlStateNormal];
    [emojiBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    emojiBtn.tag = 12;
    [bgView addSubview:emojiBtn];
    
    UIButton *imageBtn = [[UIButton alloc] init];
    imageBtn.frame = CGRectMake(bgView.frame.size.width - 39, 5, 34, 34);
    [imageBtn setBackgroundImage:[UIImage imageNamed:@"image"] forState:UIControlStateNormal];
    [imageBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    imageBtn.tag = 13;
    [bgView addSubview:imageBtn];
    
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"])
    {
        if (textView.text.length == 0)
        {
            return NO;
        }
        CSMessageModel *model = [[CSMessageModel alloc] init];
        model.showMessageTime=YES;
        model.messageSenderType = MessageSenderTypeOther;
        model.messageType = MessageTypeText;
        model.messageText = textView.text;
        model.messageTime = @"16:40";
        [_dataArray addObject:model];
        [_tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForItem:_dataArray.count - 1 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:_dataArray.count - 1 inSection:0]
                                    animated:YES
                              scrollPosition:UITableViewScrollPositionMiddle];
        textView.text = @"";
        return NO;
    }
    
    return YES;
}
static int iiii = 0;
- (void)touchDown:(UIButton *)btn
{
    if (iiii == 0)
    {
        [[CSRecord ShareCSRecord] beginRecord];
        iiii = 1;
    }
    
}
- (void)leaveBtnClicked:(UIButton *)btn
{
    iiii = 0;
    NSLog(@"松开了");
    [[CSRecord ShareCSRecord] endRecord];
}
- (void)btnClicked:(UIButton *)btn
{
    [self.view endEditing:YES];
    _ev.hidden = YES;
    _tableBottomConstraint.constant = 44;
    UIView *vi = [self.view viewWithTag:100];
    vi.frame = CGRectMake(0, _nowHeight, [UIScreen mainScreen].bounds.size.width, 44);
    switch (btn.tag)
    {
        case 11:
            
            break;
        case 12:
            
        {
            
            _ev.hidden = NO;
            _tableBottomConstraint.constant = 44 + 180;
            UIView *vi = [self.view viewWithTag:100];
            CGRect rec = vi.frame ;
            rec.origin.y = _nowHeight - 180;
            vi.frame = rec;

        }
            
            break;
        case 13:
            {
                
                
                
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请选择" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
                [alertController addAction:[UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    UIImagePickerController * picker = [[UIImagePickerController alloc]init];
                    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                        
                        //图片选择是相册（图片来源自相册）
                        
                        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                        
                        //设置代理
                        
                        picker.delegate=self;
                        
                        //模态显示界面
                        
                        [self presentViewController:picker animated:YES completion:nil];
                        
                    }
                    
                    else {
                        
                        NSLog(@"不支持相机");
                        
                    }
                    

                    NSLog(@"点击确认");
                    
                }]];
                [alertController addAction:[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                    UIImagePickerController * picker = [[UIImagePickerController alloc]init];
                    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
                        
                        //图片选择是相册（图片来源自相册）
                        
                        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                        
                        //设置代理
                        
                        picker.delegate=self;
                        
                        //模态显示界面
                        
                        [self presentViewController:picker animated:YES completion:nil];
                        
                        
                        
                    }
                    
                    NSLog(@"点击确认");
                    
                }]];
                [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    
                    [self dismissViewControllerAnimated:YES completion:nil];
                    NSLog(@"点击取消");
                    
                }]];
                
                [self presentViewController:alertController animated:YES completion:nil];
                
            }
            break;
        default:
            break;
    }
    NSLog(@"呀！我这个按钮别点击了！");
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
     if (picker.sourceType == UIImagePickerControllerSourceTypePhotoLibrary)
     {
        UIImage * image =info[UIImagePickerControllerOriginalImage];
        CSMessageModel * model = [[CSMessageModel alloc] init];
         model.showMessageTime=YES;
         model.messageSenderType = MessageSenderTypeOther;
         model.messageType = MessageTypeImage;
         model.imageSmall = image;
         model.messageTime = @"16:40";
         [_dataArray addObject:model];
         
         [_tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForItem:_dataArray.count - 1 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
         [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:_dataArray.count - 1 inSection:0]
                                     animated:YES
                               scrollPosition:UITableViewScrollPositionMiddle];
         
        [self dismissViewControllerAnimated:YES completion:nil];
     }
   else if (picker.sourceType == UIImagePickerControllerSourceTypeCamera)
    {
        UIImage * image =info[UIImagePickerControllerOriginalImage];
        CSMessageModel * model = [[CSMessageModel alloc] init];
        model.showMessageTime=YES;
        model.messageSenderType = MessageSenderTypeOther;
        model.messageType = MessageTypeImage;
        model.imageSmall = image;
        model.messageTime = @"16:40";
        [_dataArray addObject:model];
        
        [_tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForItem:_dataArray.count - 1 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:_dataArray.count - 1 inSection:0]
                                    animated:YES
                              scrollPosition:UITableViewScrollPositionMiddle];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
- (void)showBigImage
{
    
}

#pragma mark - EmojiViewDelegate
- (void)emojiClicked:(NSString *)strEmoji {
    UITextView *tv = [self.view viewWithTag:101];
    tv.text = [tv.text stringByAppendingString:strEmoji];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
