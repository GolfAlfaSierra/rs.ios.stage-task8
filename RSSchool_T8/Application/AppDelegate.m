//
//  AppDelegate.m
//  RSSchool_T8
//
//  Created by John Kent on 16.07.2021.
//

#import "AppDelegate.h"
#import "ArtistViewController.h"

@interface AppDelegate ()

@property (strong, nonatomic) UINavigationController *navigationController;


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    ArtistViewController *firstVC = [[ArtistViewController alloc] initWithNibName:@"Artist" bundle:nil];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:firstVC];
    
    
    [window setRootViewController:self.navigationController];
    
    self.window = window;
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
