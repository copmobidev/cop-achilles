//
//  LCArcImageView.m
//  Achilles
//
//  Created by weiyanen on 13-6-30.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "LCArcView.h"

@implementation LCArcView

- (UIBezierPath *)getPath {
	
	UIBezierPath *path=[UIBezierPath bezierPathWithArcCenter:self.center radius:self.radius startAngle:self.startAngle endAngle:self.endAngle clockwise:self.isClockWise];
	NSLog(@"+++++++++%f, %f", self.startAngle, self.endAngle);
	[path closePath];
	
	if (self.startAngle == self.endAngle)
		return nil;
	
	return path;
}

- (void)setShape {
	UIBezierPath *path = [self getPath];
	CGPathRef shape = path.CGPath;
	
    if (shape == nil) {
		self.layer.mask = nil;
    } else {
		CAShapeLayer* maskLayer = [CAShapeLayer layer];
		maskLayer.path = shape;
		self.layer.mask = maskLayer;
	}
}

@end
