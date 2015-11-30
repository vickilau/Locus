//
//  VLConstants.m
//  Locus
//
//  Created by Vicki Lau on 11/27/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLConstants.h"

@implementation VLConstants

static NSString *kNeedLocationErrorMessage = @"We cannot connect you with locals without a location. Please set a location for your trip by clicking the \"Trip\" tab and filling in the \"City\" and \"Country\" field or clicking the \"Use Current Location\" button.";
static NSString *kNoTravelStyleMessage = @"You have not built your travel style yet. Click the \"Build\" button above to get started!";
static NSString *kTravelStyleInstructionsMessage = @"Doesn't seem right? No problem! Click the \"Build\" button at the top to rebuild your travel style!";
static NSString *kDefaultTravelStyle = @"You are the all-around traveler! You are an adventurous, exciting person who loves meeting new people and lives on adrenaline rushes. You explore busy cultural bazaars one day and go hiking the next. You enjoy a nice, calm dinner one night and party like crazy the next. Nevertheless, you value time for yourself to relax and enjoy a good book once in a while.";
static NSString *kEmptyItineraryMessage = @"You do not have any saved suggestions in your itinerary! Click on the \"Connect\" tab to search for suggestions.";
static NSString *kActivityRatingMessage = @"How did you enjoy this suggestion?";
static NSString *kLocationMessage = @"Locals near you";
static NSString *kNoCommentsMessage = @"No comments have been made about this suggestion yet.";

static NSString *kPlaceholderAboutMeString = @"Tell us about yourself";
static NSString *kPlaceholderFavPlacesString = @"#hiking #readingInCoffeeShops";
static NSString *kPlaceholderFavActivitiesString = @"#NicksCafe #EatonCanyon #SFFarmersMarket";
static NSString *kPlaceholderSaveActivityNoteString = @"Your notes about this activity";

static NSString *kActivityClass = @"Activity";
static NSString *kActivityNameKey = @"activityName";
static NSString *kActivityUserNamesKey = @"activityUserNames";
static NSString *kActivityCommentsKey = @"activityComments";
static NSString *kActivityRatingsKey = @"activityRatings";
static NSString *kActivityFbPicturesKey = @"activityFbPictures";
static NSString *kActivityAgesKey = @"activityAges";
static NSString *kActivityGendersKey = @"activityGenders";

static NSString *kPlaceholderNameField = @"Locus";
static NSString *kPlaceholderGenderField = @"Female";
static NSString *kPlaceholderAgeField = @"28";
static NSString *kPlaceholderHomeLocationField = @"Los Angeles, CA";

static NSString *kItineraryArrayKey = @"itinerary";
static NSString *kActivityNoteArrayKey = @"activityNote";

static NSString *kTravelStyleKey = @"travelStyle";

static NSString *kProfilePicKey = @"profilePicField";
static NSString *kFbPictureKey = @"fbPictureField";
static NSString *kNameFieldKey = @"nameField";
static NSString *kGenderFieldKey = @"genderField";
static NSString *kAgeFieldKey = @"ageField";
static NSString *kHomeLocationKey = @"homeLocationField";
static NSString *kAboutMeFieldKey = @"aboutMeField";
static NSString *kFavActivitiesFieldKey = @"faveActivitiesField";
static NSString *kFavPlacesFieldKey = @"favePlacesField";

static NSString *kCountryFieldKey = @"countryField";
static NSString *kCityFieldKey = @"cityField";
static NSString *kTripLocationKey = @"tripLocation";
static NSString *kStartDateFieldKey = @"startDateField";
static NSString *kEndDateFieldKey = @"endDateField";
static NSString *kCurrencyChoiceFieldKey = @"currencyChoiceField";
static NSString *kBudgetFieldKey = @"budgetField";
static NSString *kBudgetChoiceKey = @"budgetChoiceField";
static NSString *kNumChildrenField = @"numChildrenField";
static NSString *kNumAdultsField = @"numAdultsField";

