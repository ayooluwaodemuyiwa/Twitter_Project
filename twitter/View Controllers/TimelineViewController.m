//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "APIManager.h"
#import "ComposeViewController.h"
#import "Tweet.h"
#import "TweetCells.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "UIImageView+AFNetworking.h"

@interface TimelineViewController () <ComposeViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>


@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray<Tweet*> *tweets;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@end

@implementation TimelineViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.refreshControl =[[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(beginRefresh) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    [self beginRefresh];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TweetCells *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCelloo"];
    if(cell == nil){
        cell = [[TweetCells alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TweetCelloo"];
    }
    Tweet *tweet = self.tweets[indexPath.row];
    cell.tweet = tweet;
    cell.userName.text = tweet.user.name;
    cell.tweetContent.text = tweet.text;
   // cell.favoriteCount.text = [NSString stringWithFormat:@"%d",tweet.favoriteCount];
  //  cell.retweetCount.text = [NSString stringWithFormat:@"%d",tweet.retweetCount];
    cell.dateLabel.text = [NSString stringWithFormat:@"%s%@", "@", tweet.user.screenName];
    NSURL *profileURLImage = [NSURL URLWithString:tweet.user.profileURL];
    [cell.profilePicture setImageWithURL:profileURLImage];
    cell.actualDate.text= tweet.createdAtString;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return self.tweets.count;
}

- (void)beginRefresh {
[[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
    if (tweets) {
        self.tweets = [[NSArray alloc] initWithArray:tweets];
        [self.tableView reloadData];
        [self.refreshControl endRefreshing];
    } else {
        NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
    }
}];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UINavigationController *navigationController = [segue destinationViewController];
    ComposeViewController *composeController = (ComposeViewController*)navigationController.topViewController;
    composeController.delegate = self;
}

- (void)didTweet:(Tweet *)tweet{
    [self beginRefresh];
}


- (IBAction)logoutButtonPressed:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    appDelegate.window.rootViewController = loginViewController;
}
@end
