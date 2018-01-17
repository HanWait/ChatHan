// 高度 220

#import "EmojiView.h"
#import "CSEmojiCollectionViewCell.h"

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHight [UIScreen mainScreen].bounds.size.height

@interface EmojiView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectionView;
    NSArray *_dataArray;
}
@end

@implementation EmojiView


- (instancetype)init
{
    if (self = [super init])
    {
        [self creatEmojiView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self creatEmojiView];
    }
    return self;
}
- (void)creatEmojiView
{
    NSString *emojiPath = [[NSBundle mainBundle] pathForResource:@"ISEmojiList" ofType:@"plist"];
    _dataArray = [NSArray arrayWithContentsOfFile:emojiPath];
    
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    //同一行相邻两个cell的最小间距
    layout.minimumInteritemSpacing = 0;
    //最小两行之间的间距
    layout.minimumLineSpacing = 0;
    //这个是横向滑动
//    layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    
    layout.itemSize = CGSizeMake(ScreenWidth/8, self.frame.size.height/3);
    
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) collectionViewLayout:layout];
    _collectionView.backgroundColor=[UIColor whiteColor];
    _collectionView.pagingEnabled = YES;
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    [self addSubview:_collectionView];
    
    
    [_collectionView registerClass:[CSEmojiCollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
    
}

//每一组有多少个cell
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataArray.count;
}
//每一个cell是什么
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CSEmojiCollectionViewCell *cell = (CSEmojiCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    cell.emojiLabel.text = _dataArray[indexPath.row];
    return cell;
}
//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(emojiClicked:)])
    {
        NSString *strEmoji = _dataArray[indexPath.row];
        [self.delegate emojiClicked:strEmoji];
    }
    
}

@end
