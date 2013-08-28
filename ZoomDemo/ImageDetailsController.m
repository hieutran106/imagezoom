//
//  ImageDetailsController.m
//  ZoomDemo
//
//  Created by Tran Trung Hieu on 8/28/13.
//  Copyright (c) 2013 Tran Trung Hieu. All rights reserved.
//

#import "ImageDetailsController.h"

@interface ImageDetailsController ()

@end

@implementation ImageDetailsController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id)initWithImageURL:(NSString*)url {
    self =[super initWithNibName:@"ImageDetailsController" bundle:nil];
    if (self) {
        self.url=url;
    }
    return self;
}
#pragma mark - Life cyle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.scrollView.minimumZoomScale=1.0;
    self.scrollView.maximumZoomScale=6.0;
    _imageView=[[UIImageView alloc] initWithFrame:self.scrollView.bounds];
    _imageView.contentMode=UIViewContentModeScaleAspectFit;
//    [self.imageView setImageWithURL:[NSURL URLWithString:_url] placeholderImage:nil];
    [self.imageView setImageWithURL:[NSURL URLWithString:_url]  usingActivityIndicatorStyle:1];
    [self.scrollView addSubview:_imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc {
    self.imageView=nil;
    self.url=nil;
}
- (void)centerScrollViewContents {
    CGSize boundsSize = self.scrollView.bounds.size;
    CGRect contentsFrame = self.imageView.frame;
    
    if (contentsFrame.size.width < boundsSize.width) {
        contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0f;
    } else {
        contentsFrame.origin.x = 0.0f;
    }
    
    if (contentsFrame.size.height < boundsSize.height) {
        contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0f;
    } else {
        contentsFrame.origin.y = 0.0f;
    }
    
    self.imageView.frame = contentsFrame;
}
#pragma mark - UIScrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    NSLog(@"djkashdj");
    [self centerScrollViewContents];
}

@end
