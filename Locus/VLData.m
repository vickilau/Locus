//
//  VLData.m
//  Locus
//
//  Created by Vicki Lau on 11/27/15.
//  Copyright © 2015 Vicki Lau. All rights reserved.
//

#import "VLData.h"

@implementation VLData

static NSString *firstLocal = @"Vicki Lau";
static NSString *secondLocal = @"Gautam Rao";
static NSString *thirdLocal = @"Anwesha Jalan";
static NSString *fourthLocal = @"Erin Singer";

static NSString *firstLocalAboutMe = @"I love meeting new people! I was born and raised here and proudly claim that it is the best place ever. I know most of the residents here and can tell you about all the best spots.";
static NSString *secondLocalAboutMe = @"You can always find me immersed in nature during the day. I love beaches, hiking, and everything in between. By night though, I am the biggest partier you will ever meet...";
static NSString *thirdLocalAboutMe = @"I am a huge supporter of local businesses and love that this place has so many of them. I think they really make our town interesting and authentic. Let me know what you're looking for and I will most likely know of a place.";
static NSString *fourthLocalAboutMe = @"Many people are hesitant at first to try out my suggestions but when they do, they never regret it. I really do know the hidden gems of this city and love sharing them.";

static NSString *firstLocalFaves = @"#hiking #reading #eatingIceCream #painting #DTLA #artsDistrict #VeniceBeach #Chinatown";
static NSString *secondLocalFaves = @"#clubbing #drinking #surfing #sleeping #startups #NatesFishery";
static NSString *thirdLocalFaves = @"#shopping #coffee #business #driving #falafels #SusansBakery #Sallys";
static NSString *fourthLocalFaves = @"#humanComputerInteraction #iceCream #Avengers #Marvel";

static NSString *firstLocalImage = @"Vicki.jpeg";
static NSString *secondLocalImage = @"Gautam.jpg";
static NSString *thirdLocalImage = @"Anwesha.jpg";
static NSString *fourthLocalImage = @"Erin.jpg";

static NSString *firstLocalGender = @"Female";
static NSString *secondLocalGender = @"Male";
static NSString *thirdLocalGender = @"Female";
static NSString *fourthLocalGender = @"Female";

static NSString *firstLocalAge = @"21";
static NSString *secondLocalAge = @"35";
static NSString *thirdLocalAge = @"28";
static NSString *fourthLocalAge = @"24";

static float firstLocalRating = 4.5;
static float secondLocalRating = 3.875;
static float thirdLocalRating = 3.075;
static float fourthLocalRating = 4.375;

static NSString *firstLocalFirstSuggestion = @"Eaton Canyon";
static NSString *firstLocalSecondSuggestion = @"Nick's Cafe";
static NSString *firstLocalThirdSuggestion = @"Venice Beach";
static NSString *firstLocalFourthSuggestion = @"Elysian Park";

static float firstLocalFirstSuggestionRating = 4.8;
static float firstLocalSecondSuggestionRating = 4.2;
static float firstLocalThirdSuggestionRating = 4.7;
static float firstLocalFourthSuggestionRating = 4.3;

static NSString *firstLocalFirstNote = @"I love hiking here right before sunset. The waterfall at the end is so worth the long journey!";
static NSString *firstLocalSecondNote = @"Definitely the best brunch place in the area!";
static NSString *firstLocalThirdNote = @"The boardwalk is really nice. Lots of small shops and interesting people everywhere!";
static NSString *firstLocalFourthNote = @"Very peaceful park. Good for short naps, walking the dog, or playing with kids!";

static NSString *firstLocalFirstImage = @"waterfall.jpg";
static NSString *firstLocalSecondImage = @"nicksCafe.jpeg";
static NSString *firstLocalThirdImage = @"veniceBeach.jpg";
static NSString *firstLocalFourthImage = @"elysianPark.jpeg";

static NSString *secondLocalFirstSuggestion = @"Aer Lounge";
static NSString *secondLocalSecondSuggestion = @"Red Beach";
static NSString *secondLocalThirdSuggestion = @"City Lights";
static NSString *secondLocalFourthSuggestion = @"Land's End";

