//
//  ViewController_Extention.m
//  JsonParsetest
//
//  Created by Paradox Space Rumy M1 on 16/4/22.
//

#import "ViewController_Extention.h"

@implementation UIViewController (ViewController_Extention)
- (void)showAlert:(NSString *)title with:(NSString *)message{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             { }];
    
    [alert addAction:ok];
                                
    [self presentViewController:alert animated:YES completion:nil];
}

@end
