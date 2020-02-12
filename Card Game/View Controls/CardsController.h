//
//  CardsController.h
//  Card Game
//
//  Created by Hale, Andrew on 2/12/20.
//  Copyright © 2020 Hale, Andrew. All rights reserved.
//

#ifndef CardsController_h
#define CardsController_h

#import <UIKit/UIKit.h>


@interface CardsController : UIViewController
@property (strong, nonatomic) NSArray *cards;
@property (weak, nonatomic) IBOutlet UIButton *start;
@property (weak, nonatomic) IBOutlet UIButton *hit;
@property (weak, nonatomic) IBOutlet UIButton *stay;
@property (weak, nonatomic) IBOutlet UIButton *reset;
@property (strong, nonatomic) IBOutlet UIImageView *hide;
@property (strong, nonatomic) IBOutlet UIImageView *startIcon;
@property (strong, nonatomic) IBOutlet UIImageView *hitButton;
@property (strong, nonatomic) IBOutlet UIImageView *stayButton;
@property (strong, nonatomic) IBOutlet UIImageView *player1;
@property (strong, nonatomic) IBOutlet UIImageView *player2;
@property (strong, nonatomic) IBOutlet UIImageView *player3;
@property (strong, nonatomic) IBOutlet UIImageView *player4;
@property (strong, nonatomic) IBOutlet UIImageView *house1;
@property (strong, nonatomic) IBOutlet UIImageView *house2;
@property (strong, nonatomic) IBOutlet UIImageView *house3;
@property (strong, nonatomic) IBOutlet UIImageView *house4;
@property (strong, nonatomic) IBOutlet UILabel *pPoint;
@property (strong, nonatomic) IBOutlet UILabel *hPoint;
@property (strong, nonatomic) IBOutlet UILabel *infoText;

@end


#endif /* CardsController_h */
