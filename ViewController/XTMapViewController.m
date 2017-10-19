#import "TLCityPickerController.h"
#import "XTMapViewController.h"
#import "CCLocationManager.h"
//#import "TLCityPickerController.h"
@interface XTMapViewController ()<BMKPoiSearchDelegate,TLCityPickerDelegate,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIScrollViewDelegate> {
    BMKPoiSearch* _poisearch;
    int curPage;
}
@property (weak, nonatomic) IBOutlet UITextField *chooseCityText;

@property (weak, nonatomic) IBOutlet UITextField *addText;
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSMutableArray *cellArr;
@end

@implementation XTMapViewController
- (IBAction)chooseCity:(UIButton *)sender {
    TLCityPickerController *cityPickerVC = [[TLCityPickerController alloc] init];
    [cityPickerVC setDelegate:self];
        cityPickerVC.locationCityID = [self getCityCodeByCityName];
    cityPickerVC.hotCitys = @[@"100010000", @"200010000", @"300210000", @"600010000", @"300110000"];
    NSLog(@"%@",cityPickerVC.locationCityID);
    UINavigationController *nav =[[UINavigationController alloc]initWithRootViewController:cityPickerVC];
    [self presentViewController:nav animated:YES completion:^{
    }];
}
//获取当前定位城市的code
-(NSString *)getCityCodeByCityName{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"CityData" ofType:@"plist"]];
    for (NSDictionary *groupDic in array) {
        for (NSDictionary *dic in [groupDic objectForKey:@"citys"]) {
            if([[dic objectForKey:@"city_name"] isEqualToString:self.chooseCityText.text]){
                return [dic objectForKey:@"city_key"];
            }
        }
    }
    return @"700100000";
}
- (void) cityPickerController:(TLCityPickerController *)cityPickerViewController
                didSelectCity:(TLCity *)city;{
    NSLog(@"选择了城市：%@",city.cityName);
    self.chooseCityText.text = city.cityName;
}
- (IBAction)search:(UIButton *)sender {
    [self.cellArr removeAllObjects];
    BMKCitySearchOption *citySearchOption = [[BMKCitySearchOption alloc]init];
    citySearchOption.pageIndex = curPage;
    citySearchOption.pageCapacity = 10;
    citySearchOption.city= self.chooseCityText.text;
    citySearchOption.keyword = self.addText.text;
    NSLog(@"城市：%@,地址:%@",self.chooseCityText.text,_addText.text);
    BOOL flag = [_poisearch poiSearchInCity:citySearchOption];
    if(flag){
        NSLog(@"城市内检索发送成功");
    }
    else{
        NSLog(@"城市内检索发送失败");
    }
}

- (IBAction)end:(UITextField *)sender {
     [sender resignFirstResponder];
}
-(void)footRequest{
    curPage++;
    //城市内检索，请求发送成功返回YES，请求发送失败返回NO
    BMKCitySearchOption *citySearchOption = [[BMKCitySearchOption alloc]init];
    citySearchOption.pageIndex = curPage;
    citySearchOption.pageCapacity = 10;
    citySearchOption.city= self.chooseCityText.text;
    citySearchOption.keyword = self.addText.text;
    BOOL flag = [_poisearch poiSearchInCity:citySearchOption];
    if(flag){
        NSLog(@"城市内检索发送成功");
    }else{
        NSLog(@"城市内检索发送失败");
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [[CCLocationManager shareLocation] getCity:^(NSString *addressString) {
        self.chooseCityText.text = addressString;
    }];
    self.cellArr = [NSMutableArray array];
    curPage = 0;
    _poisearch = [[BMKPoiSearch alloc]init];
    [self.view addSubview:self.tableview];
    
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _poisearch.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
}
- (void)dealloc {
    if (_poisearch != nil) {
        _poisearch = nil;
    }
}
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    _poisearch.delegate = nil; // 不用时，置nil
}


#pragma mark -
#pragma mark implement BMKSearchDelegate
- (void)onGetPoiResult:(BMKPoiSearch *)searcher result:(BMKPoiResult*)result errorCode:(BMKSearchErrorCode)error
{
    if (error == BMK_SEARCH_NO_ERROR) {
        for (int i = 0; i < result.poiInfoList.count; i++) {
            BMKPoiInfo* poi = [result.poiInfoList objectAtIndex:i];
            [self.cellArr addObject:poi];
        }
        [self.tableview footerEndRefreshing];
        [self.tableview reloadData];
    } else if (error == BMK_SEARCH_AMBIGUOUS_ROURE_ADDR){
        NSLog(@"起始点有歧义");
    } else {
        // 各种情况的判断。。。
    }
}

#pragma mark - tableviewDelegate

-(UITableView*)tableview{
    if(!_tableview){
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 114, kScreenWidth, kScreenHeight-114) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
//        _tableview.separatorStyle  = UITableViewCellSeparatorStyleNone;
        _tableview.emptyDataSetSource = self;
        _tableview.emptyDataSetDelegate = self;
        _tableview.tableFooterView = [UIView new];
        [_tableview addFooterWithTarget:self action:@selector(footRequest)];
    }
    return _tableview;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cellArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *tableCell = @"cellIdentifier";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableCell];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                          reuseIdentifier:tableCell];
    }
    if (self.cellArr) {
        BMKPoiInfo* poi = self.cellArr[indexPath.row];
        cell.textLabel.text = poi.name;
        cell.detailTextLabel.text = poi.address;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BMKPoiInfo* poi = self.cellArr[indexPath.row];
    
    NSDictionary *dic =@{
                         @"lon":[NSString stringWithFormat:@"%f",poi.pt.longitude],
                         @"lat":[NSString stringWithFormat:@"%f",poi.pt.latitude],
                         @"name":poi.name
                         };
    if(self.callback){
        self.callback(dic);
    }
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}


#pragma mark - DZNEmptyDataSetSource
-(NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView{
    
    NSString *text = @"无结果";
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0f],
                                 NSForegroundColorAttributeName: [UIColor darkGrayColor]};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = @"没有搜索到，请检查地址是否输入正确";
    
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0f],
                                 NSForegroundColorAttributeName: [UIColor lightGrayColor],
                                 NSParagraphStyleAttributeName: paragraph};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view
{
    
}



























- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
