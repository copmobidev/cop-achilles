//
//  LCDefine.h
//  Achilles
//
//  Created by weiyanen on 13-6-5.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#ifndef Achilles_LCDefine_h
#define Achilles_LCDefine_h

#define IS_HEIGHT_GTE_568 [[UIScreen mainScreen ] bounds].size.height >= 568.0f

#define LCSINGLETON_IN_H(classname) \
+ (id)sharedInstance;

#define LCSINGLETON_IN_M(classname) \
\
__strong static id _shared##classname = nil; \
\
+ (id)sharedInstance { \
@synchronized(self) \
{ \
if (_shared##classname == nil) \
{ \
_shared##classname = [[super allocWithZone:NULL] init]; \
} \
} \
return _shared##classname; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
return [self sharedInstance]; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return self; \
}

#endif	// End of File
