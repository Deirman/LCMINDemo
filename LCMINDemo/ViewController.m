//
//  ViewController.m
//  LCMINDemo
//
//  Created by Deirman on 2018/5/23.
//  Copyright © 2018年 Deirman. All rights reserved.
//

#import "ViewController.h"
#import "MINTableViewCell.h"
#import "LCDataManger.h"
#import "MINView.h"
#import <NIMSDK/NIMSDK.h>
#import <NIMAVChat/NIMAVChat.h>
#import "LCDataManger.h"
#import "MINData.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,NIMLoginManagerDelegate,NIMChatManagerDelegate>

@property(nonatomic,strong)NSArray * dataArray;
@property(nonatomic,strong)UITableView * myTableView;
@property(nonatomic,strong)UILabel * allLable;
@property(nonatomic,strong)MINView * minView;
@property(nonatomic,strong)NSDictionary * userDic;
@property(nonatomic,strong)NSArray  *userNameArray;
@property(nonatomic,strong)NSString *fileName;
@property(nonatomic,strong)UIView   *contentView;
@property(nonatomic,strong)UILabel  *userNameLable;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initData];
    [self initailViews];

//    [self updateCacheData];
}

-(void)initData{
    self.userNameArray= @[@"test_1",@"test_2",@"test_3",@"test_4",@"test_5",@"test_6",@"test_7",@"test_8",@"test_9",@"test_10",@"test_11",@"test_12",@"test_13",@"test_14",@"test_15",@"test_16",@"test_17",@"test_18",@"test_19",@"test_20"];

       self.userDic =@{@"test_1":@"3404a82139c160db85362646af9a826f",
                       @"test_2":@"845e9d4c17fd4aae4f7de466f67bce6f",
                       @"test_3":@"050f6dfd2077cd86f3bc688dff451a34",
                       @"test_4":@"0f41ccf82f6a27fec87ae1ca44afb5c9",
                       @"test_5":@"e2f60b1f06c1e8aa13e302fa3e9cc2d6",
                       @"test_6":@"a724e832f7710ce214ffeeefda432186",
                       @"test_7":@"fb4892650d312f4d278f1968397771af",
                       @"test_8":@"2b0ec62915fe4ebfe9cff34ead428fa3",
                       @"test_9":@"c4806e797b47823615ad9bb3cff6ab6a",
                       @"test_10":@"13054f4d910388cb033613b8179a2f98",
                       @"test_11":@"2727e7acdbf528e24f9dea3caff7818e",
                       @"test_12":@"a1ebc6b63395fd2e7b18c62c20231015",
                       @"test_13":@"815c7b3a0fc7e8b63f663e6f16850929",
                       @"test_14":@"2f900c0f1b21bd63e3647cc77b41056b",
                       @"test_15":@"cb88c29b0ca9ef6863dafbd8ae9ea578",
                       @"test_16":@"02632a97be9816242c097884473a83f6",
                       @"test_17":@"41b73555315e82c0d1e718abd55a3cbe",
                       @"test_18":@"8df634993ba4cd03effc4d876a4bc67b",
                       @"test_19":@"ed206fc87b595bb6a73fa8c4b8884964",
                       @"test_20":@"b41720a55e445c60e3385754ac42d55d",
                       };

}


#pragma mark 创建视图
- (void)initailViews{
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.view addSubview:self.myTableView];
}

