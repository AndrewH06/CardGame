//
//  CardsController.m
//  Card Game
//
//  Created by Hale, Andrew on 2/12/20.
//  Copyright © 2020 Hale, Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>

#include "CardsController.h"


@implementation CardsController

@synthesize start, hit, stay, reset, player1, player2, player3, player4, house1, house2, house3, house4, pPoint, hPoint, infoText;
int temp = 0;
int cHit = 0;
int pPointInt = 0;
int hPointInt = 0;

int deckArray[52];
int deckValues[52] = {2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11, 11, 11, 11};

- (void)viewDidLoad {
    [super viewDidLoad];
    for(int x = 0; x < 52; x++){
        deckArray[x] = x;
  }
   
  self.cards = [NSArray arrayWithObjects:@"C2.png", @"D2.png", @"H2.png", @"S2.png", @"C3.png", @"D3.png", @"H3.png", @"S3.png", @"C4.png", @"D4.png", @"H4.png", @"S4.png", @"C5.png", @"D5.png", @"H5.png", @"S5.png", @"C6.png", @"D6.png", @"H6.png", @"S6.png", @"C7.png", @"D7.png", @"H7.png", @"S7.png", @"C8.png", @"D8.png", @"H8.png", @"S8.png", @"C9.png", @"D9.png", @"H9.png", @"S9.png", @"C10.png", @"D10.png", @"H10.png", @"S10.png", @"C11.png", @"D11.png", @"H11.png", @"S11.png", @"C12.png", @"D12.png", @"H12.png", @"S12.png", @"C13.png", @"D13.png", @"H13.png", @"S13.png", @"C1.png", @"D1.png", @"H1.png", @"S1.png", nil];
   
    int n = sizeof(deckArray)/ sizeof(deckArray[0]);
    randomize(deckArray, n);
   
    pPointInt = 0;
    hPointInt = 0;
    temp = 0;
    cHit = 0;
   
    hit.hidden = YES;
    stay.hidden = YES;
    pPoint.hidden = YES;
    hPoint.hidden = YES;
    infoText.hidden = YES;
    reset.hidden = YES;
    
}

void randomize ( int arr[], int n )
{
  srand ( time(NULL) );
  for (int i = n-1; i > 0; i--)
  {
    int j = rand() % (i+1);
    swap(&arr[i], &arr[j]);
  }
}
void swap (int *a, int *b)
{
  int temp = *a;
  *a = *b;
  *b = temp;
}
void moveUp(){
  if(temp < 52){
  temp++;
  }
}

- (IBAction)startAct:(id)sender {
   
    start.hidden = YES;
    self.startIcon.center = CGPointMake(self.hide.center.x, self.hide.center.y);
    pPoint.hidden = NO;
    hit.hidden = NO;
    stay.hidden = NO;
   
    [player1 setImage:[UIImage imageNamed:self.cards[deckArray[temp]]]];
  [self.view addSubview:player1];
  pPointInt = pPointInt + deckValues[deckArray[temp]];
  moveUp();
   
  [player2 setImage:[UIImage imageNamed:self.cards[deckArray[temp]]]];
  [self.view addSubview:player2];
  pPointInt = pPointInt + deckValues[deckArray[temp]];
  moveUp();
   
  [house1 setImage:[UIImage imageNamed:@"playing-card-back-png-1.png"]];
  [self.view addSubview:house1];
  moveUp();
   
  [house2 setImage:[UIImage imageNamed:self.cards[deckArray[temp]]]];
  [self.view addSubview:house2];
  hPointInt = hPointInt + deckValues[deckArray[temp]];
  moveUp();
   
  pPoint.text = [NSString stringWithFormat:@"%d" , pPointInt];
}

