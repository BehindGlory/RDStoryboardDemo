//
//  RDTabBarController.m
//  RDStoryboardDemo
//
//  Created by Rain Day on 2018/8/31.
//  Copyright © 2018年 Rain Day. All rights reserved.
//

#import "RDTabBarController.h"
#import "RDHomeViewController.h"
#import "RDProfileViewController.h"

@interface RDTabBarController ()

@end

@implementation RDTabBarController

+ (RDTabBarController *)initTabBarController {
    RDTabBarController *tabBarController = [[RDTabBarController alloc] init];
    tabBarController.tabBar.itemPositioning = UITabBarItemPositioningFill;
    tabBarController.tabBar.itemWidth = 44;
    tabBarController.tabBar.itemSpacing = 0;
    tabBarController.tabBar.barTintColor = [UIColor whiteColor];

    RDHomeViewController *homeViewController = (RDHomeViewController *)[[UIStoryboard storyboardWithName:@"Home" bundle:nil] instantiateViewControllerWithIdentifier:@"RDHomeViewController"];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    homeNav.tabBarItem = [self tabBarItemWithTitle:@"首页" imageName:@"nav_icon_home_normal" selectedImageName:@"nav_icon_home_pre"];

    RDProfileViewController *profileViewController = (RDProfileViewController *)[[UIStoryboard storyboardWithName:@"Profile" bundle:nil] instantiateInitialViewController];
    UINavigationController *profileNav = [[UINavigationController alloc] initWithRootViewController:profileViewController];
    profileNav.tabBarItem = [self tabBarItemWithTitle:@"我的" imageName:@"nav_icon_mine_normal" selectedImageName:@"nav_icon_mine_pre"];

    tabBarController.viewControllers = @[homeNav, profileNav];

    return tabBarController;
}

+ (UITabBarItem *)tabBarItemWithTitle:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] init];
    tabBarItem.title = title;
    tabBarItem.image = [UIImage imageNamed:imageName];
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [tabBarItem setSelectedImage:selectedImage];
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:[UIColor colorWithRed:255/255.0f green:72/255.0f blue:67/255.0f alpha:1.0] forKey:NSForegroundColorAttributeName];
    [tabBarItem setTitleTextAttributes:attributes forState:UIControlStateSelected];
    return tabBarItem;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
