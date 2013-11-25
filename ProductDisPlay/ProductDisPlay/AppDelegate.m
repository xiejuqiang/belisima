//
//  AppDelegate.m
//  ProductDisPlay
//
//  Created by apple on 13-9-6.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "Constant.h"

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
   [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
//    NSArray *familyNames =[[NSArray alloc]initWithArray:[UIFont familyNames]];
//    NSArray *fontNames;
//    NSInteger indFamily, indFont;
//    NSLog(@"[familyNames count]===%d",[familyNames count]);
//    for(indFamily=0;indFamily<[familyNames count];++indFamily)
//        
//	{
//		NSLog(@"Family name: %@", [familyNames objectAtIndex:indFamily]);
//        fontNames =[[NSArray alloc]initWithArray:[UIFont fontNamesForFamilyName:[familyNames objectAtIndex:indFamily]]];
//        
//		for(indFont=0; indFont<[fontNames count]; ++indFont)
//            
//		{
//			NSLog(@"Font name: %@",[fontNames objectAtIndex:indFont]);
//            
//        }
//        
//		[fontNames release];
//	}
//    
//	[familyNames release];
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    UINavigationController *aNavigationController = [[UINavigationController alloc] initWithRootViewController:homeVC];
    [aNavigationController setNavigationBarHidden:YES];
    self.window.rootViewController = aNavigationController;
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}


@end