//
//  MainRootViewController.m
//  Pension520Checker
//
//  Created by KwanHee Kim on 11. 7. 13..
//  Copyright 2011 Nubicom. All rights reserved.
//

#import "MainRootViewController.h"


#define NUMBER_OF_ITEMS 2
#define ITEM_SPACING 210
#define USE_BUTTONS YES
 

@interface MainRootViewController ()  

@property (nonatomic, assign) BOOL wrap;
@property (nonatomic, retain) NSMutableArray *items;

@end




@implementation MainRootViewController

@synthesize carousel;
@synthesize items;
@synthesize wrap;
@synthesize checkerView;
@synthesize save_result;
@synthesize datamanager;

 
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        //set up data
        self.items = [NSMutableArray array];
        for (int i = 1; i < NUMBER_OF_ITEMS; i++)
        {
            [items addObject:[NSNumber numberWithInt:i]];
        }
    }
    return self;
}
 
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	
	//carousel.type = iCarouselTypeCustom;
	carousel.type = iCarouselTypeCoverFlow;
	wrap =YES;
	 
	checkerView = [[CheckerViewController alloc]init];
	
	//audio setting
	
	NSString *path = [[NSBundle mainBundle] pathForResource:@"next" ofType:@"wav"];
	NSURL *fileURL = [[NSURL alloc]initFileURLWithPath:path];
	player = [[AVAudioPlayer alloc]initWithContentsOfURL:fileURL error:nil];
	[player prepareToPlay];
	 
	
	datamanager =[DataManager getDataInstance];
	[datamanager showProgressBar:self.view CallviewID:self];
	[self RequestData];
	
}

-(void)viewDidAppear:(BOOL)animated
{
	[self requestAd];
	
}


-(void)viewDidUnload{
	[super viewDidUnload];
	self.carousel = nil;
	
	
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}



- (void)dealloc {
	[carousel release];
	[items release];
    [super dealloc];
}


#pragma mark -
#pragma mark iCarousel methods

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
 
    return [items count];
	 
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index
{
    if (USE_BUTTONS)
    {
        //create a numbered button
        UIImage *image = [UIImage imageNamed:@"page.png"];
        UIButton *button = [[[UIButton alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)] autorelease];
        [button setBackgroundImage:image forState:UIControlStateNormal];
		NSString *tempString = [[NSString alloc]initWithFormat:[[[items objectAtIndex:index] stringValue] stringByAppendingFormat:@"회차"]];
        [button setTitle:tempString forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [button.titleLabel.font fontWithSize:50];
        [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = index;
		
		//TT_RELEASE_SAFELY(tempString);
        return button;
    }
    else
    {
        //create a numbered view
        UIView *view = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"page.png"]] autorelease];
        UILabel *label = [[[UILabel alloc] initWithFrame:view.bounds] autorelease];
        label.text = [[items objectAtIndex:index] stringValue];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = UITextAlignmentCenter;
        label.font = [label.font fontWithSize:50];
        [view addSubview:label];
        return view;
    }
}

- (NSUInteger)numberOfPlaceholdersInCarousel:(iCarousel *)carousel
{
	//note: placeholder views are only displayed if wrapping is disabled
	return 2;
}

- (UIView *)carousel:(iCarousel *)carousel placeholderViewAtIndex:(NSUInteger)index
{
	//NSLog(@"placeholderViewAtIndex");
	//create a placeholder view
	UIView *view = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"page.png"]] autorelease];
	UILabel *label = [[[UILabel alloc] initWithFrame:view.bounds] autorelease];
	label.text = (index == 0)? @"[": @"]";
	label.backgroundColor = [UIColor clearColor];
	label.textAlignment = UITextAlignmentCenter;
	label.font = [label.font fontWithSize:50];
	[view addSubview:label];
	return view;
}

- (float)carouselItemWidth:(iCarousel *)carousel
{
    //slightly wider than item view
    return ITEM_SPACING;
}

- (CATransform3D)carousel:(iCarousel *)_carousel transformForItemView:(UIView *)view withOffset:(float)offset
{
	//NSLog(@"transformForItemView");
    //implement 'flip3D' style carousel
    
    //set opacity based on distance from camera
    view.alpha = 1.0 - fminf(fmaxf(offset, 0.0), 1.0);
    
    //do 3d transform
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = self.carousel.perspective;
    transform = CATransform3DRotate(transform, M_PI / 8.0, 0, 1.0, 0);
    return CATransform3DTranslate(transform, 0.0, 0.0, offset * carousel.itemWidth);
}

- (BOOL)carouselShouldWrap:(iCarousel *)carousel
{
    //wrap all carousels
    return wrap;
}

- (void)carouselWillBeginDragging:(iCarousel *)carousel
{
	NSLog(@"Carousel will begin dragging");
}

- (void)carouselDidEndDragging:(iCarousel *)carousel willDecelerate:(BOOL)decelerate
{
	NSLog(@"Carousel did end dragging and %@ decelerate", decelerate? @"will": @"won't");
}

- (void)carouselWillBeginDecelerating:(iCarousel *)carousel
{
	NSLog(@"Carousel will begin decelerating");
}

- (void)carouselDidEndDecelerating:(iCarousel *)carousel
{
	NSLog(@"Carousel did end decelerating");
}

