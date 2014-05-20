//
// Created by Dal Rupnik on 06/05/14.
// Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import "DKDrawingSource.h"

static NSMutableArray* allSources;

@interface DKDrawingSource ()

@property (nonatomic, strong) NSMutableDictionary* drawingBlocks;

@end

@implementation DKDrawingSource

+ (void)registerSource:(Class)class
{
    @synchronized (self)
    {
        if (!allSources)
        {
            allSources = [NSMutableArray array];
        }

        //
        // This will automatically register all icon source classes
        //
        if ([allSources containsObject:class])
        {
            [allSources addObject:class];
        }
    }
}


+ (void)load
{
    [self registerSource:[self class]];
}

+ (NSArray *)allSources
{
    return [allSources copy];
}

+ (instancetype)source
{
    return [self design];
}

+ (DKDrawingSource *)sourceForTag:(DKDrawingSourceTag *)tag
{
    //
    // Go through all classes in sources and search for tag.
    //
    for (id class in [self allSources])
    {
        DKDrawingSource* source = [class source];

        if ([source containsDrawingBlockForTag:tag])
        {
            return source;
        }
    }

    return nil;
}

- (NSMutableDictionary *)drawingBlocks
{
    if (!_drawingBlocks)
    {
        _drawingBlocks = [NSMutableDictionary dictionary];
    }

    return _drawingBlocks;
}

- (id)init
{
    self = [super init];

    if (self)
    {
        [self setupBlocks];
    }

    return self;
}

- (void)setupBlocks
{
}


- (void)setDrawingBlock:(DKDrawingBlock)drawingBlock forTag:(DKDrawingSourceTag *)tag forState:(UIControlState)state
{
    NSString* controlState = [NSString stringWithFormat:@"%d", state];

    //
    // Create dictionary for the tag
    //
    if (!self.drawingBlocks[tag])
    {
        self.drawingBlocks[tag] = [NSMutableDictionary dictionary];
    }

    self.drawingBlocks[tag][controlState] = drawingBlock;
}

- (DKDrawingBlock)drawingBlockForTag:(DKDrawingSourceTag *)tag forState:(UIControlState)state
{
    NSString* controlState = [NSString stringWithFormat:@"%d", state];

    return self.drawingBlocks[tag][controlState];
}

- (BOOL)containsDrawingBlockForTag:(DKDrawingSourceTag *)tag
{
    if (self.drawingBlocks[tag])
    {
        return YES;
    }

    return NO;
}

- (BOOL)containsDrawingBlockForTag:(DKDrawingSourceTag *)tag forState:(UIControlState)state
{
    NSString* controlState = [NSString stringWithFormat:@"%d", state];

    if (self.drawingBlocks[tag][controlState])
    {
        return YES;
    }

    return NO;
}

@end