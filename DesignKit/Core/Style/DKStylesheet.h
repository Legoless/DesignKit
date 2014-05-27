//
// Created by Dal Rupnik on 13/05/14.
// Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import "DKStyle.h"

/*!
 * Stylesheet that can be created from a NSS file
 */
@interface DKStylesheet : NSObject

/*!
 * File path, if this is nil, the style was probably built by code.
 */
@property (nonatomic, readonly) NSString* filePath;

/*!
 * Contains DKStyle objects that the stylesheet contains, dictionary key is the style key
 */
@property (nonatomic, readonly) NSDictionary* styles;

/*!
 * Returns dictionary as a property list, extracted from styles dictionary
 */
@property (nonatomic, readonly) NSDictionary* stylePropertyList;

/*!
 * Initializes empty dictionary with file path
 */
- (id)initWithFilePath:(NSString *)filePath;

/*!
 * Same to alloc/init and calling appendStyles
 */
- (id)initWithStyles:(id)styles;

/*!
 * Returns style for specific object class, nil if there is no style defined
 */
- (DKStyle *)styleForClass:(Class)class;

/*!
 * Returns style for specific style key
 */
- (DKStyle *)styleForStyleKey:(NSString *)styleKey;

/*!
 * Function appends and overwrites existing styles.
 *
 * Two types of parameters are expected:
 *  - NSArray of DKStyle classes with keys
 *  - NSDictionary of property lists in NUI format (dictionary keys must be style keys)
 *  - NSDictionary of DKStyle classes (since DKStyle has styleKey property, we do not need the dictionary keys to match them)
 *
 *  @throws exception on wrong parameter type.
 */
- (void)appendStyles:(id)styles;

/*!
 * Function adds/overwrites existing style and creates new DKStyle object
 */
- (void)addStyle:(NSDictionary *)style withStyleKey:(NSString *)styleKey;

/*!
 * Function adds/overwrites style
 */
- (void)addStyle:(DKStyle *)style;

/*!
 * Stores stylesheet and appends .nss extension
 */
- (void)exportToFile:(NSString *)path;

@end