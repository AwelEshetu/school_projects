//
//  CalendarView.m
//  pushCalendar
//
//  Created by iosdev on 11/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalendarView.h"
#import <QuartzCore/QuartzCore.h>
#import "AddEvent.h"


const unsigned int uppermargin =130;
unsigned int x;
unsigned int y;
const float width=40;
const  float height=35;
const  float prevNextButtonSize=20;
const  float prevNextButtonSpaceWidth=15;
const float prevNextButtonSpaceHeight=10;

static int collectWeekNumbers;

@implementation CalendarView

@synthesize currentMonthDate;
@synthesize currentSelectDate;
@synthesize currentTime;
@synthesize viewImageView;
@synthesize currentWeek;
@synthesize delegate1;


-(void)initCalView{
	currentTime=CFAbsoluteTimeGetCurrent();
	currentMonthDate=CFAbsoluteTimeGetGregorianDate(currentTime,CFTimeZoneCopyDefault());
	currentMonthDate.day=1;
	currentSelectDate.year=0;
    currentWeek = CFAbsoluteTimeGetGregorianDate(currentTime, CFTimeZoneCopyDefault());
    [self getWeekOfYear:currentWeek];
    self.backgroundColor=[UIColor whiteColor];
}
- (id)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
		[self initCalView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
	
	if (self = [super initWithFrame:frame]) {
		[self initCalView];
	}
	return self;
}

-(int)getDayCountOfaMonth:(CFGregorianDate)date{
	switch (date.month) {
		case 1:
		case 3:
		case 5:
		case 7:
		case 8:
		case 10:
		case 12:
			return 31;
			
		case 2:
			if(date.year%4==0 && date.year%100!=0)
				return 29;
			else
				return 28;
		case 4:
		case 6:
		case 9:		
		case 11:
			return 30;
		default:
			return 31;
	}
}
-(void)drawPrevButton:(CGPoint)leftTop{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetGrayStrokeColor(ctx, 0, 1);
    CGContextMoveToPoint(ctx,leftTop.x , prevNextButtonSpaceWidth/2+leftTop.y);
    CGContextAddLineToPoint(ctx, prevNextButtonSize+leftTop.x, leftTop.y);
    CGContextAddLineToPoint(ctx, prevNextButtonSize+leftTop.x, prevNextButtonSize+leftTop.y);
    //CGContextAddLineToPoint(ctx, 0+leftTop.x, 0+leftTop.y);
    
    CGContextFillPath(ctx);
}
-(void)drawNextButton:(CGPoint )leftTop{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetGrayStrokeColor(ctx, 0, 1);
    CGContextMoveToPoint(ctx,leftTop.x,  leftTop.y);
    CGContextAddLineToPoint(ctx, prevNextButtonSize+leftTop.x, prevNextButtonSpaceHeight+leftTop.y);
    CGContextAddLineToPoint(ctx, 0+leftTop.x, prevNextButtonSize+leftTop.y);
    // CGContextAddLineToPoint(ctx, 0+leftTop.x, 0+leftTop.y);
    
    CGContextFillPath(ctx);
    
}

-(void)drawTopGradientBar{
    
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    size_t num_locations=3;
    CGFloat locations[3]={0.0,0.7,1.0}; // total number of position
    CGFloat components[12]={0.0,0.30,0.0,1.0,
        0.5,0.5,0.5,0.5,
        0.40,0.0,0.10,1.0
    }; // color combination
    CGGradientRef myGradient;
    CGColorSpaceRef myColorspace = CGColorSpaceCreateDeviceRGB();
    myGradient =CGGradientCreateWithColorComponents(myColorspace, components, locations, num_locations);
    CGPoint myStartPoint, myEndPoint;
    myStartPoint.x=uppermargin;
    myStartPoint.y=40;
    myEndPoint.x=uppermargin;
    myEndPoint.y=uppermargin;
    
    CGContextDrawLinearGradient(ctx, myGradient, myStartPoint, myEndPoint, 0);
    
    CGGradientRelease(myGradient);
    
    // Draw Previous Button and next button
    
    [self drawPrevButton:CGPointMake(10, 50)];
    [self drawNextButton:CGPointMake(290, 50)];
    
    
    
}


