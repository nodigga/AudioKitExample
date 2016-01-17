//
//  VariableDelay.m
//  AudioKitExample
//
//  Created by nicholas.cardinal on 11/4/15.
//  Copyright © 2015 nicholas.cardinal. All rights reserved.
//

#import "VariableDelay.h"

@implementation VariableDelay

- (instancetype)initWithAudioSource:(AKStereoAudio *)audioSource
{
    self = [super init];
    if (self) {
        
        // Instrument Based Control
        _delayTime = [self createPropertyWithValue:0.5 minimum:0 maximum:1.0];
        _mix       = [self createPropertyWithValue:0.5 minimum:0 maximum:0.5];
        
        // Instrument Definition
        AKVariableDelay *leftDelay = [AKVariableDelay delayWithInput:audioSource.leftOutput];
        leftDelay.delayTime = _delayTime;
        [self connect:leftDelay];
        
        AKVariableDelay *rightDelay = [AKVariableDelay delayWithInput:audioSource.rightOutput];
        rightDelay.delayTime = _delayTime;
        [self connect:rightDelay];
        
        AKMix *leftMix = [[AKMix alloc] initWithInput1:audioSource.leftOutput
                                                input2:leftDelay
                                               balance:_mix];
        
        AKMix *rightMix = [[AKMix alloc] initWithInput1:audioSource.rightOutput
                                                 input2:rightDelay
                                                balance:_mix];
        
        // Output to global effects processing
        _auxilliaryOutput = [AKStereoAudio globalParameter];
        [self assignOutput:_auxilliaryOutput to:[[AKStereoAudio alloc] initWithLeftAudio:leftMix
                                                                              rightAudio:rightMix]];
        
        // Reset Inputs
        [self resetParameter:audioSource];
    }
    return self;
}


@end
