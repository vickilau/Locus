//
//  VLTripViewController.m
//  Locus
//
//  Created by Vicki Lau on 11/19/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLTripViewController.h"

@implementation VLTripViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isEditing = NO;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.view.backgroundColor = [UIColor clearColor];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"TripTableViewSegue"]){
        self.tripTableVC = (VLTripTableViewController *)segue.destinationViewController;
    }
}

/*- (IBAction)toggleButtonClicked:(id)sender {
    self.isEditing = !self.isEditing;
    if (self.isEditing == YES) {
        [self.editSaveToggleButton setTitle:@"Save" forState:UIControlStateNormal];
        [self.tripTableVC editTripFields];
    } else {
        [self.editSaveToggleButton setTitle:@"Edit" forState:UIControlStateNormal];
        [self.tripTableVC saveTripFields];
    }
}*/
- (IBAction)toggleButtonClicked:(id)sender {
}
@end
