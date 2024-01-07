#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "UKThreadSafeMutableArray.h"
#import "UKThreadSafeMutableDictionary.h"

FOUNDATION_EXPORT double UKThreadSafeObjcVersionNumber;
FOUNDATION_EXPORT const unsigned char UKThreadSafeObjcVersionString[];

