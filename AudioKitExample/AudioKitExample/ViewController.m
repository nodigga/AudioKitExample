//
//  ViewController.m
//  AudioKitExample
//
//  Created by nicholas.cardinal on 9/29/15.
//  Copyright © 2015 nicholas.cardinal. All rights reserved.
//

#import "ViewController.h"
#import "AKFoundation.h"
#import "NewInstrument.h"
#import "AKPropertySlider.h"
#import "Reverb.h"
#import "DelayPedal.h"
#import "VariableDelay.h"


@implementation ViewController
{
    NewInstrument *newInstrument;
    BOOL isNewInstrumentPlaying;
    IBOutlet AKPropertySlider *frequencySlider;
    IBOutlet AKPropertySlider *carrierMultiplierSlider;
    IBOutlet AKPropertySlider *modIndexSlider;
    IBOutlet AKPropertySlider *amplitudeSlider;
    IBOutlet AKPropertySlider *modMultiplierSlider;
    IBOutlet AKPropertySlider *lfoFreqSlider;
    IBOutlet UIButton *changeWave;
    IBOutlet AKPropertySlider *reverbFeedbackSlider;
    IBOutlet AKPropertySlider *delaySlider;
    
    IBOutlet AKPropertySlider *variableDelaySlider;
    
    
    Reverb *myReverb;
    DelayPedal *myDelay;
    VariableDelay *variableDelay;
    
   }

- (void)viewDidLoad
    {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
        
        float screenWidth = [UIScreen mainScreen].bounds.size.width;
        //float screenHeights = [UIScreen mainScreen].bounds.size.height;
        
        CGRect onOffLabel = CGRectMake(screenWidth/2, 20, 10, 10);
        
        [self.onOff setBackgroundColor:[UIColor blueColor]];
        [self.onOff setFrame:onOffLabel];
        self.onOff.text = @"on off";
        [self.view addSubview:self.onOff];
                
    newInstrument = [[NewInstrument alloc] init];
        
    //myDelay = [[DelayPedal alloc]initWithAudioSource:newInstrument.auxillaryOutput];
    
  // myReverb = [[Reverb alloc]initWithAudioSource:newInstrument.auxillaryOutput];
    
    variableDelay = [[VariableDelay alloc]initWithAudioSource:[AKStereoAudio stereoFromMono:newInstrument.auxillaryOutput]];
        
    myReverb = [[Reverb alloc]initWithStereoAudio:variableDelay.auxilliaryOutput];
    
        
        
    frequencySlider.property = newInstrument.frequency;
    carrierMultiplierSlider.property = newInstrument.carrierMult;
    modIndexSlider.property = newInstrument.modIndex;
    amplitudeSlider.property = newInstrument.amplitude;
    modMultiplierSlider.property = newInstrument.modMultiplier;
    
    variableDelaySlider.property = variableDelay.delayTime;
        
        
    //lfo slider
    lfoFreqSlider.property = newInstrument.updateFrequency;
    
    //reverb feedback slider
    reverbFeedbackSlider.property = myReverb.reverbProperty;

    // delay sliders
    delaySlider.property = myDelay.time;
    
        
    [AKOrchestra addInstrument:newInstrument];
    //[AKOrchestra addInstrument:myDelay];
    [AKOrchestra addInstrument:variableDelay];
    [AKOrchestra addInstrument:myReverb];
    [variableDelay play];
    //[myDelay play];
    [myReverb play];
    
    
    }

- (IBAction)toggleInstrument:(id)sender
{
    if (isNewInstrumentPlaying)
    {
        [newInstrument stop];
        isNewInstrumentPlaying = NO;
    }
    else
    {
        [newInstrument play];
        isNewInstrumentPlaying = YES;
    }
}

-(void)setReverbFeedBackLevel:(float)feedbackLevel
{
    myReverb.reverbProperty.value = feedbackLevel;
}

-(void)setDelayTime:(float)delayTime
{
    myDelay.time.value = delayTime;
}
-(void)setVariableDelayTime:(float)delayTime
{
    variableDelay.delayTime.value = delayTime;
}

-(IBAction)changeWave:(id)sender
{
    NSLog(@"button pressed");
}

-(IBAction)lfoValue:(id)sender
{
    NSLog(@"%f", newInstrument.lfo.value);
}

-(IBAction)reverbFeedback:(id)sender
{
    NSLog(@"%f", myReverb.reverbProperty.value);
    
    [self setReverbFeedBackLevel:[(UISlider *)sender value]];
}

-(IBAction)delayTime:(id)sender
{

    NSLog(@"%f",myDelay.time.value);
    
    [self setDelayTime:[(UISlider *)sender value]];

}

-(IBAction)variableDelayTime:(id)sender
{
    
    NSLog(@"%f",variableDelay.delayTime.value);
    
    [self setVariableDelayTime:[(UISlider *)sender value]];
    
}


@end
