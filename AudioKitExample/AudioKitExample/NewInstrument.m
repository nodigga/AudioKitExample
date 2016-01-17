//
//  NewInstrument.m
//  AudioKitExample
//
//  Created by nicholas.cardinal on 9/30/15.
//  Copyright © 2015 nicholas.cardinal. All rights reserved.
//

#import "NewInstrument.h"
#import "ViewController.h"
#import "AppDelegate.h"

@implementation NewInstrument

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        //lfo definition
        
        _waveformType = [AKLowFrequencyOscillator waveformTypeForSine];
        _updateFrequency =[self createPropertyWithValue:3.0 minimum:1.0 maximum:6.0];
        _updateAmplitude = akp(30.0);
        
        self.lfo = [[AKLowFrequencyOscillator alloc]initWithWaveformType:_waveformType frequency:_updateFrequency amplitude:_updateAmplitude];
        
        //oscillator definition
        
        self.fmOscillator = [[AKFMOscillator alloc]init];
        
        _frequency = [self createPropertyWithValue:440 minimum:150 maximum:740];
        _carrierMult = [self createPropertyWithValue:0.5 minimum:0.0 maximum:1.0];
        _modIndex   = [self createPropertyWithValue:15  minimum:0.0 maximum:30];
        _amplitude  = [self createPropertyWithValue:0.25 minimum:0.0 maximum:0.5];
        _modMultiplier = [self createPropertyWithValue:1 minimum:0 maximum:3];
        
        _waveform = [AKTable standardReverseSawtoothWave];
        
        self.fmOscillator.baseFrequency = [_frequency plus:_lfo];
        self.fmOscillator.carrierMultiplier = _carrierMult;
        self.fmOscillator.modulationIndex = _modIndex;
        self.fmOscillator.amplitude = _amplitude;
        self.fmOscillator.modulatingMultiplier = _modMultiplier;
        self.fmOscillator.waveform = _waveform;

        //setting up outputs
        
        _auxillaryOutput = [AKAudio globalParameter];
        [self assignOutput:_auxillaryOutput to:self.fmOscillator];
        
        // [self setAudioOutput:self.fmOscillator];
        [self setParameter:_lfo to: _updateFrequency];

    }
    return self;
}


@end