//
//  MainViewController.m
//  VHKeyboardTest
//
//  Created by HoangNIIT on 7/7/14.
//  Copyright (c) 2014 FlyingCatSoftware. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _mainScrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height + 400);
    
    //set keyboard for text
    [[VHKeyboard shareInstance] keyboardForTextField:_txtNumpad keyboardType:VHKey_NumberPad];
    [[VHKeyboard shareInstance] keyboardForTextField:_txtPhonepad keyboardType:VHKey_PhonePad];
    [[VHKeyboard shareInstance] keyboardForTextField:_txtWebBrowserPad keyboardType:VHKey_WebBrowserPad];
    [[VHKeyboard shareInstance] keyboardForTextField:_txtCalendarPad keyboardType:VHKey_CarlendarPad];
    [[VHKeyboard shareInstance] keyboardForTextField:_txtTextPad keyboardType:VHkey_TextPad];
    
    //set textfield delegate for scroll view scroll to focus view
    _txt1ColPad.delegate = self;
    _txt2ColPad.delegate = self;
    _txt3ColPad.delegate = self;
}

//use this to set data for multicolum textfield
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (textField == _txt1ColPad) {
        NSArray *arr1 = [NSArray arrayWithObjects:@"iPhone 2G",@"iPhone 3G",@"iPhone 3GS",@"iPhone 4",@"iPhone 4S",@"iPhone 5",@"iPhone 5C",@"iPhone 5S",nil];
        [[VHKeyboard shareInstance] setVHKeyboardData:arr1 Data2:nil Data3:nil];
        [[VHKeyboard shareInstance] keyboardForTextField:_txt1ColPad keyboardType:VHKey_CustomeData1Cols];
    }else if (textField == _txt2ColPad){
        NSArray *arr1 = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",nil];
        NSArray *arr2 = [NSArray arrayWithObjects:@"one",@"two",@"three",@"four",@"five",@"six",@"seven",@"eight",@"nine",@"ten",nil];
        [[VHKeyboard shareInstance] setVHKeyboardData:arr1 Data2:arr2 Data3:nil];
        [[VHKeyboard shareInstance] keyboardForTextField:_txt2ColPad keyboardType:VHKey_CustomeData2Cols];
    }else if (textField == _txt3ColPad){
        NSArray *arr1 = [NSArray arrayWithObjects:@"Mr.",@"Mrs.",@"Ms.",@"Miss",@"Dr.",nil];
        NSArray *arr2 = [NSArray arrayWithObjects:@"Incredible",@"Captain",@"Iron",@"Hawk",@"Black",@"Nick",@"Winter",nil];
        NSArray *arr3 = [NSArray arrayWithObjects:@"Widow",@"America",@"Nam",@"Eye",@"Fury",@"Hulk",@"Sodier",nil];
        [[VHKeyboard shareInstance] setVHKeyboardData:arr1 Data2:arr2 Data3:arr3];        
        [[VHKeyboard shareInstance] keyboardForTextField:_txt3ColPad keyboardType:VHKey_CustomeData3Cols];
    }else{
    
    }
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