- (IBAction)reset:(id)sender {
  reset.hidden = YES;
  hPoint.hidden = YES;
  infoText.hidden = YES;
    hit.hidden = NO;
    stay.hidden = NO;
  player3.image = nil;
  player4.image = nil;
  house3.image = nil;
  house4.image = nil;
    pPointInt = 0;
  [self.view addSubview:player1];
    pPointInt = pPointInt + deckValues[deckArray[temp]];
    moveUp();
     
    [player2 setImage:[UIImage imageNamed:self.cards[deckArray[temp]]]];
    [self.view addSubview:player2];
    pPointInt = pPointInt + deckValues[deckArray[temp]];
    moveUp();
    pPoint.text = [NSString stringWithFormat:@"%d" , pPointInt];
  hPointInt = 0;
    [house1 setImage:[UIImage imageNamed:@"playing-card-back-png-1.png"]];
    [self.view addSubview:house1];
    moveUp();
     
    [house2 setImage:[UIImage imageNamed:self.cards[deckArray[temp]]]];
    [self.view addSubview:house2];
    hPointInt = hPointInt + deckValues[deckArray[temp]];
    moveUp();
    hPoint.text = [NSString stringWithFormat:@"%d" , hPointInt];
  pPoint.textColor = [UIColor blackColor];
  cHit = 0;
  temp = 0;
  int n = sizeof(deckArray)/ sizeof(deckArray[0]);
  randomize(deckArray, n);
}
- (IBAction)hitAct:(id)sender {
  if(cHit == 0){
    [player3 setImage:[UIImage imageNamed:self.cards[deckArray[temp]]]];
    [self.view addSubview:player3];
    aceChecker();
    pPointInt = pPointInt + deckValues[deckArray[temp]];
    pPoint.text = [NSString stringWithFormat:@"%d" , pPointInt];
    moveUp();
    [self bustCheck];
    cHit++;
  }else if(cHit == 1){
    [player4 setImage:[UIImage imageNamed:self.cards[deckArray[temp]]]];
    [self.view addSubview:player4];
    aceChecker();
    pPointInt = pPointInt + deckValues[deckArray[temp]];
    pPoint.text = [NSString stringWithFormat:@"%d" , pPointInt];
    moveUp();
    [self bustCheck];
    cHit++;
  }
}
- (IBAction)stayAct:(id)sender {
  hit.hidden = YES;
  stay.hidden = YES;
   
  [house1 setImage:[UIImage imageNamed:self.cards[deckArray[temp]]]];//if your images extension is .png than no need to write extension of an image..
  [self.view addSubview:house1];
  hPointInt = hPointInt + deckValues[deckArray[temp]];
  moveUp();
   
  if (hPointInt < 17) {
    [house3 setImage:[UIImage imageNamed:self.cards[deckArray[temp]]]];//if your images extension is .png than no need to write extension of an image..
    [self.view addSubview:house3];
    aceCheckerHouse();
    hPointInt = hPointInt + deckValues[deckArray[temp]];
    moveUp();
    [self bustCheckHouse];
  }
   
   
  if (hPointInt < 17) {
    [house4 setImage:[UIImage imageNamed:self.cards[deckArray[temp]]]];//if your images extension is .png than no need to write extension of an image..
    [self.view addSubview:house4];
    aceCheckerHouse();
    hPointInt = hPointInt + deckValues[deckArray[temp]];
    moveUp();
    [self bustCheckHouse];
  } else if (hPointInt >= 17) {
    if ([self bustCheckHouse] == 0) {
      if (hPointInt > pPointInt) {
        infoText.text = [NSString stringWithFormat:@"YOU LOSE!"];
        reset.hidden = NO;
        infoText.textColor = [UIColor redColor];
        pPoint.textColor = [UIColor redColor];
        infoText.hidden = NO;
        hPoint.text = [NSString stringWithFormat:@"%d", hPointInt];
        hPoint.textColor = [UIColor greenColor];
        hPoint.hidden = NO;
      } else if(hPointInt < pPointInt){
        infoText.text = [NSString stringWithFormat:@"YOU WIN!"];
        reset.hidden = NO;
        infoText.textColor = [UIColor greenColor];
        pPoint.textColor = [UIColor greenColor];
        infoText.hidden = NO;
        hPoint.text = [NSString stringWithFormat:@"%d", hPointInt];
        hPoint.textColor = [UIColor redColor];
        hPoint.hidden = NO;
      } else if(hPointInt == pPointInt){
        infoText.text = [NSString stringWithFormat:@"PUSH!"];
        reset.hidden = NO;
        infoText.textColor = [UIColor blueColor];
        pPoint.textColor = [UIColor blueColor];
        infoText.hidden = NO;
        hPoint.text = [NSString stringWithFormat:@"%d", hPointInt];
        hPoint.textColor = [UIColor blueColor];
        hPoint.hidden = NO;
      }
    }
     
  }
}

void aceChecker(){
  if (deckValues[deckArray[temp]] == 11) {
    if (deckValues[deckArray[temp]] + pPointInt > 21) {
      pPointInt = pPointInt - 10;
    }
  }
   
}
void aceCheckerHouse(){
  if (deckValues[deckArray[temp]] == 11) {
    if (deckValues[deckArray[temp]] + hPointInt > 21) {
      hPointInt = hPointInt - 10;
    }
  }
   
}
-(void)bustCheck {
  if (pPointInt > 21) {
    hit.hidden = YES;
    stay.hidden = YES;
    infoText.text = [NSString stringWithFormat:@"BUST!"];
    infoText.hidden = NO;
    reset.hidden = NO;
    pPoint.textColor = [UIColor redColor];
  }
}
-(int)bustCheckHouse {
  if (hPointInt > 21) {
    self.hitButton.center = CGPointMake(self.hide.center.x, self.hide.center.y);
    infoText.text = [NSString stringWithFormat:@"YOU WIN!"];
    infoText.hidden = NO;
    reset.hidden = NO;
    pPoint.textColor = [UIColor greenColor];
    hPoint.text = [NSString stringWithFormat:@"%d", hPointInt];
    hPoint.textColor = [UIColor redColor];
    hPoint.hidden = NO;
    return 1;
  }
  return 0;
}
@end

