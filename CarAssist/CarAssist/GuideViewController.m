//
//  GuideViewController.m
//  CarAssist
//
//  Created by Dennis on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "GuideViewController.h"
#import "StepView.h"
#import "Utils.h"
#import <OpenEars/LanguageModelGenerator.h>
#import <OpenEars/PocketsphinxController.h>
#import <OpenEars/OpenEarsEventsObserver.h>

@interface GuideViewController () <OpenEarsEventsObserverDelegate>
@property (nonatomic) PocketsphinxController  *pocketsphinxController;
@property (strong, nonatomic) OpenEarsEventsObserver *openEarsEventsObserver;
@end

@implementation GuideViewController

-(id) initWithGuide:(Guide *)guide
{
    self = [super init];
    if(self)
    {
        self.guide = guide;
    }
    
    return self;
}


-(void)scrollViewDidScroll:(UIScrollView * )sender
{
    CGFloat pageWidth = sender.frame.size.width;
    int page = floor((sender.contentOffset.x - pageWidth /2)/pageWidth) +1;
    self.pageControl.currentPage = page;
    
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    // Hintergrundgrafik einbinden
    //self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[Utils imageWithImage:[UIImage imageNamed:@"background_service_hell"] scaledToSize:[[UIScreen mainScreen] bounds].size]];
    self.view.backgroundColor = [UIColor blackColor];
    
    NSArray *steps = self.guide.steps; // Array von Step
    for (int i = 0; i<steps.count; i++) {
        CGRect frame;
        frame.origin.x = i * self.scrollView.frame.size.width;
        frame.origin.y = 0;
        frame.size = self.scrollView.frame.size;
        frame.size.height = frame.size.height + 32; // + x Pixel: Höhe für Page-Control 
        
        
        Step *step = [steps objectAtIndex:i];
        StepView *subView = [[StepView alloc] initWithFrame:frame];

        subView.nameLabel.text = step.name;
        subView.imageView.image = step.image;
        subView.textView.text = step.desc;

        [self.scrollView addSubview:subView];
    }
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * steps.count, self.scrollView.frame.size.height);
    self.pageControl.numberOfPages = steps.count;
    
    self.title = self.guide.name;
    [self makeWordRec];
    
}
-(IBAction)changePage:(id)sender
{
    UIPageControl *pageControl = sender;
    NSInteger currentPage = pageControl.currentPage;
    CGPoint offset = CGPointMake(currentPage * self.scrollView.frame.size.width, 0);
    [self.scrollView setContentOffset:offset animated:YES];
}

-(void)makeWordRec
{
    self.openEarsEventsObserver = [[OpenEarsEventsObserver alloc] init];
    self.pocketsphinxController = [[PocketsphinxController alloc] init];
    
    LanguageModelGenerator *lmGenerator = [[LanguageModelGenerator alloc] init];
    
    NSArray *words = [NSArray arrayWithObjects:@"NEXT", @"BACK", @"SEX", @"RACK",@"LACK",@"HECK", nil];
    NSString *name = @"NameIWantForMyLanguageModelFiles";
    NSError *err = [lmGenerator generateLanguageModelFromArray:words withFilesNamed:name];
    
    
    NSDictionary *languageGeneratorResults = nil;
    
    NSString *lmPath = nil;
    NSString *dicPath = nil;
	
    if([err code] == noErr) {
        
        languageGeneratorResults = [err userInfo];
		
        lmPath = [languageGeneratorResults objectForKey:@"LMPath"];
        dicPath = [languageGeneratorResults objectForKey:@"DictionaryPath"];
		
    } else {
        NSLog(@"Error: %@",[err localizedDescription]);
    }
    [self.openEarsEventsObserver setDelegate:self];
    [self.pocketsphinxController startListeningWithLanguageModelAtPath:lmPath dictionaryAtPath:dicPath languageModelIsJSGF:NO];
    [self.pocketsphinxController returnNullHypotheses];

}

- (void)viewWillDisappear:(BOOL)animated {
    [self.openEarsEventsObserver setDelegate:nil];
    [self.pocketsphinxController stopListening];

    
}


- (void) pocketsphinxDidReceiveHypothesis:(NSString *)hypothesis recognitionScore:(NSString *)recognitionScore utteranceID:(NSString *)utteranceID {
	NSLog(@"The received hypothesis is %@ with a score of %@ and an ID of %@", hypothesis, recognitionScore, utteranceID);
    if([recognitionScore intValue] < 0)
    {
        
    if([hypothesis isEqualToString: @"NEXT"])
    {
        if(self.pageControl.currentPage != [ self.pageControl numberOfPages]-1)
           {
    self.pageControl.currentPage = self.pageControl.currentPage+1;
           }
    }
        
    if([hypothesis isEqualToString: @"BACK"])
    {
        if(self.pageControl.currentPage != 0)
        {
        self.pageControl.currentPage = self.pageControl.currentPage-1;
        }
    }
    CGPoint offset = CGPointMake(self.pageControl.currentPage * self.scrollView.frame.size.width, 0);
    [self.scrollView setContentOffset:offset animated:YES];
    }
}

- (void) pocketsphinxDidStartCalibration {
}

- (void) pocketsphinxDidCompleteCalibration {
    //NSLog(@"Calibration");
}

- (void) pocketsphinxDidStartListening {
    //NSLog(@"Start Listening");
}

- (void) pocketsphinxDidDetectSpeech {
    //NSLog(@"Detect Speech");
}

- (void) pocketsphinxDidDetectFinishedSpeech {
   //NSLog(@"Detect finished Speech");
}

- (void) pocketsphinxDidStopListening {
} 

- (void) pocketsphinxDidSuspendRecognition {
}

- (void) pocketsphinxDidResumeRecognition {
}

- (void) pocketsphinxDidChangeLanguageModelToFile:(NSString *)newLanguageModelPathAsString andDictionary:(NSString *)newDictionaryPathAsString {
	NSLog(@"Pocketsphinx is now using the following language model: \n%@ and the following dictionary: %@",newLanguageModelPathAsString,newDictionaryPathAsString);
}

- (void) pocketSphinxContinuousSetupDidFail { // This can let you know that something went wrong with the recognition loop startup. Turn on OPENEARSLOGGING to learn why.
	NSLog(@"Setting up the continuous recognition loop has failed for some reason, please turn on OpenEarsLogging to learn more.");
}



@end
