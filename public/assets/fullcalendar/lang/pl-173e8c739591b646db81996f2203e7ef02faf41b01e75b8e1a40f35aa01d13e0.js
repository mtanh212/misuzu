!function(e){"function"==typeof define&&define.amd?define(["jquery","moment"],e):e(jQuery,moment)}(function(e,t){function n(e){return 5>e%10&&e%10>1&&~~(e/10)%10!==1}function a(e,t,a){var r=e+" ";switch(a){case"m":return t?"minuta":"minut\u0119";case"mm":return r+(n(e)?"minuty":"minut");case"h":return t?"godzina":"godzin\u0119";case"hh":return r+(n(e)?"godziny":"godzin");case"MM":return r+(n(e)?"miesi\u0105ce":"miesi\u0119cy");case"yy":return r+(n(e)?"lata":"lat")}}var r="stycze\u0144_luty_marzec_kwiecie\u0144_maj_czerwiec_lipiec_sierpie\u0144_wrzesie\u0144_pa\u017adziernik_listopad_grudzie\u0144".split("_"),i="stycznia_lutego_marca_kwietnia_maja_czerwca_lipca_sierpnia_wrze\u015bnia_pa\u017adziernika_listopada_grudnia".split("_");(t.defineLocale||t.lang).call(t,"pl",{months:function(e,t){return/D MMMM/.test(t)?i[e.month()]:r[e.month()]},monthsShort:"sty_lut_mar_kwi_maj_cze_lip_sie_wrz_pa\u017a_lis_gru".split("_"),weekdays:"niedziela_poniedzia\u0142ek_wtorek_\u015broda_czwartek_pi\u0105tek_sobota".split("_"),weekdaysShort:"nie_pon_wt_\u015br_czw_pt_sb".split("_"),weekdaysMin:"N_Pn_Wt_\u015ar_Cz_Pt_So".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD.MM.YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd, D MMMM YYYY LT"},calendar:{sameDay:"[Dzi\u015b o] LT",nextDay:"[Jutro o] LT",nextWeek:"[W] dddd [o] LT",lastDay:"[Wczoraj o] LT",lastWeek:function(){switch(this.day()){case 0:return"[W zesz\u0142\u0105 niedziel\u0119 o] LT";case 3:return"[W zesz\u0142\u0105 \u015brod\u0119 o] LT";case 6:return"[W zesz\u0142\u0105 sobot\u0119 o] LT";default:return"[W zesz\u0142y] dddd [o] LT"}},sameElse:"L"},relativeTime:{future:"za %s",past:"%s temu",s:"kilka sekund",m:a,mm:a,h:a,hh:a,d:"1 dzie\u0144",dd:"%d dni",M:"miesi\u0105c",MM:a,y:"rok",yy:a},ordinalParse:/\d{1,2}\./,ordinal:"%d.",week:{dow:1,doy:4}}),e.fullCalendar.datepickerLang("pl","pl",{closeText:"Zamknij",prevText:"&#x3C;Poprzedni",nextText:"Nast\u0119pny&#x3E;",currentText:"Dzi\u015b",monthNames:["Stycze\u0144","Luty","Marzec","Kwiecie\u0144","Maj","Czerwiec","Lipiec","Sierpie\u0144","Wrzesie\u0144","Pa\u017adziernik","Listopad","Grudzie\u0144"],monthNamesShort:["Sty","Lu","Mar","Kw","Maj","Cze","Lip","Sie","Wrz","Pa","Lis","Gru"],dayNames:["Niedziela","Poniedzia\u0142ek","Wtorek","\u015aroda","Czwartek","Pi\u0105tek","Sobota"],dayNamesShort:["Nie","Pn","Wt","\u015ar","Czw","Pt","So"],dayNamesMin:["N","Pn","Wt","\u015ar","Cz","Pt","So"],weekHeader:"Tydz",dateFormat:"dd.mm.yy",firstDay:1,isRTL:!1,showMonthAfterYear:!1,yearSuffix:""}),e.fullCalendar.lang("pl",{buttonText:{month:"Miesi\u0105c",week:"Tydzie\u0144",day:"Dzie\u0144",list:"Plan dnia"},allDayText:"Ca\u0142y dzie\u0144",eventLimitText:"wi\u0119cej"})});