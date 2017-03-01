//
//  ViewController.m
//  WTImageEasyInOut
//
//  Created by Dwt on 2017/2/15.
//  Copyright © 2017年 Dwt. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+EasyInOut.h"
#import "ImageProgressView.h"

#define W 30
@interface ImageViewCell : UITableViewCell

@property(nonatomic, strong)UIImageView *picImageView;
@property(nonatomic, strong)ImageProgressView *progressView ;
- (void)setCellWithUrl:(NSString *)url;

@end

@implementation ImageViewCell

- (ImageProgressView *)progressView{
    if (!_progressView) {
        _progressView = [[ImageProgressView alloc]initWithFrame:CGRectMake((self.bounds.size.width - W) * 0.5, (self.bounds.size.height- W) * 0.5, W, W)];
    }
    return _progressView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _picImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:_picImageView];
        [self.contentView addSubview:self.progressView];

    }
    return self;
}

- (void)setCellWithUrl:(NSString *)url{
    
    [self.progressView show];
    __weak typeof(self)weakSelf = self;
    [self.picImageView wt_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"moren.jpeg"] completed:^(UIImage *image) {
        [weakSelf.progressView hide];
    }];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.picImageView.frame = self.bounds;
    self.progressView.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
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
    self.tableView.rowHeight = 230;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:self.tableView];
    
    self.dataArray = @[
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488360008080&di=d91f2df1f957c94b20ad5aec615f4e97&imgtype=0&src=http%3A%2F%2Fpic23.nipic.com%2F20120815%2F1065982_153222584170_2.jpg",
                       @"http://img.mp.itc.cn/upload/20160829/ca3995a158664f5ab368523a0731afe6_th.jpg",
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

