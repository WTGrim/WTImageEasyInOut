//
//  ViewController.m
//  WTImageEasyInOut
//
//  Created by Dwt on 2017/2/15.
//  Copyright © 2017年 Dwt. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+EasyInOut.h"


@interface ImageViewCell : UITableViewCell

@property(nonatomic, strong)UIImageView *picImageView;
- (void)setCellWithUrl:(NSString *)url;

@end

@implementation ImageViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _picImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:_picImageView];
    }
    return self;
}

- (void)setCellWithUrl:(NSString *)url{
    
    [self.picImageView wt_setImageWithURL:url placeholderImage:nil completed:nil];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.picImageView.frame = self.bounds;
}
@end

@interface ViewController ()<UITableViewDataSource>

@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSArray *dataArray;

@end
static NSString *const cellId = @"cellId";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initView];
}

- (void)initView{
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView registerClass:[ImageViewCell class] forCellReuseIdentifier:cellId];
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 100;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:self.tableView];
    
    self.dataArray = @[@"http://img.mp.itc.cn/upload/20160829/ca3995a158664f5ab368523a0731afe6_th.jpg",
                       @"http://img.mp.itc.cn/upload/20160829/2fffd742017247738c4eef644b0a83d8_th.jpg",
                       @"http://img.mp.itc.cn/upload/20160829/5c560f0b2a22446bb834de119d83a904_th.jpg",
                       @"http://img.mp.itc.cn/upload/20160829/86421eef973046a3a466ae9601bbe652_th.jpg",
                       @"http://img.mp.itc.cn/upload/20160829/41f32140caf24300a07e58488e5eb9d9_th.jpg",
                       @"http://img.mp.itc.cn/upload/20160829/38a0649b715f4cdb899d6cd2398ae5f9_th.jpg",
                       @"http://img.mp.itc.cn/upload/20160829/45ab823255bf4afbad394d7de2a169ec_th.jpg",
                       @"http://img.mp.itc.cn/upload/20160829/944d38c2085445d480a38cfb448e5b8a_th.jpg",
                       @"http://img.mp.itc.cn/upload/20160829/eaf52b69fa7a4981afa8eb8e96c9b943_th.jpg",
                       @"http://img.mp.itc.cn/upload/20160829/6728f2f5cc384861bd3a2034eb9cfb88_th.jpg"
                       ];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ImageViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    [cell setCellWithUrl:self.dataArray[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

