//
//  TableViewController.m
//  WebServices with Collection View Controller
//
//  Created by Student-002 on 21/11/16.
//  Copyright © 2016 Felix-its. All rights reserved.
//

#import "TableViewController.h"



@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _name=[[NSMutableArray alloc]init];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
    
   _queue=dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
    
    NSLog(@"%@ tempvalue in didload",_temp);
   
}

-(void)viewWillAppear:(BOOL)animated
{
    dispatch_async(_queue, ^{
        
        
        
     //   NSString *temp=@"https://maps.googleapis.com/maps/api/place/search/json?location=18.5204,%2073.8567&radius=1500&types=atm=true&key=AIzaSyBOeZjfivTWR9f0S5-7ceoGUXQ0tGEho-c";
        NSURL *url=[NSURL URLWithString:_temp];
        NSData *data=[NSData dataWithContentsOfURL:url];
        if(data==nil)
        {
            NSLog(@"Data is nil");
            
           
        }
        else
        {
            NSDictionary *outerdic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
            NSArray *results=[outerdic objectForKey:@"results"];
            for(NSDictionary *temp in results)
                {
                    NSString *name=[temp objectForKey:@"name"];
                    [_name addObject:name];
                    [self.tableView reloadData];
                   
                }
             NSLog(@"%@",_name[0]);
//            [self.tableView reloadData];
            }
    });
   

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return _name.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    cell.textLabel.text=[_name objectAtIndex:indexPath.row];
    // Configure the cell...
   // [tableView reloadData];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
