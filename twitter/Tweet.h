//
//  Tweet.h
//  twitter
//
//  Created by aodemuyi on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface Tweet : NSObject

@property (nonatomic, strong) NSString *idStr; // For favoriting, retweeting & replying
@property (strong, nonatomic) NSString *text; // Text content of tweet
@property (nonatomic) int favoriteCount; // Update favorite count label
@property (nonatomic) BOOL favorited; // Configure favorite button
@property (nonatomic) int retweetCount; // Update favorite count label
@property (nonatomic) BOOL retweeted; // Configure retweet button
@property (strong, nonatomic) User *user; // Contains name, screenname, etc. of tweet author
@property (strong, nonatomic) NSString *createdAtString; // Display date
@property (strong, nonatomic) NSString *replyCount; // Displays number of replies to a user's tweet
@property (nonatomic) BOOL *possiblySensitive; // when there is a link, determines sensitivity
@property (nonatomic) int quoteCount; // number of times quoted
@property (nonatomic) BOOL quotedStatus; // if tweet is quoted

//for Retweets
@property (strong, nonatomic) User *retweetedbyUser; //user who retweeted if tweet is retweet

+ (NSMutableArray *)tweetsWithArray:(NSArray *)dictionaries;

-(instancetype)initWithDictionary:(NSDictionary *) dictionary;

@end

NS_ASSUME_NONNULL_END
