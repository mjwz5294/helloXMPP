//
//  RegisterVC.m
//  helloXMPP
//
//  Created by mac on 2017/10/27.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "RegisterVC.h"
#import "XMPPTools.h"

@interface RegisterVC ()<XMPPStreamDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;

@end

@implementation RegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[XMPPTools defaultManager].xmppStream addDelegate:self delegateQueue:dispatch_get_main_queue()];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)registerBtnTapped:(id)sender {
    [[XMPPTools defaultManager] registerWithName:self.nameTF.text andPassword:self.pwdTF.text];
}

- (IBAction)cancelBtnTapped:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 注册成功执行的方法
-(void)xmppStreamDidRegister:(XMPPStream *)sender
{
    NSLog(@"注册成功------%@",sender);
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)xmppStream:(XMPPStream *)sender didNotRegister:(NSXMLElement *)error{
    NSLog(@"注册失败------%@",error);
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
