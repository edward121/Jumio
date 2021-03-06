//
//  JMExtendedScanDebugging.h
//  JumioMobileSDK
//
//  Created by Christian Neudorfer on 24.07.14.
//  Copyright (c) 2014 Jumio Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


extern NSString * const kExtScanDebuggingRequestTimingTask;
extern NSString * const kExtScanDebuggingRequestTimingHTTPBody;
extern NSString * const kExtScanDebuggingRequestTimingResponseData;
extern NSString * const kExtScanDebuggingRequestTimingHTTPStatusCode;
extern NSString * const kExtScanDebuggingRequestTimingTimeRequired;
extern NSString * const kExtScanDebuggingRequestTimingError;
extern const NSUInteger kExtScanDebuggingMaxServerTaskDataLengthAllowed;

@interface JMExtendedScanDebugging : NSObject
{
    NSString*               _requestTimingLogFilePath;
    BOOL                    _isScanStarted;
    NSMutableDictionary*    _imagesBufferDict;
    NSMutableDictionary*    _rawImagesBufferDict;
    NSString*               _scanLogFilePath;
    NSString*               _scanLogDirPath;
}

@property (nonatomic, assign) BOOL netswipeExtendedScanDebugging;
@property (nonatomic, assign) BOOL netverifyExtendedScanDebugging;
@property (nonatomic, assign) BOOL netverifyLiveScanDebugging;
@property (nonatomic, assign) BOOL multiDocumentExtendedScanDebugging;

@property (nonatomic, assign, readonly) BOOL                    isScanStarted;
@property (nonatomic, strong)           NSString*               scanReference;
@property (nonatomic, strong, readonly) NSMutableDictionary*    imagesBufferDict;
@property (nonatomic, strong, readonly) NSMutableDictionary*    rawImagesBufferDict;
@property (nonatomic, strong, readonly) NSString*               scanLogFilePath;
@property (nonatomic, strong, readonly) NSString*               scanLogDirPath;
@property (nonatomic, strong, readonly) NSString*               requestTimingLogFilePath;

@property (nonatomic, strong)                           NSString*   logFile;
@property (nonatomic, strong)                           NSString* 	requestTimingsLogFile;
@property (nonatomic, strong)                           NSString*   logRootDirectory;
@property (nonatomic, assign, getter=isLogFinalized)    BOOL        logFinalized;


+ (JMExtendedScanDebugging*) sharedInstance;

- (void)writeString:(NSString*)string toFileAtPath:(NSString*)filePath;
- (void)appendLineToLogString:(NSMutableString*)logString key:(NSString*)aKey value:(NSString*)aValue separator:(NSString*)aSeparator;

@end
