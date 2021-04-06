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
		void *spec = MSFindSymbol(image,"__HXClotho_isSpecialServiceOrdered__ ");
		if (spec) {
			MSHookFunction(spec,(void*)new_func,(void**)&old_func);
		} else {
			NSLog(@"no found __HXClotho_isSpecialServiceOrdered__");
		}

		void *spec103 = MSFindSymbol(image,"__HXClotho_isSpecial103ServiceOrdered__ ");
		if (spec103) {
			MSHookFunction(spec103,(void*)new_func,(void**)&old_func);
		} else {
			NSLog(@"no found __HXClotho_isSpecial103ServiceOrdered__");
		}
		
		void *spec102 = MSFindSymbol(image,"__HXClotho_isSpecial102ServiceOrdered__ ");
		if (spec102) {
			MSHookFunction(spec102,(void*)new_func,(void**)&old_func);
		} else {
			NSLog(@"no found __HXClotho_isSpecial102ServiceOrdered__");
		}

		void *getFunc = MSFindSymbol(image,"__HXClotho_getFuncWithSid_bit__ ");
		if (getFunc) {
			MSHookFunction(getFunc,(void*)new_func,(void**)&old_func);
		} else {
			NSLog(@"no found __HXClotho_getFuncWithSid_bit__");
		}

	} else {
		NSLog(@"no found image");
	}
}
