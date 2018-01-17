//

//









#define RGBA(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define RGB(R,G,B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]


#define HEXRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define HEXRGBA(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]


#define AppFrameWidth  [UIScreen mainScreen].bounds.size.width
#define AppFrameHight [UIScreen mainScreen].bounds.size.height

#define ISIOS7LATER ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0)

#define ISIOS8LATER ([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0)

#define ISIOS9LATER ([[[UIDevice currentDevice] systemVersion] floatValue]>=9.0)

#define ISIOS10LATER ([[[UIDevice currentDevice] systemVersion] floatValue]>=10.0)





#define FONT_HEADTITLE [UIFont fontWithName:@"PingFangSC-Medium" size:24]

#define NOTICE_LOGIN_SUC @"notice_login_suc"

#define hiddenViewNotifaction @"hiddenViewNotifaction"
#define loginViewShowNotifaction @"loginViewShowNotifaction"


#define FONT_MEDIUM @"PingFangSC-Medium"
#define FONT_REGULAR @"PingFangSC-Regular"
#define FONT_SEMIBOLD @"PingFangSC-Semibold"
#define FONT_SC @"PingFangSC"

#define COLOR_ffffff HEXRGB(0xffffff)
#define COLOR_f2f2f2 HEXRGB(0xf2f2f2)
#define COLOR_f6f6f6 HEXRGB(0xf6f6f6)
#define COLOR_a8a8a8 HEXRGB(0xa8a8a8)
#define COLOR_444444 HEXRGB(0x444444)
#define COLOR_f7f7f7 HEXRGB(0xf7f7f7)
#define COLOR_e85b53 HEXRGB(0xe85b53)
#define COLOR_666666 HEXRGB(0x666666)
#define COLOR_bababa HEXRGB(0xbababa)
#define COLOR_999999 HEXRGB(0x999999)
#define COLOR_ececec HEXRGB(0xececec)
#define COLOR_e6e6e6 HEXRGB(0xe6e6e6)
#define COLOR_4ab495 HEXRGB(0x4ab495)
#define COLOR_78879d HEXRGB(0x78879d)

#define COLOR_313232 HEXRGB(0x313232)
#define COLOR_abaaaa HEXRGB(0xabaaaa)
#define COLOR_e3e3e3 HEXRGB(0xe3e3e3)
#define COLOR_000000 HEXRGB(0x000000)
#define COLOR_cecece HEXRGB(0xcecece)
#define COLOR_2a9e39 HEXRGB(0x2a9e39)
#define COLOR_c00000 HEXRGB(0xc00000)