- (void)drawDateBoxes
{
    CGRect rectangle;
    // Drawing code
    for(int i =0;i<6;i++){
        y=i*height+uppermargin;
        
        for(int j =0;j<8;j++){
            x=j*width;
            
            CGMutablePathRef path = CGPathCreateMutable();              /*create the path first*/
            rectangle = CGRectMake(x, y, width, height);  /*our rectangle boundaries*/
            CGPathAddRect(path, NULL, rectangle);                       /*add the rectangle to the path*/
            CGContextRef currentContext =UIGraphicsGetCurrentContext(); /*get the handle to the current context*/
            CGContextAddPath(currentContext, path);                       /*add the path to the context*/
            [[UIColor colorWithRed:0.20f green:0.60f blue:0.0f alpha:0.25f]setFill];/*set the fill color*/
            [[UIColor colorWithRed:0.0f green:0.0f blue:0.10f alpha:0.1f]setStroke];                            //set the stroke color to brown
            CGContextSetLineWidth(currentContext, 1.0f);                                    /*set the line width*/
            CGContextDrawPath(currentContext, kCGPathFillStroke);       /*stroke and fill the path on the context*/
            CGPathRelease(path);     
        }/*dispose of the path*/
    }
    //Drawing the UIView
    
}


-(void)drawNameOfDaysAtTop {
    
    [[UIColor blackColor]set];
    int width = self.frame.size.width;// gives the total size of the frame ie 320
    int s_width = width/8;// we want to have the display in the same amount of distance 8 column
    
    NSString *monthName;
    switch (currentMonthDate.month) {
        case 1:
            monthName=@"January";
            break;
        case 2:
            monthName=@"February";
            break;
        case 3:
            monthName=@"March";
            break;
        case 4:
            monthName=@"April";
            break;
        case 5:
            monthName=@"May";
            break;
        case 6:
            monthName=@"June";
            break;
        case 7:
            monthName=@"July";
            break;
        case 8:
            monthName=@"August";
            break;
        case 9:
            monthName=@"September";
            break;
        case 10:
            monthName=@"October";
            break;
        case 11:
            monthName=@"November";
            break;
        case 12:
            monthName=@"December";
            break;
            
        default:
            break;
    }
    NSString *title_Month = [[NSString alloc]initWithFormat:@"%@ %d",monthName,currentMonthDate.year];
    
    
    int fontsize= [UIFont buttonFontSize]; //buttonFontSize returns the fonts suitable for a button
    
    UIFont *font = [UIFont boldSystemFontOfSize:20];
    CGPoint location = CGPointMake(width/2-uppermargin+50, prevNextButtonSpaceHeight+40); //location holds the points set by cgpointmake
    [title_Month drawAtPoint:location withFont:font];
    
    
    UIFont *weekfont = [UIFont boldSystemFontOfSize:15];
    
    fontsize+=75;
    [[UIColor brownColor]set];
    [@"Wk" drawAtPoint:CGPointMake(s_width*0+9,fontsize) withFont:weekfont];
    [[UIColor blackColor]set];
    [@"Mon" drawAtPoint:CGPointMake(s_width*0.89+9,fontsize) withFont:weekfont];
    [@"Tue" drawAtPoint:CGPointMake(s_width*1.89+9,fontsize) withFont:weekfont];
	[@"Wed" drawAtPoint:CGPointMake(s_width*2.89+9,fontsize) withFont:weekfont];
	[@"Thu" drawAtPoint:CGPointMake(s_width*3.89+9,fontsize) withFont:weekfont];
	[@"Fri" drawAtPoint:CGPointMake(s_width*4.89+9,fontsize) withFont:weekfont];
	[[UIColor colorWithRed:0.0 green:0.2 blue:1 alpha:0.9]set];
	[@"Sat" drawAtPoint:CGPointMake(s_width*5.89+9,fontsize) withFont:weekfont];
    [[UIColor redColor] set];
	[@"Sun" drawAtPoint:CGPointMake(s_width*6.8+9,fontsize) withFont:weekfont];
    [[UIColor blackColor]set];
    
    
}


