//
//  VariableDelay.h
//  AudioKitExample
//
//  Created by nicholas.cardinal on 11/4/15.
//  Copyright © 2015 nicholas.cardinal. All rights reserved.
//

#import "AKInstrument.h"
#import "AKFoundation.h"

@interface VariableDelay : AKInstrument

@property (nonatomic, strong) AKInstrumentProperty *delayTime;
@property (nonatomic, strong) AKInstrumentProperty *mix;

@property (readonly) AKStereoAudio *auxilliaryOutput;

- (instancetype)initWithAudioSource:(AKStereoAudio *)audioSource;

@end
