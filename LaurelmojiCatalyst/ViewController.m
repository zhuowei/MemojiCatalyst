//
//  ViewController.m
//  LaurelmojiCatalyst
//
//  Created by Zhuowei Zhang on 2019-10-19.
//  Copyright © 2019 Zhuowei Zhang. All rights reserved.
//

#import "ViewController.h"
@import ObjectiveC.runtime;

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

@interface AVTRenderer: NSObject
+ (AVTRenderer*)renderer;
@end

@interface AVTSnapshotBuilder: NSObject
@end

@interface UISelectionFeedbackGenerator (Laurelmoji)
- (void)_setOutputMode:(int)mode;
@end
@implementation UISelectionFeedbackGenerator (Laurelmoji)
- (void)_setOutputMode:(int)mode {
    NSLog(@"_setOutputMode: %x", mode);
}
@end

static AVTSnapshotBuilder* (*AVTSnapshotBuilder_init_real)(AVTSnapshotBuilder*, SEL);

static AVTSnapshotBuilder* AVTSnapshotBuilder_init_hook(AVTSnapshotBuilder* self, SEL sel) {
    AVTRenderer* renderer = [AVTRenderer renderer];
    [self setValue:renderer forKey:@"_renderer"];
    return AVTSnapshotBuilder_init_real(self, sel);
}

static void loadAvatarKit() {
    Method method = class_getInstanceMethod([AVTSnapshotBuilder class], @selector(init));
    AVTSnapshotBuilder_init_real = (void*)method_getImplementation(method);
    method_setImplementation(method, (void*)&AVTSnapshotBuilder_init_hook);
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
