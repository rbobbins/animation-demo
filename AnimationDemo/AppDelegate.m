//
//  AppDelegate.m
//  AnimationDemo
//
//  Created by Rachel Bobbins on 1/29/15.
//  Copyright (c) 2015 Rachel Bobbins. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIViewController *rootViewController = [[ViewController alloc] init];
    
//    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    
    self.window.rootViewController = rootViewController;

    [self.window makeKeyAndVisible];
    return YES;
}


@end
