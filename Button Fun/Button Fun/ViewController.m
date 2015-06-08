//
//  ViewController.m
//  Button Fun
//
//  Created by MAC OS 10.9 on 15-6-4.
//  Copyright (c) 2015年 MAC OS 10.9. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation ViewController

- (IBAction)buttonPressed:(UIButton *)sender {
    NSString *title = [sender titleForState:UIControlStateNormal];
    NSString *plainText = [NSString stringWithFormat:@"%@ button pressed.", title];
    NSMutableAttributedString *styledText = [[NSMutableAttributedString alloc] initWithString:plainText];
    NSDictionary *attributes = @{
                                 NSFontAttributeName :[UIFont boldSystemFontOfSize:_statusLabel.font.pointSize]
                                 };
    NSRange nameRange = [plainText rangeOfString:title];
    
    [styledText setAttributes:attributes range:nameRange];
    _statusLabel.attributedText = styledText;
}

@end
