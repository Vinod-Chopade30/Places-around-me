//
//  CollectionViewController.m
//  WebServices with Collection View Controller
//
//  Created by Student-002 on 18/11/16.
//  Copyright © 2016 Felix-its. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"
#import "TableViewController.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];

    _img=[[NSMutableArray alloc]initWithObjects:@"ATM",@"Bank",@"Hospital",@"Hotel",@"School",@"Shop", nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of items
    return _img.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.lbl.text=[_img objectAtIndex:indexPath.row];
    cell.imgview.image=[UIImage imageNamed:[_img objectAtIndex:indexPath.row]];
    // Configure the cell
    
    return cell;
}

//#pragma mark <UICollectionViewDelegate>


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Tab_seg"]) {
        NSArray*indxpath = [self.collectionView indexPathsForSelectedItems];
        NSIndexPath *indexPath=[indxpath objectAtIndex:0];
       TableViewController *table = segue.destinationViewController;
       
        
        if (indexPath.row==0)
        {
            table.temp=@"https://maps.googleapis.com/maps/api/place/search/json?location=18.5204,%2073.8567&radius=1500&types=atm=true&key=AIzaSyBOeZjfivTWR9f0S5-7ceoGUXQ0tGEho-c";
            
            
            NSLog(@"temp value in indexrow - %@ ",table.temp);
        }
        else if (indexPath.row==1)
        {
            table.temp=@"https://maps.googleapis.com/maps/api/place/search/json?location=18.5204,%2073.8567&radius=1500&types=bank=true&key=AIzaSyBOeZjfivTWR9f0S5-7ceoGUXQ0tGEho-c";
        }
        else if (indexPath.row==2)
        {
            table.temp=@"https://maps.googleapis.com/maps/api/place/search/json?location=18.5204,%2073.8567&radius=1500&types=hospital=true&key=AIzaSyBOeZjfivTWR9f0S5-7ceoGUXQ0tGEho-c";
        }
        else if (indexPath.row==3)
        {
            table.temp=@"https://maps.googleapis.com/maps/api/place/search/json?location=18.5204,%2073.8567&radius=1500&types=restaurant=true&key=AIzaSyBOeZjfivTWR9f0S5-7ceoGUXQ0tGEho-c";
        }
        else if (indexPath.row==4)
        {
            table.temp=@"https://maps.googleapis.com/maps/api/place/search/json?location=18.5204,%2073.8567&radius=1500&types=school=true&key=AIzaSyBOeZjfivTWR9f0S5-7ceoGUXQ0tGEho-c";
        }
        else if (indexPath.row==5)
        {
            table.temp=@"https://maps.googleapis.com/maps/api/place/search/json?location=18.5204,%2073.8567&radius=1500&types=store=true&key=AIzaSyBOeZjfivTWR9f0S5-7ceoGUXQ0tGEho-c";
        }
        
        //table.temp =@"hello";
        //[recipes objectAtIndex:indexPath.row];
    }
}
/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
