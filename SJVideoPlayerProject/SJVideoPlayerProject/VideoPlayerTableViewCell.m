//
//  VideoPlayerTableViewCell.m
//  SJVideoPlayerProject
//
//  Created by BlueDancer on 2017/8/28.
//  Copyright © 2017年 SanJiang. All rights reserved.
//

#import "VideoPlayerTableViewCell.h"

#import "UIView+Extension.h"

#import <Masonry.h>

#import <SJBorderLineView/SJBorderlineView.h>

@interface VideoPlayerTableViewCell ()

@property (nonatomic, strong, readonly) SJBorderlineView *backgroundView;

@property (nonatomic, strong, readonly) UIButton *playVideoBtn;

@end

@implementation VideoPlayerTableViewCell

@synthesize backgroundView = _backgroundView;
@synthesize videoImageView = _videoImageView;
@synthesize playVideoBtn = _playVideoBtn;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self _VideoPlayerTableViewCellSetupUI];
    }
    return self;
}

// MARK: Actions

- (void)clickedBtn:(UIButton *)btn {
    if ( ![self.delegate respondsToSelector:@selector(clickedPlayBtnOnTheCell:)] ) return;
    [self.delegate clickedPlayBtnOnTheCell:self];
}

// MARK: UI

- (void)_VideoPlayerTableViewCellSetupUI {
    
    [self.contentView addSubview:self.backgroundView];
    [_backgroundView addSubview:self.videoImageView];
    [_videoImageView addSubview:self.playVideoBtn];
    
    [_backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    [_videoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.offset(0);
        make.bottom.offset(-6);
    }];
    
    [_playVideoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.offset(0);
    }];
}

- (UIButton *)playVideoBtn {
    if ( _playVideoBtn ) return _playVideoBtn;
    _playVideoBtn = [UIButton buttonWithImageName:@"db_play_big" tag:0 target:self sel:@selector(clickedBtn:)];
    return _playVideoBtn;
}

- (UIImageView *)videoImageView {
    if ( _videoImageView ) return _videoImageView;
    _videoImageView = [UIImageView imageViewWithImageStr:[NSString stringWithFormat:@"%zd", arc4random() % 3] viewMode:UIViewContentModeScaleAspectFit];
    _videoImageView.userInteractionEnabled = YES;
    return _videoImageView;
}

- (UIView *)backgroundView {
    if ( _backgroundView ) return _backgroundView;
    _backgroundView = [SJBorderlineView borderlineViewWithSide:SJBorderlineSideBottom startMargin:0 endMargin:0 lineColor:[UIColor lightGrayColor] lineWidth:6 backgroundColor:[UIColor clearColor]];
    return _backgroundView;
}
@end
