//
//  LCTableProvider.m
//  Achilles
//
//  Created by weiyanen on 13-5-24.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "LCTableProvider.h"
#import "LCSubBillCell.h"
#import "LCSectionBillCell.h"

@implementation LCTableProvider

#pragma mark - Data

- (void)initProvider {
	self.isOpen = NO;
}

- (NSMutableArray *)bills {
	if (!_bills) {
		NSString *path = [[NSBundle mainBundle] pathForResource:@"bills" ofType:@"plist"];
		_bills = [[NSMutableArray alloc] initWithContentsOfFile:path];
	}
	return _bills;
}

#pragma mark - UITableViewSource

- (NSUInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return [self.bills count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if (self.isOpen) {
		if (self.selectIndex.section == section) {
			return [[self.bills objectAtIndex:section] count] + 1;
		}
	}
	return 1;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
	if (self.isOpen && self.selectIndex.section == indexPath.section && indexPath.row!=0)
    {
        static NSString *CellIdentifier = @"LCSubBillCell";
        LCSubBillCell *cell = (LCSubBillCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (!cell)
        {
            cell = [[[NSBundle mainBundle] loadNibNamed:CellIdentifier
                                                  owner:self
                                                options:nil] objectAtIndex:0];
        }
        NSDictionary* dict = [self.bills objectAtIndex:self.selectIndex.section];
        NSDictionary* bill = [[dict objectForKey:@"subBills" ] objectAtIndex:indexPath.row - 1];
        [cell.date setText:[bill objectForKey:@"date"]];
        [cell.oil setText:[bill objectForKey:@"oil"]];
        [cell.perCost setText:[bill objectForKey:@"perCost"]];
		[cell.totalCost setText:[bill objectForKey:@"totalCost"]];
		
        return cell;
    }
    else
    {
        static NSString *CellIdentifier = @"LCSectionBillCell";
        LCSectionBillCell *cell = (LCSectionBillCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell)
        {
            cell = [[[NSBundle mainBundle] loadNibNamed:CellIdentifier
                                                  owner:self
                                                options:nil] objectAtIndex:0];
        }
        NSDictionary* dict = [[self.bills objectAtIndex:indexPath.section] objectForKey:@"summaryBill"];
        [cell.date setText:[dict objectForKey:@"date"]];
        [cell.times setText:[dict objectForKey:@"times"]];
        [cell.oilAmount setText:[dict objectForKey:@"oilAmount"]];
		[cell.perCost setText:[dict objectForKey:@"perCost"]];
		[cell.totalCost setText:[dict objectForKey:@"totalCost"]];

        [cell changeArrowWithUp:([self.selectIndex isEqual:indexPath] ? YES : NO)];
        return cell;
    }
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        if ([indexPath isEqual:self.selectIndex])
        {
            self.isOpen = NO;
            [self didSelectCellRowFirstDo:NO nextDo:NO];
            self.selectIndex = nil;
            
        }
        else
        {
            if (!self.selectIndex)
            {
                self.selectIndex = indexPath;
                [self didSelectCellRowFirstDo:YES nextDo:NO];
            }
            else
            {
                [self didSelectCellRowFirstDo:NO nextDo:YES];
            }
        }
        
    }
    else
    {
		//        NSDictionary *dic = [bill objectAtIndex:indexPath.section];
		//        NSArray *list = [dic objectForKey:@"list"];
		//        NSString *item = [list objectAtIndex:indexPath.row-1];
		//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:item
		//                                                        message:nil
		//                                                       delegate:nil
		//                                              cancelButtonTitle:@"取消"
		//                                              otherButtonTitles: nil];
		//        [alert show];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)didSelectCellRowFirstDo:(BOOL)firstDoInsert nextDo:(BOOL)nextDoInsert
{
    self.isOpen = firstDoInsert;
    
    LCSectionBillCell *cell = (LCSectionBillCell *)[self.billTableView cellForRowAtIndexPath:self.selectIndex];
    [cell changeArrowWithUp:firstDoInsert];
    
    [self.billTableView beginUpdates];
    
    int section = self.selectIndex.section;
    int contentCount = [[_bills objectAtIndex:section] count];
	NSMutableArray* rowToInsert = [[NSMutableArray alloc] init];
	for (NSUInteger i = 1; i < contentCount + 1; i++)
    {
		NSIndexPath* indexPathToInsert = [NSIndexPath indexPathForRow:i inSection:section];
		[rowToInsert addObject:indexPathToInsert];
	}
	
	if (firstDoInsert)
    {
        [self.billTableView insertRowsAtIndexPaths:rowToInsert
                                  withRowAnimation:UITableViewRowAnimationTop];
    }
	else
    {
        [self.billTableView deleteRowsAtIndexPaths:rowToInsert
                                  withRowAnimation:UITableViewRowAnimationTop];
    }
	
	[self.billTableView endUpdates];
    if (nextDoInsert)
    {
        self.isOpen = YES;
        self.selectIndex = [self.billTableView indexPathForSelectedRow];
        [self didSelectCellRowFirstDo:YES nextDo:NO];
    }
    if (self.isOpen)
    {
        [self.billTableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop
                                                              animated:YES];
    }
}

@end
