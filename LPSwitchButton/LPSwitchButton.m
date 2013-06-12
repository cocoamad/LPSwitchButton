//
//  LPSwitchButton.m
//  LPSwitchButton
//
//  Created by Penny on 13-6-12.
//  Copyright (c) 2013年 Penny. All rights reserved.
//

#import "LPSwitchButton.h"

@interface LPSwitchButton()
@property (nonatomic, retain) CALayer *backgroundLayer;
@property (nonatomic, retain) CALayer *indicationLayer;
@property (nonatomic, retain) CALayer *pointLayer;

@property (nonatomic, assign) BOOL isMouseDown;
@property (nonatomic, assign) BOOL isMove;
@property (nonatomic, assign) CGFloat offx;
@property (nonatomic, assign) CGPoint lastDownPoint;

@end

@implementation LPSwitchButton

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
        [self setWantsLayer: YES];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = self.layer.bounds.size.height / 2;
        _state = NO;
        
        self.backgroundLayer = [CALayer layer];
        self.backgroundLayer.frame = self.layer.bounds;
        self.backgroundLayer.cornerRadius = self.layer.bounds.size.height / 2;
        self.backgroundLayer.backgroundColor = [NSColor grayColor].CGColor;
        self.backgroundLayer.masksToBounds = YES;
        [self.layer addSublayer: self.backgroundLayer];
        
        self.indicationLayer = [CALayer layer];
        self.indicationLayer.backgroundColor = [NSColor orangeColor].CGColor;
        self.indicationLayer.cornerRadius = self.layer.bounds.size.height / 2;
        self.indicationLayer.frame = [self _indicationRect];
        self.indicationLayer.masksToBounds = YES;
        [self.layer addSublayer: self.indicationLayer];
        
        self.pointLayer = [CALayer layer];
        self.pointLayer.frame = CGRectMake(self.indicationLayer.bounds.size.width - self.indicationLayer.bounds.size.height,
                                           self.indicationLayer.bounds.origin.y, self.indicationLayer.bounds.size.height, self.indicationLayer.bounds.size.height);
        self.pointLayer.cornerRadius = self.layer.bounds.size.height / 2;
        self.pointLayer.backgroundColor = [NSColor blueColor].CGColor;
        [self.indicationLayer addSublayer: self.pointLayer];
        
        self.type = kLPSwitchButtonTypeRound;
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)addTarget:(id)target action:(SEL)action
{
    _target = target;
    _action = action;
}

#pragma mark -  Setter
#pragma mark ------Color
- (void)setTintColor:(NSColor *)tintColor
{
    if (![_tintColor isEqual: tintColor]) {
        [_tintColor release];
        _tintColor = [tintColor retain];
        self.backgroundLayer.backgroundColor = _tintColor.CGColor;
    }
}

- (void)setOnTintColor:(NSColor *)onTintColor
{
    if (![_onTintColor isEqual: onTintColor]) {
        [_onTintColor release];
        _onTintColor = [onTintColor retain];
        self.indicationLayer.backgroundColor = _onTintColor.CGColor;
    }
}

- (void)setThumbTintColor:(NSColor *)thumbTintColor
{
    if (![_thumbTintColor isEqual: thumbTintColor]) {
        [_thumbTintColor release];
        _thumbTintColor = [thumbTintColor retain];
        self.pointLayer.backgroundColor = _thumbTintColor.CGColor;
    }
}

#pragma mark -------Image
- (void)setOnImage:(NSImage *)onImage
{
    [CATransaction begin];
    [CATransaction setDisableActions: YES];
    self.indicationLayer.contents = (id)onImage.CGImage;
    CGImageRef tmpImageRef = onImage.CGImage;
    if (tmpImageRef) {
        self.indicationLayer.contents = (id)tmpImageRef;
        CGImageRelease(tmpImageRef);
    }
    [CATransaction commit];
}

- (void)setOffImage:(NSImage *)offImage
{
    [CATransaction begin];
    [CATransaction setDisableActions: YES];
    CGImageRef tmpImageRef = offImage.CGImage;
    if (tmpImageRef) {
        self.backgroundLayer.contents = (id)tmpImageRef;
        CGImageRelease(tmpImageRef);
    }
    [CATransaction commit];
}

- (void)setPointImage:(NSImage *)pointImage
{
    [CATransaction begin];
    [CATransaction setDisableActions: YES];
    CGImageRef tmpImageRef = pointImage.CGImage;
    if (tmpImageRef) {
        self.pointLayer.contents = (id)tmpImageRef;
        CGImageRelease(tmpImageRef);
    }

    [CATransaction commit];
}

- (void)setType:(LPSwitchButtonType)type
{
    if (_type != type) {
        _type = type;
        if (_type == kLPSwitchButtonTypeRound) {
            self.backgroundLayer.cornerRadius = self.layer.bounds.size.height / 2;
            self.indicationLayer.cornerRadius = self.layer.bounds.size.height / 2;
            self.pointLayer.cornerRadius = self.layer.bounds.size.height / 2;
            self.layer.cornerRadius = self.layer.bounds.size.height / 2;
        } else {
            self.backgroundLayer.cornerRadius = 0;
            self.indicationLayer.cornerRadius = 0;
            self.pointLayer.cornerRadius = 0;
            self.layer.cornerRadius = 0;
        }
    }
}

