//
//  ImagePageViewController.h
//  ZoomDemo
//
//  Created by Tran Trung Hieu on 8/28/13.
//  Copyright (c) 2013 Tran Trung Hieu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageDetailsController.h"
@interface ImagePageViewController : UIPageViewController <UIPageViewControllerDataSource,UIPageViewControllerDelegate> {
    NSInteger tempCurrPage;
}
@property (nonatomic, strong) NSArray *listImage;
@property (nonatomic, strong) NSMutableArray *listController;
@property (nonatomic) NSInteger currIndex;
- (id)init;
@end
