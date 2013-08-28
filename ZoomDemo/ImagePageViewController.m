//
//  ImagePageViewController.m
//  ZoomDemo
//
//  Created by Tran Trung Hieu on 8/28/13.
//  Copyright (c) 2013 Tran Trung Hieu. All rights reserved.
//

#import "ImagePageViewController.h"

@interface ImagePageViewController ()

@end

@implementation ImagePageViewController

- (id)init {
    self=[super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.listImage=[NSArray arrayWithObjects:
                    @"http://newevolutiondesigns.com/images/freebies/hd-wallpaper-6.jpg",
                    @"http://beachhotelresort.com.au/assets/Beach%20Hotel%20Resort/page-bgs/about-beach-hotel-resort.jpg",
                    @"http://static4.businessinsider.com/image/5101513aecad04bb07000000-1200/bora-bora-snorkeler-tropical-beach.jpg",
                    @"http://4.bp.blogspot.com/-sSiBtGQiHgs/TiHThoSz_VI/AAAAAAAAFCg/eKtkupuwpn4/s1600/Du+lich+Vung+Tau+-+Bien+Vung+Tau+13.JPG", nil];
    self.listController=[NSMutableArray array];
    for (int i=0;i<[self.listImage count];i++) {
        [self.listController addObject:[NSNull null]];
    }
    self.delegate=self;
    self.dataSource=self;
    ImageDetailsController *newsDetail=[self viewControllerAtIndex:self.currIndex];
    [self setViewControllers:@[newsDetail] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Handler
-(ImageDetailsController*)viewControllerAtIndex:(int)index {
    if (index<0 || index>=[self.listImage count]) {
        return nil;
    } else {
        ImageDetailsController *newsDetailController=[self.listController objectAtIndex:index];
        if ((NSNull *)newsDetailController == [NSNull null]){
            NSString *url=[self.listImage objectAtIndex:index];
            newsDetailController=[[ImageDetailsController alloc] initWithImageURL:url];
            NSLog(@"alloc controller for index %d",index);
            [self.listController replaceObjectAtIndex:index withObject:newsDetailController];
            
        }
        //CHi su dung voi UIPageView, voi UIScrollView xu ly theo kieu khac
        for (int i=0;i<[self.listController count];i++) {
            if (fabs(i-index)>3) {
                [self.listController replaceObjectAtIndex:i withObject:[NSNull null]];
            }
        }
        
        return newsDetailController;
    }
}
#pragma mark - UIPageViewControllerDataSource
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    int index = [self.listController indexOfObject:(ImageDetailsController *)viewController];
    if (index < 0)  {
        NSLog(@"Co index <0");
        return nil;
    }
    index--;
    tempCurrPage=index;
    ImageDetailsController *newsDetailController=[self viewControllerAtIndex:index];
    
    return newsDetailController;
    //return [self viewControllerAtIndex:index];
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    int index = [self.listController indexOfObject:(ImageDetailsController *)viewController];
    if (index >= [self.listImage count])  {
        NSLog(@"Co index > count");
        return nil;
    }
    index++;
    tempCurrPage=index;
    
    ImageDetailsController *newsDetailController=[self viewControllerAtIndex:index];
    return newsDetailController;
}
@end
