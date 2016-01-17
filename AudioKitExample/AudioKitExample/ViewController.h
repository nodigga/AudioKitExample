//
//  ViewController.h
//  AudioKitExample
//
//  Created by nicholas.cardinal on 9/29/15.
//  Copyright © 2015 nicholas.cardinal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AKFoundation.h"

@interface ViewController : UIViewController
//@property (readonly) AKStereoAudio *auxOutput;


@property UILabel *onOff;

@property (nonatomic,strong) AKParameter *updateLfo;


@end

