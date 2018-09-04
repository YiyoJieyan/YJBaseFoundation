//
//  labelViewController.m
//  yjProject
//
//  Created by 邓钦武 on 2018/8/31.
//  Copyright © 2018年 YJProject. All rights reserved.
//

#import "labelViewController.h"

@interface labelViewController ()

@property (strong, nonatomic) IBOutlet UILabel *one;
@property (strong, nonatomic) IBOutlet UILabel *two;

@end

@implementation labelViewController

#define UILABEL_LINE_SPACE 5

#define HEIGHT [ [ UIScreen mainScreen ] bounds ].size.height
#define WIDTH [ [ UIScreen mainScreen ] bounds ].size.width

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.one setText:@"大家在DIY选择机箱的过程中是不是有过选择困难的情况出现,不是这个缺一点就是那个多一点,没一个能符合自己的心意,怎么办?买不到?那就自己造!从零开始设计一款机箱非常需要勇气和技术,当然票子是不能少的.前不久,评测室收到一台由CHH会员自行打造的机箱——aboStudio Bunker,关注机王大赛的大家应该对这台机箱有印象,那么今天CHH评测室就带大家来了解量产版Bunker的评测."];
    
    [self.two setText:@"大家在DIY选择机箱的过程中是不是有过选择困难的情况出现,不是这个缺一点就是那个多一点,没一个能符合自己的心意,怎么办?买不到?那就自己造!从零开始设计一款机箱非常需要勇气和技术,当然票子是不能少的.前不久,评测室收到一台由CHH会员自行打造的机箱——aboStudio Bunker,关注机王大赛的大家应该对这台机箱有印象,那么今天CHH评测室就带大家来了解量产版Bunker的评测."];
    
    [self setLabelSpace:self.two withValue:@"大家在DIY选择机箱的过程中是不是有过选择困难的情况出现,不是这个缺一点就是那个多一点,没一个能符合自己的心意,怎么办?买不到?那就自己造!从零开始设计一款机箱非常需要勇气和技术,当然票子是不能少的.前不久,评测室收到一台由CHH会员自行打造的机箱——aboStudio Bunker,关注机王大赛的大家应该对这台机箱有印象,那么今天CHH评测室就带大家来了解量产版Bunker的评测." withFont:[UIFont systemFontOfSize:14]];
    
    NSLog(@"label高度 = %f ",[self getSpaceLabelHeight:@"大家在DIY选择机箱的过程中是不是有过选择困难的情况出现,不是这个缺一点就是那个多一点,没一个能符合自己的心意,怎么办?买不到?那就自己造!从零开始设计一款机箱非常需要勇气和技术,当然票子是不能少的.前不久,评测室收到一台由CHH会员自行打造的机箱——aboStudio Bunker,关注机王大赛的大家应该对这台机箱有印象,那么今天CHH评测室就带大家来了解量产版Bunker的评测." withFont:[UIFont systemFontOfSize:14] withWidth:WIDTH - 60]);
    
}



//给UILabel设置行间距和字间距

-(void)setLabelSpace:(UILabel*)label withValue:(NSString*)str withFont:(UIFont*)font {
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    
    paraStyle.alignment = NSTextAlignmentLeft;
    
    paraStyle.lineSpacing = UILABEL_LINE_SPACE; //设置行间距
    
    paraStyle.hyphenationFactor = 0.0;
    
    paraStyle.firstLineHeadIndent = 0.0;//首行缩进
    
    paraStyle.paragraphSpacingBefore = 0.0;
    
    paraStyle.headIndent = 0;
    
    paraStyle.tailIndent = 0;
    
    //设置字间距 NSKernAttributeName:@1.5f
    
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };
    
    
    
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:str attributes:dic];
    
    label.attributedText = attributeStr;
    
}

//计算UILabel的高度(带有行间距的情况)

-(CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width {
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    
    paraStyle.alignment = NSTextAlignmentLeft;
    
    paraStyle.lineSpacing = UILABEL_LINE_SPACE;
    
    paraStyle.hyphenationFactor = 1.0;
    
    paraStyle.firstLineHeadIndent = 0.0;
    
    paraStyle.paragraphSpacingBefore = 0.0;
    
    paraStyle.headIndent = 0;
    
    paraStyle.tailIndent = 0;
    
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };
    
    CGSize size = [str boundingRectWithSize:CGSizeMake(width, HEIGHT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    return size.height;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