+ (NSString *)kNeedLocationErrorMessage{
    return kNeedLocationErrorMessage;
}
+ (NSString *)kNoTravelStyleMessage {
    return kNoTravelStyleMessage;
}
+ (NSString *)kTravelStyleInstructionsMessage {
    return kTravelStyleInstructionsMessage;
}
+ (NSString *)kEmptyItineraryMessage {
    return kEmptyItineraryMessage;
}
+ (NSString *)kActivityRatingMessage {
    return kActivityRatingMessage;
}
+ (NSString *)kNoCommentsMessage {
    return kNoCommentsMessage;
}
+ (NSString *)kActivityFbPicturesKey {
    return kActivityFbPicturesKey;
}
+ (NSString *)kActivityAgesKey {
    return kActivityAgesKey;
}
+ (NSString *)kActivityGendersKey {
    return kActivityGendersKey;
}
+ (NSString *)kLocationMessage {
    return kLocationMessage;
}
+ (NSString *)kActivityClass {
    return kActivityClass;
}
+ (NSString *)kActivityNameKey {
    return kActivityNameKey;
}
+ (NSString *)kActivityUserNamesKey {
    return kActivityUserNamesKey;
}
+ (NSString *)kActivityCommentsKey {
    return kActivityCommentsKey;
}
+ (NSString *)kActivityRatingsKey {
    return kActivityRatingsKey;
}
+ (NSString *)kDefaultTravelStyle {
    return kDefaultTravelStyle;
}
+ (NSString *)kPlaceholderNameField {
    return kPlaceholderNameField;
}
+ (NSString *)kPlaceholderGenderField {
    return kPlaceholderGenderField;
}
+ (NSString *)kPlaceholderAgeField {
    return kPlaceholderAgeField;
}
+ (NSString *)kPlaceholderHomeLocationField {
    return kPlaceholderHomeLocationField;
}
+ (NSString *)kPlaceholderAboutMeString {
    return kPlaceholderAboutMeString;
}
+ (NSString *)kPlaceholderFavPlacesString {
    return kPlaceholderFavPlacesString;
}
+ (NSString *)kPlaceholderFavActivitiesString {
    return kPlaceholderFavActivitiesString;
}
+ (NSString *)kPlaceholderSaveActivityNoteString {
    return kPlaceholderSaveActivityNoteString;
}
+ (NSString *)kItineraryArrayKey {
    return kItineraryArrayKey;
}
+ (NSString *)kActivityNoteArrayKey {
    return kActivityNoteArrayKey;
}
+ (NSString *)kTravelStyleKey {
    return kTravelStyleKey;
}
+ (NSString *)kProfilePicKey {
    return kProfilePicKey;
}
+ (NSString *)kFbPictureKey {
    return kFbPictureKey;
}
+ (NSString *)kNameFieldKey {
    return kNameFieldKey;
}
+ (NSString *)kGenderFieldKey {
    return kGenderFieldKey;
}
+ (NSString *)kAgeFieldKey {
    return kAgeFieldKey;
}
+ (NSString *)kHomeLocationKey {
    return kHomeLocationKey;
}
+ (NSString *)kAboutMeFieldKey {
    return kAboutMeFieldKey;
}
+ (NSString *)kFavActivitiesFieldKey {
    return kFavActivitiesFieldKey;
}
+ (NSString *)kFavPlacesFieldKey {
    return kFavPlacesFieldKey;
}
+ (NSString *)kCountryFieldKey {
    return kCountryFieldKey;
}
+ (NSString *)kCityFieldKey {
    return kCityFieldKey;
}
+ (NSString *)kTripLocationKey {
    return kTripLocationKey;
}
+ (NSString *)kStartDateFieldKey {
    return kStartDateFieldKey;
}
+ (NSString *)kEndDateFieldKey {
    return kEndDateFieldKey;
}
+ (NSString *)kCurrencyChoiceFieldKey {
    return kCurrencyChoiceFieldKey;
}
+ (NSString *)kBudgetChoiceKey {
    return kBudgetChoiceKey;
}
+ (NSString *)kBudgetFieldKey {
    return kBudgetFieldKey;
}
+ (NSString *)kNumChildrenField {
    return kNumChildrenField;
}
+ (NSString *)kNumAdultsField {
    return kNumAdultsField;
}

@end