#pragma mark Private Method
- (CGRect)_indicationRect
{
    if (!_state) {
        return CGRectMake(-ceil(self.bounds.size.width - self.layer.bounds.size.height),
                          self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height);
    } else {
        return CGRectMake(self.bounds.origin.x, self.bounds.origin.y,
                          self.bounds.size.width, self.bounds.size.height);
    }
}

- (CGRect)_pointRect
{
    if (_state) {
        return CGRectMake(self.bounds.size.width - self.layer.bounds.size.height,
                          self.bounds.origin.y, self.bounds.size.height, self.bounds.size.height);
    } else {
        return CGRectMake(self.bounds.origin.x, self.bounds.origin.y,
                          self.bounds.size.height, self.bounds.size.height);
    }
}

- (void)setIsMouseDown:(BOOL)isMouseDown
{
    if (_isMouseDown != isMouseDown) {
        _isMouseDown = isMouseDown;
        if (_isMouseDown) {
            CALayer *foreBGLayer = [CALayer layer];
            foreBGLayer.backgroundColor = [NSColor blackColor].CGColor;
            foreBGLayer.opacity = .2f;
            foreBGLayer.frame = self.pointLayer.bounds;
            foreBGLayer.cornerRadius = self.pointLayer.cornerRadius;
            [foreBGLayer setValue: @"YES" forKey: @"foreBgLayer"];
            [self.pointLayer addSublayer: foreBGLayer];
        } else {
            NSArray *subLayers = self.pointLayer.sublayers;
            for (CALayer *layer in subLayers) {
                if ([[layer valueForKey: @"foreBgLayer"] isEqualToString: @"YES"]) {
                    [layer removeFromSuperlayer];
                    break;
                }
            }
        }
    }
}

- (void)setOffx:(CGFloat)offx
{
    CGRect frame = self.indicationLayer.frame;
    frame.origin.x += offx;
    frame.origin.x = frame.origin.x > 0 ? 0 : frame.origin.x;
    frame.origin.x = frame.origin.x < -(self.bounds.size.width - self.bounds.size.height) ? -(self.bounds.size.width - self.bounds.size.height) : frame.origin.x;
    
    [CATransaction begin];
    [CATransaction setDisableActions: YES];
    self.indicationLayer.frame = frame;
    [CATransaction commit];
}


- (void)_setState:(BOOL)state animated:(BOOL)animated
{
    if (animated) {
        [CATransaction begin];
        [CATransaction setAnimationDuration: .2];
        if (_state != state) {
            [CATransaction setCompletionBlock:^{
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (_target && [_target respondsToSelector: _action]) {
                        [_target performSelector: _action withObject: self];
                    }
                });
            }];
        }
        _state = state;
        [CATransaction setAnimationTimingFunction: [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseInEaseOut]];
        self.indicationLayer.frame = [self _indicationRect];
        [CATransaction commit];
    } else {
        if (state != _state) {
            if (_target && [_target respondsToSelector: _action]) {
                [_target performSelector: _action withObject: self];
            }
        }
        _state = state;
        [CATransaction begin];
        [CATransaction setDisableActions: YES];
        self.indicationLayer.frame = [self _indicationRect];
        [CATransaction commit];
    }
}

#pragma mark Mouse Event
- (void)mouseDown:(NSEvent *)theEvent
{
    _lastDownPoint = [self convertPointFromBase: [theEvent locationInWindow]];
    _lastDownPoint = NSMakePoint(_lastDownPoint.x - self.frame.origin.x, _lastDownPoint.y - self.frame.origin.y);
    self.isMouseDown = YES;
}

- (void)mouseDragged:(NSEvent *)theEvent
{
    CGPoint point = [self convertPoint: [theEvent locationInWindow] toView: self];
    point = NSMakePoint(point.x - self.frame.origin.x, point.y - self.frame.origin.y);
    CGFloat offx = point.x - _lastDownPoint.x;
    self.offx = offx;
    _lastDownPoint = point;
}

- (void)mouseUp:(NSEvent *)theEvent
{
    CGPoint point = [self convertPoint: [theEvent locationInWindow] toView: self];
    point = NSMakePoint(point.x - self.frame.origin.x, point.y - self.frame.origin.y);
    if(CGRectEqualToRect(self.indicationLayer.frame, [self _indicationRect])) {
        if (CGRectContainsPoint(self.bounds, point)) {
            [self _setState: !_state animated: YES];
        }
    } else {
        CGFloat offx = self.indicationLayer.frame.origin.x;
        BOOL state = offx > -(self.bounds.size.width - self.bounds.size.height) / 2 ? YES : NO;
        [self _setState: state animated: YES];
    }
    
    self.isMouseDown = NO;
    _lastDownPoint = CGPointZero;
}
@end

@implementation NSImage(CGImage)
- (CGImageRef)CGImage
{
    CGImageSourceRef source = CGImageSourceCreateWithData((CFDataRef)[self TIFFRepresentation], NULL);
    if (source) {
        CGImageRef maskRef =  CGImageSourceCreateImageAtIndex(source, 0, NULL);
        CFRelease(source);
        return maskRef;   // should release outside
    }
    return nil;
}
@end



