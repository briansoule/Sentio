//
//  RawVideoOutput.m
//  Sensio
//
//  Created by Paul Collier on 13/06/01.
//  Copyright (c) 2013年 Sensio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import "RawVideoOutput.h"

@implementation RawVideoOutput

- (BOOL)automaticallyDropsLateVideoFrames
{
    return YES;
}

- (void)outputVideoFrame:(CVImageBufferRef)videoFrame withSampleBuffer:(QTSampleBuffer *)sampleBuffer fromConnection:(QTCaptureConnection *)connection
{
    CVPixelBufferLockBaseAddress(videoFrame, 0);
    uint8_t *baseAddress = (uint8_t *)CVPixelBufferGetBaseAddress(videoFrame);
    size_t bytesPerRow = CVPixelBufferGetBytesPerRow(videoFrame);
    size_t width = CVPixelBufferGetWidth(videoFrame);
    size_t height = CVPixelBufferGetHeight(videoFrame);

    // MOLEST PIXELS

    CVPixelBufferUnlockBaseAddress(videoFrame, 0);
}

@end
