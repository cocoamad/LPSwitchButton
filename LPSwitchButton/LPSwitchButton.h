//
//  LPSwitchButton.h
//  LPSwitchButton
//
//  Created by Cocoamad on 13-6-12.
//  Copyright (c) 2013年 Penny. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <QuartzCore/QuartzCore.h>

typedef enum {
    kLPSwitchButtonTypeRound = 0,
    kLPSwitchButtonTypeSquare
} LPSwitchButtonType;

@interface LPSwitchButton : NSView {
    id _target;
    SEL _action;
}

@property (nonatomic, retain) NSColor *onTintColor;
@property (nonatomic, retain) NSColor *tintColor;
@property (nonatomic, retain) NSColor *thumbTintColor;

@property (nonatomic, retain) NSImage *onImage;
@property (nonatomic, retain) NSImage *offImage;
@property (nonatomic, retain) NSImage *pointImage;

@property (nonatomic, readonly) BOOL state;
@property (nonatomic, assign) LPSwitchButtonType type;

- (void)addTarget:(id)target action:(SEL)action;
@end


@interface NSImage(CGImage)
- (CGImageRef)CGImage;
@end

