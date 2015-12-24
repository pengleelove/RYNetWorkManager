//
//  ViewController.m
//  RYReachability
//
//  Created by Dinotech on 15/12/23.
//  Copyright © 2015年 Dinotech. All rights reserved.
//

#import "ViewController.h"
#import "RYPreferanceManager.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *currentNetWorkStatus;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 
   NetWorkSatusType type =  [[RYPreferanceManager sharePreferanceManager]currentNetStatusType];
    switch (type) {
        case NetWorkSatusType_None:
        {
            self.currentNetWorkStatus.text = @"无网络连接";
            NSLog(@"没有网络");
        }
            break;
        case NetWorkSatusType_WiFi:{
            self.currentNetWorkStatus.text = @"当前连接是WiFi";
            NSLog(@" current net is wifi");
        }
            break;
        case NetWorkSatusType_2G:{
            self.currentNetWorkStatus.text = @"当前使用的是2G网络";
            NSLog(@" current net is 2g");

        }
            break;
        case NetWorkSatusType_3G:{
            self.currentNetWorkStatus.text = @"当前使用的是3g网络";
            NSLog(@" current net is 3g");

        }
            break;
        case NetWorkSatusType_4G:{
            self.currentNetWorkStatus.text = @"当前使用的是4G网络";
            NSLog(@" current net is 4g");

        }
            break;
        case NetWorkSatusType_5G:{
            NSLog(@" current net is 5g  暂时还未找到支持5G的API");

        }
            break;
            
            
        default:
            break;
    }
    [[RYPreferanceManager sharePreferanceManager]getReachablityStatusWithChangeBlock:^(NetWorkSatusType status) {
        if (status==NetWorkSatusType_WiFi) {
            self.changeLable.text =[NSString stringWithFormat:@"当前是wifi %@",@(status)];
        }else{
            self.changeLable.text =[NSString stringWithFormat:@"当前无网络 %@",@(status)];
        }
        
        
        NSLog(@"current net status = %@",@(status));
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
