//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self stringsInRectangularFrame:@[@"Hello", @"World", @"in", @"a", @"frame"]];
    [self stringsInRectangularFrame:@[@"Tomorrow", @"will", @"be", @"a", @"great", @"day"]];
    [self translateToPigLatin:@[@"The", @"quick", @"brown", @"fox"]];
    [self translateToEnglish:@[@"Hetay", @"uickqay", @"rownbay", @"oxfay"]];
    [self combinedArray:@[@"a", @"b", @"c"] arrayToAdd:@[@(1), @(2), @(3)]];
    [self numbersToNumbersArray:12045];
    [self reverseArray:@[@"Tomorrow", @"will", @"be", @"a", @"great", @"day"]];
    return YES;
}

- (NSUInteger)longestStringInArray:(NSArray *)arrayOfStrings {
    NSUInteger longestString = 0;
    for (NSString *currentString in arrayOfStrings) {
        NSUInteger stringLength = [currentString length];
        if (stringLength > longestString) {
            longestString += stringLength;
        } else {
            continue;
        }
    }
    return longestString;
}

- (NSString *)addWhiteSpaceToString:(NSString *)shorterString longerString:(NSUInteger)length {
    NSMutableString *shorterStringWithWhiteSpace = [shorterString mutableCopy];
    
    if ([shorterString length] < length) {
        for (NSUInteger i = 0; i < length - [shorterString length]; i++) {
            [shorterStringWithWhiteSpace appendString:@" "];
        }
        //NSLog(@"* %@ *", shorterStringWithWhiteSpace);
        return shorterStringWithWhiteSpace;
    }
    //NSLog(@"* %@ *", shorterStringWithWhiteSpace);
    return shorterStringWithWhiteSpace;
}

- (NSString *)stringsInRectangularFrame:(NSArray *)arrayOfStrings {
    NSUInteger longestString = [self longestStringInArray:arrayOfStrings];
    NSMutableArray *framedString = [@[] mutableCopy];
    for (NSString *currentString in arrayOfStrings) {
        [framedString addObject:[NSString stringWithFormat:@"* %@ *", [self addWhiteSpaceToString:currentString longerString:longestString]]];
    }
    NSMutableString *frameStartAndEnd = [@"" mutableCopy];
    for (NSUInteger i = 0; i < [[framedString firstObject] length]; i++) {
        [frameStartAndEnd appendString:@"*"];
    }
    [framedString insertObject:frameStartAndEnd atIndex:0];
    [framedString insertObject:frameStartAndEnd atIndex:[framedString count]];
    NSLog(@"%@", framedString);
    return @"";
}

- (NSString *)translateToPigLatin:(NSArray *)arrayOfStrings {
    NSMutableArray *pigLatinStrings = [@[] mutableCopy];
    for (NSString *word in arrayOfStrings) {
        NSString *firstLetter = [NSString stringWithFormat:@"%c", [word characterAtIndex:0]];
        NSMutableString *pigLatinWord = [[word stringByReplacingOccurrencesOfString:firstLetter withString:@""] mutableCopy];
        [pigLatinWord appendFormat:@"%@ay", firstLetter];
        if ([firstLetter isEqualToString:[firstLetter uppercaseString]]) {
            [pigLatinStrings addObject:[pigLatinWord capitalizedString]];
        } else {
            [pigLatinStrings addObject:[pigLatinWord lowercaseString]];
        }
    }
    NSLog(@"%@", pigLatinStrings);
    return @"";
}

- (NSString *)translateToEnglish:(NSArray *)arrayOfStrings {
    NSMutableArray *pigLatinStrings = [@[] mutableCopy];
    for (NSString *word in arrayOfStrings) {
        NSString *englishWord = [word stringByReplacingOccurrencesOfString:@"ay" withString:@""];
        NSString *firstLetter = [NSString stringWithFormat:@"%c", [englishWord characterAtIndex:0]];
        NSString *lastLetter = [NSString stringWithFormat:@"%c", [englishWord characterAtIndex:[englishWord length]-1]];
        NSMutableString *pigLatinWord = [@"" mutableCopy];
        englishWord = [englishWord stringByReplacingOccurrencesOfString:lastLetter withString:@""];
        [pigLatinWord appendFormat:@"%@%@", lastLetter, englishWord];
        if ([firstLetter isEqualToString:[firstLetter uppercaseString]]) {
            [pigLatinStrings addObject:[pigLatinWord capitalizedString]];
        } else {
            [pigLatinStrings addObject:[pigLatinWord lowercaseString]];
        }
    }
    NSLog(@"%@", pigLatinStrings);
    return @"";
}

- (NSArray *)combinedArray:(NSArray *)firstArray arrayToAdd:(NSArray *)secondArray {
    NSMutableArray *combinedArray = [@[] mutableCopy];
    NSMutableArray *secondArrayCopy = [secondArray mutableCopy];
    for (NSString *letter in firstArray) {
        [combinedArray addObject:letter];
        [combinedArray addObject:[secondArrayCopy firstObject]];
        [secondArrayCopy removeObjectAtIndex:0];
    }
    NSLog(@"%@", combinedArray);
    return @[];
}

- (NSArray *)numbersToNumbersArray:(NSUInteger)number {
    NSUInteger temp = number;
    
    NSMutableArray *digits = [@[] mutableCopy];
    while(temp > 0){
        NSInteger digit = temp % 10;
        temp /= 10;
        [digits addObject:@(digit)];
    }
    
    NSArray *reversedArray = [[digits reverseObjectEnumerator] allObjects];
    NSLog(@"%@", reversedArray);
    return @[];
}

- (NSArray *)reverseArray:(NSArray *)arrayToReverse {
    NSArray *reversedArrayWithoutNew = [[arrayToReverse reverseObjectEnumerator] allObjects];
    NSMutableArray *reverseArray = [@[] mutableCopy];
    for (NSUInteger i = [arrayToReverse count] - 1; i > 0; i--) {
        [reverseArray addObject:arrayToReverse[i]];
    }
    
    [reverseArray addObject:[arrayToReverse firstObject]];
    
    NSLog(@"%@", reverseArray);
    NSLog(@"%@", reversedArrayWithoutNew);
    return @[];
}





@end
