//
//  DelayPedal.m
//  AudioKitExample
//
//  Created by nicholas.cardinal on 10/28/15.
//  Copyright © 2015 nicholas.cardinal. All rights reserved.
//

#import "DelayPedal.h"
#import "Reverb.h"
#import "NewInstrument.h"

@implementation DelayPedal

-(instancetype)initWithAudioSource:(AKAudio *)audioSource
{
    self = [super init];
    if(self)
    {
        //instrument control
        
        _feedback = [self createPropertyWithValue:0.5 minimum:0 maximum:1.0];
        _mix = [self createPropertyWithValue:0.5 minimum:0 maximum:1];
        _time = [self createPropertyWithValue:0.2 minimum:0 maximum:1];
        
        
       //instrument definition
        
        AKDelayPedal *delayPedal = [[AKDelayPedal alloc]initWithInput:audioSource];
        
        delayPedal.feedback = _feedback;
        delayPedal.mix = _mix;
        delayPedal.time = _time;
        
        //outputs
        
        _auxillaryOutput = [AKAudio globalParameter];
    
        [self assignOutput:_auxillaryOutput to:delayPedal.output];
        [self connect:delayPedal.output];
        
        [self resetParameter:audioSource];
    }
    return self;
}

    
@end
