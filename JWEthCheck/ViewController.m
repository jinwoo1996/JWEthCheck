//
//  ViewController.m
//  JWEthCheck
//
//  Created by 진우 이 on 2017. 3. 16..
//  Copyright © 2017년 진우 이. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/AFHTTPSessionManager.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    self.statusItem.title = @"10,000";
    self.statusItem.highlightMode = YES;

    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(refresh:) userInfo:nil repeats:YES];
    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void)refresh:(id)sender {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSURL *baseURL = [NSURL URLWithString:@"https://api.coinone.co.kr/ticker/"];
    [manager GET:[baseURL absoluteString] parameters: @{ @"currency": @"ETH" } progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.statusItem.title = [NSString stringWithFormat: @"%@", responseObject[@"last"]];
        NSLog(@"%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}


@end
