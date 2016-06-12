//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (NSString *)stringsInRectangularFrame:(NSArray *)arrayOfStrings;
- (NSString *)translateToPigLatin:(NSArray *)arrayOfStrings;
- (NSString *)translateToEnglish:(NSArray *)arrayOfStrings;
- (NSArray *)combinedArray:(NSArray *)firstArray arrayToAdd:(NSArray *)secondArray;
- (NSArray *)numbersToNumbersArray:(NSUInteger)number;
- (NSArray *)reverseArray:(NSArray *)arrayToReverse;



@end