-(void)initContentView{

        self.contentView = [[UIView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:self.contentView];

        [self.contentView addSubview:self.userNameLable];

        [self.userNameLable mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(self.contentView).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(0);
            make.height.offset(64);

        }];

        [self.contentView addSubview:self.minView];
        [self.minView mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(self.userNameLable.mas_bottom).offset(20);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.right.equalTo(self.contentView.mas_right).offset(-20);
            make.height.offset(150);
        }];
    
    
        self.allLable= [[UILabel alloc] init];
    
        self.allLable.textAlignment = NSTextAlignmentCenter;
        self.allLable.font = [UIFont systemFontOfSize:15];
        self.allLable.textColor = [UIColor blackColor];
    
        [self.contentView addSubview:self.allLable];
    
        [self.allLable mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(self.minView.mas_bottom);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.right.equalTo(self.contentView.mas_right).offset(-20);
            make.height.offset(50);
        }];
    
        UIButton * deleteFileButton = [[UIButton alloc] init];
        [deleteFileButton setTitle:@"清空缓存数据" forState:UIControlStateNormal];
        [deleteFileButton setBackgroundColor:[UIColor redColor]];
        [deleteFileButton addTarget:self action:@selector(clickDeleteFileButton) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:deleteFileButton];
    
        [deleteFileButton mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(self.allLable.mas_bottom).offset(50);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.right.equalTo(self.contentView.mas_right).offset(-20);
            make.height.offset(50);
    
        }];

    UIButton * logOutButton = [[UIButton alloc] init];
    [logOutButton setTitle:@"退出登录" forState:UIControlStateNormal];
    [logOutButton setBackgroundColor:[UIColor greenColor]];
    [logOutButton addTarget:self action:@selector(clickLogOutButton) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:logOutButton];

    [logOutButton mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(deleteFileButton.mas_bottom).offset(50);
        make.left.equalTo(self.contentView.mas_left).offset(20);
        make.right.equalTo(self.contentView.mas_right).offset(-20);
        make.height.offset(50);
    }];

    MINData * minData = [[MINData alloc] init];
    [self.minView setMINViewForMINData:minData];
    [self.allLable setText:[NSString stringWithFormat:@"总共收到 0 条"]];
}

-(UILabel *)userNameLable{
    if (_userNameLable == nil) {
        _userNameLable = [[UILabel alloc] init];
        _userNameLable.textAlignment = NSTextAlignmentCenter;
        _userNameLable.font = [UIFont systemFontOfSize:15];
        _userNameLable.textColor = [UIColor blackColor];
        _userNameLable.backgroundColor =[UIColor grayColor];

    }

    return _userNameLable;

}

-(MINView *)minView{
    if (_minView == nil) {
        _minView = [[MINView alloc] init];
    }
    return _minView;
}


//网约车
- (void)updateData:(MINData *)minData {
    [self.minView setMINViewForMINData:minData];

    NSString *log = [LCDataManger getOperationLogFileForFileName:self.fileName];
    NSArray *array = [log componentsSeparatedByString:@"\n"];
    [self.allLable setText:[NSString stringWithFormat:@"总共收到 %ld 条",[array count]-1]];

}