//methods to play with dates


- (int)getMonthWeekday:(CFGregorianDate)date{
    
    CFTimeZoneRef timezone= CFTimeZoneCopyDefault();
    CFGregorianDate month_date;
    month_date.year = date.year;
    month_date.month=date.month;
    month_date.day=1;
    month_date.hour=0;
    month_date.minute=0;
    month_date.second=1; //
    
    
    
    return (int)CFAbsoluteTimeGetDayOfWeek(CFGregorianDateGetAbsoluteTime(month_date, timezone), timezone);//2
    
}
//weekView 
-(int)getWeekOfYear:(CFGregorianDate)date{
    
    CFTimeZoneRef timezone= CFTimeZoneCopyDefault();
    CFGregorianDate month_date;
    month_date.year = date.year;
    month_date.month=date.month;
    month_date.day=0;
    month_date.hour=0;
    month_date.minute=0;
    month_date.second=1;
    
    //   NSLog(@"check week return =%ld",CFAbsoluteTimeGetWeekOfYear(CFGregorianDateGetAbsoluteTime(month_date, timezone), timezone));
    collectWeekNumbers =(int)CFAbsoluteTimeGetWeekOfYear(CFGregorianDateGetAbsoluteTime(month_date, timezone), timezone);
    return (int)CFAbsoluteTimeGetWeekOfYear(CFGregorianDateGetAbsoluteTime(month_date, timezone), timezone);
    
}

//Drawing the actual dates

-(void)drawDateWords{
    
    
    CGContextRef ctx =UIGraphicsGetCurrentContext();
    int width = self.frame.size.width;
    
    int dayCount = [self getDayCountOfaMonth:currentMonthDate];
    int day =0;
    int x =0;
    int y =0,i;
    int s_width=width/8;
    
    int current_weekday = [self getMonthWeekday:currentMonthDate];  
    
    UIFont *weekfont =[UIFont boldSystemFontOfSize:15];
    
    //int check_sunday=0;
    int check_saturday=0;
    int check_week=140;
    
    [[UIColor brownColor]set];
    //Week Number Display
    
    for(int k =1;k<7;k++){
        if(collectWeekNumbers >52){
            collectWeekNumbers =1;
        }   
        
        NSString *week = [[NSString alloc]initWithFormat:@"%2d",collectWeekNumbers];
        // NSLog(@"check the week number=%d",collectWeekNumbers);
        collectWeekNumbers++;
        if(k==6){
            collectWeekNumbers-=1;
        }
        [week drawAtPoint:CGPointMake(s_width-30, check_week) withFont:weekfont];
        check_week+=35;
        
    }
    
    
    [[UIColor blackColor]set];       
    for( i=1;i<dayCount+1;i++){
        day = i + current_weekday-2;  
        x = day%7;
        y=day/7;
        
        
        //printing 
        NSString *date = [[NSString alloc]initWithFormat:@"%2d",i];
        
        // Saturday and Sunday for colouring
        check_saturday=x*s_width+50;
        // check_sunday = x*s_width+50;
        
        //colour saturday
        if(check_saturday ==250){
            [[UIColor blueColor]set];
            [date drawAtPoint:CGPointMake(x*s_width+50, y*35+uppermargin+10) withFont:weekfont];
            
        }
        
        //colour sunday
        else if(check_saturday == 290){
            [[UIColor redColor]set];
            [date drawAtPoint:CGPointMake(x*s_width+50, y*35+uppermargin+10) withFont:weekfont];
            
            
        }
        else
            [date drawAtPoint:CGPointMake(x*s_width+50, y*35+uppermargin+10) withFont:weekfont];
        
        // NSLog(@"check these x:%d and y:%d, i:%d",x*s_width+50,y*35+uppermargin+10,i);
        
        CGContextSetRGBFillColor(ctx, 0, 0, 0, 1);
    }
    
    
    
    
}


