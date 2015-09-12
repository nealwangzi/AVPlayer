//
//  ViewController.m
//  视频播放器
//
//  Created by Apple on 15/9/12.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "ViewController.h"

#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()
/* <#注释#> */
@property(nonatomic , strong) AVPlayer *avplayer;

/* 注释 */
@property(nonatomic , strong) MPMoviePlayerController *MoviePlayer;

/* 注释 */
@property(nonatomic , strong)  MPMoviePlayerViewController *player;
- (IBAction)AVPlayer:(UIButton *)sender;
- (IBAction)MPMoviePlayer:(UIButton *)sender;
- (IBAction)MPMoviePlayerView:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)AVPlayer:(UIButton *)sender {
    
        NSURL *url = [NSURL URLWithString:@"http://v1.mukewang.com/a45016f4-08d6-4277-abe6-bcfd5244c201/L.mp4"];
    AVPlayerItem *item = [[AVPlayerItem alloc]initWithURL:url];
    AVPlayer *player = [[AVPlayer alloc]initWithPlayerItem:item];
    /**
     *  需要添加对应的layer 并将layer加到父控件图层中,进行播放
     */
    AVPlayerLayer *playerlayer = [AVPlayerLayer playerLayerWithPlayer:player];
    playerlayer.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width * 9 /16);
    [self.view.layer addSublayer:playerlayer];
    
    self.avplayer = player;
    
    [self.avplayer play];
}

- (IBAction)MPMoviePlayer:(UIButton *)sender {
    
    NSURL *url = [NSURL URLWithString:@"http://v1.mukewang.com/19954d8f-e2c2-4c0a-b8c1-a4c826b5ca8b/L.mp4"];
    
    self.MoviePlayer = [[MPMoviePlayerController alloc]initWithContentURL:url];
    
    self.MoviePlayer.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width *9/16);
    
    [self.view addSubview:self.MoviePlayer.view];
    
    [self.MoviePlayer play];
    
}

- (IBAction)MPMoviePlayerView:(UIButton *)sender {
    /**
     *  该方法只能通过modal的形式将控制器弹出,并且默认为全屏播放
     */
    NSURL *url = [NSURL URLWithString:@"http://v1.mukewang.com/19954d8f-e2c2-4c0a-b8c1-a4c826b5ca8b/L.mp4"];
    
    self.player = [[MPMoviePlayerViewController alloc]initWithContentURL:url];
    
    [self presentMoviePlayerViewControllerAnimated:self.player];

}
@end
