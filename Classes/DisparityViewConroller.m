//
//  DisparityViewConroller.m
//  Pension520Checker
//
//  Created by KwanHee Kim on 11. 7. 18..
//  Copyright 2011 Nubicom. All rights reserved.
//

#import "DisparityViewConroller.h"


@implementation DisparityViewConroller

@synthesize HUD;
@synthesize save_result;
@synthesize downdata;


-(void)viewDidLoad
{
	NSLog(@"viewDidLoad");
	self.title=@"추첨결과";
	DataManager *datamanager = [DataManager getDataInstance];
	[self setSave_result:datamanager.save_data];
	NSLog(@"data manager have save data %@", datamanager.save_data);
	
	UIView *backgroundView = [[[UIView alloc]initWithFrame:CGRectMake(0, 44, 320, 416)]autorelease];
	backgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"listbackground.png"]];
	self.tableView.backgroundView =  backgroundView;
	 
 	
}

 
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





#pragma mark tableView 

-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

	return 80;
	
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	NSLog(@"numberOfSectionsInTableView");
    return 1;
}
  
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{ 
	NSLog(@"numberOfRowsInSection");
	return [save_result count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSLog(@"cellForRowAtIndexPath");
	static NSString *CellIdentifier = @"DisparityCell";
	
	DisparityCell *cell = (DisparityCell *)[tableView dequeueReusableCellWithIdentifier: CellIdentifier];
	if (cell == nil) {
		NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DisparityCell" owner:self options:nil];
		cell = (DisparityCell *)[nib objectAtIndex:0];
 
	}
	NSUInteger row = [indexPath row];
	[tableView setSeparatorColor:[UIColor clearColor]];
 
	NSDictionary *tempdic = [[NSDictionary alloc]initWithDictionary:[save_result objectAtIndex:row]];
 
	[cell setCellStyle:cell];
 
	NSString *tempdata = [[NSString alloc]initWithFormat:@"추첨일 : "];
	
	cell.inning.text = [[tempdic objectForKey:@"INNING"] stringByAppendingFormat:@" 회"];
	cell.inningtime.text = [tempdata stringByAppendingFormat:[tempdic objectForKey:@"TIME"]];
 
	return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
		NSLog(@"selected");
	
	NSDictionary *tempdic = [[NSDictionary alloc]initWithDictionary:[save_result objectAtIndex:indexPath.row]];
	  
	
	detailview = [[DisparityDetailController alloc]init];
	[detailview setInning:[tempdic objectForKey:@"INNING"]];
	[detailview setInningtime:[tempdic objectForKey:@"TIME"]];
	
	[self.navigationController pushViewController:detailview animated:YES];
	
}

 

#pragma mark dev makedev


-(void)viewinit{
	
	
} 

-(void)showProgressBar
{

	HUD = [[MBProgressHUD showHUDAddedTo:self.view animated:YES]retain];
	HUD.dimBackground = YES;
    HUD.delegate = self;
	[HUD showUsingAnimation:YES];
	
	
}

- (void)hudWasHidden:(MBProgressHUD *)hud {
    // Remove HUD from screen when the HUD was hidded
	[hud hide:YES afterDelay:2];
    [HUD removeFromSuperview];
    [HUD release];
	HUD = nil;
}

- (void)dealloc {
	[downdata release];
	[save_result release];
    [super dealloc];
}
 
@end
