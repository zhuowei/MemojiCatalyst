//
//  MessagesStubs.m
//  Messages
//
//  Created by Zhuowei Zhang on 2019-10-19.
//  Copyright © 2019 Zhuowei Zhang. All rights reserved.
//

@import UIKit;

@interface MSSticker: NSObject
@end
@implementation MSSticker
@end

@interface MSStickerView: UIView
@end
@implementation MSStickerView
@end

@interface _UIEdgeFeedbackGeneratorConfiguration: NSObject
+ (_UIEdgeFeedbackGeneratorConfiguration*)sliderConfiguration;
@end
@implementation _UIEdgeFeedbackGeneratorConfiguration
+ (_UIEdgeFeedbackGeneratorConfiguration*)sliderConfiguration {
    return nil;
}
@end

@interface _UIEdgeFeedbackGenerator: NSObject
- (instancetype)initWithConfiguration:(_UIEdgeFeedbackGeneratorConfiguration*)configuration coordinateSpace:(id<UICoordinateSpace>)coordinateSpace;
- (void)setAxis:(int)axis;
- (void)setDistance:(double)distance;
@end
@implementation _UIEdgeFeedbackGenerator
- (instancetype)initWithConfiguration:(_UIEdgeFeedbackGeneratorConfiguration*)configuration coordinateSpace:(id<UICoordinateSpace>)coordinateSpace {
    self = [super init];
    return self;
}
- (void)setAxis:(int)axis {
}
- (void)setDistance:(double)distance {
}
@end
