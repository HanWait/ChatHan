



#import <UIKit/UIKit.h>


@protocol EmojiViewDelegate <NSObject>

@optional
- (void)emojiClicked:(NSString *)strEmoji;
@end



@interface EmojiView : UIView
@property (nonatomic, assign) id<EmojiViewDelegate> delegate;
@end
