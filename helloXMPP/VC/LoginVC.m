//
//  LoginVC.m
//  helloXMPP
//
//  Created by mac on 2017/10/27.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "LoginVC.h"
#import "RegisterVC.h"
#import "RosterViewController.h"

#import "XMPPTools.h"

@interface LoginVC ()<XMPPStreamDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[XMPPTools defaultManager].xmppStream addDelegate:self delegateQueue:dispatch_get_main_queue()];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginBtnTapped:(id)sender {
    if (self.nameTF.text.length==0 || self.pwdTF.text.length==0) {
        NSLog(@"用户名和密码不能为空");
    }
    [[XMPPTools defaultManager]loginwithName:self.nameTF.text andPassword:self.pwdTF.text];
}

- (IBAction)registerBtnTapped:(id)sender {
    RegisterVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"RegisterVC"];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark 验证成功的方法
-(void)xmppStreamDidAuthenticate:(XMPPStream *)sender{
    
    NSLog(@"登录成功------%@",sender);
    RosterViewController *rvc = [[RosterViewController alloc]init];
    [self.navigationController pushViewController:rvc animated:YES];
    
}

- (void)xmppStream:(XMPPStream *)sender didNotAuthenticate:(NSXMLElement *)error{
    NSLog(@"登录失败------%@",error);
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
