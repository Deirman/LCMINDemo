//
//  MINTableViewCell.m
//  LCMINDemo
//
//  Created by Deirman on 2018/5/23.
//  Copyright © 2018年 Deirman. All rights reserved.
//

#import "MINTableViewCell.h"

@interface MINTableViewCell()




@end

@implementation MINTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){

        [self addSubview:self.userNameLable];
        [self.userNameLable mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.right.equalTo(self);
            make.top.equalTo(self.mas_top);
            make.height.offset(30);
        }];



        [self addSubview:self.passwordLable];
        [self.passwordLable mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.right.equalTo(self);
            make.top.equalTo(self.userNameLable.mas_bottom);
             make.height.offset(30);
        }];

        

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(UILabel *)userNameLable{

    if (_userNameLable == nil) {

        _userNameLable = [[UILabel alloc] init];
        _userNameLable.textAlignment = NSTextAlignmentLeft;
       _userNameLable.font = [UIFont systemFontOfSize:15];
        _userNameLable.textColor = [UIColor blackColor];

    }
    return _userNameLable;

}

-(UILabel *)passwordLable{

    if (_passwordLable == nil) {

        _passwordLable = [[UILabel alloc] init];
        _passwordLable.textAlignment = NSTextAlignmentLeft;
       _passwordLable.font = [UIFont systemFontOfSize:15];
        _passwordLable.textColor = [UIColor blackColor];

    }
    return _passwordLable;
}

@end
