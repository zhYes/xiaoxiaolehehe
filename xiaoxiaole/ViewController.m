//
//  ViewController.m
//  xiaoxiaole
//
//  Created by FDC-iOS on 16/8/16.
//  Copyright © 2016年 meilun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong)UIButton * firstBtn;
@property(nonatomic,strong)UIView * blackView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView * v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 150)];
    
    v.backgroundColor = [UIColor blackColor];
    
    self.blackView = v;
    
    [self.view addSubview:self.blackView];
    
    [self reStart];
    
    NSMutableArray * nmArray = [NSMutableArray array];
    
    for (int i = 0; i < 18; i ++) {
        int random = arc4random()%7 + 1;
        NSString * randomStr = [NSString stringWithFormat:@"%zd",random];
        [nmArray addObject:randomStr];
        [nmArray addObject:randomStr];
        
    }
    
    
    for (int i = 0; i < 6; i ++) {
        
        for (int j = 0;j < 6; j ++) {
            
            UIButton * btn = [UIButton new];
            
            [UIView beginAnimations:nil context:nil];
            
            [UIView setAnimationDuration:2];
            
            
            int arrRandom = arc4random() % nmArray.count;
            
            NSString * str = [nmArray objectAtIndex:arrRandom];
            //            NSString * str = [NSString stringWithFormat:@"%@",str1];
            //                        NSLog(@"%@",[str class]);
            //            NSLog(@"%@",str);
            UIImage * image = [UIImage imageNamed:str];
            [btn setImage:image forState:UIControlStateNormal];
            [nmArray removeObjectAtIndex:arrRandom];
            
            [btn addTarget:self action:@selector(startGame:) forControlEvents:UIControlEventTouchUpInside];
            
            btn.frame = CGRectMake(10+j * 50, 80 +i * 50, 50, 50);
            
            [UIView commitAnimations];
            
            
            [self.blackView addSubview:btn];
            
            btn.tag = [str integerValue];
        }
        
    }

    

}

-(void)reStart{
    
    
    
    UIButton * btn = [UIButton new];
    [btn setTitle:@"重新开始" forState:UIControlStateNormal];
//    [btn setTintColor:[UIColor redColor]];
    btn.titleLabel.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(145, [UIScreen mainScreen].bounds.size.height - 100, 100, 40);
    btn.backgroundColor = [UIColor yellowColor];
    [btn addTarget:self action:@selector(reStartGame) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)reStartGame{
    
//    self.blackView.subviews = ;
    for (id btn in self.blackView.subviews) {
        [btn removeFromSuperview];
    }
    
    NSMutableArray * nmArray = [NSMutableArray array];
    
    for (int i = 0; i < 18; i ++) {
        int random = arc4random()%7 + 1;
        NSString * randomStr = [NSString stringWithFormat:@"%zd",random];
        [nmArray addObject:randomStr];
        [nmArray addObject:randomStr];
        
    }
    
    
    for (int i = 0; i < 6; i ++) {
        
        for (int j = 0;j < 6; j ++) {
            
            UIButton * btn = [UIButton new];
            
            [UIView beginAnimations:nil context:nil];
            
            [UIView setAnimationDuration:2];
            
            
            int arrRandom = arc4random() % nmArray.count;
            
            NSString * str = [nmArray objectAtIndex:arrRandom];
            //            NSString * str = [NSString stringWithFormat:@"%@",str1];
            //                        NSLog(@"%@",[str class]);
            //            NSLog(@"%@",str);
            UIImage * image = [UIImage imageNamed:str];
            [btn setImage:image forState:UIControlStateNormal];
            [nmArray removeObjectAtIndex:arrRandom];
            
            [btn addTarget:self action:@selector(startGame:) forControlEvents:UIControlEventTouchUpInside];
            
            btn.frame = CGRectMake(10+j * 50, 80 +i * 50, 50, 50);
            
            [UIView commitAnimations];
            
            
            [self.blackView addSubview:btn];
            
            btn.tag = [str integerValue];
        }
        
    }

}


-(void)startGame:(UIButton*)btn{
//    UIButton * firstBtn = nil;
    if (_firstBtn == nil) {
        _firstBtn = btn;
        _firstBtn.enabled = NO;
    }else{
        if (_firstBtn.tag == btn.tag) {
//            _firstBtn.alpha = 0;
            [_firstBtn removeFromSuperview];
//            btn.alpha = 0;
            [btn removeFromSuperview];
            _firstBtn = nil;
            
            NSLog(@"%lu",(unsigned long)self.blackView.subviews.count);
            
            if ((unsigned long)self.blackView.subviews.count == 0) {
//                UIAlertAction * action = [[UIAlertAction alloc] init];
//                [UIAlertAction actionWithTitle:@"恭喜闯关成功!欢迎挑战更高难度" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//                    
//                }];
                
//                [UIAlert]
            UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"闯关成功" message:@"我要继续" preferredStyle:UIAlertControllerStyleActionSheet];
                
                [alert addAction:[UIAlertAction actionWithTitle:@"进入下一关" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                    [self reStartGame];
                    
                }]];
                [alert addAction:[UIAlertAction actionWithTitle:@"结束游戏" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    [self reStartGame];
                }]];
                
//                  [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
                [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:^{
//                    [self reStartGame];
                    NSLog(@"切换弹框控制器");
                }];
            }
            
            
            
        }else {
            _firstBtn.enabled = YES;
            _firstBtn = nil;
        }
    }
}



@end








