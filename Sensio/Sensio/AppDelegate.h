//
//  AppDelegate.h
//  Sensio
//
//  Created by Brian Soule on 6/1/13.
//  Copyright (c) 2013 Sensio. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "VideoBufferController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property VideoBufferController *videoController;

@end