-(void)movePrevNext:(int)isPrev{
    
    currentSelectDate.year =0;
    
    
    int width=self.frame.size.width;
    int position;
    if(isPrev==1){
        position=width;
    }
    else
        position=-width;
    
    UIImage *viewImage;
    
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    viewImage = UIGraphicsGetImageFromCurrentImageContext();
    if(viewImageView ==nil){
        viewImageView = [[UIImageView alloc]initWithImage:viewImage];
        viewImageView.center=self.center;
        [[self superview]addSubview:viewImageView];
    }
    else
    {
        viewImageView.image=viewImage;
        
    }
    
    viewImageView.hidden =NO;
    viewImageView.transform = CGAffineTransformMakeTranslation(0, 0);
    self.hidden=YES;
    [self setNeedsDisplay];
    self.transform=CGAffineTransformMakeTranslation(position, 0);
 
	self.hidden=NO;
	[UIView beginAnimations:nil	context:nil];
	[UIView setAnimationDuration:0.5];
	self.transform=CGAffineTransformMakeTranslation(0,0);
	viewImageView.transform=CGAffineTransformMakeTranslation(-position, 0);
	[UIView commitAnimations];
    
}

- (void)movePrevMonth{
    // int decrease=12;
	if(currentMonthDate.month>1){
		currentMonthDate.month-=1;
        // collectWeekNumbers-=decrease;
        [self getWeekOfYear:currentMonthDate];
        
        // NSLog(@"check the WeekHere1 %d",collectWeekNumbers);
    }
	else
	{
		currentMonthDate.month=12;
		currentMonthDate.year-=1;
        
	}
	[self movePrevNext:0]; 
    [self getWeekOfYear:currentMonthDate ];
    
    
}

