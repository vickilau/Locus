//
//  VLItineraryTableViewController.m
//  Locus
//
//  Created by Vicki Lau on 11/26/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLItineraryTableViewController.h"

@implementation VLItineraryTableViewController

- (instancetype)init {
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        _currentUser = [PFUser currentUser];
        _itineraryTableViewCells = [[NSMutableArray alloc] init];
        _itineraryArray = [[NSMutableArray alloc] init];
        _itineraryNoteArray = [[NSMutableArray alloc] init];
        [self.tableView setSeparatorColor:[UIColor lightGrayColor]];
        [self.tableView setDelegate:self];
    }
    return self;
}

- (void)loadView {
    [super loadView];
    self.itineraryArray = [self.currentUser objectForKey:[VLConstants kItineraryArrayKey]];
    self.itineraryNoteArray = [self.currentUser objectForKey:[VLConstants kActivityNoteArrayKey]];
    [self.itineraryTableViewCells removeAllObjects];
    NSUInteger count = 0;
    while (count < self.itineraryArray.count) {
        VLItineraryTableViewCell *newCell = [[VLItineraryTableViewCell alloc] init];
        [newCell.activityNameLabel setText:[self.itineraryArray objectAtIndex:count]];
        [newCell.activityNoteLabel setText:[self.itineraryNoteArray objectAtIndex:count]];
        [newCell setDelegate:self];
        [self.itineraryTableViewCells addObject:newCell];
        count++;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itineraryTableViewCells.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.itineraryTableViewCells objectAtIndex:indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
     return 250.0f;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *label = [[UILabel alloc] init];
    [label setText:@"Saved Suggestions"];
    [label setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2]];
    [label setTextColor:[UIColor colorWithRed:153.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setBackgroundColor:[UIColor clearColor]];
    return label;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    NSString *stringToMove = self.itineraryTableViewCells[sourceIndexPath.section];
    [self.itineraryTableViewCells removeObjectAtIndex:sourceIndexPath.row];
    [self.itineraryTableViewCells insertObject:stringToMove atIndex:destinationIndexPath.row];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.itineraryArray removeObjectAtIndex:indexPath.row];
        [self.itineraryNoteArray removeObjectAtIndex:indexPath.row];
        [self.currentUser setObject:self.itineraryArray forKey:[VLConstants kItineraryArrayKey]];
        [self.currentUser setObject:self.itineraryNoteArray forKey:[VLConstants kActivityNoteArrayKey]];
        [self.currentUser saveInBackground];
        [self loadView];
    }
}

# pragma mark - VLItineraryTableViewCellDelegate

- (void)didClickCompleteActivity:(VLItineraryTableViewCell *)cell {
    [self.view setBackgroundColor:[UIColor clearColor]];
    self.view.backgroundColor = [UIColor clearColor];
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    self.blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    self.blurEffectView.frame = self.view.bounds;
    self.blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:self.blurEffectView];
    
    self.popupVC = [[VLItineraryCompletionViewController alloc] initWithActivityName:cell.activityNameLabel.text indexPath:[self.tableView indexPathForCell:cell]];
    [self.popupVC setDelegate:self];

    [self addChildViewController:self.popupVC];
    [self.popupVC.view setFrame:CGRectMake(self.view.bounds.origin.x, self.view.bounds.size.height/2, self.view.bounds.size.width, 220)];
    [VLUtilities makeRound:self.popupVC.view];
    
    [self.view addSubview:self.popupVC.view];
    [self.popupVC didMoveToParentViewController:self];
}

# pragma mark - VLItineraryCompletionViewControllerDelegate

- (void)didSaveCancelCompleteActivity:(VLItineraryTableViewCell *)cell remove:(BOOL)remove {
    [self.popupVC removeFromParentViewController];
    [self.popupVC.view removeFromSuperview];
    [self.blurEffectView removeFromSuperview];
    if (remove) {
        [self tableView:self.tableView commitEditingStyle:UITableViewCellEditingStyleDelete forRowAtIndexPath:[self.tableView indexPathForCell:cell]];
    }
    [self loadView];
}

@end
