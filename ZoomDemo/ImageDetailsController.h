//
//  ImageDetailsController.h
//  ZoomDemo
//
//  Created by Tran Trung Hieu on 8/28/13.
//  Copyright (c) 2013 Tran Trung Hieu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+UIImageView_MBProgressHUD.h"

@interface ImageDetailsController : UIViewController
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
-(id)initWithImageURL:(NSString*)url;
@end
