# RDStoryboardDemo

![图1](http://upload-images.jianshu.io/upload_images/7001298-c8151d03cad11223?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240) 

进入Storyboard文件，添加一个Scene。

![图2](https://upload-images.jianshu.io/upload_images/7001298-6ab5ee1045dc79f4.gif?imageMogr2/auto-orient/strip)



设置Scene对应的类。如下图，在Custom Class填入类名。Identity中Storyboard ID的作用后面会讲。

![图3](http://upload-images.jianshu.io/upload_images/7001298-4d9570f96f594759?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##加载Storyboard

如上图，代码中要获取RDHomeViewController在Storyboard中的这个实例，需要用到UIStoryboard中的API

```
#import <Foundation/Foundation.h>
#import <UIKit/UIKitDefines.h>

@class UIViewController;

NS_ASSUME_NONNULL_BEGIN

NS_CLASS_AVAILABLE_IOS(5_0) @interface UIStoryboard : NSObject {
}

+ (UIStoryboard *)storyboardWithName:(NSString *)name bundle:(nullable NSBundle *)storyboardBundleOrNil;

- (nullable __kindof UIViewController *)instantiateInitialViewController;
- (__kindof UIViewController *)instantiateViewControllerWithIdentifier:(NSString *)identifier;

@end

NS_ASSUME_NONNULL_END
```
代码如下

```
UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Home" bundle:nil];

RDHomeViewController *homeViewController = (RDHomeViewController *)[storyboard instantiateViewControllerWithIdentifier:@"RDHomeViewController"];
```
此处的“Home”为Storyboard创建时的命名，Identifier为图3中的Storyboard ID。

UIStoryboard中的另一个方法
```
UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Home" bundle:nil];

RDHomeViewController *homeViewController = (RDHomeViewController *)[storyboard instantiateInitialViewController];
```
此方法获取到的是勾选了下图所示项的UIViewController，一个Storyboard中只能有一个Initial View Controller。
![图4](https://upload-images.jianshu.io/upload_images/7001298-6998bec73783eac1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##Storyboard中添加子视图

在RDHomeViewController中声明一个tableView属性，声明前添加IBOutlet，表示该对象是在Interface Builder中创建的。

```
@interface RDHomeViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end
```
然后在Storyboard中添加一个Table View，并和tableView关联。

![图5](https://upload-images.jianshu.io/upload_images/7001298-54aefd30341fd78e.gif?imageMogr2/auto-orient/strip)

图5中黑色弹框为选中tableView点击右键弹出。这样就可以在代码中使用在Storyboard中创建的tableView。tableView的许多属性都可以在下图所示位置设置。

![图6](https://upload-images.jianshu.io/upload_images/7001298-569b38d9a68fe931.gif?imageMogr2/auto-orient/strip)

##Autolayout自动布局

Storyboard中创建的子视图应该使用Autolayout进行布局。自动布局的核心是添加约束。

```
self.tableView.frame = CGRectMake(100, 100, 100, 100);
```
这种设置frame的方法使用的是绝对坐标系统，以父视图左上角为原点，每个子视图的x、y都是与原点之前的距离。 
Autolayout使用相对坐标系统，通过设置约束确定子视图的位置和尺寸。

![图7](https://upload-images.jianshu.io/upload_images/7001298-39e0379d90c961ba.gif?imageMogr2/auto-orient/strip)

上图给tableView添加的约束为，充满屏幕除顶部状态栏和导航栏（如果存在）、底部tabBar（如果存在）之外的部分，无论是什么尺寸的屏幕，tableView都是显示在这部分区域。

![图8](https://upload-images.jianshu.io/upload_images/7001298-6df5cd170c7adaa3.gif?imageMogr2/auto-orient/strip)

通过上图的方式设置约束的constant，此时tableView距离屏幕左边缘50个点，距离屏幕右边缘100个点。


在Storyboard中添加约束可以帮助我们解决大部分屏幕适配的问题，但有些适配需要在代码中完成。比如图8中，在4.7-inch屏幕上，tableView与屏幕左边缘的距离为50，但是在5.5-inch屏幕上，我们希望这个距离为100。此时我们需要在代码中通过判断屏幕尺寸来设置此约束的constant。

```
@interface RDHomeViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, weak) IBOutlet NSLayoutConstraint *tableViewLeftConstraint;

@end
```

每一个约束都是NSLayoutConstraint的实例，我们创建一个IBOutlet 修饰的tableViewLeftConstraint属性，然后与Storyboard中的约束关联。

![图9](https://upload-images.jianshu.io/upload_images/7001298-e5d15536e7eae9df.gif?imageMogr2/auto-orient/strip)

```
self.tableViewLeftConstraint.constant = 10;
```
这样就可以在代码中设置self.tableViewLeftConstraint.constant的值了。


##Storyboard中的UITableView

UITableView是我日常开发中使用最多的控件，大部分页面都可以用
tableView实现。下面介绍一下在Storyboard中使用tableView。

在之前的内容中，我们已经在RDHomeViewController中添加一个tableView。接着给tableView添加一个cell，在Storyboard中可以直接把cell拖入tableView。

![图10](https://upload-images.jianshu.io/upload_images/7001298-2c489b07213ddfe1.gif?imageMogr2/auto-orient/strip)

####设置cell对应的类。
RDHomeFirstTableCell是一个继承自UITableViewCell的类。
```
#import <UIKit/UIKit.h>

@interface RDHomeFirstTableCell : UITableViewCell

@end
```
![图11](https://upload-images.jianshu.io/upload_images/7001298-fc8a2141f63ec1cf.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

####设置cell的Identifier。

![图12](https://upload-images.jianshu.io/upload_images/7001298-fd681e58d5444847.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

Identifier是cell的唯一标识，在UITableViewDataSource的- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath方法中通过Identifier获取到对应的cell
```
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"RDHomeFirstTableCell";
    RDHomeFirstTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    return cell;
}
```
####cell添加子视图
在cell上添加一个label，并添加约束。

![图13](https://upload-images.jianshu.io/upload_images/7001298-71d4c10b4a2375d4.gif?imageMogr2/auto-orient/strip)


####设置tableView代理

代理可以在代码中设置，也可以在Storyboard中设置。

![图14](https://upload-images.jianshu.io/upload_images/7001298-d814b06d9a0f97d4.gif?imageMogr2/auto-orient/strip)

####配置cell子视图

根据面向对象的封装性，cell的子视图应该由cell自己来管理。即外部给cell一个model，cell显示相应的内容。为了更好的体现封装性，除需要在外部使用的属性外，属性声明应该写在匿名类别（即类扩展）中。

```
@interface RDHomeFirstTableCell ()

@property (nonatomic, weak) IBOutlet UILabel *labelTitle;

@end
```

![图15](https://upload-images.jianshu.io/upload_images/7001298-c6b32e864a416f69.gif?imageMogr2/auto-orient/strip)


将label与labelTitle关联，便可在代码中设置label。按照上述方法再添加一个labelDetail。可以在Storyboard中设置label的text，也可以在代码中设置。

```
- (void)awakeFromNib {
    [super awakeFromNib];
    self.labelTitle.text = @"我是标题";
    self.labelDetail.text = @"我是详情";
}
```
在Storyboard中和awakeFromNib方法中设置的是固定的标题，如果需要动态设置，需要添加一个public方法

```
- (void)configureWithModel:(RDHomeFirstCellModel *)cellModel {
    self.labelTitle.text = cellModel.titleText;
    self.labelDetail.text = cellModel.detailText;
}
```
在此处调用

```
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"RDHomeFirstTableCell";
    RDHomeFirstTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    [cell configureWithModel:self.dataSource[indexPath.row]];
    return cell;
}
```
这样写就是cell自己管理子视图，外部只需要告诉它需要显示的内容，减少了ViewController中的代码量。

如果cell上有action，可以通过delegate回调ViewController。

```
#import <UIKit/UIKit.h>

@class RDHomeFirstCellModel;
@protocol RDHomeFirstTableCellDelegate;
@interface RDHomeFirstTableCell : UITableViewCell

@property (nonatomic, weak) id <RDHomeFirstTableCellDelegate> delegate;

- (void)configureWithModel:(RDHomeFirstCellModel *)cellModel;

@end

@protocol RDHomeFirstTableCellDelegate <NSObject>

- (void)firstTableCell:(RDHomeFirstTableCell *)firstTableCell didClickButtonWithModel:(RDHomeFirstCellModel *)cellModel;

@end
```

```
- (IBAction)buttonClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(firstTableCell:didClickButtonWithModel:)]) {
        [self.delegate firstTableCell:self didClickButtonWithModel:self.cellModel];
    }
}
```

cell上添加一个button，关联点击事件。

![图16](https://upload-images.jianshu.io/upload_images/7001298-883c591dc6f51f49.gif?imageMogr2/auto-orient/strip)

##关于Storyboard合作开发的问题

将Storyboard按模块和功能进行拆分，每个Storyboard只由一个开发者负责，Storyboard之间使用UIStoryboard中的API建立连接，可以尽可能的避免合作开发的问题。

##小结

以上就是在日常开发中Storyboard的基本用法，由于笔者的水平有限，如有不足之处，欢迎交流指正。

代码地址：https://github.com/rainday666/RDStoryboardDemo
