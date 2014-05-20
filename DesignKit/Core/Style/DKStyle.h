//
// Created by Dal Rupnik on 13/05/14.
// Copyright (c) 2014 arvystate.net. All rights reserved.
//

@interface DKStyle : NSObject

/*!
 * Holds a specific class name
 */
@property (nonatomic, readonly) NSString* styleKey;

/*!
 * Holds style properties
 */
@property (nonatomic, readonly) NSDictionary* properties;

/*!
 * Returns style properties as property list, compatible with NUI
 */
@property (nonatomic, readonly) NSDictionary *propertiesPropertyList;

/*!
 * Designated initializer initializes new style with provided property list in NUI format
 */
- (id)initWithStyleKey:(NSString *)styleKey properties:(NSDictionary *)dictionary;

/*!
 * Creates new style object with key
 */
- (id)initWithStyleKey:(NSString *)styleKey;

/*!
 * Returns property for specific key
 */
- (id)propertyForKey:(NSString *)key;

/*!
 * Currently key is appended the state as a new key
 * Normal state has no additional string.
 */
- (id)propertyForKey:(NSString *)key forState:(UIControlState)state;

//
// TODO: Documentation
//
- (void)setPropertyForKey:(NSString *)key withProperty:(id)object;

- (void)setPropertyForKey:(NSString *)key withProperty:(id)object forState:(UIControlState)state;


/*!
 * Collection methods to allow easier access to properties itself
 */
- (id)objectForKeyedSubscript:(id)key;

- (void)setObject:(id)object forKeyedSubscript:(id<NSCopying>)aKey;

@end