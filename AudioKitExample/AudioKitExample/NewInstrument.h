//
//  NewInstrument.h
//  AudioKitExample
//
//  Created by nicholas.cardinal on 9/30/15.
//  Copyright © 2015 nicholas.cardinal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AKFoundation.h"
#import "AKLowFrequencyOscillator.h"
#import "AKMoogLadder.h"
#import "Reverb.h"

@interface NewInstrument : AKInstrument

//fmoscillator

@property (nonatomic,strong) AKFMOscillator *fmOscillator;
@property (nonatomic, strong) AKInstrumentProperty *frequency;
@property (nonatomic, strong) AKInstrumentProperty *carrierMult;
@property (nonatomic, strong) AKInstrumentProperty *modIndex;
@property (nonatomic, strong) AKInstrumentProperty *amplitude;
@property (nonatomic, strong) AKInstrumentProperty *modMultiplier;
@property (nonatomic) AKTable *waveform;


//lfo

@property(nonatomic, strong) AKLowFrequencyOscillator *lfo;
@property AKConstant *waveformType;
@property AKParameter *updateAmplitude;
@property AKInstrumentProperty *updateFrequency;

@property AKParameter *input;
//@property(readonly) AKAudio *auxillaryOutput;

@property(readonly) AKAudio *auxillaryOutput;


//@property(readonly) AKAudio *auxillaryOutput;




//- (instancetype)initWithAudioSource:(AKStereoAudio *)audioSource;


@end
