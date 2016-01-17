//
//  Reverb.h
//  AudioKitExample
//
//  Created by nicholas.cardinal on 10/20/15.
//  Copyright © 2015 nicholas.cardinal. All rights reserved.
//

#import "AKInstrument.h"
#import "AKFoundation.h"

@interface Reverb : AKInstrument

-(instancetype)initWithAudioSource:(AKAudio*)audioSource;
-(instancetype)initWithStereoAudio:(AKStereoAudio*)stereoAudio;

@property AKInstrumentProperty *reverbProperty;

@end
