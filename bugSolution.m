The solution involves using `__weak` to capture `self` within the block, breaking the strong reference cycle:

```objectivec
@interface MyClass : NSObject
@property (strong, nonatomic) NSString *myString;
@end

@implementation MyClass
- (void)someMethod {
    __weak typeof(self) weakSelf = self;
    self.myString = [NSString stringWithFormat:@