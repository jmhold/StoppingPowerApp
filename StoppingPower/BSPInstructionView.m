#import "BSPInstructionView.h"
#import "BSPUI.h"

@interface BSPInstructionView()
@property (nonatomic) UILabel *textLabel;
@property (nonatomic) UIButton *button;
@property (nonatomic) UIImageView *imageView;

@end

@implementation BSPInstructionView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor studyBgDarkGray];
        
        UILabel *textLabel = [BSPUI labelWithFont:[BSPUI boldFontOfSize:20.0f]];
        textLabel.numberOfLines = 0;
        textLabel.textColor = [UIColor whiteColor];
        textLabel.text = @"Touch the image that gets your attention first. You have two seconds to make your choice, as indicated by the time bar above the images.";
        
        UIButton *button = [BSPUI blackButtonWithTitle:@"Ok, I got it."];
        [button addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        
        self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_instructions"]];
        
        UIGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [self addGestureRecognizer:tapRecognizer];
        
        self.textLabel = textLabel;
        self.button = button;
        
        [self addSubview:self.imageView];
        [self addSubview:textLabel];
        [self addSubview:button];
    }
    return self;
}

-(void)dismiss {
    self.hidden = YES;
    [[NSNotificationCenter defaultCenter] postNotificationName:BSPInstructionViewDismissed object:self];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    [self.textLabel centerHorizonallyAtY:100 inBounds:self.bounds thatFits:CGSizeMake(500, CGFLOAT_MAX)];
    [self.imageView centerHorizonallyAtY:125 inBounds:self.bounds thatFits:CGSizeUnbounded];
    [self.button centerHorizonallyAtY:200 inBounds:self.bounds thatFits:CGSizeUnbounded];
}

@end
