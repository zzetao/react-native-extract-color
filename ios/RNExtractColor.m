//
//  RNExtractColor.m
//
//  Created by zzetao on 2018/5/10.
//

#import "RNExtractColor.h"
#import "MFExtractColor.h"

#import <UIKit/UIKit.h>
#import <React/RCTConvert.h>
#import <React/RCTLog.h>

@implementation RNExtractColor

RCT_EXPORT_MODULE();

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}


- (NSString *)hexStringFromColor:(UIColor *)color {
  const CGFloat *components = CGColorGetComponents(color.CGColor);
  
  CGFloat r = components[0];
  CGFloat g = components[1];
  CGFloat b = components[2];
  
  return [NSString stringWithFormat:@"#%02lX%02lX%02lX",
          lroundf(r * 255),
          lroundf(g * 255),
          lroundf(b * 255)];
}


RCT_EXPORT_METHOD(
                  extract:(NSString *)imageLocalPath
                  successCallback:(RCTResponseSenderBlock)successCallback
                  failureCallback:(RCTResponseErrorBlock)failureCallback
                )
{
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    NSError *error;
    NSURL *URL = [RCTConvert NSURL:imageLocalPath];
    NSData *data = [NSData dataWithContentsOfURL:URL
                                         options:(NSDataReadingOptions)0
                                           error:&error];
    if (!data) {
      failureCallback(error);
      return;
    }
    
    UIImage *image = [UIImage imageWithData: data];
    
    [MFExtractColor extractColorFromImage:image scaled:CGSizeMake(512, 512) completionHandler:^(MFExtractColor *extractColor) {

      NSString *primaryColor = [self hexStringFromColor:extractColor.primaryColor];
      NSString *backgroundColor = [self hexStringFromColor:extractColor.backgroundColor];
      NSString *detailColor = [self hexStringFromColor:extractColor.detailColor];
      NSString *secondaryColor = [self hexStringFromColor:extractColor.secondaryColor];
      
      NSDictionary *result = @{
                               @"backgroundColor": backgroundColor,
                               @"primaryColor": primaryColor,
                               @"detailColor": detailColor,
                               @"secondaryColor": secondaryColor
                               };
      
      successCallback(@[result]);
      
    }];
  });
}

@end
