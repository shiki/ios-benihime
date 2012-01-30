//
//  BMacros.h
//
//  Created by Shiki on 11/23/11.
//

// stolen from Three20
#define B_RELEASE_SAFELY(__POINTER) { [__POINTER release]; __POINTER = nil; }