-(void)updateCacheData{

    NSString *log = [LCDataManger getOperationLogFileForFileName:self.fileName];
    if (log != nil && ![log isEqualToString:@""]) {
        NSArray *array = [log componentsSeparatedByString:@"\n"];
        NSArray * lastDataArray = [[array objectAtIndex:[array count]-2] componentsSeparatedByString:@","];
        MINData * minData = [[MINData alloc] init];
        minData.minID = [lastDataArray objectAtIndex:0];
        minData.sendtime= [lastDataArray objectAtIndex:1];
        minData.timestamp =[lastDataArray objectAtIndex:2];
        minData.acceptTime = [lastDataArray objectAtIndex:3];
        minData.comment = [lastDataArray objectAtIndex:4];
        [self.minView setMINViewForMINData:minData];
        [self.allLable setText:[NSString stringWithFormat:@"总共收到 %ld 条",[array count]-1]];
    }else{
        MINData * minData = [[MINData alloc] init];
        [self.minView setMINViewForMINData:minData];
        [self.allLable setText:[NSString stringWithFormat:@"总共收到 0 条"]];
    }


}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.userNameArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MINTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(!cell){
        cell = [[MINTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSString *userName =[self.userNameArray objectAtIndex:indexPath.row];
    NSString *passworde = [_userDic objectForKey:userName];
    cell.userNameLable.text =userName;
    cell.passwordLable.text = passworde;
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    NSString *userName =[self.userNameArray objectAtIndex:indexPath.row];
    NSString *passworde = [_userDic objectForKey:userName];
    self.fileName = [NSString stringWithFormat:@"%@_%@",userName,[self currentTimeStr]];
    NSLog(@"%@,%@",userName,passworde);
    [self.userNameLable setText:self.fileName];
    [self loginMINForUsserName:userName  withPassworde:passworde];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)dealloc {

    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"updateData" object:nil];
}

- (void)clickDeleteFileButton{
    [LCDataManger deleteFileForFileName:self.fileName];
    [self updateCacheData];
}

-(void)clickLogOutButton{

    [[[NIMSDK sharedSDK] loginManager] logout:^(NSError *error) {
        //jump to login page
        [self.contentView removeFromSuperview];
        [self initailViews];
        self.fileName = nil;
        MINData * minData = [[MINData alloc] init];
        [self.minView setMINViewForMINData:minData];
        [self.allLable setText:[NSString stringWithFormat:@"总共收到 0 条"]];
    }];

}

-(void)loginMINForUsserName:(NSString*)userName withPassworde:(NSString*)passworde{
    [[NIMSDK sharedSDK].chatManager addDelegate:self];
    //推荐在程序启动的时候初始化 NIMSDK
    NSString *appKey        = @"2e5258c972677f9a95731118e3835647";
    NIMSDKOption *option    = [NIMSDKOption optionWithAppKey:appKey];
    option.apnsCername      = nil;
    option.pkCername        = nil;
    [[NIMSDK sharedSDK] registerWithOption:option];


    NSString *account = userName;
    NSString *token   = passworde;
    [[NIMSDK sharedSDK].loginManager addDelegate:self];
    [[[NIMSDK sharedSDK] loginManager] login:account
                                       token:token
                                  completion:^(NSError *error) {

                                      if (error == nil) {
                                          [self.myTableView removeFromSuperview];
                                          [self initContentView];
                                      }

                                      NSLog(@"错误%@",error);

                                  }];
}


- (void)onLogin:(NIMLoginStep)step{

    NSLog(@"登录成功");
}

- (void)onRecvMessages:(NSArray<NIMMessage *> *)messages{

    NSString * filePath = [LCDataManger dataFilepath];
    NSMutableArray * dataArray = [LCDataManger readListFromFile:filePath];
    if ([dataArray count] == 0) {
        dataArray = [[NSMutableArray alloc] init];
    }
    for (int i = 0 ; i< messages.count; i++) {
        NIMMessage *message = messages[i];
        MINData * minData = [MINData alloc];
        minData.sendtime = message.text;
        minData.timestamp = [NSString stringWithFormat:@"%f",message.timestamp];
        minData.comment = message.text;
        minData.acceptTime = [self currentTimeStr];
        minData.minID = message.messageId;

        [LCDataManger WriteLogToFile:[NSString stringWithFormat:@"%@,%@,%@,%@,%@", minData.minID, minData.sendtime,minData.timestamp,minData.acceptTime,minData.comment] withFileName:self.fileName];
        [self updateData:minData];

        //        [dataArray addObject:minData];
    }

    //    [LCDataManger writeList:dataArray To:filePath];

}

// 时间戳转时间,时间戳为13位是精确到毫秒的，10位精确到秒
- (NSString *)getDateStringWithTimeStr:(NSTimeInterval)time{
    NSDate *detailDate=[NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; //实例化一个NSDateFormatter对象
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *currentDateStr = [dateFormatter stringFromDate: detailDate];
    return currentDateStr;
}

-(NSString*)getCurrentTimes{

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];

    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制

    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];

    //现在时间,你可以输出来看下是什么格式

    NSDate *datenow = [NSDate date];

    //----------将nsdate按formatter格式转成nsstring

    NSString *currentTimeString = [formatter stringFromDate:datenow];

    NSLog(@"currentTimeString =  %@",currentTimeString);

    return currentTimeString;

}

//获取当前时间戳
- (NSString *)currentTimeStr{
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
    NSTimeInterval time=[date timeIntervalSince1970]*1000;// *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    return timeString;
}

-(NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }

    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

@end
