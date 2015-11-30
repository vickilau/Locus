//
//  VLConstants.h
//  Locus
//
//  Created by Vicki Lau on 11/27/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VLConstants : NSObject

+ (NSString *) kNeedLocationErrorMessage;
+ (NSString *) kNoTravelStyleMessage;
+ (NSString *) kTravelStyleInstructionsMessage;
+ (NSString *) kDefaultTravelStyle;
+ (NSString *) kEmptyItineraryMessage;
+ (NSString *) kActivityRatingMessage;
+ (NSString *) kLocationMessage;

+ (NSString *) kPlaceholderNameField;
+ (NSString *) kPlaceholderGenderField;
+ (NSString *) kPlaceholderAgeField;
+ (NSString *) kPlaceholderHomeLocationField;

+ (NSString *) kPlaceholderAboutMeString;
+ (NSString *) kPlaceholderFavPlacesString;
+ (NSString *) kPlaceholderFavActivitiesString;
+ (NSString *) kPlaceholderSaveActivityNoteString;

+ (NSString *) kActivityClass;
+ (NSString *) kActivityNameKey;
+ (NSString *) kActivityUserNamesKey;
+ (NSString *) kActivityCommentsKey;
+ (NSString *) kActivityRatingsKey;
+ (NSString *) kActivityFbPicturesKey;
+ (NSString *) kActivityAgesKey;
+ (NSString *) kActivityGendersKey;

+ (NSString *) kItineraryArrayKey;
+ (NSString *) kActivityNoteArrayKey;

+ (NSString *)kTravelStyleKey;

+ (NSString *) kProfilePicKey;
+ (NSString *) kFbPictureKey;
+ (NSString *) kNameFieldKey;
+ (NSString *) kGenderFieldKey;
+ (NSString *) kAgeFieldKey;
+ (NSString *) kHomeLocationKey;
+ (NSString *) kAboutMeFieldKey;
+ (NSString *) kFavActivitiesFieldKey;
+ (NSString *) kFavPlacesFieldKey;

+ (NSString *) kCountryFieldKey;
+ (NSString *) kCityFieldKey;
+ (NSString *) kTripLocationKey;
+ (NSString *) kStartDateFieldKey;
+ (NSString *) kEndDateFieldKey;
+ (NSString *) kCurrencyChoiceFieldKey;
+ (NSString *) kBudgetFieldKey;
+ (NSString *) kBudgetChoiceKey;
+ (NSString *) kNumChildrenField;
+ (NSString *) kNumAdultsField;

@end
