//
//  ViewController.m
//  FormattedCurrencyInput
//
//  Created by Peter Boni on 4/07/13.
//  Copyright (c) 2013 Peter Boni. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize textField = _textField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	//_textField.delegate = self;
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numberFormatter setMaximumFractionDigits:2];
    [numberFormatter setMinimumFractionDigits:2];
    
    _textField.text = [numberFormatter stringFromNumber:[NSNumber numberWithInt:0]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.textField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)valueButton:(id)sender
{
    NSNumber *textFieldNum = [_textField getValueAsNumber];
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:[NSString stringWithFormat:@"Value: %@, Number: %@", _textField.text, textFieldNum]
                                                   delegate:nil
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil];
    [alert show];
}

- (BOOL)textField:(UITextField*)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)string
{
    NSInteger MAX_DIGITS = 15; // $999,999,999.99
    
    if (textField.text.length <= MAX_DIGITS) {
        return YES;
    }
    
    return NO;
}

@end