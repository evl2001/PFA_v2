//
//  PFA_v2Filter.m
//  PFA_v2
//
//  Copyright (c) 2016 EM. All rights reserved.
//

#import "PFA_v2Filter.h"
#import "LauncherGUI.h"

@implementation PFA_v2Filter

- (void) initPlugin
{
}

- (long) filterImage:(NSString *) menuName
{
    NSString *defaultChoice = [[NSString alloc] initWithString : @"PFA_v2"];
    NSDictionary *pfaDict;
    
    if ([menuName isEqualToString : defaultChoice]) {
        LauncherGUI *l = [[LauncherGUI alloc] initWithWindowNibName : @"LauncherGUI"];
        [l  showWindow : self];
        
    } else {
        pfaDict = [self referencePointSetup : menuName];
    }
    return 0;

}

- (NSDictionary *) referencePointSetup:(NSString *) menuChoice
{
    NSString *umbChoice = [[NSString alloc] initWithString : @"PFA - Umbilicus (UMB)"];
    NSString *umbString = [[NSString alloc] initWithString : @"UMB"];
    
    NSString *igcChoice = [[NSString alloc] initWithString : @"PFA - Inferior Gluteal Crease (IGC)"];
    NSString *igcString = [[NSString alloc] initWithString : @"IGC"];
    
    NSString *sgcChoice = [[NSString alloc] initWithString : @"PFA - Superior Gluteal Crease (SGC)"];
    NSString *sgcString = [[NSString alloc] initWithString : @"SGC"];
    
//    NSString *ssnChoice = [[NSString alloc] initWithString: @"PFA - Suprasternal Notch (SSN)"];
//    NSString *ssnString = [[NSString alloc] initWithString: @"SSN"];
    
    NSDictionary *pfaDict;
    
    if ([menuChoice isEqualToString : umbChoice] || [menuChoice isEqualToString : umbString]) {
        pfaDict = [NSDictionary dictionaryWithObjectsAndKeys: @"", @"score", @"normal", @"state", [NSArchiver archivedDataWithRootObject: [NSColor whiteColor]], @"color", nil];
    } else if ([menuChoice isEqualToString : igcChoice] || [menuChoice isEqualToString : igcString]) {
        pfaDict = [NSDictionary dictionaryWithObjectsAndKeys: @"", @"score", @"normal", @"state", [NSArchiver archivedDataWithRootObject: [NSColor whiteColor]], @"color", nil];
    } else if ([menuChoice isEqualToString : sgcChoice] || [menuChoice isEqualToString : sgcString]) {
        pfaDict = [NSDictionary dictionaryWithObjectsAndKeys: @"", @"score", @"normal", @"state", [NSArchiver archivedDataWithRootObject: [NSColor whiteColor]], @"color", nil];
    } else { //if ([menuChoice isEqualToString : ssnChoice] || [menuChoice isEqualToString : ssnString]) {
        pfaDict = [NSDictionary dictionaryWithObjectsAndKeys: @"", @"score", @"normal", @"state", [NSArchiver archivedDataWithRootObject: [NSColor whiteColor]], @"color", nil];
    }
    
    return pfaDict;
}

- (NSString *) probeDicomHdr : (DCMPix *) thisPix tagID : (NSString *) tagID
{
    DCMAttributeTag *dcmTag;
    DCMObject       *dcmObj;
    DCMAttribute    *dcmAttr;
    //DCMAttributeTag *dcmAttrTag;
    
    NSString		*dcmPatientName;
    NSString		*dcmPatientMRN;
    NSString        *dcmPatientAcqDate;
    NSString		*dcmStudyID;
    NSString		*dcmSeriesNum;
    
    
    dcmFilePath = [thisPix sourceFile];
    dcmObj = [DCMObject objectWithContentsOfFile: dcmFilePath decodingPixelData: NO];
    
    NSString* tmp;
    
    // get patient name
    //dcmPatientTag = @"0010,0010"; // patient name
    dcmTag = [DCMAttributeTag tagWithTagString:tagID];
    dcmAttr = [dcmObj attributeForTag: dcmTag];
    dcmPatientName = [[dcmAttr value] description];
}

@end
