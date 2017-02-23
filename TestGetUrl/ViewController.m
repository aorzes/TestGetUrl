//
//  ViewController.m
//  TestGetUrl
//
//  Created by Anton Orzes on 23/02/2017.
//  Copyright © 2017 Anton Orzes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *mainText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)dajData:(id)sender {
    NSString     *urlString = @"https://api.github.com/users/aorzes";
    NSURL        *url       = [NSURL URLWithString:urlString];
    NSURLRequest *request   = [NSURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      // get data from php
                                      NSError *parseError = nil;
                                      NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&parseError];
                                      if (parseError) {
                                          NSLog(@"JSONObjectWithData error: %@", parseError);
                                          return;
                                      }else{
                                          NSLog(@"%@", results);
                                          _mainText.text = [NSString stringWithFormat:@"%@", results];
                                      }
                                  }];
    
    [task resume];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
