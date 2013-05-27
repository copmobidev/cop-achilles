//
//  LCSpanTableControllerViewController.m
//  FPPopoverDemo
//
//  Created by Alvise Susmel on 4/13/12.
//  Copyright (c) 2012 Fifty Pixels Ltd. All rights reserved.
//

#import "LCSpanTableController.h"
//#import "FPViewController.h"

@interface LCSpanTableController ()
@property (nonatomic, strong) NSArray *spanType;
@end

@implementation LCSpanTableController

- (NSArray *)spanType {
	if (!_spanType) {
		_spanType = @[@"按年查看", @"按月查看", @"按周查看", @"按次查看"];
	}
	return _spanType;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = nil;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SpanCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [self.spanType objectAtIndex:indexPath.row];
    cell.textLabel.textAlignment = UITextAlignmentCenter;
	
    return cell;
}


#pragma mark - Table view delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if([self.delegate respondsToSelector:@selector(selectedTableRow:)])
    {
        [self.delegate selectedTableRow:indexPath.row];
    }
}




@end
