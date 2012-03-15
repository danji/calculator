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
@property (nonatomic) BOOL isFloatNumber;
@property (nonatomic, strong) calculateBrain *brain;
@end

@implementation HankViewController

@synthesize display=_display;
@synthesize displayAll = _displayAll;
@synthesize hasEnterNumber= _hasEnterNumber;
@synthesize brain=_brain;
@synthesize isFloatNumber=_isFloatNumber;

-(calculateBrain *) brain{
    if(!_brain) _brain=[[calculateBrain alloc] init];
    return _brain;
}

- (IBAction)enterClicked {
    [self.brain pushOperand: [self.display.text doubleValue]]; 
    self.hasEnterNumber = NO;
}

- (IBAction)operationClicked:(UIButton *)sender {
    if (self.hasEnterNumber) {
        [self enterClicked];
    }
    self.display.text = [NSString stringWithFormat:@"%g", [self.brain performOperation:[sender currentTitle]]];
}

- (IBAction)numberClicked:(UIButton *)sender {
    if ([sender.currentTitle isEqualToString:@"."]) {
        if (!self.isFloatNumber) {
            if (!self.hasEnterNumber) {
                self.display.text = [NSString stringWithFormat:@"0."];
                self.hasEnterNumber = YES;
            }else{
                self.display.text = [self.display.text stringByAppendingFormat: sender.currentTitle];
            }   
            self.isFloatNumber = YES;
        }
    }else{
        if (!self.hasEnterNumber) {
            if (![sender.currentTitle isEqualToString:@"0"]) {
                self.display.text = sender.currentTitle;
                self.hasEnterNumber = YES;
            }
        }else{
            self.display.text = [self.display.text stringByAppendingFormat: sender.currentTitle];
        }   
    }
    //NSLog(@"%@", sender.currentTitle);
    //[self.brain pushOperand: [sender.currentTitle doubleValue]];
}

- (IBAction)clearClicked {
    // fixme later, here should be written as init in addition, it should be written in brain
    self.display.text = [NSString stringWithFormat:@"0"];
    self.hasEnterNumber = NO;
    self.isFloatNumber = NO;
}

- (void)viewDidUnload {
    [self setDisplayAll:nil];
    [super viewDidUnload];
}
@end
