//
//  HelpInfo.m
//  Pension520Checker
//
//  Created by KwanHee Kim on 11. 7. 18..
//  Copyright 2011 Nubicom. All rights reserved.
//

#import "HelpInfo.h"


@implementation HelpInfo
 
@synthesize tableview;
 
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.title =@"정보";
	
	UIView *backgroundView = [[[UIView alloc]initWithFrame:CGRectMake(0, 44, 320, 416)]autorelease];
	backgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"listbackground.png"]];
	self.tableview.backgroundView =  backgroundView;
	
}
 

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

#pragma mark tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	 
	if (section==0) {
		return 1;
	}
	else if(section==1){
		return 1;
	}

	return 0;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	if (indexPath.section==0) {
		return 60;
	}
	else if (indexPath.section==1) {
		NSLog(@"section==1");
		return 220;
	}
	
	return 0;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
	if (section==0) {
		return 40;
	}
	else if (section==1) {
		
		return 40;
	}
	
	return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	NSLog(@"numberOfSectionsInTableView");
    return 2;
}

 

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
	if (section==0) {
		
		UIView *info = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 320, 40)];
		info.backgroundColor = [UIColor clearColor];
		
		UILabel *infolabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 3, 100, 30)];
		infolabel.textColor = [UIColor whiteColor];
		infolabel.backgroundColor = [UIColor clearColor];
		infolabel.text = @"개발자 정보";

		[info addSubview:infolabel];
		return info;
		 
	}
	if (section==1) {
		UIView *devinfoView = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 320, 40)];
		devinfoView.backgroundColor = [UIColor clearColor];
		
		
		UILabel *info = [[UILabel alloc]initWithFrame:CGRectMake(5, 3, 100, 30)];
		info.textColor = [UIColor whiteColor];
		info.backgroundColor= [UIColor clearColor];
		info.text = @"주의사항";
		
		[devinfoView addSubview:info];
		return devinfoView;
	}
	
	return nil;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	
 
	
	
	static NSString *CellIdentifier1 = @"DevInfo";
	static NSString *CellIdentifier2 = @"Caution";
 
	 	 
	if (indexPath.section==0) 
	{
		DevInfo *cell = (DevInfo *)[tableView dequeueReusableCellWithIdentifier: CellIdentifier1];
		if (cell == nil) {
			NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DevInfo" owner:self options:nil];
			cell = (DevInfo *)[nib objectAtIndex:0];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
		}
		 
		
		return cell;
		
	}
	
	if (indexPath.section==1) 
	{
		Caution *cell = (Caution *)[tableView dequeueReusableCellWithIdentifier: CellIdentifier2];
		if (cell == nil) {
			NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"Caution" owner:self options:nil];
			cell = (Caution *)[nib objectAtIndex:0];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
		}
		
		cell.textview.font = [UIFont systemFontOfSize:14.0];
		cell.textview.backgroundColor = [UIColor clearColor];
		
		return cell;
	}
	
	return nil;
	 	
}



 
@end
