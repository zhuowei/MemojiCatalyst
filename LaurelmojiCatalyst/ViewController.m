//
//  ViewController.m
//  LaurelmojiCatalyst
//
//  Created by Zhuowei Zhang on 2019-10-19.
//  Copyright © 2019 Zhuowei Zhang. All rights reserved.
//

#import "ViewController.h"

static NSBundle* avatarKitBundle;
static NSBundle* avatarUIBundle;

static void loadAvatarKit() {
    if (avatarUIBundle) return;
    NSBundle* mainBundle = [NSBundle mainBundle];
    avatarKitBundle = [NSBundle bundleWithPath:[mainBundle pathForResource:@"AvatarKit" ofType:@"framework"]];
    [avatarKitBundle load];
    avatarUIBundle = [NSBundle bundleWithPath:[mainBundle pathForResource:@"AvatarKit" ofType:@"framework"]];
    [avatarUIBundle load];
}

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    loadAvatarKit();
}


@end