static float secondLocalFirstSuggestionRating = 2.1;
static float secondLocalSecondSuggestionRating = 2.5;
static float secondLocalThirdSuggestionRating = 3.4;
static float secondLocalFourthSuggestionRating = 4.3;

static NSString *secondLocalFirstNote = @"Great place for a low-key Friday night with your buddies. Very chill atmosphere!";
static NSString *secondLocalSecondNote = @"The sand is literally red! It's magnificent!";
static NSString *secondLocalThirdNote = @"My favorite club in the area! Great music ALL THE TIME!!!";
static NSString *secondLocalFourthNote = @"Beautiful. Literally all I can say...";

static NSString *secondLocalFirstImage = @"aerLounge.jpeg";
static NSString *secondLocalSecondImage = @"redBeach.jpeg";
static NSString *secondLocalThirdImage = @"cityLights.jpg";
static NSString *secondLocalFourthImage = @"landsEnd.jpg";

static NSString *thirdLocalFirstSuggestion = @"Millie's Hut";
static NSString *thirdLocalSecondSuggestion = @"Java Cafe";
static NSString *thirdLocalThirdSuggestion = @"The Ballet";
static NSString *thirdLocalFourthSuggestion = @"Flying Falafel";

static float thirdLocalFirstSuggestionRating = 3.9;
static float thirdLocalSecondSuggestionRating = 4.3;
static float thirdLocalThirdSuggestionRating = 4.0;
static float thirdLocalFourthSuggestionRating = 3.3;

static NSString *thirdLocalFirstNote = @"An awesome open-air food plaza. A MUST for foodies!";
static NSString *thirdLocalSecondNote = @"Delicious coffee. DELICIOUS!";
static NSString *thirdLocalThirdNote = @"Beautiful shows every week. Great prices too!";
static NSString *thirdLocalFourthNote = @"They literally throw falafels at you! It's amazing...";

static NSString *thirdLocalFirstImage = @"milliesHut.jpeg";
static NSString *thirdLocalSecondImage = @"javaCafe.jpg";
static NSString *thirdLocalThirdImage = @"ballet.jpg";
static NSString *thirdLocalFourthImage = @"falafel.jpg";

static NSString *fourthLocalFirstSuggestion = @"CS147 Lecture";
static NSString *fourthLocalSecondSuggestion = @"CS147 Studio";
static NSString *fourthLocalThirdSuggestion = @"CS147 TA Meetings";
static NSString *fourthLocalFourthSuggestion = @"Bob's Ice Cream";

static float fourthLocalFirstSuggestionRating = 4.5;
static float fourthLocalSecondSuggestionRating = 5.0;
static float fourthLocalThirdSuggestionRating = 3.2;
static float fourthLocalFourthSuggestionRating = 4.8;

static NSString *fourthLocalFirstNote = @"James Landay is the best lecturer! Human Computer Interaction is awesome! :DDDD";
static NSString *fourthLocalSecondNote = @"Come see the coolest ideas come to life throughout the quarter!";
static NSString *fourthLocalThirdNote = @"Always an entertaining time...";
static NSString *fourthLocalFourthNote = @"I LOVE ICE CREAM!!!";

static NSString *fourthLocalFirstImage = @"lecture.jpg";
static NSString *fourthLocalSecondImage = @"studio.jpg";
static NSString *fourthLocalThirdImage = @"meeting.jpg";
static NSString *fourthLocalFourthImage = @"icecream.jpeg";


+ (NSString *)firstLocal {
    return firstLocal;
}
+ (NSString *)secondLocal {
    return secondLocal;
}
+ (NSString *)thirdLocal {
    return thirdLocal;
}
+ (NSString *)fourthLocal {
    return fourthLocal;
}
+ (NSString *)firstLocalAboutMe {
    return firstLocalAboutMe;
}
+ (NSString *)secondLocalAboutMe {
    return secondLocalAboutMe;
}
+ (NSString *)thirdLocalAboutMe {
    return thirdLocalAboutMe;
}
+ (NSString *)fourthLocalAboutMe {
    return fourthLocalAboutMe;
}
+(NSString *)firstLocalFaves {
    return firstLocalFaves;
}
+(NSString *)secondLocalFaves {
    return secondLocalFaves;
}
+(NSString *)thirdLocalFaves {
    return thirdLocalFaves;
}
+(NSString *)fourthLocalFaves {
    return fourthLocalFaves;
}


