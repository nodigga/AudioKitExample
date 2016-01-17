//
//  DelayPedal.h
//  AudioKitExample
//
//  Created by nicholas.cardinal on 10/28/15.
//  Copyright © 2015 nicholas.cardinal. All rights reserved.
//

#import "AKInstrument.h"
#import "AKFoundation.h"

@interface DelayPedal : AKInstrument

@property AKInstrumentProperty *feedback;
@property AKInstrumentProperty *mix;
@property (readonly) AKAudio *output;
@property AKInstrumentProperty *time;

-(instancetype)initWithAudioSource:(AKAudio *)audioSource;

@property(readonly) AKAudio *auxillaryOutput;


@end

