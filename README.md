#VHKeyboard
==========
VHKeyboard were objective C classes help developers simple the keyboard coding for development iOS application, I created them as an instance for people can modify it easy.

They all free, and you can edit them for your personal target.

#Prepare
==========
If you want to use these classes, just simple download it and import it to your project (2 objective C files : VHkeyboard.h and VHKeyboard.m) the functions to use it I will introduce on the description below, but for real experiences you can download the example project

#How to
==========
0)import the class name (VHKeyboard.h) to your controller where you want to use VHKeyboard by code

import "VHKeyboard.h"

2)Set the keyboard type for textfield
**********************************
(*)Set the text pad keyboard for textfield by using the following code

[[VHKeyboard shareInstance] keyboardForTextField:yourTextField keyboardType:VHkey_TextPad];

**********************************
(*)Set the phone pad keyboard for textfield by using the following code

[[VHKeyboard shareInstance] keyboardForTextField:yourTextField keyboardType:VHKey_PhonePad];

**********************************
(*)Set the number pad keyboard for textfield by using the following code

[[VHKeyboard shareInstance] keyboardForTextField:yourTextField keyboardType:VHKey_NumberPad];

**********************************
(*)Set the calendar pad keyboard for textfield by using the following code

[[VHKeyboard shareInstance] keyboardForTextField:yourTextField keyboardType:VHKey_CarlendarPad];

**********************************
(*)Set the Web Browser Pad keyboard for textfield by using the following code

[[VHKeyboard shareInstance] keyboardForTextField:yourTextField keyboardType:VHKey_WebBrowserPad];

**********************************
(*)Set the data for 1 Col Data keyboard for textfield by using the following code
on the function
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{

    if (textField == yourTextField) {

        NSArray *arr1 = [NSArray arrayWithObjects:@"iPhone 2G",@"iPhone 3G",@"iPhone 3GS",@"iPhone 4",@"iPhone 4S",@"iPhone 5",@"iPhone 5C",@"iPhone 5S",nil];

        [[VHKeyboard shareInstance] setVHKeyboardData:arr1 Data2:nil Data3:nil];

        [[VHKeyboard shareInstance] keyboardForTextField:yourTextField keyboardType:VHKey_CustomeData1Cols];

    }

**********************************
(*)Set the data for 2 Cols Data keyboard for textfield by using the following code
on the function
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{

    if (textField == yourTextField) {

        NSArray *arr1 = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",nil];

        NSArray *arr2 = [NSArray arrayWithObjects:@"one",@"two",@"three",@"four",@"five",@"six",@"seven",@"eight",@"nine",@"ten",nil];

        [[VHKeyboard shareInstance] setVHKeyboardData:arr1 Data2:arr2 Data3:nil];

        [[VHKeyboard shareInstance] keyboardForTextField:yourTextField keyboardType:VHKey_CustomeData2Cols];

    }
**********************************
(*)Set the data for 2 Cols Data keyboard for textfield by using the following code
onthe function
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{

    if (textField == yourTextField) {

        NSArray *arr1 = [NSArray arrayWithObjects:@"Mr.",@"Mrs.",@"Ms.",@"Miss",@"Dr.",nil];

        NSArray *arr2 = [NSArray arrayWithObjects:@"Incredible",@"Captain",@"Iron",@"Hawk",@"Black",@"Nick",@"Winter",nil];

        NSArray *arr3 = [NSArray arrayWithObjects:@"Widow",@"America",@"Nam",@"Eye",@"Fury",@"Hulk",@"Sodier",nil];

        [[VHKeyboard shareInstance] setVHKeyboardData:arr1 Data2:arr2 Data3:arr3];

        [[VHKeyboard shareInstance] keyboardForTextField:yourTextField keyboardType:VHKey_CustomeData3Cols];

    }
**********************************
