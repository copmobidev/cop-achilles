//
//  WelcomeScrollView.m
//  Achilles
//
//  Created by weiyanen on 13-5-11.
//  Copyright (c) 2013年 weiyanen. All rights reserved.
//

#import "WelcomeScrollView.h"

@interface WelcomeScrollView()

- (void)setShowsPageControl: (BOOL)show;

@end

@implementation WelcomeScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	if (!self.pageControll) {
		self.lastOrientation = [[UIApplication sharedApplication] statusBarOrientation];
		self.pageControll = [[UIPageControl alloc] initWithFrame:[[UIApplication sharedApplication] statusBarFrame]];
		self.pageControll.numberOfPages = self.contentSize.width / self.frame.size.width;
		self.backgroundColor = [UIColor clearColor];
	}
}

- (void)setContentOffset:(CGPoint)contentOffset {
	[super setContentOffset:contentOffset];
	
	if (self.isTracking) {
		[self setShowsPageControl:YES];
	} else if (!self.isDragging) {
		[self setShowsPageControl:NO];
	}
	
	self.pageControll.currentPage = (contentOffset.x + (self.frame.size.width / 2)) / self.frame.size.width;
}

#pragma mark - Private methods

- (void)setShowsPageControl: (BOOL)show {
	if (self.lastOrientation != [[UIApplication sharedApplication] statusBarOrientation]) {
		self.pageControll.transform = CGAffineTransformMakeRotation(UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]) ? M_PI_2 : 0);
		self.pageControll.frame = [[UIApplication sharedApplication] statusBarFrame];
		self.lastOrientation = [[UIApplication sharedApplication] statusBarOrientation];
	}
	
	[UIView animateWithDuration:.4 animations:^{
		[[UIApplication sharedApplication] setStatusBarHidden:show withAnimation:UIStatusBarAnimationFade];
		self.pageControll.alpha = show;
		
		if (show) {
			[[[UIApplication sharedApplication] keyWindow] addSubview:self.pageControll];
		}
	} completion:^(BOOL finished) {
		if (!show) {
			[self.pageControll removeFromSuperview];
		}
	}];
}
@end