+ (NSString *)firstLocalImage {
    return firstLocalImage;
}
+ (NSString *)secondLocalImage {
    return secondLocalImage;
}
+ (NSString *)thirdLocalImage {
    return thirdLocalImage;
}
+ (NSString *)fourthLocalImage {
    return fourthLocalImage;
}
+ (NSString *)firstLocalGender {
    return firstLocalGender;
}
+ (NSString *)secondLocalGender {
    return secondLocalGender;
}
+ (NSString *)thirdLocalGender {
    return thirdLocalGender;
}
+ (NSString *)fourthLocalGender {
    return fourthLocalGender;
}
+ (NSString *)firstLocalAge {
    return firstLocalAge;
}
+ (NSString *)secondLocalAge {
    return secondLocalAge;
}
+ (NSString *)thirdLocalAge {
    return thirdLocalAge;
}
+ (NSString *)fourthLocalAge {
    return fourthLocalAge;
}
+ (float)firstLocalRating {
    return firstLocalRating;
}
+ (float)secondLocalRating {
    return secondLocalRating;
}
+ (float)thirdLocalRating {
    return thirdLocalRating;
}
+ (float)fourthLocalRating {
    return fourthLocalRating;
}

+ (NSString *)firstLocalFirstSuggestion {
    return firstLocalFirstSuggestion;
}
+ (NSString *)firstLocalSecondSuggestion {
    return firstLocalSecondSuggestion;
}
+ (NSString *)firstLocalThirdSuggestion {
    return firstLocalThirdSuggestion;
}
+ (NSString *)firstLocalFourthSuggestion {
    return firstLocalFourthSuggestion;
}
+ (float)firstLocalFirstSuggestionRating {
    return firstLocalFirstSuggestionRating;
}
+ (float)firstLocalSecondSuggestionRating {
    return firstLocalSecondSuggestionRating;
}
+ (float)firstLocalThirdSuggestionRating {
    return firstLocalThirdSuggestionRating;
}
+ (float)firstLocalFourthSuggestionRating {
    return firstLocalFourthSuggestionRating;
}
+ (NSString *)firstLocalFirstNote {
    return firstLocalFirstNote;
}
+ (NSString *)firstLocalSecondNote {
    return firstLocalSecondNote;
}
+ (NSString *)firstLocalThirdNote {
    return firstLocalThirdNote;
}
+ (NSString *)firstLocalFourthNote {
    return firstLocalFourthNote;
}
+ (NSString *)firstLocalFirstImage {
    return firstLocalFirstImage;
}
+ (NSString *)firstLocalSecondImage {
    return firstLocalSecondImage;
}
+ (NSString *)firstLocalThirdImage {
    return firstLocalThirdImage;
}
+ (NSString *)firstLocalFourthImage {
    return firstLocalFourthImage;
}

+ (NSString *)secondLocalFirstSuggestion {
    return secondLocalFirstSuggestion;
}
+ (NSString *)secondLocalSecondSuggestion {
    return secondLocalSecondSuggestion;
}
+ (NSString *)secondLocalThirdSuggestion {
    return secondLocalThirdSuggestion;
}
+ (NSString *)secondLocalFourthSuggestion {
    return secondLocalFourthSuggestion;
}
+ (float)secondLocalFirstSuggestionRating {
    return secondLocalFirstSuggestionRating;
}
+ (float)secondLocalSecondSuggestionRating {
    return secondLocalSecondSuggestionRating;
}
+ (float)secondLocalThirdSuggestionRating {
    return secondLocalThirdSuggestionRating;
}
+ (float)secondLocalFourthSuggestionRating {
    return secondLocalFourthSuggestionRating;
}
+ (NSString *)secondLocalFirstNote {
    return secondLocalFirstNote;
}
+ (NSString *)secondLocalSecondNote {
    return secondLocalSecondNote;
}
+ (NSString *)secondLocalThirdNote {
    return secondLocalThirdNote;
}
+ (NSString *)secondLocalFourthNote {
    return secondLocalFourthNote;
}
+ (NSString *)secondLocalFirstImage {
    return secondLocalFirstImage;
}
+ (NSString *)secondLocalSecondImage {
    return secondLocalSecondImage;
}
+ (NSString *)secondLocalThirdImage {
    return secondLocalThirdImage;
}
+ (NSString *)secondLocalFourthImage {
    return secondLocalFourthImage;
}

