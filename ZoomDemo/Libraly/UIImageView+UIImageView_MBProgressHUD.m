//
//  UIImageView+UIImageView_MBProgressHUD.m
//  ZoomDemo
//
//  Created by Tran Trung Hieu on 8/28/13.
//  Copyright (c) 2013 Tran Trung Hieu. All rights reserved.
//

#import "UIImageView+UIImageView_MBProgressHUD.h"

#define TAG_ACTIVITY_INDICATOR 149462

@implementation UIImageView (UIImageView_MBProgressHUD)

-(void)createActivityIndicatorWithStyle:(NSInteger) style {
    MBProgressHUD *activityIndicator = (MBProgressHUD *)[self viewWithTag:TAG_ACTIVITY_INDICATOR];
    if (activityIndicator == nil) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.mode = MBProgressHUDModeAnnularDeterminate;
        hud.labelText = @"Loading";
        activityIndicator.tag = TAG_ACTIVITY_INDICATOR;
    }
}
-(void)removeActivityIndicator {
    
    MBProgressHUD *activityIndicator = (MBProgressHUD *)[self viewWithTag:TAG_ACTIVITY_INDICATOR];
    if (activityIndicator) {
        [activityIndicator removeFromSuperview];
    }
}
- (void)setImageWithURL:(NSURL *)url usingActivityIndicatorStyle:(NSInteger)style {
    MBProgressHUD *hud = (MBProgressHUD *)[self viewWithTag:TAG_ACTIVITY_INDICATOR];
    if (hud == nil) {
        hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.mode = MBProgressHUDModeAnnularDeterminate;
        hud.labelText = @"Loading";
        hud.tag = TAG_ACTIVITY_INDICATOR;
    }
    
    __weak MBProgressHUD *weakHUD=hud;
    [self setImageWithURL:url placeholderImage:nil options:0 progress:^(NSUInteger receivedSize, long long expectedSize) {
        [hud setProgress:receivedSize*1.0/expectedSize];
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
        [weakHUD hide:YES];
    }];
}
@end
