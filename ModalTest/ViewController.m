//
//  ViewController.m
//  ModalTest
//
//  Created by SDT-1 on 2014. 1. 10..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(nameChanged:) name:@"UsernameChanged" object:nil];
}

- (void)nameChanged:(NSNotification *)notification {
    NSDictionary *info = notification.userInfo;
    NSString *str = info[@"username"];
    NSLog(@"%@", str);
    self.label.text = str;
    
//    [self.label setText:info[@"username"]];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //만약 로그인 한 적이 없으면 자동으로 로그인 화면을 모달로 띄운다.
    BOOL isLoggiedIn = YES;
    
    if (!isLoggiedIn) {
        [self performSegueWithIdentifier:@"ModalSegue" sender:self];
    }
}



- (IBAction)showSignUp:(id)sender {
    //세규 말고 코드로 스토리보드 부르기
    UIStoryboard *storyboard = self.storyboard;
    UIViewController *signUpViewController = [storyboard instantiateViewControllerWithIdentifier:@"SignUp"];
    
    [self presentViewController:signUpViewController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
