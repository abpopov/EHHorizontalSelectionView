//
//  PinkHorizontalViewCell.m
//  TvRemote
//
//  Created by Danila Gusev on 01/03/2016.
//  Copyright © 2016 com.abrt. All rights reserved.
//

#import "EHRoundedHorizontalViewCell.h"
#import "EHHorizontalViewCell.h"

@implementation EHRoundedHorizontalViewCell

- (void)awakeFromNib {
    self.titleLabel.font = [EHRoundedHorizontalViewCell font];
    [super awakeFromNib];
    // Initialization code
}

+ (NSMutableDictionary *)styles
{
    NSMutableDictionary * retDict = [super styles];
    [retDict setObject:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.0] forKey:@"fontMedium"];
    [retDict setObject:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.0] forKey:@"font"];
    [retDict setObject:@(48) forKey:@"cellGap"];
    [retDict setObject:@(NO) forKey:@"needCentered"];
    return retDict;
}

- (void)setTitleLabelText:(NSString *)text
{
    self.titleLabel.text = text;
}


- (UIView *)createSelectedView
{
    self.clipsToBounds = NO;
    self.coloredView.frame = CGRectMake(7.5, 0, self.bounds.size.width- 15, self.bounds.size.height );
    self.coloredView.layer.cornerRadius = 3;
    self.coloredView.layer.masksToBounds = NO;
    self.selectedView.clipsToBounds = NO;
    
    [self.titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    UIView * tLabel = self.titleLabel;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tLabel]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(tLabel)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tLabel]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(tLabel)]];
    
    [self updateSelectedFrames];
    return self.selectedView;
}


- (void)updateConstraints
{
    [super updateConstraints];
    [self updateSelectedFrames];
}

- (void)updateSelectedFrames
{
    self.titleLabel.frame = self.bounds;
    self.selectedView.frame = self.bounds;
    self.coloredView.frame = CGRectMake( 7.5, 0, self.bounds.size.width-15, self.bounds.size.height );
    self.coloredView.layer.cornerRadius = 3;
}

- (void)updateFramesForMovingFromRect:(CGRect)rect
{
    self.selectedView.frame = CGRectMake(CGRectGetMinX(rect) - CGRectGetMinX(self.frame), 0, rect.size.width, self.selectedView.bounds.size.height);
    self.coloredView.frame = CGRectMake(7.5 , 0, self.selectedView.bounds.size.width -15, self.selectedView.bounds.size.height );
    self.coloredView.layer.cornerRadius = 3;
}
@end
