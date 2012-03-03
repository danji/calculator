//
//  HankViewController.m
//  calculator
//
//  Created by Hank on 12/3/1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HankViewController.h"
#import "calculateBrain.h"


@interface HankViewController()
@property (nonatomic) BOOL hasEnterNumber;
@property (nonatomic, strong) calculateBrain *brain;
@end

@implementation HankViewController

@synthesize display=_display;
@synthesize hasEnterNumber= _hasEnterNumber;
@synthesize brain=_brain;

-(calculateBrain *) brain{
    if(!_brain) _brain=[[calculateBrain alloc] init];
    return _brain;
}

- (IBAction)operationClicked:(UIButton *)sender {
    self.display.text = [NSString stringWithFormat:@"%g", [self.brain performOperation:[sender currentTitle]]];
}

- (IBAction)numberClicked:(UIButton *)sender {
    if (!self.hasEnterNumber) {
        self.display.text = sender.currentTitle;
        self.hasEnterNumber = YES;
    }else{
        self.display.text = [self.display.text stringByAppendingFormat: sender.currentTitle];
    }
    
    //[self.brain pushOperand: [sender.currentTitle doubleValue]];
}

- (IBAction)enterClicked {
    [self.brain pushOperand: [self.display.text doubleValue]]; 
    self.hasEnterNumber = NO;
}

- (IBAction)clearClicked {
    self.display.text = [NSString stringWithFormat:@"0"];
    self.hasEnterNumber = NO;
}

@end
