//
//  DevInfo.m
//  Pension520Checker
//
//  Created by KwanHee Kim on 11. 7. 19..
//  Copyright 2011 Nubicom. All rights reserved.
//

#import "DevInfo.h"


@implementation DevInfo

@synthesize name;
@synthesize mailurl;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	 
	UITouch *touch = [touches anyObject];
  
	 
	if (CGRectContainsPoint([mailurl frame], [touch locationInView:self]))
	{
		NSLog(@"메일 url 클릭했음.");
		NSString *str = [NSString stringWithString:@"mailto://maxtrain77@gamil.com"];
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
	 	
		
	}
	 
	
	
}



- (void)dealloc {
    [super dealloc];
}


@end
