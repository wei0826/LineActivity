LineActivity
============
LineActivity is an iOS 6/7/8 UIActivity subclass for Line App.



How To use
==========

``` objective-c
    #import "UIActivity+LineActivity.h"

    UIActivityViewController *activityVC = nil;
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"line://"]])
    {
        LineActivity *lineActivity = [LineActivity new];
        NSArray *applicationActivities = @[lineActivity];

        activityVC = [[UIActivityViewController alloc] initWithActivityItems:@[[[self.listData objectAtIndex:shareSelectID] valueForKey:@"fb_message"]] applicationActivities:applicationActivities];
    }
    else
    {
        activityVC = [[UIActivityViewController alloc] initWithActivityItems:@[[[self.listData objectAtIndex:shareSelectID] valueForKey:@"fb_message"]] applicationActivities:nil];
    }

    [activityVC setCompletionHandler:^(NSString *activityType, BOOL completed)
    {
        NSLog(@"share completed");
    }];
    
    [self presentViewController:activityVC animated:YES completion:^{
        nil;
    }];
```



License
============
   Copyright 2014 Ervis Peng

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
