#import "ENExamplesListController.h"
#import "ENPushBackTransitionController.h"
#import "ENPushBackSideTransitionController.h"
#import "ENPushFadeOutTransitionController.h"
#import "ENFadeInOutTransitionController.h"

#pragma mark Constants


#pragma mark - Class Extension

@interface ENExamplesListController ()

- (void)_initializeExamplesListController;


@end


#pragma mark - Class Variables


#pragma mark - Class Definition

@implementation ENExamplesListController


#pragma mark - Properties


#pragma mark - Constructors

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
	[self _initializeExamplesListController];
	
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
	[self _initializeExamplesListController];
	
	// Return initialized instance.
	return self;
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
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
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

- (void)_initializeExamplesListController
{
    self.title = @"Examples";
	
}
#pragma mark - UITableViewDataSource Methods

- (NSInteger)tableView: (UITableView *)tableView 
	numberOfRowsInSection: (NSInteger)section
{
	NSInteger numberOfRows = 4;

	return numberOfRows;
}

- (UITableViewCell *)tableView: (UITableView *)tableView 
	cellForRowAtIndexPath: (NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
	switch (indexPath.row)
		{
			case 0:
				cell.textLabel.text = @"Push Back Transition";
				break;
				
			case 1:
				cell.textLabel.text = @"Push Back Side Transition";
				break;
			case 2:
				cell.textLabel.text = @"Push Fade Out Transition";
				break;
			case 3:
				cell.textLabel.text = @"Fade In Out Transition";
				break;
		}
	
	return cell;
}


#pragma mark - UITableViewDelegate Methods

- (void)tableView: (UITableView *)tableView 
	didSelectRowAtIndexPath: (NSIndexPath *)indexPath
{
    ENPushBackTransitionController *pushBackController = [ENPushBackTransitionController new];
	ENPushBackSideTransitionController *pushBackSideController = [ENPushBackSideTransitionController new];
	ENPushFadeOutTransitionController *pushFadeOutController = [ENPushFadeOutTransitionController new];
	ENFadeInOutTransitionController *fadeInOutController = [ENFadeInOutTransitionController new];
	
	switch (indexPath.row)
		{
			case 0:
				[self.navigationController pushViewController:pushBackController animated:YES];
				break;
				
			case 1:
				[self.navigationController pushViewController:pushBackSideController animated:YES];
				break;
				
			case 2:
				[self.navigationController pushViewController:pushFadeOutController animated:YES];
				break;
				
			case 3:
				[self.navigationController pushViewController:fadeInOutController animated:YES];
				break;
		}
}


@end