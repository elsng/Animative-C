#import "ENExamplesListController.h"
#import "ENModalSheetPushBackTransitionController.h"
#import "ENModalSheetRightPushBackTransitionController.h"
#import "ENModalWindowScaleFadeOutTransitionController.h"
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	
    NSString *title = nil;
    
    switch (section)
    {
        case 0:
            title = @"Page Transitions";
            break;
            
        case 1:
            title = @"Modal Transitions";
            break;
    }
	
    return title;
}

- (NSInteger)tableView: (UITableView *)tableView 
	numberOfRowsInSection: (NSInteger)section
{
	NSInteger numberOfRows = 0;
	
	switch (section)
	{
		//PAGE TRANSITIONS
		case 0:
			numberOfRows = 1;
			break;
		
		//MODAL TRANSITIONS
		case 1:
			numberOfRows = 3;
			break;
	}

	return numberOfRows;
}

- (UITableViewCell *)tableView: (UITableView *)tableView 
	cellForRowAtIndexPath: (NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
	switch (indexPath.section)
	{
		//PAGE TRANSITIONS
		case 0:
			switch (indexPath.row)
				{
					case 0:
						cell.textLabel.text = @"Fade In Out";
						break;
				}
			break;
			
		//MODAL TRANSITIONS
		case 1:
			switch (indexPath.row)
				{
					case 0:
						cell.textLabel.text = @"Sheet Push Back (Bottom)";
						break;
					case 1:
						cell.textLabel.text = @"Sheet Push Back (Right)";
						break;
					case 2:
						cell.textLabel.text = @"Modal Window Scale Out (Bottom)";
						break;
				}
			break;
	}
	
	return cell;
}


#pragma mark - UITableViewDelegate Methods

- (void)tableView: (UITableView *)tableView 
	didSelectRowAtIndexPath: (NSIndexPath *)indexPath
{
    ENModalSheetPushBackTransitionController *modalSheetPushBackController = [ENModalSheetPushBackTransitionController new];
	ENModalSheetRightPushBackTransitionController *modalSheetRightPushBackController = [ENModalSheetRightPushBackTransitionController new];
	ENModalWindowScaleFadeOutTransitionController *modalWindowScaleFadeOutController = [ENModalWindowScaleFadeOutTransitionController new];
	ENFadeInOutTransitionController *fadeInOutController = [ENFadeInOutTransitionController new];
	
	switch (indexPath.section)
	{
		//PAGE TRANSITIONS
		case 0:
			switch (indexPath.row)
			{
				case 0:
					[self.navigationController pushViewController:fadeInOutController animated:YES];
					break;
				
			}
			break;
		
		//MODAL TRANSITIONS
		case 1:
			switch (indexPath.row)
			{
				
				case 0:
					[self.navigationController pushViewController:modalSheetPushBackController animated:YES];
					break;
				
				case 1:
					[self.navigationController pushViewController:modalSheetRightPushBackController animated:YES];
					break;
				
				case 2:
					[self.navigationController pushViewController:modalWindowScaleFadeOutController animated:YES];
					break;
			}
			break;
	}
}


@end