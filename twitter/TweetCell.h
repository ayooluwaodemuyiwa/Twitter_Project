//
//  TweetCell.h
//  twitter
//
//  Created by aodemuyi on 7/3/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

NS_ASSUME_NONNULL_BEGIN

@interface TweetCell : UITableViewCell
@property (strong, nonatomic) Tweet *tweet;
@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UIImageView *replyPicture;
@property (weak, nonatomic) IBOutlet UIImageView *retweetPicture;
@property (weak, nonatomic) IBOutlet UIImageView *favoritePicture;
@property (weak, nonatomic) IBOutlet UIImageView *messagingPicture;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *tweetContent;
@property (weak, nonatomic) IBOutlet UILabel *userName2;


@end

NS_ASSUME_NONNULL_END
