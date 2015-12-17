//! moment.js locale configuration
//! locale : chinese (zh-cn)
//! author : suupic : https://github.com/suupic
//! author : Zeno Zeng : https://github.com/zenozeng
!function(e,t){"object"==typeof exports&&"undefined"!=typeof module?t(require("../moment")):"function"==typeof define&&define.amd?define(["moment"],t):t(e.moment)}(this,function(e){"use strict";var t=e.defineLocale("zh-cn",{months:"\u4e00\u6708_\u4e8c\u6708_\u4e09\u6708_\u56db\u6708_\u4e94\u6708_\u516d\u6708_\u4e03\u6708_\u516b\u6708_\u4e5d\u6708_\u5341\u6708_\u5341\u4e00\u6708_\u5341\u4e8c\u6708".split("_"),monthsShort:"1\u6708_2\u6708_3\u6708_4\u6708_5\u6708_6\u6708_7\u6708_8\u6708_9\u6708_10\u6708_11\u6708_12\u6708".split("_"),weekdays:"\u661f\u671f\u65e5_\u661f\u671f\u4e00_\u661f\u671f\u4e8c_\u661f\u671f\u4e09_\u661f\u671f\u56db_\u661f\u671f\u4e94_\u661f\u671f\u516d".split("_"),weekdaysShort:"\u5468\u65e5_\u5468\u4e00_\u5468\u4e8c_\u5468\u4e09_\u5468\u56db_\u5468\u4e94_\u5468\u516d".split("_"),weekdaysMin:"\u65e5_\u4e00_\u4e8c_\u4e09_\u56db_\u4e94_\u516d".split("_"),longDateFormat:{LT:"Ah\u70b9mm\u5206",LTS:"Ah\u70b9m\u5206s\u79d2",L:"YYYY-MM-DD",LL:"YYYY\u5e74MMMD\u65e5",LLL:"YYYY\u5e74MMMD\u65e5Ah\u70b9mm\u5206",LLLL:"YYYY\u5e74MMMD\u65e5ddddAh\u70b9mm\u5206",l:"YYYY-MM-DD",ll:"YYYY\u5e74MMMD\u65e5",lll:"YYYY\u5e74MMMD\u65e5Ah\u70b9mm\u5206",llll:"YYYY\u5e74MMMD\u65e5ddddAh\u70b9mm\u5206"},meridiemParse:/\u51cc\u6668|\u65e9\u4e0a|\u4e0a\u5348|\u4e2d\u5348|\u4e0b\u5348|\u665a\u4e0a/,meridiemHour:function(e,t){return 12===e&&(e=0),"\u51cc\u6668"===t||"\u65e9\u4e0a"===t||"\u4e0a\u5348"===t?e:"\u4e0b\u5348"===t||"\u665a\u4e0a"===t?e+12:e>=11?e:e+12},meridiem:function(e,t,n){var r=100*e+t;return 600>r?"\u51cc\u6668":900>r?"\u65e9\u4e0a":1130>r?"\u4e0a\u5348":1230>r?"\u4e2d\u5348":1800>r?"\u4e0b\u5348":"\u665a\u4e0a"},calendar:{sameDay:function(){return 0===this.minutes()?"[\u4eca\u5929]Ah[\u70b9\u6574]":"[\u4eca\u5929]LT"},nextDay:function(){return 0===this.minutes()?"[\u660e\u5929]Ah[\u70b9\u6574]":"[\u660e\u5929]LT"},lastDay:function(){return 0===this.minutes()?"[\u6628\u5929]Ah[\u70b9\u6574]":"[\u6628\u5929]LT"},nextWeek:function(){var t,n;return t=e().startOf("week"),n=this.unix()-t.unix()>=604800?"[\u4e0b]":"[\u672c]",0===this.minutes()?n+"dddAh\u70b9\u6574":n+"dddAh\u70b9mm"},lastWeek:function(){var t,n;return t=e().startOf("week"),n=this.unix()<t.unix()?"[\u4e0a]":"[\u672c]",0===this.minutes()?n+"dddAh\u70b9\u6574":n+"dddAh\u70b9mm"},sameElse:"LL"},ordinalParse:/\d{1,2}(\u65e5|\u6708|\u5468)/,ordinal:function(e,t){switch(t){case"d":case"D":case"DDD":return e+"\u65e5";case"M":return e+"\u6708";case"w":case"W":return e+"\u5468";default:return e}},relativeTime:{future:"%s\u5185",past:"%s\u524d",s:"\u51e0\u79d2",m:"1 \u5206\u949f",mm:"%d \u5206\u949f",h:"1 \u5c0f\u65f6",hh:"%d \u5c0f\u65f6",d:"1 \u5929",dd:"%d \u5929",M:"1 \u4e2a\u6708",MM:"%d \u4e2a\u6708",y:"1 \u5e74",yy:"%d \u5e74"},week:{dow:1,doy:4}});return t});