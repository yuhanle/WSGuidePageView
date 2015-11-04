//
//  AppDelegate.m
//  WSGuidePageViewDemo
//
//  Created by 温世波 on 15/11/4.
//  Copyright © 2015年 温世波. All rights reserved.
//

#import "AppDelegate.h"
#import "WSIntroductionViewController.h"
#import "ViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) WSIntroductionViewController *introductionView;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    
    // Added Introduction View Controller
    NSArray *coverImageNames = @[@"p1", @"p2", @"p3", @"p4"];
    NSArray *backgroundImageNames = @[@"p1_bg", @"p2_bg", @"p3_bg", @"p4_bg"];
    
    // Example 2
    UIButton *enterButton = [UIButton new];
    enterButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [enterButton setTitleColor:[UIColor colorWithRed:75 / 255.0 green:70 / 255.0 blue:71 / 255.0 alpha:1.0] forState:UIControlStateNormal];
    [enterButton setTitle:@"立即体验" forState:UIControlStateNormal];
    [enterButton setBackgroundImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
    [enterButton setBackgroundImage:[UIImage imageNamed:@"button_down"] forState:UIControlStateHighlighted];
    
    self.introductionView = [[WSIntroductionViewController alloc] initWithCoverImageNames:coverImageNames backgroundImageNames:backgroundImageNames button:enterButton];
    
    // 设置索引图片
    [self.introductionView setImage:[UIImage imageNamed:@"index"]
                   highlightedImage:[UIImage imageNamed:@"index_sel"]
                          dotRadius:6.0f];
    
    self.window.rootViewController = self.introductionView;
    
    __weak AppDelegate *weakSelf = self;
    self.introductionView.didSelectedEnter = ^() {
        [weakSelf.introductionView.view removeFromSuperview];
        weakSelf.introductionView = nil;
        
        ViewController *mainVC = [[ViewController alloc] init];
        weakSelf.window.rootViewController = mainVC;
    };
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end