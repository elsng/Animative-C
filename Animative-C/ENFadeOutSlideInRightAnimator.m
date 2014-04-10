#import "ENFadeOutSlideInRightAnimator.h"


#pragma mark Constants


#pragma mark - Class Extension

@interface ENFadeOutSlideInRightAnimator ()

@end


#pragma mark - Class Variables


#pragma mark - Class Definition

@implementation ENFadeOutSlideInRightAnimator;

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
	   fromViewController.view.alpha = 1.f;
       
       [transitionContext.containerView addSubview:fromViewController.view];
	   [transitionContext.containerView addSubview:toViewController.view];
	   
	   CGRect frame = toViewController.view.frame;
	   frame.origin.x = [transitionContext containerView].bounds.size.width;
	   toViewController.view.frame = frame;
	   frame.origin.x = 0;
	   
       [UIView animateWithDuration:[self transitionDuration:transitionContext]
				animations:^
				{
					fromViewController.view.alpha = 0.f;
					
					toViewController.view.frame = frame;
				}
				completion:^(BOOL finished)
				{
					[transitionContext completeTransition:YES];
				}
		];
   }
   
   else {
        toViewController.view.userInteractionEnabled = YES;
		toViewController.view.alpha = 0.f;
	   
		[transitionContext.containerView addSubview:toViewController.view];
		[transitionContext.containerView addSubview:fromViewController.view];
       
       [UIView animateWithDuration:[self transitionDuration:transitionContext]
				animations:^
				{
					toViewController.view.alpha = 1.f;
					
					CGRect frame = fromViewController.view.frame;
					frame.origin.x = [transitionContext containerView].bounds.size.width;
					fromViewController.view.frame = frame;
				}
				completion:^(BOOL finished)
				{
					[transitionContext completeTransition:YES];
				}
	   ];
   }
}

@end