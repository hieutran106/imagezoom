//
//  UIImageView+UIImageView_MBProgressHUD.h
//  ZoomDemo
//
//  Created by Tran Trung Hieu on 8/28/13.
//  Copyright (c) 2013 Tran Trung Hieu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "MBProgressHUD.h"
@interface UIImageView (UIImageView_MBProgressHUD)
- (void)setImageWithURL:(NSURL *)url usingActivityIndicatorStyle:(NSInteger)style;
@end
