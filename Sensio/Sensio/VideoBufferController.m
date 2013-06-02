//
//  VideoBufferController.m
//  Sensio
//
//  Created by Brian Soule on 6/1/13.
//  Copyright (c) 2013 Sensio. All rights reserved.
//

#import "VideoBufferController.h"
#import "RawVideoOutput.h"

@implementation VideoBufferController

- (IBAction)startBuffer:(id)sender{
    NSLog(@"Buffer started");
}

- (void)awakeFromNib
{
    
    
	mCaptureSession = [[QTCaptureSession alloc] init];
    
    
	BOOL success = NO;
	NSError *error;
	
    
    QTCaptureDevice *videoDevice = [QTCaptureDevice defaultInputDeviceWithMediaType:QTMediaTypeVideo];
    success = [videoDevice open:&error];
    
    
    
	if (!success) {
		videoDevice = [QTCaptureDevice defaultInputDeviceWithMediaType:QTMediaTypeMuxed];
		success = [videoDevice open:&error];
		
    }
    
    if (!success) {
        videoDevice = nil;
        // Handle error
        
    }
    
    if (videoDevice) {
		
		mCaptureVideoDeviceInput = [[QTCaptureDeviceInput alloc] initWithDevice:videoDevice];
		success = [mCaptureSession addInput:mCaptureVideoDeviceInput error:&error];
		if (!success) {
			// Handle error
		}

        decompressedOutput = [[RawVideoOutput alloc] init];
        [mCaptureSession addOutput:decompressedOutput error:&error];
        if (error) {
            // TODO
        }
        
        [mCaptureView setCaptureSession:mCaptureSession];
        
        [mCaptureSession startRunning];
        
	}
    
}


- (void)windowWillClose:(NSNotification *)notification
{
	
	[mCaptureSession stopRunning];
    
    if ([[mCaptureVideoDeviceInput device] isOpen])
        [[mCaptureVideoDeviceInput device] close];
}

@end
