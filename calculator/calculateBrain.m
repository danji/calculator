//
//  calculateBrain.m
//  calculator
//
//  Created by Hank on 12/3/1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "calculateBrain.h"
#include <math.h>

@interface calculateBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
@property (nonatomic, strong) NSMutableArray *enterHistoryStack;
@end

@implementation calculateBrain
double const PI=3.14159;
@synthesize operandStack=_operandStack;
@synthesize enterHistoryStack=_enterHistoryStack;


- (NSMutableArray *) operandStack{
    if(!_operandStack) _operandStack = [[NSMutableArray alloc] init];
    return _operandStack;
}

-(NSString*) getCalculateHistory{
    return [NSString stringWithFormat:@"%@",  _enterHistoryStack.description];
}

- (NSMutableArray *) enterHistory{
    if(!_enterHistoryStack) _enterHistoryStack = [[NSMutableArray alloc] init];
    return _enterHistoryStack;
}

-(void)pushOperand: (double) operand {
    [self.operandStack addObject:[NSNumber numberWithDouble: operand]];
    [self.enterHistoryStack addObject:[NSNumber numberWithInt: operand]]; 
}

- (double) popOperand{
    NSNumber *operandObject = [self.operandStack lastObject];
    if(operandObject) [self.operandStack removeLastObject];
    return [operandObject doubleValue];
}

-(double)performOperation: (NSString *)operation{
    double result =0;
    [self.enterHistoryStack addObject:operation];
    
    if ([operation isEqualToString:@"+"]){
        result = [self popOperand] + [self popOperand];
    }
    
    if ([operation isEqualToString:@"-"]){
        double subtranhend;
        subtranhend = [self popOperand];
        result = [self popOperand] - subtranhend;
    }
    
    if ([operation isEqualToString:@"*"]){
        result = [self popOperand] * [self popOperand];
    }
    
    if ([operation isEqualToString:@"/"]){
        double dividor;
        dividor = [self popOperand];
        if (dividor!=0){
            result = [self popOperand] / dividor;
        }else{
            result = 0;
        }
    }
    
    if ([operation isEqualToString:@"sin"]){
        double operand;
        operand = [self popOperand];
        result = sin(operand*PI/180);
    }
    
    if ([operation isEqualToString:@"cos"]){
        double operand;
        operand = [self popOperand];
        result = cos(operand*PI/180);
    }

    if ([operation isEqualToString:@"sqrt"]){
        double operand;
        operand = [self popOperand];
        result = sqrt(operand);
    }

    
    [self pushOperand:result];
    return result;
}



@end
