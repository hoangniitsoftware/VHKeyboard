//
//  VHKeyboard.h
//  VHkeyboard by HoangNIIT
//  email: hoangniitsoftware@gmail.com
//  It's a free Objective C class, you can custom this class
//
//  Created by HoangNIIT on 7/3/14.
//  Copyright (c) 2014 FlyingCatSoftware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface VHKeyboard : NSObject <UIPickerViewDataSource,UIPickerViewDelegate>

+(VHKeyboard *)shareInstance;

typedef enum{
    VHKey_LongMonthDateYearDate = 0,
    VHKey_ShortMonthDateYearDate = 1,
    VHKey_LongDateMonthYearDate = 2,
    VHKey_ShortDateMonthYearDate = 3,
    VHKey_LongMonthYear = 4,
    VHKey_ShortMonthYear = 5,
}VHKey_CalendarFormat;

@property (nonatomic) VHKey_CalendarFormat VHKey_DateFormat;

typedef enum{
    VHKey_NumberPad = 0,
    VHKey_PhonePad = 1,
    VHKey_CarlendarPad = 2,
    VHkey_TextPad = 3,
    VHKey_CustomeData1Cols = 4,
    VHKey_CustomeData2Cols = 5,
    VHKey_CustomeData3Cols = 6,
    VHKey_WebBrowserPad = 7,
}VHKeyboardType;

-(void)setVHKeyboardData:(NSArray *)data1 Data2:(NSArray *)data2 Data3:(NSArray *)data3;

-(void)keyboardForTextField:(UITextField *)textField keyboardType:(VHKeyboardType)keyboardType;

@end
