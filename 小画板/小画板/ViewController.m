//
//  ViewController.m
//  小画板
//
//  Created by xmy on 16/8/25.
//  Copyright © 2016年 xmy. All rights reserved.
//

#import "ViewController.h"
#import "XMYDrawBoardView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet XMYDrawBoardView *demoView;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation ViewController
- (IBAction)clear:(id)sender {
    
    [self.demoView clear];
    
}
- (IBAction)back:(id)sender {
    
    [self.demoView back];
}

- (IBAction)save:(UIButton *)sender {
    
    //图片 获取上下文
    UIGraphicsBeginImageContextWithOptions(self.demoView.bounds.size, NO, 0);
    
    
    //将这个view画到上下文中,并且渲染
    [self.demoView drawViewHierarchyInRect:self.demoView.bounds afterScreenUpdates:YES];
    
    //获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //保存到相册
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:FinishWriteWithError:contextInfo:), nil);
    
    
}
- (void)image:(UIImage *)image FinishWriteWithError:(NSError *)error contextInfo:(void *)contextinfo;
{
    NSLog(@"保存成功!");
}

- (IBAction)lineColor:(UIButton *)sender {
    
    self.demoView.lineColor = sender.backgroundColor;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //监听slider
    [self.slider addTarget:self action:@selector(lineSetWidth:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)lineSetWidth:(UISlider *)sender{
    
    NSLog(@"%f", sender.value);
    
    self.demoView.lineWidth1 = sender.value;
    
}

@end
