#import <substrate.h>

bool (*old_func)(int);
bool new_func(int) {
	return true;
}
%ctor
{

	// 二进制文件路劲
	NSString *binaryFilepath = [[NSBundle mainBundle] executablePath];
	NSLog(@"binaryFilepath = %@", binaryFilepath);
	MSImageRef image = MSGetImageByName([binaryFilepath UTF8String]);
	if (image) {
		// 一定要加一个下划线
		void *func = MSFindSymbol(image,"__HXClotho_isSpecialServiceOrdered__ ");
		if (func) {
			MSHookFunction(func,(void*)new_func,(void**)&old_func);
		} else {
			NSLog(@"no found __HXClotho_isSpecialServiceOrdered__");
		}

		*func = MSFindSymbol(image,"__HXClotho_isSpecial103ServiceOrdered__ ");
		if (func) {
			MSHookFunction(func,(void*)new_func,(void**)&old_func);
		} else {
			NSLog(@"no found __HXClotho_isSpecial103ServiceOrdered__");
		}
		
		*func = MSFindSymbol(image,"__HXClotho_isSpecial102ServiceOrdered__ ");
		if (func) {
			MSHookFunction(func,(void*)new_func,(void**)&old_func);
		} else {
			NSLog(@"no found __HXClotho_isSpecial102ServiceOrdered__");
		}

		*func = MSFindSymbol(image,"__HXClotho_getFuncWithSid_bit__ ");
		if (func) {
			MSHookFunction(func,(void*)new_func,(void**)&old_func);
		} else {
			NSLog(@"no found __HXClotho_getFuncWithSid_bit__");
		}

	} else {
		NSLog(@"no found image");
	}
}
