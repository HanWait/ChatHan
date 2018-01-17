

#import "CSEmojiCollectionViewCell.h"

@implementation CSEmojiCollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _emojiLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _emojiLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_emojiLabel];
    }
    
    return self;
}

@end
