//
//  ViewController.m
//  Jumio
//
//  Created by Mac on 06/10/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import "ViewController.h"
#import <JumioCore/JumioCore.h>
#import <Netverify/Netverify.h>

@interface ViewController () <NetverifyViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NetverifyConfiguration *config = [NetverifyConfiguration new];
    config.merchantApiToken = @"YOURAPITOKEN";
    config.merchantApiSecret = @"YOURAPISECRET";
    config.delegate = self;
    NetverifyViewController *netverifyViewController;
    @try {
        netverifyViewController = [[NetverifyViewController alloc]
                                   initWithConfiguration:config];
    } @catch (NSException *exception) {
        // HANDLE EXCEPTION
    }
    
    [netverifyViewController updateConfiguration:config];
    
    
    
    
    config.dataCenter = JumioDataCenterEU;
    config.name = @"FIRSTNAME LASTNAME";
    config.additionalInformation = @"ADDITONAL INFORMATION";
    config.statusBarStyle = UIStatusBarStyleLightContent;
    
//    User journey
    config.preselectedCountry = @"AUT";
    config.preselectedDocumentTypes = NetverifyDocumentTypePassport | NetverifyDocumentTypeVisa;
    config.preselectedDocumentVariant = NVDocumentVariantPlastic;
//    camera position
    config.cameraPosition = JumioCameraPositionFront;
    
    
    
    
//    Transaction identifiers
    config.merchantScanReference = @"YOURSCANREFERENCE";
    config.merchantReportingCriteria = @"YOURREPORTINGCRITERIA";
    config.customerId = @"CUSTOMERID";
    
    
//    Fastfill only
    config.dataExtractionOnMobileOnly = YES;
    
    
//    ID verification
    config.requireVerification = YES;
    config.callbackUrl = @"YOURCALLBACKURL";
    config.requireFaceMatch = YES;
    
    
    
//    Analytics Service
    config.sendDebugInfoToJumio = YES;
    NSUUID *debugSessionID = netverifyViewController.debugID;

}
#pragma mark - NetVerifyViewControllerDelegate
- (void) netverifyViewController: (NetverifyViewController*) netverifyViewController didFinishInitializingWithError:(NSError*)error {
    // YOURCODE
}
- (void) netverifyViewController: (NetverifyViewController*) netverifyViewController didFinishWithDocumentData:(NetverifyDocumentData *)documentData scanReference: (NSString*) scanReference {
    // OBTAIN PARAMETERS HERE
    // YOURCODE
}
- (void) netverifyViewController: (NetverifyViewController*) netverifyViewController didCancelWithError: (NSError*) error scanReference: (NSString*) scanReference {
    // NSString *scanReference = scanReference;
    // NSInteger errorCode = error.code;
    // NSString *errorMessage = error.localizedDescription;
    // YOURCODE
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
