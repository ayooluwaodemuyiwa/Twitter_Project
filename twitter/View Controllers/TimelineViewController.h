//
//  TimelineViewController.h
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimelineViewController : UIViewController

- (void)FetchTweets:(UIRefreshControl *)FetchTweets;
- (IBAction)buttonClicked:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *logoutButton;

- (IBAction)logoutButtonPressed:(id)sender;
@end
