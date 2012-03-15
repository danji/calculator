//
//  calculateBrain.h
//  calculator
//
//  Created by Hank on 12/3/1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface calculateBrain : NSObject

-(void) pushOperand: (double) operand;
-(double) performOperation: (NSString *)operation;
-(NSString*) getCalculateHistory;
@end
