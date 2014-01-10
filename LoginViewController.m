//
//  LoginViewController.m
//  ModalTest
//
//  Created by SDT-1 on 2014. 1. 10..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userName;
@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)dismissStoryboard:(id)sender {
    //id 값 저장하기..
//    NSString * name = self.userName.text;
//    NSLog(@"%@", name);
    //id 값을 ViewController로 넘기기..
    [[NSNotificationCenter defaultCenter] postNotificationName:@"UsernameChanged" object:nil userInfo:@{@"username" : self.userName.text}];
    //뷰 컨트롤러 내리기.
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
