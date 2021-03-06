#import "ENModalWindowSlideUpBottomAnimator.h"


#pragma mark Constants


#pragma mark - Class Extension

@interface ENModalWindowSlideUpBottomAnimator ()

@end


#pragma mark - Class Variables


#pragma mark - Class Definition

@implementation ENModalWindowSlideUpBottomAnimator
{
	UIView *_blackOverlay;
}


#pragma mark - Properties


#pragma mark - Constructors

- (id)init
{
	// Abort if base initializer fails.
	if ((self = [super init]) == nil)
	{
		return nil;
	}
	
	// Initialize instance variables.
	_blackOverlay = [UIView new];
	
	// Return initialized instance.
	
	return self;
}


#pragma mark - Public Methods


#pragma mark - Overridden Methods


#pragma mark - Private Methods

#pragma mark - UIViewControllerAnimatedTransitioning Methods

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
	return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
   UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
   UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
   
   if (_presenting)
   {
       fromViewController.view.userInteractionEnabled = NO;
       toViewController.view.alpha = 0.f;
	   
	   _blackOverlay.frame = [transitionContext containerView].bounds;
	   _blackOverlay.backgroundColor = [UIColor clearColor];
	   
       [transitionContext.containerView addSubview:fromViewController.view];
       [transitionContext.containerView addSubview:_blackOverlay];
	   [transitionContext.containerView addSubview:toViewController.view];
	   
	   CGRect frame = toViewController.view.frame;
	   frame.origin.y = [transitionContext containerView].bounds.size.height/3;
	   toViewController.view.frame = frame;
	   frame.origin.y = fromViewController.view.frame.size.height/2 - (toViewController.view.frame.size.height/2);
	   
       [UIView animateWithDuration:[self transitionDuration:transitionContext]
				animations:^
				{
					_blackOverlay.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5f];
					fromViewController.view.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
					
					toViewController.view.frame = frame;
					toViewController.view.alpha = 1.f;
				}
				completion:^(BOOL finished)
				{
					[transitionContext completeTransition:YES];
				}
		];
   }
   
   else {
        toViewController.view.userInteractionEnabled = YES;
	   
	   _blackOverlay.frame = [transitionContext containerView].bounds;
	   
		[transitionContext.containerView addSubview:toViewController.view];
		[transitionContext.containerView addSubview:_blackOverlay];
		[transitionContext.containerView addSubview:fromViewController.view];
       
	   fromViewController.view.alpha = 1.f;
	   
       [UIView animateWithDuration:[self transitionDuration:transitionContext]
				animations:^
				{
					_blackOverlay.backgroundColor = [UIColor clearColor];
					CGRect frame = fromViewController.view.frame;
					frame.origin.y = [transitionContext containerView].bounds.size.height/3;
					fromViewController.view.frame = frame;
					
					fromViewController.view.alpha = 0.f;
					toViewController.view.tintAdjustmentMode = UIViewTintAdjustmentModeAutomatic;
				}
				completion:^(BOOL finished)
				{
					[transitionContext completeTransition:YES];
				}
	   ];
   }
}

@end