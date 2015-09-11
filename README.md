# Masonry 实践1

需求如下：
> 有这样一个界面，横向排列 2 个 UIView ，左边的 UIView 的宽度是右边 UIView 宽度的一半，左边 UIView 的高宽比是固定的，整个视图支持旋转

storyboard 里面设置约束应该也是可以做到的，不过约束一多就分不清哪个是哪个了，很容易乱掉，想了想这个用 [Masonry](https://github.com/cloudkite/Masonry.git) 来实现，看起来可维护性更好一点。

实现代码如下，意思很明白，应该不用解释了吧

```
    [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(padding);
        make.top.mas_equalTo(padding);
        make.height.equalTo(self.leftView.mas_width).multipliedBy(ratio);
    }];
        
```

```
    [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(padding);
        make.leading.equalTo(self.leftView.mas_trailing).with.offset(padding);
        make.trailing.mas_equalTo(-padding);
        make.width.equalTo(self.leftView.mas_width).multipliedBy(2);
        make.height.equalTo(self.leftView.mas_height);
    }];

```
