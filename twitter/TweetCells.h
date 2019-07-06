//
//  TweetCells.h
//  twitter
//
//  Created by aodemuyi on 7/4/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

NS_ASSUME_NONNULL_BEGIN

@interface TweetCells : UITableViewCell
- (IBAction)didPressRetweet:(id)sender;

@property (weak,nonatomic) Tweet* tweet;
@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetContent;
@property (weak, nonatomic) IBOutlet UILabel *replyCount;
@property (weak, nonatomic) IBOutlet UILabel *favoriteCount;
@property (weak, nonatomic) IBOutlet UILabel *retweetCount;
@property (weak, nonatomic) IBOutlet UIImageView *replyImage;
@property (weak, nonatomic) IBOutlet UIImageView *favoriteImage;
@property (weak, nonatomic) IBOutlet UIImageView *retweetImage;
@property (weak, nonatomic) IBOutlet UIButton *retweetButton;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
- (IBAction)didTapLike:(id)sender;

@property (nonatomic, strong) NSArray<Tweet*> *tweets;
@property (weak, nonatomic) IBOutlet UILabel *actualDate;


@end

NS_ASSUME_NONNULL_END
