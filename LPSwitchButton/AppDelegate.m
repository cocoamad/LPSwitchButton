//
//  AppDelegate.m
//  LPSwitchButton
//
//  Created by Penny on 13-6-12.
//  Copyright (c) 2013年 Penny. All rights reserved.
//

#import "AppDelegate.h"
#import "LPSwitchButton.h"

@implementation AppDelegate

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    LPSwitchButton *btn = [[LPSwitchButton alloc] initWithFrame: NSMakeRect(150, 250, 70, 30)];
    [btn setType: kLPSwitchButtonTypeSquare];
    [btn setTintColor: [NSColor colorWithCalibratedRed: 127 * 1.0 / 255  green: 140 * 1.0 / 255 blue: 141 * 1.0 / 255 alpha: 1]];
    [btn setThumbTintColor: [NSColor colorWithCalibratedRed: 231 * 1.0 / 255 green: 76 * 1.0 / 255 blue: 60 * 1.0 / 255 alpha: 1]];
    [btn setOnTintColor: [NSColor colorWithCalibratedRed: 52 * 1.0 /255 green: 152 * 1.0 / 255 blue: 219 * 1.0 / 255 alpha: 1]];
    [self.window.contentView addSubview: btn];
    [btn addTarget: self action: @selector(btnClick:)];
    
    LPSwitchButton *btn2 = [[LPSwitchButton alloc] initWithFrame: NSMakeRect(250, 250, 70, 30)];
    [btn2 setType: kLPSwitchButtonTypeRound];
    [btn2 setTintColor: [NSColor colorWithCalibratedRed: 127 * 1.0 / 255  green: 140 * 1.0 / 255 blue: 141 * 1.0 / 255 alpha: 1]];
    [btn2 setThumbTintColor: [NSColor colorWithCalibratedRed: 231 * 1.0 / 255 green: 76 * 1.0 / 255 blue: 60 * 1.0 / 255 alpha: 1]];
    [btn2 setOnTintColor: [NSColor colorWithCalibratedRed: 52 * 1.0 /255 green: 152 * 1.0 / 255 blue: 219 * 1.0 / 255 alpha: 1]];
    [self.window.contentView addSubview: btn2];
    [btn2 addTarget: self action: @selector(btn2Click:)];
    
    LPSwitchButton *btn3 = [[LPSwitchButton alloc] initWithFrame: NSMakeRect(250, 180, 70, 30)];
    [btn3 setOffImage: [NSImage imageNamed: @"1.png"]];
    [btn3 setOnImage: [NSImage imageNamed: @"2.png"]];
    [btn3 setPointImage: [NSImage imageNamed: @"3.png"]];
    [self.window.contentView addSubview: btn3];
    [btn3 addTarget: self action: @selector(btn3Click:)];
    
    LPSwitchButton *btn4 = [[LPSwitchButton alloc] initWithFrame: NSMakeRect(150, 180, 70, 30)];
    [btn4 setType: kLPSwitchButtonTypeSquare];
    [btn4 setOffImage: [NSImage imageNamed: @"1.png"]];
    [btn4 setOnImage: [NSImage imageNamed: @"2.png"]];
    [btn4 setPointImage: [NSImage imageNamed: @"3.png"]];
    [self.window.contentView addSubview: btn4];
    [btn4 addTarget: self action: @selector(btn3Click:)];
    
    
}

- (void)btnClick:(id)sender
{
    NSLog(@"btnClick");
}

- (void)btn2Click:(id)sender
{
    NSLog(@"btn2Click");    
}

- (void)btn3Click:(id)sender
{
    NSLog(@"btn3Click");
}

- (void)btn4Click:(id)sender
{
    NSLog(@"btn4Click");
}

@end
