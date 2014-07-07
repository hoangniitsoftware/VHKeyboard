//
//  MainViewController.h
//  VHKeyboardTest
//
//  Created by HoangNIIT on 7/7/14.
//  Copyright (c) 2014 FlyingCatSoftware. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VHKeyboard.h"

@interface MainViewController : UIViewController<UITextFieldDelegate>

@property (strong,nonatomic) IBOutlet UIScrollView *mainScrollView;

@property (strong,nonatomic) IBOutlet UITextField *txtNumpad;
@property (strong,nonatomic) IBOutlet UITextField *txtPhonepad;
@property (strong,nonatomic) IBOutlet UITextField *txtWebBrowserPad;
@property (strong,nonatomic) IBOutlet UITextField *txtCalendarPad;
@property (strong,nonatomic) IBOutlet UITextField *txtTextPad;
@property (strong,nonatomic) IBOutlet UITextField *txt1ColPad;
@property (strong,nonatomic) IBOutlet UITextField *txt2ColPad;
@property (strong,nonatomic) IBOutlet UITextField *txt3ColPad;

@end
