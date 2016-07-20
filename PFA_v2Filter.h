//
//  PFA_v2Filter.h
//  PFA_v2
//
//  Copyright (c) 2016 EM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OsiriXAPI/PluginFilter.h>
#import "OsiriX Headers/DCMObject.h"
#import "OsiriX Headers/DCMAttribute.h"
#import "Osirix Headers/DCMAttributeTag.h"

@interface PFA_v2Filter : PluginFilter {

}

- (long) filterImage : (NSString*) menuName;

- (NSDictionary *) referencePointSetup : (NSString *) menuChoice;

- (NSString *) probeDicomHdr : (DCMPix *) thisPix tagID : (NSString *) tagID;

@end
