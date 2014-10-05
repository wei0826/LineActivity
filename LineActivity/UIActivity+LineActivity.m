//
//  UIActivity+LineActivity.m
//  watsons
//
//  Created by Ervis Peng on 2014/8/20.
//
//

#import "UIActivity+LineActivity.h"


static NSString *LineBaseURL = @"line://msg/text";

@implementation LineActivity

//move to UIActivityCategoryShare
+ (UIActivityCategory)activityCategory
{
    return UIActivityCategoryShare;
}

- (NSString *)activityType
{
    return NSStringFromClass([self class]);
}

- (NSString *)activityTitle
{
    return NSLocalizedStringFromTable(@"Line", @"LineActivity", nil);
}

- (UIImage *)_activityImage
{
    return [UIImage imageNamed:@"LINE_logo"];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:LineBaseURL]];
}

- (void)prepareWithActivityItems:(NSArray *)activityItems
{
    for(id activityItem in activityItems)
    {
        if([activityItem isKindOfClass:[NSString class]] && !_message)
            _message = activityItem;
    }
}

- (void)performActivity
{
    static NSString *const charactersToBeEscaped = @"!*'();:@&=+$,/?%#[]";
    NSString *msg =  (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                 (__bridge CFStringRef)_message,
                                                                                 NULL,
                                                                                 (__bridge CFStringRef)charactersToBeEscaped,
                                                                                 kCFStringEncodingUTF8);
    
    NSString *urlToOpen = [NSString stringWithFormat:@"%@/%@", LineBaseURL, msg];
    BOOL completed = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlToOpen]];
    
    [self activityDidFinish:completed];
}

@end