- (void)moveNextMonth{
	if(currentMonthDate.month<12){
		currentMonthDate.month+=1;
        [self getWeekOfYear:currentMonthDate];
        
    }
	else
	{
		currentMonthDate.month=1;
		currentMonthDate.year+=1;
        [self getWeekOfYear:currentMonthDate];
	}
	[self movePrevNext:1];
	
    
}
//change the color of the selected cell
-(void)changeColor{
    /* int x;
     int y;
     int day;
     CGContextRef ctx = UIGraphicsGetCurrentContext();
     CFGregorianDate today = CFAbsoluteTimeGetGregorianDate(currentTime, CFTimeZoneCopySystem());
     if(today.year  == currentSelectDate.year && today.month==currentSelectDate.month && today.day ==currentSelectDate.day){
     
     int width = self.frame.size.width;
     int s_width=width/8;
     int weekday = [self getMonthWeekday:currentMonthDate];
     day=currentSelectDate.day+weekday-2;
     x=day%7;
     y=day/7;
     
     
     
     
     //to shade the cell for today's date
     CGContextSetRGBFillColor(ctx, 0.0, 0.5, 1.0, 1);
     CGContextMoveToPoint(ctx, x*s_width+s_width, y*height+uppermargin);
     CGContextAddLineToPoint(ctx, x*s_width+s_width+s_width, y*height+uppermargin);
     CGContextAddLineToPoint(ctx, x*s_width+s_width+s_width, y*height+uppermargin+height);
     CGContextAddLineToPoint(ctx, x*s_width+s_width, y*height+uppermargin+height);
     CGContextFillPath(ctx); 
     // [self setNeedsDisplay];
     }*/
    
}
-(void) touchAtDate:(CGPoint)touchPoint{
    
    //[self changeColor];
    int x;
    int y;
    int width=self.frame.size.width-40;//320
    
    int weekday=[self getMonthWeekday:currentMonthDate];// get the current month
    // NSLog(@"weekday=%d",weekday);
    int monthDayCount=[self getDayCountOfaMonth:currentMonthDate];//get the total day of the month
    //  NSLog(@"weekdayCont=%d",monthDayCount);
    x=((touchPoint.x-40)*7)/width;
    y=(touchPoint.y-(uppermargin))/height;
    
    int monthday=x+y*7-weekday+2;
    
    // NSLog(@"x=%f  y=%f  monthday=%d",touchPoint.x,touchPoint.y,monthday);
    if(monthday>0 && monthday<monthDayCount+1)
    {
        currentSelectDate.year=currentMonthDate.year;
        currentSelectDate.month=currentMonthDate.month;
        currentSelectDate.day=monthday;
        currentSelectDate.hour=0;
        currentSelectDate.minute=0;
        currentSelectDate.second=1; 
        
        //[self setNeedsDisplay];
        if( [delegate1 respondsToSelector:@selector(getDate:)])
            [delegate1 getDate:@"123"];
        
        NSLog(@"year=%ld  month=%ld  day=%d",currentSelectDate.year,currentSelectDate.month,monthday);
    }
    
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	int width=self.frame.size.width;
	UITouch* touch=[touches anyObject];
	CGPoint touchPoint=[touch locationInView:self];
	//UIView* theview=[self hitTest:touchPoint withEvent:event];
    
	if(touchPoint.x<50 && touchPoint.y<60)
		[self movePrevMonth];
	else if(touchPoint.x>width-50 && touchPoint.y<60)
		[self moveNextMonth];
    
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    int width=self.frame.size.width;
    UITouch* touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    if((touchPoint.x>=50 && touchPoint.x<=width) && (touchPoint.y>=135 && touchPoint.y<=310 )){
        
        [self touchAtDate:touchPoint];
        
        
        
        // AddEvent *addEvent = [[AddEvent alloc]initWithNibName:@"AddEvent" bundle:nil];
        
        
        //[self.window addSubview:addEvent.view];
        //[self presentModalViewContoller:addEvent animated:YES];
        
        
        
        
        
        // [self changeColor];
        //NSLog(@"check====x:%f  y:%f",touchPoint.x,touchPoint.y);
        
        
    }
    
    
}
-(void) drawToday{
    
    int x;
    int y;
    int day;
    CFGregorianDate today = CFAbsoluteTimeGetGregorianDate(currentTime, CFTimeZoneCopySystem());
    if(today.month == currentMonthDate.month && today.year==currentMonthDate.year){
        
        int width = self.frame.size.width;
        int s_width=width/8;
        int weekday = [self getMonthWeekday:currentMonthDate];
        day=today.day+weekday-2;
        x=day%7;
        y=day/7;
        
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        
        
        //to shade the cell for today's date
	 	CGContextSetRGBFillColor(ctx, 0.5, 0.5, 0.5, 1);
		CGContextMoveToPoint(ctx, x*s_width+40, y*35+165);
		CGContextAddLineToPoint(ctx, x*s_width+s_width+40, y*35+165);
		CGContextAddLineToPoint(ctx, x*s_width+s_width+40, y*35+130);
		CGContextAddLineToPoint(ctx, x*s_width+40, y*35+130);
		CGContextFillPath(ctx); 
        
        
        
        CGContextSetRGBFillColor(ctx, 0, 1, 1, 1);
        UIFont *weekfont = [UIFont boldSystemFontOfSize:15];
        NSString *date = [[NSString alloc]initWithFormat:@"%2d",today.day];
        
        [date drawAtPoint:CGPointMake(x*s_width+50, y*35+140) withFont:weekfont];
        
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    currentTime = CFAbsoluteTimeGetCurrent();
    [self drawTopGradientBar]; 
    
    [self drawNameOfDaysAtTop];
    [self drawDateBoxes];
    [self drawDateWords];
    //[self changeColor];
    [self drawToday];
    
    
    
}


@end
