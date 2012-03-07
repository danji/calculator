//
//  calculateBrain.m
//  calculator
//
//  Created by Hank on 12/3/1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "calculateBrain.h"

@interface calculateBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation calculateBrain
@synthesize operandStack=_operandStack;

- (NSMutableArray *) operandStack{
    if(!_operandStack) _operandStack = [[NSMutableArray alloc] init];
    return _operandStack;
}

-(void)pushOperand: (double) operand {
    [self.operandStack addObject:[NSNumber numberWithDouble: operand]];
}

- (double) popOperand{
    NSNumber *operandObject = [self.operandStack lastObject];
    if(operandObject) [self.operandStack removeLastObject];
    return [operandObject doubleValue];
}

-(double)performOperation: (NSString *)operation{
    double result =0;
    
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
    
    [self pushOperand:result];
    return result;
}

@end
