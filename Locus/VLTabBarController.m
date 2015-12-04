//
//  VLTabBarController.m
//  Locus
//
//  Created by Vicki Lau on 12/2/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLTabBarController.h"

@implementation VLTabBarController

- (instancetype)init {
    if (self = [super init]) {
        
        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]]];
        
        VLPageViewController *profileTab = [[VLPageViewController alloc] init];
        VLPageViewController *styleTab = [[VLPageViewController alloc] init];
        VLPageViewController *tripTab = [[VLPageViewController alloc] init];
        VLPageViewController *connectTab = [[VLPageViewController alloc] init];
        VLPageViewController *itineraryTab = [[VLPageViewController alloc] init];
        
        NSMutableArray *tabViewControllers = [[NSMutableArray alloc] init];
        [tabViewControllers addObject:profileTab];
        [tabViewControllers addObject:styleTab];
        [tabViewControllers addObject:tripTab];
        [tabViewControllers addObject:connectTab];
        [tabViewControllers addObject:itineraryTab];
        
        [self setViewControllers:tabViewControllers];
        
        profileTab.tabBarItem =
        [[UITabBarItem alloc] initWithTitle:@"Profile"
                                      image:[UIImage imageNamed:@"woman.png"]
                                        tag:1];
        styleTab.tabBarItem =
        [[UITabBarItem alloc] initWithTitle:@"Style"
                                      image:[UIImage imageNamed:@"quiz.png"]
                                        tag:2];
        tripTab.tabBarItem =
        [[UITabBarItem alloc] initWithTitle:@"Trip"
                                      image:[UIImage imageNamed:@"travel.png"]
                                        tag:3];
        connectTab.tabBarItem =
        [[UITabBarItem alloc] initWithTitle:@"Connect"
                                      image:[UIImage imageNamed:@"locals.png"]
                                        tag:4];
        itineraryTab.tabBarItem =
        [[UITabBarItem alloc] initWithTitle:@"Itinerary"
                                      image:[UIImage imageNamed:@"itinerary.png"]
                                        tag:5];
        
    }
    return self;
}

@end
