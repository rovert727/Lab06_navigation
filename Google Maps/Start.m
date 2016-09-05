//
//  ViewController.m
//  Google Maps
//
//  Created by Jose Rodriguez 8/11/16.
//  Copyright © 2016 Jose. All rights reserved.
//
#import "Start.h"
#import <Google/Analytics.h>
#import "Details.h"


@import GoogleMaps;

float latitude;
float longitude;
int counter;

@interface Start ()

@end

@implementation Start {
    GMSMapView *mapView_;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self createMap];
    
    //[self viewWillAppear];
}
-(void)viewWillAppear:(BOOL)animated
{
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"Start"];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)createMap {
    // Create a GMSCameraPosition that tells the map to display t
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:36.200621 longitude:-115.275286 zoom:4];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.delegate=self;
    self.view = mapView_;

}
/**********************************************************************************************/
#pragma mark - GMSMapViewDelegate
/**********************************************************************************************/

- (void)mapView:(GMSMapView *)mapView didLongPressAtCoordinate:(CLLocationCoordinate2D)coordinate {
    if(counter==5){
        counter=0;
    [mapView_ clear];
        }
    counter++;
    GMSMarker *marker = [[GMSMarker alloc] init];
    GMSMarker *marker1 = [[GMSMarker alloc] init];
    GMSMarker *marker2 = [[GMSMarker alloc] init];
    GMSMarker *marker3 = [[GMSMarker alloc] init];
    GMSMarker *marker4 = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude);
    marker1.position = CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude);
    marker2.position = CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude);
    marker3.position = CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude);
    marker4.position = CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude);
    /*Global variables to share the coordinate*/
    latitude=coordinate.latitude;
    longitude=coordinate.longitude;
    
    marker.map = mapView_;
    marker1.map = mapView_;
    marker3.map = mapView_;
    marker2.map = mapView_;
    marker4.map = mapView_;
    
   
}

/**********************************************************************************************/
#pragma mark - SEGUE
/**********************************************************************************************/
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    /*
    if([segue.destinationViewController isKindOfClass:[Details class]])
    {
      Place to share the coordinate variables to the next Details class
    }
     */
}







@end
