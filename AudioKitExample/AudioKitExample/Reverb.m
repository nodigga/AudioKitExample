//
//  Reverb.m
//  AudioKitExample
//
//  Created by nicholas.cardinal on 10/20/15.
//  Copyright © 2015 nicholas.cardinal. All rights reserved.
//

#import "Reverb.h"

@implementation Reverb

-(instancetype)initWithAudioSource:(AKAudio *)audioSource
{
    self = [super init];
    if(self)
    {
        //instrument control
        _reverbProperty = [self createPropertyWithValue:0.5 minimum:0.0 maximum:1.0];
    
        //instrument definition
        
        AKReverb *reverb = [[AKReverb alloc]initWithInput:audioSource];
        reverb.feedback = _reverbProperty;
        
        AKMix *leftMix = [[AKMix alloc]initWithInput1:reverb.leftOutput
                                               input2:audioSource balance:akp(0.50)];
        
        AKMix *rightMix = [[AKMix alloc]initWithInput1:reverb.rightOutput
                                               input2:audioSource balance:akp(0.50)];
    
        //audio output
        
        AKAudioOutput *audio = [[AKAudioOutput alloc] initWithLeftAudio:leftMix
                                              rightAudio:rightMix];
        [self connect:audio];
        
      
        
        //reset inputs
        [self resetParameter:audioSource];
    
    }
    return self;
}

-(instancetype)initWithStereoAudio:(AKStereoAudio*)stereoAudio
{
    self = [super init];
    if(self)
    {
        //instrument control
        _reverbProperty = [self createPropertyWithValue:0.5 minimum:0.0 maximum:1.0];
        
        //instrument definition
        
        AKReverb *reverb = [[AKReverb alloc] initWithStereoInput:stereoAudio];
        reverb.feedback = _reverbProperty;
        
        AKMix *leftMix = [[AKMix alloc]initWithInput1:reverb.leftOutput
                                               input2:stereoAudio.leftOutput balance:akp(0.50)];
        
        AKMix *rightMix = [[AKMix alloc]initWithInput1:reverb.rightOutput
                                                input2:stereoAudio.rightOutput balance:akp(0.50)];
        
        //audio output
        
        AKAudioOutput *audio = [[AKAudioOutput alloc] initWithLeftAudio:leftMix
                                                             rightAudio:rightMix];
        [self connect:audio];
        
        
        
        //reset inputs
        [self resetParameter:stereoAudio];
        
    }
    return self;

}




@end
