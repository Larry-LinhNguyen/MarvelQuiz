//
//  ViewController.m
//  MarvelQuiz
//
//  Created by Andrea Miotto on 15/11/16.
//  Copyright © 2016 Andrea Miotto. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)quizCalling:(id)sender {
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Quiz is coming"
                                                                   message:@"We are working to implement this feature, stay connect..."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
