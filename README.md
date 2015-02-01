This app shows demonstrates a folding animation for UITableViewCells.

It can be used on any UIView, but it looks *really* good on UITableViewCells.

On a UITableViewCell that has one "collapsible" area (thanks autolayout!), the animation looks like this:

![Animated demo](https://raw.githubusercontent.com/rbobbins/animation-demo/master/screenshots/video_demo.gif)

## Usage:
```
- (void)foldOpenWithTransparency:(BOOL)withTransparency
             withCompletionBlock:(void (^)(void))completionBlock;

- (void)foldClosedWithTransparency:(BOOL)withTransparency
             withCompletionBlock:(void (^)(void))completionBlock;
```

* `withTransparency`: YES hides all the subviews of the view you're animating, so you can see what's behind it. NO shows a black background while the animation is going on.
* `withCompletionBlock`: Sometimes you want to change the state of your superview before animating... use the completion block to change it back when done!
