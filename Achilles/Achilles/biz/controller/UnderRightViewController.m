//
//  UnderRightViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "UnderRightViewController.h"

@interface UnderRightViewController()

@property (nonatomic, assign) CGFloat peekLeftAmount;

@end

@implementation UnderRightViewController

- (NSArray *)spanArray {
	if (!_spanArray) {
		self.spanArray = @[@{@"name": @"year", @"display":@"年"}, @{@"name": @"month", @"display":@"月"}, @{@"name": @"week", @"display":@"周"}, @{@"name": @"shift", @"display":@"次"}];
	}
	return _spanArray;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.peekLeftAmount = 40.0f;
  [self.slidingViewController setAnchorLeftPeekAmount:self.peekLeftAmount];
  self.slidingViewController.underRightWidthLayout = ECVariableRevealWidth;
}

- (void)viewDidUnload {
	[self setSpanPicker:nil];
	[super viewDidUnload];
	
}

#pragma UIPickerViewDataSource

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	return self.spanArray.count;
}

#pragma UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	return [[self.spanArray objectAtIndex:row] objectForKey:@"name"];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	
}
@end
