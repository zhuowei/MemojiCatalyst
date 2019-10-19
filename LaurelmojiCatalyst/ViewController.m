//
//  ViewController.m
//  LaurelmojiCatalyst
//
//  Created by Zhuowei Zhang on 2019-10-19.
//  Copyright © 2019 Zhuowei Zhang. All rights reserved.
//

#import "ViewController.h"

@interface AVTUIEnvironment : NSObject
+ (AVTUIEnvironment*)defaultEnvironment;
@end

@interface AVTAvatarStore : NSObject
+ (AVTAvatarStore*)defaultBackendWithWorkQueue:(dispatch_queue_t)arg1 environment:(AVTUIEnvironment*)arg2;
- (instancetype)initWithDomainIdentifier:(NSString*)domainIdentifier;
@end

@interface AVTAvatarLibraryViewController : UIViewController
- (instancetype)initWithAvatarStore:(AVTAvatarStore*)store;;
@end

@interface UISelectionFeedbackGenerator (Laurelmoji)
- (void)_setOutputMode:(int)mode;
@end
@implementation UISelectionFeedbackGenerator (Laurelmoji)
- (void)_setOutputMode:(int)mode {
    NSLog(@"_setOutputMode: %x", mode);
}
@end

static NSBundle* avatarKitBundle;
static NSBundle* avatarUIBundle;

static void loadAvatarKit() {
    /*
    if (avatarUIBundle) return;
    NSBundle* mainBundle = [NSBundle mainBundle];
    avatarKitBundle = [NSBundle bundleWithPath:[mainBundle pathForResource:@"AvatarKit" ofType:@"framework"]];
    [avatarKitBundle load];
    avatarUIBundle = [NSBundle bundleWithPath:[mainBundle pathForResource:@"AvatarUI" ofType:@"framework"]];
    [avatarUIBundle load];*/
}


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    loadAvatarKit();
}

- (IBAction)openAvatar {
    AVTAvatarStore* store = [[AVTAvatarStore alloc] initWithDomainIdentifier:@"com.worthdoingbadly.LaurelmojiCatalyst"];
    AVTAvatarLibraryViewController* vc = [[AVTAvatarLibraryViewController alloc] initWithAvatarStore:store];
    [self presentViewController:vc animated:true completion:nil];
}


@end
