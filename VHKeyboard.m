//
//  VHKeyboard.h
//  VHkeyboard by HoangNIIT
//  email: hoangniitsoftware@gmail.com
//  It's a free Objective C class, you can custom this class
//
//  Created by HoangNIIT on 7/3/14.
//  Copyright (c) 2014 FlyingCatSoftware. All rights reserved.
//

#import "VHKeyboard.h"

static VHKeyboard *_shareInstance;

@implementation VHKeyboard{
    UIToolbar *VHKey_Toolbar;
    NSMutableDictionary *VHKey_data;
    UITextField *VHTextFiels;
    UIDatePicker *datePicker;
    NSDateFormatter *VHDateFormatter;
    UIPickerView *dataPicker;
    VHKeyboardType vhKeyType;
    UIPasteboard *pasteboard;
}

@synthesize VHKey_DateFormat;

#pragma mark - create Instance

+(VHKeyboard *)shareInstance{
    if (!_shareInstance) {
        _shareInstance = [[VHKeyboard alloc] init];
    }
    return _shareInstance;
}

#pragma mark - create VHkeyboard

-(void)keyboardForTextField:(UITextField *)textField keyboardType:(VHKeyboardType)keyboardType{
    vhKeyType = keyboardType;
    switch (keyboardType) {
        case VHKey_NumberPad:
        {
            [self createVHKey_NumberPad:textField];
        }
            break;
        case VHKey_PhonePad:
        {
            [self createVHKey_PhonePad:textField];
        }
            break;
        case VHKey_CarlendarPad:
        {
            [self createVHKey_CalendarPad:textField];
        }
            break;
        case VHkey_TextPad:
        {
            [self createVHkey_TextPad:textField];
        }
            break;
        case VHKey_CustomeData1Cols:
        {
            [self createVHKey_CustomeData1Cols:textField];
        }
            break;
        case VHKey_CustomeData2Cols:
        {
            [self createVHKey_CustomeData2Cols:textField];
        }
            break;
        case VHKey_CustomeData3Cols:
        {
            [self createVHKey_CustomeData3Cols:textField];
        }
            break;
        case VHKey_WebBrowserPad:
        {
            [self createVHKey_WebBrowserPad:textField];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - create Keyboard data

-(void)setVHKeyboardData:(NSArray *)data1 Data2:(NSArray *)data2 Data3:(NSArray *)data3{
    VHKey_data = nil;
    VHKey_data = [[NSMutableDictionary alloc] init];
    
    [VHKey_data setValue:data1 forKey:@"Data 1"];
    [VHKey_data setValue:data2 forKey:@"Data 2"];
    [VHKey_data setValue:data3 forKey:@"Data 3"];
    
    [self createVKKey_DataPickerView];
    [dataPicker reloadAllComponents];
}

#pragma mark - create data picker

-(UIPickerView *)createVKKey_DataPickerView{
    if (!dataPicker) {
        dataPicker = [[UIPickerView alloc] init];
    }
    dataPicker.frame = CGRectMake(0, 0, 320, 80);
    dataPicker.dataSource = self;
    dataPicker.delegate = self;
    return dataPicker;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    switch (vhKeyType) {
        case VHKey_CustomeData1Cols:
            return 1;
            break;
        case VHKey_CustomeData2Cols:
            return 2;
            break;
        case VHKey_CustomeData3Cols:
            return 3;
            break;
        default:
            return 0;
            break;
    }
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSArray *data1Arr = [VHKey_data valueForKey:@"Data 1"];
    NSArray *data2Arr = [VHKey_data valueForKey:@"Data 2"];
    NSArray *data3Arr = [VHKey_data valueForKey:@"Data 3"];
    switch (component) {
        case 0:
        {
            return [data1Arr count];
        }
            break;
        case 1:
        {
            return [data2Arr count];
        }
            break;
        case 2:
        {
            return [data3Arr count];
        }
            break;
            
        default:{
            return 0;
        }
            break;
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    [self VHKey_Textfield_setStringValue:nil];
    NSInteger numberOfComponent = dataPicker.numberOfComponents;
    
    NSArray *data1Arr = [VHKey_data valueForKey:@"Data 1"];
    NSArray *data2Arr = [VHKey_data valueForKey:@"Data 2"];
    NSArray *data3Arr = [VHKey_data valueForKey:@"Data 3"];
    
    switch (numberOfComponent) {
        case 1:
        {
            if ((data1Arr != nil) || ([data1Arr count]>0)) {
                [self VHKey_Textfield_setStringValue:[data1Arr objectAtIndex:row]];
            }else{
                [self VHKey_Textfield_setStringValue:nil];
            }
        }
            break;
        case 2:
        {
            NSString *str1 = @"";
            NSString *str2 = @"";
            if ((data1Arr != nil) || ([data1Arr count]>0)) {
                str1 = [data1Arr objectAtIndex:[dataPicker selectedRowInComponent:0]];
            }
            if ((data2Arr != nil) || ([data2Arr count]>0)) {
                str2 = [data2Arr objectAtIndex:[dataPicker selectedRowInComponent:1]];
            }
            NSString *focusStr = [[str1 stringByAppendingString:@" "] stringByAppendingString:str2];
            [self VHKey_Textfield_setStringValue:focusStr];
        }
            break;
        case 3:
        {
            NSString *str1 = @"";
            NSString *str2 = @"";
            NSString *str3 = @"";
            if ((data1Arr != nil) || ([data1Arr count]>0)) {
                str1 = [data1Arr objectAtIndex:[dataPicker selectedRowInComponent:0]];
            }
            if ((data2Arr != nil) || ([data2Arr count]>0)) {
                str2 = [data2Arr objectAtIndex:[dataPicker selectedRowInComponent:1]];
            }
            if ((data3Arr != nil) || ([data3Arr count]>0)) {
                str3 = [data3Arr objectAtIndex:[dataPicker selectedRowInComponent:2]];
            }
            NSString *focusStr = [[[[str1 stringByAppendingString:@" "] stringByAppendingString:str2] stringByAppendingString:@" "]stringByAppendingString:str3];
            [self VHKey_Textfield_setStringValue:focusStr];
        }
            break;
            
        default:{
            [self VHKey_Textfield_setStringValue:nil];
        }
            break;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSArray *data1Arr = [VHKey_data valueForKey:@"Data 1"];
    NSArray *data2Arr = [VHKey_data valueForKey:@"Data 2"];
    NSArray *data3Arr = [VHKey_data valueForKey:@"Data 3"];
    switch (component) {
        case 0:
        {
            return [data1Arr objectAtIndex:row];
        }
            break;
        case 1:
        {
            return [data2Arr objectAtIndex:row];
        }
            break;
        case 2:
        {
            return [data3Arr objectAtIndex:row];
        }
            break;
        default: return @"";
            break;
    }
}

#pragma mark - create date picker

-(UIDatePicker *)createVKKey_DatePickerView{
    if (!datePicker) {
        datePicker = [[UIDatePicker alloc] init];
    }
    datePicker.frame = CGRectMake(0, 0, 320, 80);
    [datePicker addTarget:self action:@selector(VHKeyCalendarChangedValue) forControlEvents:UIControlEventValueChanged];
    datePicker.timeZone = [NSTimeZone defaultTimeZone];
    datePicker.datePickerMode = UIDatePickerModeDate;
    return datePicker;
}

#pragma mark - create keyboard toolbar

-(UIToolbar *)createVHKey_ToolbarWeb{
    UIToolbar* toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    toolbar.barStyle = UIBarStyleDefault;
    toolbar.items = [NSArray arrayWithObjects:                     
                     [[UIBarButtonItem alloc]initWithTitle:@"http://" style:UIBarButtonItemStylePlain target:self action:@selector(VHKeyTapHTTP)],
                     [[UIBarButtonItem alloc]initWithTitle:@"www." style:UIBarButtonItemStylePlain target:self action:@selector(VHKeyTapWWW)],
                     [[UIBarButtonItem alloc]initWithTitle:@".org" style:UIBarButtonItemStylePlain target:self action:@selector(VHKeyTapDotOrg)],
                     [[UIBarButtonItem alloc]initWithTitle:@".net" style:UIBarButtonItemStylePlain target:self action:@selector(VHKeyTapDotNet)],
                     [[UIBarButtonItem alloc]initWithTitle:@".com" style:UIBarButtonItemStylePlain target:self action:@selector(VHKeyTapDotCom)],
                     [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                     [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneVHKey)],
                     nil];
    [toolbar sizeToFit];
    return toolbar;
}

-(UIToolbar *)createVHKey_ToolbarText{
    UIToolbar* toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    toolbar.barStyle = UIBarStyleDefault;
    toolbar.items = [NSArray arrayWithObjects:
                     [[UIBarButtonItem alloc]initWithTitle:@"Select All" style:UIBarButtonItemStylePlain target:self action:@selector(VHKeyTapSelectAll)],
                     [[UIBarButtonItem alloc]initWithTitle:@"Copy" style:UIBarButtonItemStylePlain target:self action:@selector(VHkeyTapCopy)],
                     [[UIBarButtonItem alloc]initWithTitle:@"Paste" style:UIBarButtonItemStylePlain target:self action:@selector(VHkeyTapPaste)],
                     [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                     [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneVHKey)],
                     nil];
    [toolbar sizeToFit];
    return toolbar;
}

-(UIToolbar *)createVHKey_Toolbar{
    UIToolbar* toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    toolbar.barStyle = UIBarStyleDefault;
    toolbar.items = [NSArray arrayWithObjects:
                     [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                     [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneVHKey)],
                     nil];
    [toolbar sizeToFit];
    return toolbar;
}

#pragma mark - toolbar button action

-(void)VHKeyTapSelectAll{
    [self VHKey_Textfield_selectAllText];
}

-(void)VHkeyTapCopy{
    [self VHKey_Textfield_copySelectedText];
}

-(void)VHkeyTapPaste{
    [self VHKey_Textfield_PasteClipboardText];
}

-(void)doneVHKey{
    [[UIApplication sharedApplication].keyWindow.rootViewController.view endEditing:YES];
}

-(void)VHKeyTapWWW{
    [self VHKey_Textfield_setStringValue:@"www."];
}

-(void)VHKeyTapHTTP{
    [self VHKey_Textfield_setStringValue:@"http://"];
}

-(void)VHKeyTapDotOrg{
    [self VHKey_Textfield_setStringValue:@".org"];
}

-(void)VHKeyTapDotNet{
    [self VHKey_Textfield_setStringValue:@".net"];
}

-(void)VHKeyTapDotCom{
    [self VHKey_Textfield_setStringValue:@".com"];
}

-(void)VHKeyCalendarChangedValue{
    [self VHKey_Textfield_setStringValue:nil];
    if (!VHKey_DateFormat) {
        VHKey_DateFormat = VHKey_LongDateMonthYearDate;
    }
    VHDateFormatter = [[NSDateFormatter alloc] init];
    switch (VHKey_DateFormat) {
        case VHKey_LongDateMonthYearDate:
        {
            [VHDateFormatter setDateFormat:@"dd MMMM yyyy"];
        }
            break;
        case VHKey_ShortDateMonthYearDate:
        {
            [VHDateFormatter setDateFormat:@"dd/MM/yyyy"];
        }
            break;
        case VHKey_LongMonthDateYearDate:
        {
            [VHDateFormatter setDateFormat:@"MMMM dd yyyy"];
        }
            break;
        case VHKey_ShortMonthDateYearDate:
        {
            [VHDateFormatter setDateFormat:@"MM/dd/yyyy"];
        }
            break;
        case VHKey_LongMonthYear:
        {
            [VHDateFormatter setDateFormat:@"MMMM yyyy"];
        }
            break;
        case VHKey_ShortMonthYear:
        {
            [VHDateFormatter setDateFormat:@"MM/yyyy"];
        }
            break;
            
        default:
            break;
    }
    NSString *newDate = [VHDateFormatter stringFromDate:datePicker.date];
    [self VHKey_Textfield_setStringValue:newDate];
}

#pragma mark - other function

-(UIView *)VHkey_Get_ActiveView{
    UIViewController *rootController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    UIView *focusView = [[UIView alloc] init];
    
    if ([rootController isKindOfClass:[UINavigationController class]]) {
        focusView = [((UINavigationController *) rootController) visibleViewController].view;
    } else if ([rootController isKindOfClass:[UITabBarController class]]) {
        focusView = [((UITabBarController *) rootController) selectedViewController].view;
    } else {
        if (rootController.presentedViewController) {
            focusView = rootController.presentedViewController.view;
        } else {
            focusView = rootController.view;
        }
    }
    
    return focusView;
}

-(BOOL)processCheckAndSetVHKey_textField:(UIView *)view setText:(NSString *)strValue{
    if ([view isKindOfClass:[UITextField class]]) {
        if ([((UITextField *)view) isFirstResponder]) {
            if (!strValue) {
                ((UITextField *)view).text = @"";
            }else{
                ((UITextField *)view).text = [((UITextField *)view).text stringByAppendingString:strValue];
            }
            return YES;
        }else{
            return NO;
        }
    }else{
        return NO;
    }
}

-(BOOL)processCheckAndSelectAllTextInTextfield:(UIView *)view{
    if ([view isKindOfClass:[UITextField class]]) {
        if ([((UITextField *)view) isFirstResponder]) {
            ((UITextField *)view).selectedTextRange = [((UITextField *)view) textRangeFromPosition:((UITextField *)view).beginningOfDocument toPosition:((UITextField *)view).endOfDocument];
            return YES;
        }else{
            return NO;
        }
    }else{
        return NO;
    }
}

-(BOOL)processCheckAndCopySelectedTextInTextfield:(UIView *)view{
    if ([view isKindOfClass:[UITextField class]]) {
        if ([((UITextField *)view) isFirstResponder]) {
            pasteboard = [UIPasteboard generalPasteboard];
            UITextField *focusTextfield = ((UITextField *)view);
            NSString *selectedStr = [focusTextfield textInRange:[focusTextfield selectedTextRange]];
            if ((selectedStr.length == 0) || (!selectedStr)) {
                selectedStr = focusTextfield.text;
            }
            pasteboard.string = selectedStr;
            return YES;
        }else{
            return NO;
        }
    }else{
        return NO;
    }
}

-(BOOL)processCheckAndPasteClipboardTextToTextfield:(UIView *)view{
    if ([view isKindOfClass:[UITextField class]]) {
        if ([((UITextField *)view) isFirstResponder]) {
            pasteboard = [UIPasteboard generalPasteboard];
            NSString *clipboardText = pasteboard.string;
            if (clipboardText.length > 0) {
                ((UITextField *)view).text = [((UITextField *)view).text stringByAppendingString:clipboardText];;
            }else{
                ((UITextField *)view).text = @"";
            }
            return YES;
        }else{
            return NO;
        }
    }else{
        return NO;
    }
}

-(void)VHKey_Textfield_PasteClipboardText{
    UIView *focusView = [self VHkey_Get_ActiveView];
    BOOL processDone = NO;
    for (UIView *childView in [focusView subviews]) {
        processDone = [self processCheckAndPasteClipboardTextToTextfield:childView];
        if (processDone == NO) {
            for (UIView *childOfChildView in [childView subviews]) {
                processDone = [self processCheckAndPasteClipboardTextToTextfield:childOfChildView];
                if (processDone == NO) {
                    for (UIView *childOfChildOfChildView in [childOfChildView subviews]) {
                        processDone = [self processCheckAndPasteClipboardTextToTextfield:childOfChildOfChildView];
                        if (processDone == NO) {
                            for (UIView *otherChild in [childOfChildOfChildView subviews]) {
                                processDone = [self processCheckAndPasteClipboardTextToTextfield:otherChild];
                                if (processDone == NO) {
                                    for (UIView *theLastOne in [otherChild subviews]) {
                                        processDone = [self processCheckAndPasteClipboardTextToTextfield:theLastOne];
                                        if (processDone == NO) {
                                            for (UIView *howTheFunnyView in [theLastOne subviews]) {
                                                [self processCheckAndPasteClipboardTextToTextfield:howTheFunnyView];
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

-(void)VHKey_Textfield_copySelectedText{
    UIView *focusView = [self VHkey_Get_ActiveView];
    BOOL processDone = NO;
    for (UIView *childView in [focusView subviews]) {
        processDone = [self processCheckAndCopySelectedTextInTextfield:childView];
        if (processDone == NO) {
            for (UIView *childOfChildView in [childView subviews]) {
                processDone = [self processCheckAndCopySelectedTextInTextfield:childOfChildView];
                if (processDone == NO) {
                    for (UIView *childOfChildOfChildView in [childOfChildView subviews]) {
                        processDone = [self processCheckAndCopySelectedTextInTextfield:childOfChildOfChildView];
                        if (processDone == NO) {
                            for (UIView *otherChild in [childOfChildOfChildView subviews]) {
                                processDone = [self processCheckAndCopySelectedTextInTextfield:otherChild];
                                if (processDone == NO) {
                                    for (UIView *theLastOne in [otherChild subviews]) {
                                        processDone = [self processCheckAndCopySelectedTextInTextfield:theLastOne];
                                        if (processDone == NO) {
                                            for (UIView *howTheFunnyView in [theLastOne subviews]) {
                                                [self processCheckAndCopySelectedTextInTextfield:howTheFunnyView];
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

-(void)VHKey_Textfield_selectAllText{
    UIView *focusView = [self VHkey_Get_ActiveView];
    BOOL processDone = NO;
    for (UIView *childView in [focusView subviews]) {
        processDone = [self processCheckAndSelectAllTextInTextfield:childView];
        if (processDone == NO) {
            for (UIView *childOfChildView in [childView subviews]) {
                processDone = [self processCheckAndSelectAllTextInTextfield:childOfChildView];
                if (processDone == NO) {
                    for (UIView *childOfChildOfChildView in [childOfChildView subviews]) {
                        processDone = [self processCheckAndSelectAllTextInTextfield:childOfChildOfChildView];
                        if (processDone == NO) {
                            for (UIView *otherChild in [childOfChildOfChildView subviews]) {
                                processDone = [self processCheckAndSelectAllTextInTextfield:otherChild];
                                if (processDone == NO) {
                                    for (UIView *theLastOne in [otherChild subviews]) {
                                        processDone = [self processCheckAndSelectAllTextInTextfield:theLastOne];
                                        if (processDone == NO) {
                                            for (UIView *howTheFunnyView in [theLastOne subviews]) {
                                                [self processCheckAndSelectAllTextInTextfield:howTheFunnyView];
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

-(void)VHKey_Textfield_setStringValue:(NSString *)strValue{
    UIView *focusView = [self VHkey_Get_ActiveView];
    BOOL processDone = NO;
    for (UIView *childView in [focusView subviews]) {
        processDone = [self processCheckAndSetVHKey_textField:childView setText:strValue];
        if (processDone == NO) {
            for (UIView *childOfChildView in [childView subviews]) {
                processDone = [self processCheckAndSetVHKey_textField:childOfChildView setText:strValue];
                if (processDone == NO) {
                    for (UIView *childOfChildOfChildView in [childOfChildView subviews]) {
                        processDone = [self processCheckAndSetVHKey_textField:childOfChildOfChildView setText:strValue];
                        if (processDone == NO) {
                            for (UIView *otherChild in [childOfChildOfChildView subviews]) {
                                processDone = [self processCheckAndSetVHKey_textField:otherChild setText:strValue];
                                if (processDone == NO) {
                                    for (UIView *theLastOne in [otherChild subviews]) {
                                        processDone = [self processCheckAndSetVHKey_textField:theLastOne setText:strValue];
                                        if (processDone == NO) {
                                            for (UIView *howTheFunnyView in [theLastOne subviews]) {
                                                [self processCheckAndSetVHKey_textField:howTheFunnyView setText:strValue];
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#pragma mark - create Number Pad

-(void)createVHKey_NumberPad:(UITextField *)textField{
    textField.keyboardType = UIKeyboardTypeNumberPad;
    VHKey_Toolbar = [self createVHKey_ToolbarText];
    textField.inputAccessoryView = VHKey_Toolbar;
}

#pragma mark - create Phone Pad

-(void)createVHKey_PhonePad:(UITextField *)textField{
    textField.keyboardType = UIKeyboardTypePhonePad;
    VHKey_Toolbar = [self createVHKey_ToolbarText];
    textField.inputAccessoryView = VHKey_Toolbar;
}

#pragma mark - create calendar pad

-(void)createVHKey_CalendarPad:(UITextField *)textField{
    textField.keyboardType = UIKeyboardTypePhonePad;
    VHKey_Toolbar = [self createVHKey_Toolbar];
    textField.inputAccessoryView = VHKey_Toolbar;
    textField.inputView = [self createVKKey_DatePickerView];
}

#pragma mark - create text pad

-(void)createVHkey_TextPad:(UITextField *)textField{
    textField.keyboardType = UIKeyboardTypeAlphabet;
    VHKey_Toolbar = [self createVHKey_ToolbarText];
    textField.inputAccessoryView = VHKey_Toolbar;
}

#pragma mark - create one cols pad

-(void)createVHKey_CustomeData1Cols:(UITextField *)textField{
    textField.keyboardType = UIKeyboardTypePhonePad;
    VHKey_Toolbar = [self createVHKey_Toolbar];
    textField.inputAccessoryView = VHKey_Toolbar;
    textField.inputView = [self createVKKey_DataPickerView];
}

#pragma mark - create two cols pad

-(void)createVHKey_CustomeData2Cols:(UITextField *)textField{
    textField.keyboardType = UIKeyboardTypePhonePad;
    VHKey_Toolbar = [self createVHKey_Toolbar];
    textField.inputAccessoryView = VHKey_Toolbar;
    textField.inputView = [self createVKKey_DataPickerView];
}

#pragma mark - create three cols pad

-(void)createVHKey_CustomeData3Cols:(UITextField *)textField{
    textField.keyboardType = UIKeyboardTypePhonePad;
    VHKey_Toolbar = [self createVHKey_Toolbar];
    textField.inputAccessoryView = VHKey_Toolbar;
    textField.inputView = [self createVKKey_DataPickerView];
}

#pragma mark - create web browser pad

-(void)createVHKey_WebBrowserPad:(UITextField *)textField{
    textField.keyboardType = UIKeyboardTypeAlphabet;
    VHKey_Toolbar = [self createVHKey_ToolbarWeb];
    textField.inputAccessoryView = VHKey_Toolbar;
}

@end
