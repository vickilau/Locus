//
//  VLProfileViewController.m
//  Locus
//
//  Created by Vicki Lau on 11/10/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLProfileViewController.h"

@implementation VLProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isEditing = NO;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.view.backgroundColor = [UIColor clearColor];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"ProfileTableViewSegue"]){
        self.profileTableVC = (VLProfileTableViewController *)segue.destinationViewController;
    }
}

- (IBAction)toggleButtonClicked:(id)sender {
    self.isEditing = !self.isEditing;
    if (self.isEditing == YES) {
        [self.editSaveToggleButton setTitle:@"Save" forState:UIControlStateNormal];
        [self.profileTableVC editProfileFields];
    } else {
        [self.editSaveToggleButton setTitle:@"Edit" forState:UIControlStateNormal];
        [self.profileTableVC saveProfileFields];
    }
}
@end
