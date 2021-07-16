//
//  AppDelegate.m
//  RSSchool_T8
//
//  Created by John Kent on 16.07.2021.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()



@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    MainViewController *rootVC = [[MainViewController alloc] initWithNibName:@"Main" bundle:nil];
    [window setRootViewController:rootVC];
    
    self.window = window;
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
