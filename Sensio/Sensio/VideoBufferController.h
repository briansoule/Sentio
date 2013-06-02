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

@interface VideoBufferController : NSObject{
    IBOutlet QTCaptureView *mCaptureView;
    
    QTCaptureSession            *mCaptureSession;
    QTCaptureMovieFileOutput    *mCaptureMovieFileOutput;
    QTCaptureDeviceInput        *mCaptureVideoDeviceInput;
    QTCaptureDeviceInput        *mCaptureAudioDeviceInput;
}

- (IBAction)startBuffer:(id)sender;

@end
