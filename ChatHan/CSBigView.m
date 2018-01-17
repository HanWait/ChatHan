

#import "CSBigView.h"


#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHight [UIScreen mainScreen].bounds.size.height

@implementation CSBigView

- (instancetype)init
{
    if (self = [super init])
    {
        [self creatImageView];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self creatImageView];
    }
    return self;
}
- (void)creatImageView
{
    
    self.backgroundColor = [UIColor blackColor];
    
    if (_bigImageView == nil)
    {
        _bigImageView = [[UIImageView alloc] init];
        _bigImageView.bounds = CGRectMake(0, 0, 10, 10);
        [self addSubview:_bigImageView];
    }
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClicked:)];
    [self addGestureRecognizer:tap];
    
}
-(void)tapClicked:(UITapGestureRecognizer *)sender
{
    [self removeFromSuperview];
}
-(void)setShow:(BOOL)show
{
    _show = show;
    if (show)
    {
        CGSize size = _bigImageView.image.size;
        CGFloat bigHeight = size.height;
        CGFloat bigWidth = size.width;
        if (bigWidth >= ScreenWidth)
        {
            
            if (bigHeight/bigWidth <= ScreenHight/ScreenWidth)
            {
                bigHeight = bigHeight/bigWidth * ScreenWidth;
                bigWidth = ScreenWidth;
            }
            else
            {
                bigWidth  = bigWidth/bigHeight * ScreenHight;
                bigHeight = ScreenHight;
            }
        }
//        else
//        {
//            if (bigHeight >= ScreenHight)
//            {
//                bigWidth = bigWidth/bigHeight * ScreenHight;
//                bigHeight = ScreenHight;
//            }
//
//        }
        _bigImageView.center = self.center;
        _bigImageView.bounds = CGRectMake(0, 0, bigWidth, bigHeight);
        [[UIApplication sharedApplication].keyWindow addSubview:self];
    }
}
@end
