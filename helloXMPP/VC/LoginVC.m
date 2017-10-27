//
//  LoginVC.m
//  helloXMPP
//
//  Created by mac on 2017/10/27.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "LoginVC.h"
#import "RegisterVC.h"

@interface LoginVC ()
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginBtnTapped:(id)sender {
}

- (IBAction)registerBtnTapped:(id)sender {
    RegisterVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"RegisterVC"];
    [self.navigationController pushViewController:vc animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
