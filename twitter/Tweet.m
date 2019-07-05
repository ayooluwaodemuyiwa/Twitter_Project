//
//  Tweet.m
//  twitter
//
//  Created by aodemuyi on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet

-(instancetype)initWithDictionary:(NSDictionary *) dictionary {
    self = [super init];
    if (self) {
        NSDictionary *originalTweet = dictionary[@"retweeted_status"];
        //NSDictionary *quotedTweet = dictionary[@"quoted_status"];
        if(originalTweet != nil){
            //self.retweetedbyUser= [[User alloc] initWithDictionary: dictionary];
            // Change tweet to the original tweet
           // dictionary = originalTweet;
        }
    }
    self.idStr = dictionary[@"id_str"];
    self.text = dictionary[@"text"];
    self.favoriteCount = [dictionary[@"favorite_count"] intValue];
    self.favorited = [dictionary[@"favorited"]boolValue];
    self.retweetCount = [dictionary[@"retweet_count"]intValue];
    self.retweeted = [dictionary[@"retweeted"]boolValue];
    //self.replyCount = [dictionary[@"reply_count"] intValue];
    //self.possiblySensitive = [dictionary[@"possibly_sensitive"]boolValue];
    self.quoteCount = [dictionary[@"quote_count"]intValue];
    self.quotedStatus = [dictionary[@"is_quote_status"]boolValue];
    
    //initializes user
    NSDictionary *user = dictionary[@"user"];
    self.user =[[User alloc]initWithDictionary:user];
    
    //we will need to format the date so that it can look like Twitter's
    
    // Format createdAt date string
    NSString *createdAtOriginalString = dictionary[@"created_at"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // Configure the input format to parse the date string
    formatter.dateFormat = @"E MMM d HH:mm:ss Z y";
    // Convert String to Date
    NSDate *date = [formatter dateFromString:createdAtOriginalString];
    // Configure output format
    formatter.dateStyle = NSDateFormatterShortStyle;
    formatter.timeStyle = NSDateFormatterNoStyle;
    // Convert Date to String
    self.createdAtString = [formatter stringFromDate:date];
  
    return self;

}

+ (NSMutableArray *)tweetsWithArray:(NSArray *)dictionaries{
    NSMutableArray *tweets = [NSMutableArray array];
    for (NSDictionary *dictionary in dictionaries) {
        Tweet *tweet = [[Tweet alloc] initWithDictionary:dictionary];
        [tweets addObject:tweet];
    }
    return [tweets copy];
    //puts a new array so that there is allocated space for the copy so there is access to it 
}

@end
