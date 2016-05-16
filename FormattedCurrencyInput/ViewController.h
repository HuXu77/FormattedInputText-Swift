//
//  ViewController.h
//  FormattedCurrencyInput
//
//  Created by Peter Boni on 4/07/13.
//  Copyright (c) 2013 Peter Boni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FormattedCurrencyInput-Swift.h"

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet CurrencyTextField *textField;
- (IBAction)valueButton:(id)sender;

@end
