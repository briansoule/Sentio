//
//  VideoBufferController.h
//  Sensio
//
//  Created by Brian Soule on 6/1/13.
//  Copyright (c) 2013 Sensio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import <QTKit/QTkit.h>

@class RawVideoOutput;

@interface VideoBufferController : NSObject{
    IBOutlet QTCaptureView *mCaptureView;
    
    QTCaptureSession            *mCaptureSession;
    QTCaptureDeviceInput        *mCaptureVideoDeviceInput;
    RawVideoOutput              *decompressedOutput;
}

- (IBAction)startBuffer:(id)sender;

@end
