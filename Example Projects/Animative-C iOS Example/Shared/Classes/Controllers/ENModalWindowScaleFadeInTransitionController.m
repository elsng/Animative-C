#import "ENModalWindowScaleFadeInTransitionController.h"

#pragma mark Constants


#pragma mark - Class Extension

@interface ENModalWindowScaleFadeInTransitionController ()

@property (nonatomic, retain) IBOutlet UIView *sampleOutlet;

- (void)_initializeModalWindowScaleFadeInTransitionController;

- (void)_buttonPressed;


@end


#pragma mark - Class Variables


#pragma mark - Class Definition

@implementation ENModalWindowScaleFadeInTransitionController
{
	ENModalWindowScaleFadeInAnimator *_scaleFadeInAnimator;
}

#pragma mark - Properties



#pragma mark - Constructors

- (id)initWithDefaultNibName
{
	// TODO: Add nib name.
	// Abort if base initializer fails.
	if ((self = [self initWithNibName: @"" 
		bundle: nil]) == nil)
	{
		return nil;
	}

	// Return initialized instance.
	return self;
}

- (id)initWithNibName: (NSString *)nibName 
    bundle: (NSBundle *)bundle
{
	// Abort if base initializer fails.
	if ((self = [super initWithNibName: nibName 
        bundle: bundle]) == nil)
	{
		return nil;
	}
	
	// Initialize view.
	[self _initializeModalWindowScaleFadeInTransitionController];
	
	// Return initialized instance.
	return self;
}

- (id)initWithCoder: (NSCoder *)coder
{
	// Abort if base initializer fails.
	if ((self = [super initWithCoder: coder]) == nil)
	{
		return nil;
	}
	
	// Initialize view.
	[self _initializeModalWindowScaleFadeInTransitionController];
	
	// Return initialized instance.
	return self;
}


#pragma mark - Destructor

- (void)dealloc 
{
	// nil out delegates of any instance variables.
}


#pragma mark - Public Methods


#pragma mark - Overridden Methods

- (NSUInteger)supportedInterfaceOrientations
{
	return UIInterfaceOrientationMaskAll;
}

- (void)viewDidLoad
{
	// Call base implementation.
	[super viewDidLoad];
	
	// Perform additional initialization after nib outlets are bound.
	self.view.backgroundColor = [UIColor whiteColor];
	UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
	[button setTitle:@"Perform!" forState:UIControlStateNormal];
	[button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
	[button sizeToFit];
	[button addTarget:self action:@selector(_buttonPressed) forControlEvents:UIControlEventTouchUpInside];
	button.center = self.view.center;
	[self.view addSubview:button];
}

- (void)viewWillAppear: (BOOL)animated
{
	// Call base implementation.
	[super viewWillAppear: animated];

	// Prepare view to be displayed onscreen.
}

- (void)viewDidAppear: (BOOL)animated
{
	// Call base implementation.
	[super viewDidAppear: animated];
	
	// Perform any actions required when the view is displayed onscreen.
}

- (void)viewWillDisappear: (BOOL)animated
{
	// Call base implementation.
	[super viewWillDisappear: animated];

	// Prepare view to be moved offscreen.
	
}

- (void)viewDidDisappear: (BOOL)animated
{
	// Call base implementation.
	[super viewDidDisappear: animated];
	
	// Perform any actions required when the view has been moved offscreen.
}

- (void)didReceiveMemoryWarning
{
	// Call base implementation.
	[super didReceiveMemoryWarning];
	
	// Free up any memory that can be recreated easily.
}


#pragma mark - Private Methods

- (void)_initializeModalWindowScaleFadeInTransitionController
{
	self.title = @"Transition";
	_scaleFadeInAnimator = [ENModalWindowScaleFadeInAnimator new];
}

- (void)_buttonPressed
{
	UIViewController *viewController = [UIViewController new];
	viewController.view.backgroundColor = [UIColor clearColor];
	
	CGFloat width = 300;
	CGFloat height = 150;
	
	UIView *modalView = [[UIView alloc]initWithFrame:CGRectMake(viewController.view.bounds.size.width/2 - width/2, viewController.view.bounds.size.height/2 - height/2, width, height)];
	modalView.backgroundColor = [UIColor whiteColor];
	
	[viewController.view addSubview:modalView];
	
	UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeSystem];
	[closeButton setTitle:@"Dismiss" forState:UIControlStateNormal];
	[closeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	closeButton.frame = CGRectMake(0, 0, 150, 40);
	closeButton.layer.cornerRadius = 3;
	closeButton.backgroundColor = [UIColor redColor];
	[closeButton addTarget:self action:@selector(_dismiss) forControlEvents:UIControlEventTouchUpInside];
	
	[modalView addSubview:closeButton];
	closeButton.center = [modalView convertPoint:modalView.center fromView:modalView.superview];

	
	viewController.transitioningDelegate = self;
	viewController.modalPresentationStyle = UIModalPresentationCustom;
	
	[self presentViewController:viewController animated:YES completion:nil];
}

- (void) _dismiss
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate Methods

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
	_scaleFadeInAnimator.presenting = YES;
	return _scaleFadeInAnimator;
}
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
	_scaleFadeInAnimator.presenting = NO;
	return _scaleFadeInAnimator;
}


@end