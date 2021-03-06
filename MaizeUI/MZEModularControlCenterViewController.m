#import "MZEModularControlCenterViewController.h"
#import "MZEModuleInstanceManager.h"
#import <UIKit/_UIBackdropViewSettings+Private.h>
#import <QuartzCore/CALayer+Private.h>
#import "macros.h"

@implementation MZEModularControlCenterViewController

+ (MZEModuleCollectionViewController *)sharedCollectionViewController {
	static MZEModuleCollectionViewController *_sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[MZEModuleCollectionViewController alloc] initWithModuleInstanceManager:[MZEModuleInstanceManager sharedInstance]];
    });
    return _sharedInstance;
}

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithNibName:nil bundle:nil];
	if (self) {
		_initFrame = frame;
		//_closedCollectionViewYOrigin = frame.size.height;

	    _collectionViewController = [[self class] sharedCollectionViewController];
	    _collectionViewController.delegate = self;
	    //collectionViewController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	    // if ([self isLandscape] && !(isPad)) {
	    // 	_openCollectionViewYOrigin = frame.size.height/2 - _collectionViewController.view.frame.size.height/2;
	    // } else {
	    // 	_openCollectionViewYOrigin = frame.size.height - _collectionViewController.view.frame.size.height;
	    // }

	  	//[self.view addSubview:self.mze_animatedBlurView];
	  	//[self.view bringSubviewToFront:self.mze_animatedBlurView];
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
}

// - (void)loadView {
// 	self.view = [[UIView alloc] initWithFrame:CGRectMake(0,0,_initFrame.size.width, _initFrame.size.height)];
	// if (self.luminanceBackgroundView) {
	// 	[self.view addSubview:self.luminanceBackgroundView];
	// }

	// if (_animatedBackgroundView) {
	// 	[self.view addSubview:_animatedBackgroundView];
	// 	[self.view bringSubviewToFront:_animatedBackgroundView];
	// }

	// if (_collectionViewController) {
	// 	if (_collectionViewController.view) {
	// 		[self.view addSubview:_collectionViewController.view];
	// 		[self.view bringSubviewToFront:_collectionViewController.view];

	// 	}
	// }

	// self.headerPocket = [[MZEHeaderPocketView alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height/8.875)];
	// [self.view addSubview:self.headerPocket];

//}

- (void)revealWithProgress:(CGFloat)progress {

	// if (!_animator) {
	// 	[self willBecomeActive];
	// }

	// if (_animator) {
	// 	[UIView animateWithDuration:0.05 animations:^{
	// 		_collectionViewController.view.center = CGPointMake(_collectionViewController.view.center.x, (CGRectGetHeight([self.view bounds]) + (([_collectionViewController layoutSize].height*0.5)*fabs(progress-1.0))) - (CGRectGetHeight(self.view.bounds) - _openCollectionViewYOrigin)*progress) ;
	// 		if (_animatedBackgroundView) {
	// 			_animatedBackgroundView.progress = progress;
	// 		}

	// 		if (_luminanceBackdropView) {
	// 			if (progress <= 1) {
	// 			    _luminanceBackdropView.alpha = 0.45*progress;
	// 			} else if (progress > 1) {
	// 				_luminanceBackdropView.alpha = 0.45;
	// 			}
	// 		}
	// 	//_animator.fractionComplete = progress;
	// 	} completion:nil];
	// 	// CGFloat wantedY = CGRectGetHeight(self.view.bounds) - ((CGRectGetHeight(self.view.bounds)-_openCollectionViewYOrigin)*progress);
	// 	//_collectionViewController.view.center = CGPointMake(_collectionViewController.view.center.x, (CGRectGetHeight([self.view bounds]) + (([_collectionViewController layoutSize].height*0.5)*fabs(progress-1.0))) - (CGRectGetHeight(self.view.bounds) - _openCollectionViewYOrigin)*progress) ;
	// 	//_animator.fractionComplete = progress;
	// }
	// float height = self.view.frame.size.height/8.875;
	// self.headerPocket.frame = CGRectMake(0,height * (1 - progress),self.view.frame.size.width, height);
	// [self.headerPocket animateProgress:progress];

	// self.headerPocket.headerChevronView.alpha = progress - 0.35;

	// if (_animatedBackgroundView) {
	// 	_animatedBackgroundView.progress = progress;
	// }

	// if (_luminanceBackdropView) {
	// 	if (progress <= 1) {
	// 	    _luminanceBackdropView.alpha = 0.45*progress;
	// 	} else if (progress > 1) {
	// 		_luminanceBackdropView.alpha = 0.45;
	// 	}
	// }
}

- (void)willResignActive {
	_animator = nil;

	if (_collectionViewController) {
		[_collectionViewController willResignActive];
	}
}
- (void)willBecomeActive {

	if (_collectionViewController) {
		//self.view.backgroundColor = [UIColor redColor];
		
		[_collectionViewController willBecomeActive];
	}

	//self.headerPocket.frame = CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height/8.875);
}

- (MZEModuleCollectionViewController *)moduleCollectionViewController {
	return _collectionViewController;
}

- (BOOL)isLandscape {
	if (isPad) {
		return NO;
	}
	return UIInterfaceOrientationIsLandscape((UIInterfaceOrientation)[[self.view window] interfaceOrientation]);
}

- (void)moduleCollectionViewController:(MZEModuleCollectionViewController *)collectionViewController willRemoveModuleContainerViewController:(MZEContentModuleContainerViewController *)moduleContainerViewController {

}

- (void)moduleCollectionViewController:(MZEModuleCollectionViewController *)collectionViewController didAddModuleContainerViewController:(MZEContentModuleContainerViewController *)moduleContainerViewController {

}

- (void)moduleCollectionViewController:(MZEModuleCollectionViewController *)collectionViewController didCloseExpandedModule:(id <MZEContentModule>)module {

}

- (void)moduleCollectionViewController:(MZEModuleCollectionViewController *)collectionViewController willCloseExpandedModule:(id <MZEContentModule>)module {

}

- (void)moduleCollectionViewController:(MZEModuleCollectionViewController *)collectionViewController didOpenExpandedModule:(id <MZEContentModule>)module {

}

- (void)moduleCollectionViewController:(MZEModuleCollectionViewController *)collectionViewController willOpenExpandedModule:(id <MZEContentModule>)module {

}

- (void)moduleCollectionViewController:(MZEModuleCollectionViewController *)collectionViewController didFinishInteractionWithModule:(id <MZEContentModule>)module {

}

- (void)moduleCollectionViewController:(MZEModuleCollectionViewController *)collectionViewController didBeginInteractionWithModule:(id <MZEContentModule>)module {

}

- (NSInteger)interfaceOrientationForModuleCollectionViewController:(MZEModuleCollectionViewController *)collectionViewController {
	return [[self.view window] interfaceOrientation];
}

- (BOOL)moduleCollectionViewController:(MZEModuleCollectionViewController *)collectionViewController shouldForwardAppearanceCall:(BOOL)shouldForward animated:(BOOL)animated {
	return YES;
}

- (NSInteger)_interfaceOrientation {
	NSInteger orientation = [[self.view window] interfaceOrientation];
	if (orientation == 0)
		orientation = 1;

	return orientation; 
}
@end
