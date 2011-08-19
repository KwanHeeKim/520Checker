//
//  Calculate.h
//  Pension520Checker
//
//  Created by KwanHee Kim on 11. 7. 16..
//  Copyright 2011 Nubicom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownData.h"

@interface Calculate : NSObject {

}

+(NSString *)getResultData:(NSMutableArray *)items userWrite:(NSDictionary *)data callId:(id)_id;

@end
