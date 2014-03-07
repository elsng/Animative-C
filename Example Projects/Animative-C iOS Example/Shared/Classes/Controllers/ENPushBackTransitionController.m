#import "ENPushBackTransitionController.h"

#pragma mark Constants


#pragma mark - Class Extension

@interface ENPushBackTransitionController ()

@property (nonatomic, retain) IBOutlet UIView *sampleOutlet;

- (void)_initializePushBackTransitionController;

- (void)_buttonPressed;


@end


#pragma mark - Class Variables


#pragma mark - Class Definition

@implementation ENPushBackTransitionController
{
	ENPushBackAnimator *_pushBackAnimator;
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
	[self _initializePushBackTransitionController];
	
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
	[self _initializePushBackTransitionController];
	
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

- (void)_initializePushBackTransitionController
{
	self.title = @"Push Back Transition";
	_pushBackAnimator = [ENPushBackAnimator new];
}

- (void)_buttonPressed
{
	UIViewController *viewController = [UIViewController new];
	viewController.view.backgroundColor = [UIColor clearColor];
	
	CGFloat height = viewController.view.bounds.size.height/2;
	
	UIView *sheetView = [[UIView alloc]initWithFrame:CGRectMake(0, height, viewController.view.bounds.size.width, height)];
	sheetView.backgroundColor = [UIColor whiteColor];
	
	[viewController.view addSubview:sheetView];
	
	UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeSystem];
	[closeButton setTitle:@"Dismiss" forState:UIControlStateNormal];
	[closeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	closeButton.frame = CGRectMake(0, 0, 150, 40);
	closeButton.layer.cornerRadius = 3;
	closeButton.backgroundColor = [UIColor redColor];
	[closeButton addTarget:self action:@selector(_dismiss) forControlEvents:UIControlEventTouchUpInside];
	
	[sheetView addSubview:closeButton];
	closeButton.center = [sheetView convertPoint:sheetView.center fromView:sheetView.superview];

	
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
	_pushBackAnimator.presenting = YES;
	return _pushBackAnimator;
}
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
	_pushBackAnimator.presenting = NO;
	return _pushBackAnimator;
}


@end