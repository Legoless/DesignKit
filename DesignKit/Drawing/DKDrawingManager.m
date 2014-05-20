//
// Created by Dal Rupnik on 18/05/14.
// Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import <Haystack/Haystack.h>

#import "DKDrawingManager.h"

@interface DKDrawingManager ()

@property (nonatomic, strong) NSMutableDictionary *blocks;
@property (nonatomic, strong) NSMutableDictionary *references;

@end


@implementation DKDrawingManager

- (NSMutableDictionary *)references
{
    if (!_references)
    {
        _references = [NSMutableDictionary dictionary];
    }

    return _references;
}

- (NSMutableDictionary *)blocks
{
    if (!_blocks)
    {
        _blocks = [NSMutableDictionary dictionary];
    }

    return _blocks;
}

- (DKDrawingBlock)drawingBlockForObject:(id)object
{
    NSValue *value = [NSValue valueWithPointer:(__bridge const void *)object];

    //
    // If we have a dictionary block, return first object
    //
    if ([self.blocks[value] isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *dictionary = self.blocks[value];

        return [dictionary.allValues firstObject];
    }

    return self.blocks[value];

}

- (NSDictionary *)drawingBlocksForObject:(id)object
{
    NSValue *value = [NSValue valueWithPointer:(__bridge const void *)object];

    //NSLog(@"Getting drawing blocks for object: %@", object);

    if (![self.blocks[value] isKindOfClass:[NSDictionary class]])
    {
        return nil;
    }
    else
    {
        return self.blocks[value];
    }
}

- (void)setDrawingBlock:(DKDrawingBlock)drawingBlock forObject:(id)object
{
    NSValue *value = [NSValue valueWithPointer:(__bridge const void *)object];

    self.blocks[value] = drawingBlock;
    self.references[value] = [HSWeakPointer weakPointerWithObject:object];

    [self clean];
}

- (void)setDrawingBlocks:(NSDictionary *)drawingBlocks forObject:(id)object
{
    NSValue *value = [NSValue valueWithPointer:(__bridge const void *)object];

    //NSLog(@"Setting drawing block for object: %@", object);

    //
    // Should loop over blocks to add them correctly
    //

    if (!self.blocks[value])
    {
        self.blocks[value] = [NSMutableDictionary dictionary];
    }

    for (id key in drawingBlocks)
    {
        self.blocks[value][key] = drawingBlocks[key];
    }

    //self.blocks[value] = drawingBlocks;
    self.references[value] = [HSWeakPointer weakPointerWithObject:object];

    [self clean];
}

/*!
 * This function will clean up all nilled blocks
 */
- (void)clean
{
    NSMutableArray *pointersToRemove = [NSMutableArray array];

    for (id key in self.references)
    {
        if (![self.references[key] isValid])
        {
            [pointersToRemove addObject:key];
        }
    }

    //
    // Remove all references and blocks, so we do not have a memory leak
    //
    for (id key in pointersToRemove)
    {
        [self.references removeObjectForKey:key];
        [self.blocks removeObjectForKey:key];
    }
}

@end