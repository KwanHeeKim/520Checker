//
//  Calculate.m
//  Pension520Checker
//
//  Created by KwanHee Kim on 11. 7. 16..
//  Copyright 2011 Nubicom. All rights reserved.
//

#import "Calculate.h"


@implementation Calculate


+(NSString *)getResultData:(NSMutableArray *)items userWrite:(NSDictionary *)data callId:(id)_id
{
 
	NSString *joe = [[NSString alloc]initWithFormat:@"%@", [data objectForKey:@"joe"]];
	NSString *num1 =[[NSString alloc]initWithFormat:@"%@", [data objectForKey:@"num1"]];
	NSString *num2 = [[NSString alloc]initWithFormat:@"%@", [data objectForKey:@"num2"]];
	NSString *num3 = [[NSString alloc]initWithFormat:@"%@", [data objectForKey:@"num3"]];
	NSString *num4 = [[NSString alloc]initWithFormat:@"%@", [data objectForKey:@"num4"]];
	NSString *num5 =  [[NSString alloc]initWithFormat:@"%@", [data objectForKey:@"num5"]];
	NSString *num6 =  [[NSString alloc]initWithFormat:@"%@", [data objectForKey:@"num6"]];
	NSLog(@"user write  %@ , %@ %@ %@ %@ %@ %@ ", joe, num1, num2, num3, num4, num5,num6);
	//1
	for (int i = 0; i < 2; i++) {
		DownData *item = [items objectAtIndex:i];
	  
		if( [item.joe isEqualToString:joe] &&
		   [item.num1 isEqualToString:num1] &&
		   [item.num2 isEqualToString:num2] &&
		   [item.num3 isEqualToString:num3] &&
		   [item.num4 isEqualToString:num4] &&
		   [item.num5 isEqualToString:num5] &&
		   [item.num6 isEqualToString:num6] 
		   )
			return @"1등입니다! 축하합니다!";
		 
	}
	
	//2
	for (int i = 2; i < 6; i++) {
		DownData *item = [items objectAtIndex:i];
		
		if( [item.joe isEqualToString:joe] &&
		   [item.num1 isEqualToString:num1] &&
		   [item.num2 isEqualToString:num2] &&
		   [item.num3 isEqualToString:num3] &&
		   [item.num4 isEqualToString:num4] &&
		   [item.num5 isEqualToString:num5] &&
		   [item.num6 isEqualToString:num6] 
		   )
		
			return @"2등입니다! 축하합니다!";
	}
	
	//3
	for (int i = 6; i < 7; i++) {

		DownData *item = [items objectAtIndex:i];
		
		if( [item.num1 isEqualToString:num1] &&
		   [item.num2 isEqualToString:num2] &&
		   [item.num3 isEqualToString:num3] &&
		   [item.num4 isEqualToString:num4] &&
		   [item.num5 isEqualToString:num5] &&
		   [item.num6 isEqualToString:num6] 
		   )
			return @"3등입니다! 축하합니다!";
	}
	
	//4
	for (int i = 7; i <8; i++) {
		DownData *item = [items objectAtIndex:i];
		
		if( [item.num2 isEqualToString:num2] &&
		   [item.num3 isEqualToString:num3] &&
		   [item.num4 isEqualToString:num4] &&
		   [item.num5 isEqualToString:num5] &&
		   [item.num6 isEqualToString:num6] 
		   )
			return @"4등입니다! 축하합니다!";
	}
	
	//5
	for (int i = 8; i <9; i++) {
		DownData *item = [items objectAtIndex:i];
		
		if( 
		   [item.num3 isEqualToString:num3] &&
		   [item.num4 isEqualToString:num4] &&
		   [item.num5 isEqualToString:num5] &&
		   [item.num6 isEqualToString:num6] 
		   )
			return @"5등입니다! 축하합니다!";
	}
	
	//6
	for (int i = 9; i < 11; i++) {
		DownData *item = [items objectAtIndex:i];
		
		if( 
		   [item.num5 isEqualToString:num5] &&
		   [item.num6 isEqualToString:num6] 
		   )
			return @"6등입니다! 축하합니다!";
	}
	
	//7
	for (int i = 11; i < 13; i++) {
		DownData *item = [items objectAtIndex:i];
		
		if( 
		   [item.num6 isEqualToString:num6] 
		   )
			return @"7등입니다! 축하합니다!";
	}
	
	return @"꽝!!!";
	
	
}
 

@end