+ (NSString *)thirdLocalFirstSuggestion {
    return thirdLocalFirstSuggestion;
}
+ (NSString *)thirdLocalSecondSuggestion {
    return thirdLocalSecondSuggestion;
}
+ (NSString *)thirdLocalThirdSuggestion {
    return thirdLocalThirdSuggestion;
}
+ (NSString *)thirdLocalFourthSuggestion {
    return thirdLocalFourthSuggestion;
}
+ (float)thirdLocalFirstSuggestionRating {
    return thirdLocalFirstSuggestionRating;
}
+ (float)thirdLocalSecondSuggestionRating {
    return thirdLocalSecondSuggestionRating;
}
+ (float)thirdLocalThirdSuggestionRating {
    return thirdLocalThirdSuggestionRating;
}
+ (float)thirdLocalFourthSuggestionRating {
    return thirdLocalFourthSuggestionRating;
}
+ (NSString *)thirdLocalFirstNote {
    return thirdLocalFirstNote;
}
+ (NSString *)thirdLocalSecondNote {
    return thirdLocalSecondNote;
}
+ (NSString *)thirdLocalThirdNote {
    return thirdLocalThirdNote;
}
+ (NSString *)thirdLocalFourthNote {
    return thirdLocalFourthNote;
}

+ (NSString *)thirdLocalFirstImage {
    return thirdLocalFirstImage;
}
+ (NSString *)thirdLocalSecondImage {
    return thirdLocalSecondImage;
}
+ (NSString *)thirdLocalThirdImage {
    return thirdLocalThirdImage;
}
+ (NSString *)thirdLocalFourthImage {
    return thirdLocalFourthImage;
}

+ (NSString *)fourthLocalFirstSuggestion {
    return fourthLocalFirstSuggestion;
}
+ (NSString *)fourthLocalSecondSuggestion {
    return fourthLocalSecondSuggestion;
}
+ (NSString *)fourthLocalThirdSuggestion {
    return fourthLocalThirdSuggestion;
}
+ (NSString *)fourthLocalFourthSuggestion {
    return fourthLocalFourthSuggestion;
}
+ (float)fourthLocalFirstSuggestionRating {
    return fourthLocalFirstSuggestionRating;
}
+ (float)fourthLocalSecondSuggestionRating {
    return fourthLocalSecondSuggestionRating;
}
+ (float)fourthLocalThirdSuggestionRating {
    return fourthLocalThirdSuggestionRating;
}
+ (float)fourthLocalFourthSuggestionRating {
    return fourthLocalFourthSuggestionRating;
}
+ (NSString *)fourthLocalFirstNote {
    return fourthLocalFirstNote;
}
+ (NSString *)fourthLocalSecondNote {
    return fourthLocalSecondNote;
}
+ (NSString *)fourthLocalThirdNote {
    return fourthLocalThirdNote;
}
+ (NSString *)fourthLocalFourthNote {
    return fourthLocalFourthNote;
}
+ (NSString *)fourthLocalFirstImage {
    return fourthLocalFirstImage;
}
+ (NSString *)fourthLocalSecondImage {
    return fourthLocalSecondImage;
}
+ (NSString *)fourthLocalThirdImage {
    return fourthLocalThirdImage;
}
+ (NSString *)fourthLocalFourthImage {
    return fourthLocalFourthImage;
}
@end
