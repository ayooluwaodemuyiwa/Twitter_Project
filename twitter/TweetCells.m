//
//  TweetCells.m
//  twitter
//
//  Created by aodemuyi on 7/4/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "TweetCells.h"
#import "Tweet.h"
#import "APIManager.h"
#import "User.h"
#import "UIImageView+AFNetworking.h"

@implementation TweetCells

- (void)awakeFromNib {
    [super awakeFromNib];
    //[self.favoriteButton setImage:[UIImage imageNamed:@"favor-icon"] forState:UIControlStateNormal];
  //  [self.favoriteButton setImage:[UIImage imageNamed:@"favor-icon-red"]forState:UIControlStateNormal];
    [self refreshData];
     
}

-(void)setTweet:(Tweet*)tweet{
    _tweet=tweet;
    self.favoriteButton.selected=self.tweet.favorited;
    self.retweetButton.selected=self.tweet.retweeted;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (IBAction)didTapLike:(id)sender {
    if(self.favoriteButton.selected){
        self.tweet.favorited = NO;
        self.tweet.favoriteCount -= 1;
        [self.favoriteButton setSelected:(NO)];
        self.favoriteCount.text =[NSString stringWithFormat:@"%i",  self.tweet.favoriteCount];
    [[APIManager shared] unfavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error unfavoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully unfavorited the following Tweet: %@", tweet.text);
            }
        }];
    }
    else{
        self.tweet.favorited = YES;
        self.tweet.favoriteCount += 1;
        self.favoriteCount.text =[NSString stringWithFormat:@"%i",  self.tweet.favoriteCount];
        [self.favoriteButton setSelected:(YES)];
    [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
        }
        else{
            NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
        }
    }];
    }
}

- (IBAction)didPressRetweet:(id)sender {
    if(self.retweetButton.selected){
        self.tweet.retweeted = NO;
        self.tweet.retweetCount -= 1;
        self.retweetCount.text =[NSString stringWithFormat:@"%i",  self.tweet.retweetCount];
        [self.retweetButton setSelected:(NO)];
        
        [[APIManager shared] unretweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error unfavoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully unfavorited the following Tweet: %@", tweet.text);
            }
        }];
    }
    else{
        self.tweet.retweeted = YES;
        self.tweet.retweetCount += 1;
        self.retweetCount.text =[NSString stringWithFormat:@"%i",  self.tweet.retweetCount];
        [self.retweetButton setSelected:(YES)];
        [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
            }
        }];
    }
}

-(void)refreshData{
    self.favoriteCount.text = [NSString stringWithFormat:@"%i", self.tweet.favoriteCount];
    self.retweetCount.text=[NSString stringWithFormat:@"%i", self.tweet.retweetCount];
}


@end
