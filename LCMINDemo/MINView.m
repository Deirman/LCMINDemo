//
//  MINView.m
//  LCMINDemo
//
//  Created by Deirman on 2018/5/24.
//  Copyright © 2018年 Deirman. All rights reserved.
//

#import "MINView.h"

@interface MINView()

@property(nonatomic,strong)UILabel * idLable;
@property(nonatomic,strong)UILabel * acceptTimeLable;
@property(nonatomic,strong)UILabel * timestampLable;
@property(nonatomic,strong)UILabel * sendTimeLable;
@property(nonatomic,strong)UILabel * contentLable;


@end

@implementation MINView

-(instancetype)init{
    if (self = [super init]) {


        self.layer.cornerRadius = 10;
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.layer.borderWidth = 0.5;
        
        [self addSubview:self.idLable];
        [self.idLable mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.right.equalTo(self);
            make.top.equalTo(self.mas_top);
            make.height.offset(30);
        }];


        [self addSubview:self.sendTimeLable];
        [self.sendTimeLable mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.right.equalTo(self);
            make.top.equalTo(self.idLable.mas_bottom);
            make.height.offset(30);
        }];

        [self addSubview:self.timestampLable];
        [self.timestampLable mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.right.equalTo(self);
            make.top.equalTo(self.sendTimeLable.mas_bottom);
            make.height.offset(30);
        }];

        [self addSubview:self.acceptTimeLable];
        [self.acceptTimeLable mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.right.equalTo(self);
            make.top.equalTo(self.timestampLable.mas_bottom);
            make.height.offset(30);
        }];



        [self addSubview:self.contentLable];
        [self.contentLable mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.right.equalTo(self);
            make.top.equalTo(self.acceptTimeLable.mas_bottom);
            make.height.offset(30);
        }];
    }
    return self;
}

-(UILabel *)idLable{

    if (_idLable == nil) {

        _idLable = [[UILabel alloc] init];
        _idLable.textAlignment = NSTextAlignmentLeft;
        _idLable.font = [UIFont systemFontOfSize:15];
        _idLable.textColor = [UIColor blackColor];

    }
    return _idLable;

}
-(UILabel *)sendTimeLable{

    if (_sendTimeLable == nil) {

        _sendTimeLable = [[UILabel alloc] init];
        _sendTimeLable.textAlignment = NSTextAlignmentLeft;
        _sendTimeLable.font = [UIFont systemFontOfSize:15];
        _sendTimeLable.textColor = [UIColor blackColor];

    }
    return _sendTimeLable;

}

-(UILabel *)timestampLable{
    if (_timestampLable == nil) {
        _timestampLable = [[UILabel alloc] init];
        _timestampLable.textAlignment = NSTextAlignmentLeft;
        _timestampLable.font = [UIFont systemFontOfSize:15];
        _timestampLable.textColor = [UIColor blackColor];
    }

    return _timestampLable;

}
-(UILabel *)acceptTimeLable{

    if (_acceptTimeLable == nil) {

        _acceptTimeLable = [[UILabel alloc] init];
        _acceptTimeLable.textAlignment = NSTextAlignmentLeft;
        _acceptTimeLable.font = [UIFont systemFontOfSize:15];
        _acceptTimeLable.textColor = [UIColor blackColor];

    }
    return _acceptTimeLable;

}
-(UILabel *)contentLable{
    if (_contentLable == nil) {

        _contentLable = [[UILabel alloc] init];
        _contentLable.textAlignment = NSTextAlignmentLeft;
        _contentLable.font = [UIFont systemFontOfSize:15];
        _contentLable.textColor = [UIColor blackColor];

    }
    return _contentLable;

}

-(void)setMINViewForMINData:(MINData *)minData{
    self.idLable.text =  [NSString stringWithFormat:@"ID：%@",minData.minID] ;
    self.sendTimeLable.text = [NSString stringWithFormat:@"服务器发送时间：%@",minData.sendtime];
    self.timestampLable.text = [NSString stringWithFormat:@"网易云发送时间：%@",minData.timestamp];
    self.acceptTimeLable.text =  [NSString stringWithFormat:@"客户端接收时间：%@",minData.acceptTime];
    self.contentLable.text = [NSString stringWithFormat:@"内容：%@",minData.comment] ;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
