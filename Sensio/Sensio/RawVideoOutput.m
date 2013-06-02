//
//  RawVideoOutput.m
//  Sensio
//
//  Created by Paul Collier on 13/06/01.
//  Copyright (c) 2013年 Sensio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import "ccv.h"
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
    int bytesPerRow = (int) CVPixelBufferGetBytesPerRow(videoFrame);
    int width = (int) CVPixelBufferGetWidth(videoFrame);
    int height = (int) CVPixelBufferGetHeight(videoFrame);

    // MOLEST PIXELS
    ccv_dense_matrix_t *image = NULL;
    ccv_read(baseAddress, &image, CCV_IO_GRAY | CCV_IO_NO_COPY, width, height, bytesPerRow);
    ccv_bbf_classifier_cascade_t *cascade = ccv_load_bbf_classifier_cascade("../ccv/samples/face");

    ccv_array_t *faces = ccv_bbf_detect_objects(image, &cascade, 1, ccv_bbf_default_params);
    for (int i = 0; i < faces->rnum; i++) {
        ccv_comp_t *face = (ccv_comp_t *)ccv_array_get(faces, i);
        NSLog(@"face at %d,%d %dx%d", face->rect.x, face->rect.y, face->rect.width, face->rect.height);
    }
    ccv_array_free(faces);

    ccv_bbf_classifier_cascade_free(cascade);
    ccv_matrix_free(image);

    CVPixelBufferUnlockBaseAddress(videoFrame, 0);
}

@end