- (void)carouselWillBeginScrollingAnimation:(iCarousel *)carousel
{
	NSLog(@"Carousel will begin scrolling");
}

- (void)carouselDidEndScrollingAnimation:(iCarousel *)carousel
{
	NSLog(@"Carousel did end scrolling");
	[player play];
}

- (void)carousel:(iCarousel *)_carousel didSelectItemAtIndex:(NSInteger)index
{
	if (index == carousel.currentItemIndex)
	{
 
		CheckerViewController	*checkerViewcontroller = [[CheckerViewController alloc]init];
		
		[checkerViewcontroller setSelect_number:[[items objectAtIndex:index] intValue]];
		[self.navigationController pushViewController:checkerViewcontroller animated:YES];

		
		[checkerViewcontroller release];
		
//      원본
//		[checkerView setSelect_number:[[items objectAtIndex:index] intValue]];
//		[self.navigationController pushViewController:checkerView animated:YES];

	}
	else
	{
		//NSLog(@"Selected item number %i", index);
	}
}

- (void)buttonTapped:(UIButton *)sender
{
//    [[[[UIAlertView alloc] initWithTitle:@"Button Tapped"
//                                 message:[NSString stringWithFormat:@"You tapped button number %i", sender.tag]
//                                delegate:nil
//                       cancelButtonTitle:@"OK"
//                       otherButtonTitles:nil] autorelease] show];
}




#pragma mark TTRequest

#pragma mark TTURLRequest

- (void)requestDidFinishLoad:(TTURLRequest*)request {
	NSLog(@"MainRootViewController requestDidFinishLoad");
	[datamanager.HUD hide:YES];
	TTURLXMLResponse *response = request.response;
	TTDASSERT([response.rootObject isKindOfClass:[NSDictionary class]]);
	NSDictionary* feed = response.rootObject;
	
	//NSLog(@"data is %@", feed);
	TTDASSERT([[feed objectForKey:@"POST"] isKindOfClass:[NSArray class]]);
	NSArray* entries = [feed objectForKey:@"POST"];
	//NSLog(@"entries IS %@", entries);
	
	//NSLog(@"count is %d " , [entries count]);
	 
	save_result = [[NSMutableArray alloc]initWithCapacity:[entries count]];
	
	//리스트에 뿌릴꺼 저장하기 
	for (int i=0; i<[entries count]; i++)
	{
		NSDictionary *temp = [[NSDictionary alloc]initWithDictionary:[entries objectAtIndex:i]];
		NSDictionary *row = [[NSDictionary alloc]initWithObjectsAndKeys:[[temp objectForKey:@"INNING"] objectForXMLNode]  , @"INNING",
							 [[temp objectForKey:@"TIME"] objectForXMLNode], @"TIME", nil];
		[save_result addObject:row];
		[temp release];
		[row release];
	}
	
	 
	[datamanager setSave_data:save_result];
	 
	//받아온거 추가하기 
	for(int i=0; i< [entries count]-1; i++){
		//NSLog(@"currunt before arr is %@", items);
		NSInteger index = carousel.currentItemIndex;
		NSLog(@"carousel.numberOfItems %d" , carousel.numberOfItems);
		[items insertObject:[NSNumber numberWithInt:carousel.numberOfItems+1] atIndex:index];
		[carousel insertItemAtIndex:index animated:YES];	
		//NSLog(@"currunt arr is %@", items); 
	}
	 	
}


- (NSError*)request:(TTURLRequest*)request processResponse:(NSHTTPURLResponse*)response
			   data:(id)data{
	return nil;
	
}

-(void)RequestData{
	
	NSString *requestURL = @"http://zakkfactory.zc.bz/test.html";
    NSLog(@"MainRootViewController requestURL: %@", requestURL);
	
    TTURLRequest *request = [TTURLRequest requestWithURL:requestURL delegate:self];
    request.cacheExpirationAge = TT_CACHE_EXPIRATION_AGE_NEVER;
    request.cachePolicy = TTURLRequestCachePolicyNone;
	request.httpMethod =@"POST";
	

    TTURLXMLResponse *response = [[TTURLXMLResponse alloc] init];
	response.isRssFeed =YES;
    request.response = response;
    TT_RELEASE_SAFELY(response);
	
    [request send];
	 

}


-(void)requestAd{
	
	/* 애드몹
	
	// Create a view of the standard size at the bottom of the screen.
	bannerView_ = [[GADBannerView alloc]
                   initWithFrame:CGRectMake(0,0,320,50)];
	NSLog(@"MainRootViewController bannerView_ is %@", bannerView_);
	// Specify the ad's "unit identifier." This is your AdMob Publisher ID.
	bannerView_.adUnitID = @"a14e268a9f48b42";
	
	// Let the runtime know which UIViewController to restore after taking
	// the user wherever the ad goes and add it to the view hierarchy.
	bannerView_.rootViewController = self;
	[self.view addSubview:bannerView_];
	
	// Initiate a generic request to load it with an ad.
	[bannerView_ loadRequest:[GADRequest request]];
	 
	 */
	
	if([CaulyViewController moveBannerAD:self caulyParentview:nil xPos:0 yPos:0]==FALSE){
		NSLog(@"requestbanner ad failed");
	}
 
	
}

@end
