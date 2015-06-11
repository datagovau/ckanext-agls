/********************************************************************
 *	Kalendae, a framework agnostic javascript date picker           *
 *	Copyright(c) 2013 Jarvis Badgley (chipersoft@gmail.com)         *
 *	http://github.com/ChiperSoft/Kalendae                           *
 *	Version 0.5.1                                                   *
 ********************************************************************/

(function (undefined) {

var today, moment;

var Kalendae = function (targetElement, options) {
	if (typeof document.addEventListener !== 'function' && !util.isIE8()) return;

	//if the first argument isn't an element and isn't a string, assume that it is the options object
	var is_element = false;
	try {
		is_element = targetElement instanceof Element;
	}
	catch (err) {
		is_element = !!targetElement && is_element.nodeType === 1;
	}
	if (!(is_element || typeof(targetElement) === 'string')) options = targetElement;

	var self = this,
		classes = self.classes,
		opts = self.settings = util.merge(self.defaults, {attachTo:targetElement}, options || {}),
		$container = self.container = util.make('div', {'class':classes.container}),
		calendars = self.calendars = [],
		startDay = moment().day(opts.weekStart),
		vsd,
		columnHeaders = [],
		$cal,
		$title,
		$caption,
		$header,
		$days, $week, dayNodes = [],
		$span,
		i = 0,
		j = opts.months;

	if (util.isIE8()) util.addClassName($container, 'ie8');

	//generate the column headers (Su, Mo, Tu, etc)
	i = 7;
	while (i--) {
		columnHeaders.push( startDay.format(opts.columnHeaderFormat) );
		startDay.add(1, 'days');
	}

	//setup publish/subscribe and apply any subscriptions passed in settings
	MinPubSub(self);
	if (typeof opts.subscribe === 'object') {
		for (i in opts.subscribe) if (opts.subscribe.hasOwnProperty(i)) {
			self.subscribe(i, opts.subscribe[i]);
		}
	}

	//process default selected dates
	self._sel = [];
	if (!!opts.selected) self.setSelected(opts.selected, false);

	//set the view month
	if (!!opts.viewStartDate) {
		vsd = moment(opts.viewStartDate, opts.format);
	} else if (self._sel.length > 0) {
		vsd = moment(self._sel[0]);
	} else {
		vsd = moment();
	}
	self.viewStartDate = vsd.date(1);

	var viewDelta = ({
		'past'          : opts.months-1,
		'today-past'    : opts.months-1,
		'any'           : opts.months>2?Math.floor(opts.months/2):0,
		'today-future'  : 0,
		'future'        : 0
	})[this.settings.direction];


	if (viewDelta && moment().month()==moment(self.viewStartDate).month()){
		self.viewStartDate = moment(self.viewStartDate).subtract({M:viewDelta}).date(1);
	}

	// store the view that the calendar initialized with in-case we want to reset.
	self.defaultView = moment(self.viewStartDate);

	if (typeof opts.blackout === 'function') {
		self.blackout = opts.blackout;
	} else if (!!opts.blackout) {
		var bdates = parseDates(opts.blackout, opts.parseSplitDelimiter, opts.format);
		self.blackout = function (input) {
			input = moment(input).startOf('day').yearDay();
			if (input < 1 || !self._sel) return false;
			var i = bdates.length;
			while (i--) if (bdates[i].startOf('day').yearDay() === input) return true;
			return false;
		};
	} else {
		self.blackout = function () {return false;};
	}


	self.direction = self.directions[opts.direction] ? self.directions[opts.direction] : self.directions['any'];


	//for the total months setting, generate N calendar views and add them to the container
	j = Math.max(opts.months,1);
	while (j--) {
		$cal = util.make('div', {'class':classes.calendar}, $container);

		$cal.setAttribute('data-cal-index', j);
		if (opts.months > 1) {
			if (j == Math.max(opts.months-1,1)) util.addClassName($cal, classes.monthFirst);
			else if (j === 0) util.addClassName($cal, classes.monthLast);
			else util.addClassName($cal, classes.monthMiddle);
		}

		//title bar
		$title = util.make('div', {'class':classes.title}, $cal);
		if(!opts.useYearNav){
			util.addClassName($title, classes.disableYearNav);
		}
		util.make('a', {'class':classes.previousYear}, $title);           //previous button
		util.make('a', {'class':classes.previousMonth}, $title);          //previous button
		util.make('a', {'class':classes.nextYear}, $title);               //next button
		util.make('a', {'class':classes.nextMonth}, $title);              //next button
		$caption = util.make('span', {'class':classes.caption}, $title);  //title caption

		//column headers
		$header = util.make('div', {'class':classes.header}, $cal);
		i = 0;
		do {
			$span = util.make('span', {}, $header);
			$span.innerHTML = columnHeaders[i];
		} while (++i < 7);

		//individual day cells
		$days = util.make('div', {'class':classes.days}, $cal);
		i = 0;
		dayNodes = [];
		do {
			if (opts.mode == 'week') {
				if ((i % 7) === 0) {
					$week = util.make('div', {'class': classes.week + ' clearfix'}, $days);
					dayNodes.push($week);
				}
				util.make('span', {}, $week);
			} else {
				dayNodes.push(util.make('span', {}, $days));
			}
		} while (++i < 42);

		//store each calendar view for easy redrawing
		calendars.push({
			caption:$caption,
			days:dayNodes
		});

		if (j) util.make('div', {'class':classes.monthSeparator}, $container);
	}

	self.draw();

	util.addEvent($container, 'mousedown', function (event, target) {
		var clickedDate;
		if (util.hasClassName(target, classes.nextMonth)) {
		//NEXT MONTH BUTTON
			if (!self.disableNext && self.publish('view-changed', self, ['next-month']) !== false) {
				self.viewStartDate.add(1, 'months');
				self.draw();
			}
			return false;

		} else if (util.hasClassName(target, classes.previousMonth)) {
		//PREVIOUS MONTH BUTTON
			if (!self.disablePreviousMonth && self.publish('view-changed', self, ['previous-month']) !== false) {
				self.viewStartDate.subtract('months',1);
				self.draw();
			}
			return false;

		} else if (util.hasClassName(target, classes.nextYear)) {
		//NEXT MONTH BUTTON
			if (!self.disableNext && self.publish('view-changed', self, ['next-year']) !== false) {
				self.viewStartDate.add(1, 'years');
				self.draw();
			}
			return false;

		} else if (util.hasClassName(target, classes.previousYear)) {
		//PREVIOUS MONTH BUTTON
			if (!self.disablePreviousMonth && self.publish('view-changed', self, ['previous-year']) !== false) {
				self.viewStartDate.subtract('years',1);
				self.draw();
			}
			return false;

		} else if ( (util.hasClassName(target.parentNode, classes.days) || util.hasClassName(target.parentNode, classes.week)) && util.hasClassName(target, classes.dayActive) && (clickedDate = target.getAttribute('data-date'))) {
		//DAY CLICK
			clickedDate = moment(clickedDate, opts.dayAttributeFormat).hours(12);
			if (self.publish('date-clicked', self, [clickedDate]) !== false) {

				switch (opts.mode) {
					case 'multiple':
						if (!self.addSelected(clickedDate)) self.removeSelected(clickedDate);
						break;
					case 'range':
						self.addSelected(clickedDate);
						break;
					case 'week':
						self.weekSelected(clickedDate);
						break;
					case 'single':
						/* falls through */
					default:
						self.addSelected(clickedDate);
						break;
				}

			}
			return false;

		} else if ( util.hasClassName(target.parentNode, classes.week) && (clickedDate = target.getAttribute('data-date') ) ) {
		//INACTIVE WEEK CLICK
			clickedDate = moment(clickedDate, opts.dayAttributeFormat).hours(12);
			if (self.publish('date-clicked', self, [clickedDate]) !== false) {
				if (opts.mode == 'week') {
					self.weekSelected(clickedDate);
				}
			}
			return false;
		}

		return false;
	});


	if (!!(opts.attachTo = util.$(opts.attachTo))) {
		opts.attachTo.appendChild($container);
	}

};

Kalendae.prototype = {
	defaults : {
		attachTo              :null,            /* the element to attach the root container to. can be string or DOMElement */
		months                :1,               /* total number of months to display side by side */
		weekStart             :0,               /* day to use for the start of the week. 0 is Sunday */
		direction             :'any',           /* past, today-past, any, today-future, future */
		directionScrolling    :true,            /* if a direction other than any is defined, prevent scrolling out of range */
		viewStartDate         :null,            /* date in the month to display.  When multiple months, this is the left most */
		blackout              :null,            /* array of dates, or function to be passed a date */
		selected              :null,            /* dates already selected.  can be string, date, or array of strings or dates. */
		mode                  :'single',        /* single, multiple, range */
		dayOutOfMonthClickable:false,
		format                :null,            /* string used for parsing dates. */
		subscribe             :null,            /* object containing events to subscribe to */

		columnHeaderFormat    :'dd',            /* number of characters to show in the column headers */
		titleFormat           :'MMMM, YYYY',    /* format mask for month titles. See momentjs.com for rules */
		dayNumberFormat       :'D',             /* format mask for individual days */
		dayAttributeFormat    :'YYYY-MM-DD',    /* format mask for the data-date attribute set on every span */
		parseSplitDelimiter   : /,\s*|\s+-\s+/, /* regex to use for splitting multiple dates from a passed string */
		rangeDelimiter        :' - ',           /* string to use between dates when outputting in range mode */
		multipleDelimiter     :', ',            /* string to use between dates when outputting in multiple mode */
		useYearNav            :true,

		dateClassMap          :{}
	},
	classes : {
		container       :'kalendae',
		calendar        :'k-calendar',
		monthFirst      :'k-first-month',
		monthMiddle     :'k-middle-month',
		monthLast       :'k-last-month',
		title           :'k-title',
		previousMonth   :'k-btn-previous-month',
		nextMonth       :'k-btn-next-month',
		previousYear    :'k-btn-previous-year',
		nextYear        :'k-btn-next-year',
		caption         :'k-caption',
		header          :'k-header',
		days            :'k-days',
		week            :'k-week',
		dayOutOfMonth   :'k-out-of-month',
		dayInMonth      :'k-in-month',
		dayActive       :'k-active',
		daySelected     :'k-selected',
		dayInRange      :'k-range',
		dayToday        :'k-today',
		monthSeparator  :'k-separator',
		disablePreviousMonth    :'k-disable-previous-month-btn',
		disableNextMonth        :'k-disable-next-month-btn',
		disablePreviousYear     :'k-disable-previous-year-btn',
		disableNextYear         :'k-disable-next-year-btn',
		disableYearNav          :'k-disable-year-nav'
	},

	disablePreviousMonth: false,
	disableNextMonth: false,
	disablePreviousYear: false,
	disableNextYear: false,

	directions: {
		'past'          :function (date) {return moment(date).startOf('day').yearDay() >= today.yearDay();},
		'today-past'    :function (date) {return moment(date).startOf('day').yearDay() > today.yearDay();},
		'any'           :function (date) {return false;},
		'today-future'  :function (date) {return moment(date).startOf('day').yearDay() < today.yearDay();},
		'future'        :function (date) {return moment(date).startOf('day').yearDay() <= today.yearDay();}
	},

	getSelectedAsDates : function () {
		var out = [];
		var i=0, c = this._sel.length;
		for (;i<c;i++) {
			out.push(this._sel[i].toDate());
		}
		return out;
	},

	getSelectedAsText : function (format) {
		var out = [];
		var i=0, c = this._sel.length;
		for (;i<c;i++) {
			out.push(this._sel[i].format(format || this.settings.format || 'YYYY-MM-DD'));
		}
		return out;
	},

	getSelectedRaw : function () {
		var out = [];
		var i=0, c = this._sel.length;
		for (;i<c;i++) {
			out.push(moment(this._sel[i]));
		}
		return out;
	},

	getSelected : function (format) {
		var sel = this.getSelectedAsText(format);
		switch (this.settings.mode) {
			case 'week':
				/* falls through range */

			case 'range':
				sel.splice(2); //shouldn't be more than two, but lets just make sure.
				return sel.join(this.settings.rangeDelimiter);

			case 'multiple':
				return sel.join(this.settings.multipleDelimiter);

			case 'single':
				/* falls through */
			default:
				return (sel[0] || null);
		}
	},

	isSelected : function (input) {
		input = moment(input).startOf('day').yearDay();
		if (input < 1 || !this._sel || this._sel.length < 1) return false;

		switch (this.settings.mode) {
			case 'week':
				/* falls through range */
			case 'range':
				var a = this._sel[0] ? this._sel[0].startOf('day').yearDay() : 0,
					b = this._sel[1] ? this._sel[1].startOf('day').yearDay() : 0;

				if (a === input || b === input) return 1;
				if (!a || !b) return 0;

				if ((input > a && input < b) || (a<b && input < a && input > b))  return -1;
				return false;

			case 'multiple':
				var i = this._sel.length;
				while (i--) {
					if (this._sel[i].startOf('day').yearDay() === input) {
						return true;
					}
				}
				return false;


			case 'single':
				/* falls through */
			default:
				return (this._sel[0] && (this._sel[0].startOf('day').yearDay() === input));
		}

		return false;
	},

	setSelected : function (input, draw) {
		var i,
			new_dates = parseDates(input, this.settings.parseSplitDelimiter, this.settings.format),
			old_dates = parseDates(this.getSelected(), this.settings.parseSplitDelimiter, this.settings.format);

		i = old_dates.length;
		while(i--) { this.removeSelected(old_dates[i], false); }

		i = new_dates.length;
		while(i--) { this.addSelected(new_dates[i], false); }

		if (draw !== false) {
			if (new_dates[0]) {
				this.viewStartDate = moment(new_dates[0], this.settings.format);
			}
			this.draw();
		}
	},

	addSelected : function (date, draw) {
		date = moment(date, this.settings.format).hours(12);

		if(this.settings.dayOutOfMonthClickable && this.settings.mode !== 'range'){ this.makeSelectedDateVisible(date); }

		switch (this.settings.mode) {
			case 'multiple':
				if (!this.isSelected(date)) this._sel.push(date);
				else return false;
				break;
			case 'range':

				if (this._sel.length !== 1) this._sel = [date];
				else {
					if (date.startOf('day').yearDay() > this._sel[0].startOf('day').yearDay()) this._sel[1] = date;
					else this._sel = [date, this._sel[0]];
				}
				break;
			case 'single':
				/* falls through */
			default:
				this._sel = [date];
				break;
		}
		this._sel.sort(function (a,b) {return a.startOf('day').yearDay() - b.startOf('day').yearDay();});
		this.publish('change', this, [date]);
		if (draw !== false) this.draw();
		return true;
	},

	weekSelected: function (mom) {
		var x = mom.toDate();
		var start = moment(x).startOf('week');
		var end = moment(x).endOf('week').subtract('day',1);
		this._sel = [start, end];
		this.publish('change', this, [mom.day()]);
		this.draw();
	},

	makeSelectedDateVisible: function (date) {
		outOfViewMonth = moment(date).date('1').diff(this.viewStartDate,'months');

		if(outOfViewMonth < 0){
			this.viewStartDate.subtract('months',1);
		}
		else if(outOfViewMonth > 0 && outOfViewMonth >= this.settings.months){
			this.viewStartDate.add(1, 'months');
		}
	},

	removeSelected : function (date, draw) {
		date = moment(date, this.settings.format).hours(12);
		var i = this._sel.length;
		while (i--) {
			if (this._sel[i].startOf('day').yearDay() === date.startOf('day').yearDay()) {
				this._sel.splice(i,1);
				this.publish('change', this, [date]);
				if (draw !== false) this.draw();
				return true;
			}
		}
		return false;
	},

	draw : function draw() {
		// return;
		var month = moment(this.viewStartDate).startOf('day').hours(12), //force middle of the day to avoid any weird date shifts
			day,
			classes = this.classes,
			cal,
			$span,
			klass,
			i=0, c,
			j=0, k,
			w,
			s,
			dateString,
			opts = this.settings,
			diff;

		c = this.calendars.length;

		do {
			day = moment(month).date(1);
			day.day( day.day() < this.settings.weekStart ? this.settings.weekStart-7 : this.settings.weekStart);
			//if the first day of the month is less than our week start, back up a week

			cal = this.calendars[i];
			cal.caption.innerHTML = month.format(this.settings.titleFormat);
			j = 0;
			w = 0;
			do {
				if (opts.mode == 'week') {
					if (((j % 7) === 0) && (j !== 0)) {
						w++;
					}
					$span = cal.days[w].childNodes[j%7];
				} else {
					$span = cal.days[j];
				}

				klass = [];

				s = this.isSelected(day);

				if (s) klass.push(({'-1':classes.dayInRange,'1':classes.daySelected, 'true':classes.daySelected})[s]);

				if (day.month() != month.month()) klass.push(classes.dayOutOfMonth);
				else klass.push(classes.dayInMonth);

				if (!(this.blackout(day) || this.direction(day) || (day.month() != month.month() && opts.dayOutOfMonthClickable === false)) || s>0) klass.push(classes.dayActive);

				if (day.startOf('day').yearDay() === today.yearDay()) klass.push(classes.dayToday);

				dateString = day.format(this.settings.dayAttributeFormat);
				if (opts.dateClassMap[dateString]) klass.push(opts.dateClassMap[dateString]);

				$span.innerHTML = day.format(opts.dayNumberFormat);
				$span.className = klass.join(' ');
				$span.setAttribute('data-date', dateString);


				day.add(1, 'days');
			} while (++j < 42);
			month.add(1, 'months');
		} while (++i < c);

		if (opts.directionScrolling) {
			var diffComparison = moment().startOf('day').hours(12);
			diff = month.diff(diffComparison, 'months', true);

			if (opts.direction === 'today-past' || opts.direction === 'past') {
				if (diff <= 0) {
					this.disableNextMonth = false;
					util.removeClassName(this.container, classes.disableNextMonth);
				} else {
					this.disableNextMonth = true;
					util.addClassName(this.container, classes.disableNextMonth);
				}
			} else if (opts.direction === 'today-future' || opts.direction === 'future') {
				if (diff > opts.months) {
					this.disablePreviousMonth = false;
					util.removeClassName(this.container, classes.disablePreviousMonth);
				} else {
					this.disablePreviousMonth = true;
					util.addClassName(this.container, classes.disablePreviousMonth);
				}
			}

			if (opts.direction === 'today-past' || opts.direction === 'past') {
				if (diff <= -11) {
					this.disableNextYear = false;
					util.removeClassName(this.container, classes.disableNextYear);
				} else {
					this.disableNextYear = true;
					util.addClassName(this.container, classes.disableNextYear);
				}
			} else if (opts.direction==='today-future' || opts.direction==='future') {
				if (diff > (11 + opts.months)) {
					this.disablePreviousYear = false;
					util.removeClassName(this.container, classes.disablePreviousYear);
				} else {
					this.disablePreviousYear = true;
					util.addClassName(this.container, classes.disablePreviousYear);
				}
			}
		}
	}
};

var parseDates = function (input, delimiter, format) {
	var output = [];

	if (typeof input === 'string') {
		input = input.split(delimiter);
	} else if (!util.isArray(input)) {
		input = [input];
	}

	var c = input.length,
		i = 0,
		m;

	do {
		if (input[i]) {
			m = moment(input[i], format).hours(12);
			if (m.isValid()) output.push(m);
		}
	} while (++i < c);

	return output;
};



window.Kalendae = Kalendae;

var util = Kalendae.util = {

	isIE8: function() {
		return !!( (/msie 8./i).test(navigator.appVersion) && !(/opera/i).test(navigator.userAgent) && window.ActiveXObject && XDomainRequest && !window.msPerformance );
	},

// ELEMENT FUNCTIONS

	$: function (elem) {
		return (typeof elem == 'string') ? document.getElementById(elem) : elem;
	},

	$$: function (selector) {
		return document.querySelectorAll(selector);
	},

	make: function (tagName, attributes, attach) {
		var k, e = document.createElement(tagName);
		if (!!attributes) for (k in attributes) if (attributes.hasOwnProperty(k)) e.setAttribute(k, attributes[k]);
		if (!!attach) attach.appendChild(e);
		return e;
	},

	// Returns true if the DOM element is visible, false if it's hidden.
	// Checks if display is anything other than none.
	isVisible: function (elem) {
		// shamelessly copied from jQuery
		return elem.offsetWidth > 0 || elem.offsetHeight > 0;
	},

	getStyle: function (elem, styleProp) {
		var y, s;
		if (elem.currentStyle) {
			y = elem.currentStyle[styleProp];
		} else if (window.getComputedStyle) {
      s = window.getComputedStyle(elem, null);
      y = s ? s[styleProp] : '';
		}
		return y;
	},

	domReady: function (f) {
		var state = document.readyState;
		if (state === 'complete' || state === 'interactive') {
			f();
		} else {
			setTimeout(function() { util.domReady(f); }, 9);
		}
	},

	// Adds a listener callback to a DOM element which is fired on a specified
	// event.  Callback is sent the event object and the element that triggered the event
	addEvent: function (elem, eventName, callback) {
		var listener = function (event) {
			event = event || window.event;
			var target = event.target || event.srcElement;
			var block = callback.apply(elem, [event, target]);
			if (block === false) {
				if (!!event.preventDefault) event.preventDefault();
				else {
					event.returnValue = false;
					event.cancelBubble = true;
				}
			}
			return block;
		};
		if (elem.attachEvent) { // IE only.  The "on" is mandatory.
			elem.attachEvent("on" + eventName, listener);
		} else { // Other browsers.
			elem.addEventListener(eventName, listener, false);
		}
		return listener;
	},

	// Removes a listener callback from a DOM element which is fired on a specified
	// event.
	removeEvent: function (elem, event, listener) {
		if (elem.detachEvent) {	// IE only.  The "on" is mandatory.
			elem.detachEvent("on" + event, listener);
		} else { // Other browsers.
			elem.removeEventListener(event, listener, false);
		}
	},

	fireEvent: function (elem, event) {
		if (document.createEvent) {
			var e = document.createEvent('HTMLEvents');
			e.initEvent(event, false, true);
			elem.dispatchEvent(e);
		} else if (document.createEventObject) {
			elem.fireEvent('on' + event) ;
		} else if (typeof elem['on' + event] == 'function' ) {
			elem['on' + event]();
		}
	},

	hasClassName: function(elem, className) { //copied and modified from Prototype.js
		if (!(elem = util.$(elem))) return false;
		var eClassName = elem.className;
		return (eClassName.length > 0 && (eClassName == className || new RegExp("(^|\\s)" + className + "(\\s|$)").test(eClassName)));
	},

	addClassName: function(elem, className) { //copied and modified from Prototype.js
		if (!(elem = util.$(elem))) return;
		if (!util.hasClassName(elem, className)) elem.className += (elem.className ? ' ' : '') + className;
	},

	removeClassName: function(elem, className) { //copied and modified from Prototype.js
		if (!(elem = util.$(elem))) return;
		elem.className = util.trimString(elem.className.replace(new RegExp("(^|\\s+)" + className + "(\\s+|$)"), ' '));
	},

	isFixed: function (elem) {
		do {
			if (util.getStyle(elem, 'position') === 'fixed') return true;
		} while ((elem = elem.offsetParent));
		return false;
	},

	scrollContainer: function (elem) {
		do {
			var overflow = util.getStyle(elem, 'overflow');
			if (overflow === 'auto' || overflow === 'scroll') return elem;
		} while ((elem = elem.parentNode) && elem != window.document.body);
		return null;
	},

	getPosition: function (elem, isInner) {
		var x = elem.offsetLeft,
			y = elem.offsetTop,
			r = {};

		if (!isInner) {
			while ((elem = elem.offsetParent)) {
				x += elem.offsetLeft;
				y += elem.offsetTop;
			}
		}

		r[0] = r.left = x;
		r[1] = r.top = y;
		return r;
	},

	getHeight: function (elem) {
		return elem.offsetHeight || elem.scrollHeight;
	},

	getWidth: function (elem) {
		return elem.offsetWidth || elem.scrollWidth;
	},


// TEXT FUNCTIONS

	trimString: function (input) {
		return input.replace(/^\s+/, '').replace(/\s+$/, '');
	},


// OBJECT FUNCTIONS

	merge: function () {
		/* Combines multiple objects into one.
		 * Syntax: util.extend([true], object1, object2, ... objectN)
		 * If first argument is true, function will merge recursively.
		 */

		var deep = (arguments[0]===true),
			d = {},
			i = deep?1:0;

		var _c = function (a, b) {
			if (typeof b !== 'object') return;
			for (var k in b) if (b.hasOwnProperty(k)) {
				//if property is an object or array, merge the contents instead of overwriting, if extend() was called as such
				if (deep && typeof a[k] === 'object' && typeof b[k] === 'object') _update(a[k], b[k]);
				else a[k] = b[k];
			}
			return a;
		};

		for (; i < arguments.length; i++) {
			_c(d, arguments[i]);
		}
		return d;
	},

	isArray: function (array) {
		return Object.prototype.toString.call(array) == "[object Array]";
	}
};


//auto-initializaiton code
if (typeof document.addEventListener === 'function') Kalendae.util.domReady(function () {
	var els = util.$$('.auto-kal'),
		i = els.length,
		e,
		options,
		optionsRaw;

	while (i--) {
		e = els[i];
		optionsRaw = e.getAttribute('data-kal');
		options = (optionsRaw == null || optionsRaw == "") ? {} : (new Function('return {' + optionsRaw + '};'))();

		if (e.tagName === 'INPUT') {
			//if element is an input, bind a popup calendar to the input.
			new Kalendae.Input(e, options);
		} else {
			//otherwise, insert a flat calendar into the element.
			new Kalendae(util.merge(options, {attachTo:e}));
		}

	}
});
Kalendae.Input = function (targetElement, options) {
	if (typeof document.addEventListener !== 'function'  && !util.isIE8()) return;

	var $input = this.input = util.$(targetElement),
		overwriteInput,
		$closeButton,
		changing = false;

	if (!$input || $input.tagName !== 'INPUT') throw "First argument for Kalendae.Input must be an <input> element or a valid element id.";

	var self = this,
		classes = self.classes,
		opts = self.settings = util.merge(self.defaults, options);

	this._events = {};

	//force attachment to the body
	opts.attachTo = window.document.body;

	//if no override provided, use the input's contents
	if (!opts.selected) opts.selected = $input.value;
	else overwriteInput = true;

	//call our parent constructor
	Kalendae.call(self, opts);

	//create the close button
	if (opts.closeButton) {
		$closeButton = util.make('a', {'class':classes.closeButton}, self.container);
		util.addEvent($closeButton, 'click', function () {
			$input.blur();
		});
	}

	if (overwriteInput) $input.value = self.getSelected();

	var $container = self.container,
		noclose = false;

	$container.style.display = 'none';
	util.addClassName($container, classes.positioned);

	this._events.containerMouseDown = util.addEvent($container, 'mousedown', function (event, target) {
		noclose = true; //IE8 doesn't obey event blocking when it comes to focusing, so we have to do this shit.
	});

	this._events.documentMousedown = util.addEvent(window.document, 'mousedown', function (event, target) {
		noclose = false;
	});

	this._events.inputFocus = util.addEvent($input, 'focus', function () {
		changing = true; // prevent setSelected from altering the input contents.
		self.setSelected(this.value);
		changing = false;
		self.show();
	});

	this._events.inputBlur = util.addEvent($input, 'blur', function () {
		if (noclose && util.isIE8()) {
			noclose = false;
			$input.focus();
		}
		else self.hide();
	});

	this._events.inputKeyup = util.addEvent($input, 'keyup', function (event) {
		changing = true; // prevent setSelected from altering the input contents.
		var dateValue = parseDates(this.value, self.settings.parseSplitDelimiter, self.settings.format);

		// If the date in the field is parsable as a valid date, update.  Otherwise deselect and show default view.
		if (dateValue && dateValue.length && dateValue[0] && dateValue[0].year > 1000) {
			self.setSelected(this.value);
		} else {
			self.setSelected('', null);
			self.viewStartDate = moment(self.defaultView);
			self.draw();
		}
		changing = false;
	});

	var $scrollContainer = util.scrollContainer($input);

	if( $scrollContainer ) {

		// Hide calendar when $scrollContainer is scrolled
		util.addEvent($scrollContainer, 'scroll', function (event) {
			$input.blur();
		});
	}

	self.subscribe('change', function () {
		if (changing) {
			// the change event came from an internal modification, don't update the field contents
			return;
		}
		$input.value = self.getSelected();
		util.fireEvent($input, 'change');
	});

};

Kalendae.Input.prototype = util.merge(Kalendae.prototype, {
	defaults : util.merge(Kalendae.prototype.defaults, {
		format: 'MM/DD/YYYY',
		side: 'bottom',
		closeButton: true,
		offsetLeft: 0,
		offsetTop: 0
	}),
	classes : util.merge(Kalendae.prototype.classes, {
		positioned : 'k-floating',
		closeButton: 'k-btn-close'
	}),

	show : function () {
		var $container = this.container,
			style = $container.style,
			$input = this.input,
			pos = util.getPosition($input),
			$scrollContainer = util.scrollContainer($input),
			scrollTop = $scrollContainer ? $scrollContainer.scrollTop : 0,
			scrollLeft = $scrollContainer ? $scrollContainer.scrollLeft : 0,
			opts = this.settings;

		style.display = '';
		switch (opts.side) {
			case 'left':
				style.left = (pos.left - util.getWidth($container) + opts.offsetLeft - scrollLeft) + 'px';
				style.top  = (pos.top + opts.offsetTop - scrollTop) + 'px';
				break;
			case 'right':
				style.left = (pos.left + util.getWidth($input) - scrollLeft) + 'px';
				style.top  = (pos.top + opts.offsetTop - scrollTop) + 'px';
				break;
			case 'top':
				style.left = (pos.left + opts.offsetLeft - scrollLeft) + 'px';
				style.top  = (pos.top - util.getHeight($container) + opts.offsetTop - scrollTop) + 'px';
				break;
			case 'bottom right':
				style.left = (pos.left - util.getWidth($container) + util.getWidth($input) + opts.offsetLeft) + 'px';
				style.top  = (pos.top + util.getHeight($input) + opts.offsetTop - scrollTop) + 'px';
				break;
			case 'bottom':
				/* falls through */
			default:
				style.left = (pos.left + opts.offsetLeft - scrollLeft) + 'px';
				style.top  = (pos.top + util.getHeight($input) + opts.offsetTop - scrollTop) + 'px';
				break;
		}

		style.position = util.isFixed($input) ? 'fixed' : 'absolute';

		this.publish('show', this);
	},

	hide : function () {
		this.container.style.display = 'none';
		this.publish('hide', this);
	},

	destroy : function() {
		var $container = this.container;
		var $input = this.input;

		util.removeEvent($container, 'mousedown', this._events.containerMousedown);

		util.removeEvent(window.document, 'mousedown', this._events.documentMousedown);

		util.removeEvent($input, 'focus', this._events.inputFocus);

		util.removeEvent($input, 'blur', this._events.inputBlur);

		util.removeEvent($input, 'keyup', this._events.inputKeyup);

		$container.remove();
	}
});


/*!
* MinPubSub, modified for use on Kalendae
* Copyright(c) 2011 Daniel Lamb <daniellmb.com>
* https://github.com/daniellmb/MinPubSub
* MIT Licensed
*/

var MinPubSub = function(d){

	if (!d) d = this;

	// the topic/subscription hash
	var cache = d.c_ || {}; //check for "c_" cache for unit testing

	d.publish = function(/* String */ topic, /* Object */ target, /* Array? */ args){
		// summary:
		//		Publish some data on a named topic.
		// topic: String
		//		The channel to publish on
		// args: Array?
		//		The data to publish. Each array item is converted into an ordered
		//		arguments on the subscribed functions.
		//
		// example:
		//		Publish stuff on '/some/topic'. Anything subscribed will be called
		//		with a function signature like: function(a,b,c){ ... }
		//
		//		publish("/some/topic", ["a","b","c"]);

		var subs = cache[topic],
			len = subs ? subs.length : 0,
			r;

		//can change loop or reverse array if the order matters
		while(len--){
			r = subs[len].apply(target, args || []);
			if (typeof r === 'boolean') return r;
		}
	};

	d.subscribe = function(/* String */ topic, /* Function */ callback, /* Boolean */ topPriority){
		// summary:
		//		Register a callback on a named topic.
		// topic: String
		//		The channel to subscribe to
		// callback: Function
		//		The handler event. Anytime something is publish'ed on a
		//		subscribed channel, the callback will be called with the
		//		published array as ordered arguments.
		//
		// returns: Array
		//		A handle which can be used to unsubscribe this particular subscription.
		//
		// example:
		//		subscribe("/some/topic", function(a, b, c){ /* handle data */ });

		if(!cache[topic]){
			cache[topic] = [];
		}
		if (topPriority)
			cache[topic].push(callback);
		else
			cache[topic].unshift(callback);
		return [topic, callback]; // Array
	};

	d.unsubscribe = function(/* Array */ handle){
		// summary:
		//		Disconnect a subscribed function for a topic.
		// handle: Array
		//		The return value from a subscribe call.
		// example:
		//		var handle = subscribe("/some/topic", function(){});
		//		unsubscribe(handle);

		var subs = cache[handle[0]],
			callback = handle[1],
			len = subs ? subs.length : 0;

		while(len--){
			if(subs[len] === callback){
				subs.splice(len, 1);
			}
		}
	};

};// moment.js
// version : 2.1.0
// author : Tim Wood
// license : MIT
// momentjs.com

(function (undefined) {

    /************************************
        Constants
    ************************************/

    var moment,
        VERSION = "2.1.0",
        round = Math.round, i,
        // internal storage for language config files
        languages = {},

        // check for nodeJS
        hasModule = (typeof module !== 'undefined' && module.exports),

        // ASP.NET json date format regex
        aspNetJsonRegex = /^\/?Date\((\-?\d+)/i,
        aspNetTimeSpanJsonRegex = /(\-)?(\d*)?\.?(\d+)\:(\d+)\:(\d+)\.?(\d{3})?/,

        // format tokens
        formattingTokens = /(\[[^\[]*\])|(\\)?(Mo|MM?M?M?|Do|DDDo|DD?D?D?|ddd?d?|do?|w[o|w]?|W[o|W]?|YYYYY|YYYY|YY|gg(ggg?)?|GG(GGG?)?|e|E|a|A|hh?|HH?|mm?|ss?|SS?S?|X|zz?|ZZ?|.)/g,
        localFormattingTokens = /(\[[^\[]*\])|(\\)?(LT|LL?L?L?|l{1,4})/g,

        // parsing token regexes
        parseTokenOneOrTwoDigits = /\d\d?/, // 0 - 99
        parseTokenOneToThreeDigits = /\d{1,3}/, // 0 - 999
        parseTokenThreeDigits = /\d{3}/, // 000 - 999
        parseTokenFourDigits = /\d{1,4}/, // 0 - 9999
        parseTokenSixDigits = /[+\-]?\d{1,6}/, // -999,999 - 999,999
        parseTokenWord = /[0-9]*['a-z\u00A0-\u05FF\u0700-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+|[\u0600-\u06FF\/]+(\s*?[\u0600-\u06FF]+){1,2}/i, // any word (or two) characters or numbers including two/three word month in arabic.
        parseTokenTimezone = /Z|[\+\-]\d\d:?\d\d/i, // +00:00 -00:00 +0000 -0000 or Z
        parseTokenT = /T/i, // T (ISO seperator)
        parseTokenTimestampMs = /[\+\-]?\d+(\.\d{1,3})?/, // 123456789 123456789.123

        // preliminary iso regex
        // 0000-00-00 + T + 00 or 00:00 or 00:00:00 or 00:00:00.000 + +00:00 or +0000
        isoRegex = /^\s*\d{4}-\d\d-\d\d((T| )(\d\d(:\d\d(:\d\d(\.\d\d?\d?)?)?)?)?([\+\-]\d\d:?\d\d)?)?/,
        isoFormat = 'YYYY-MM-DDTHH:mm:ssZ',

        // iso time formats and regexes
        isoTimes = [
            ['HH:mm:ss.S', /(T| )\d\d:\d\d:\d\d\.\d{1,3}/],
            ['HH:mm:ss', /(T| )\d\d:\d\d:\d\d/],
            ['HH:mm', /(T| )\d\d:\d\d/],
            ['HH', /(T| )\d\d/]
        ],

        // timezone chunker "+10:00" > ["10", "00"] or "-1530" > ["-15", "30"]
        parseTimezoneChunker = /([\+\-]|\d\d)/gi,

        // getter and setter names
        proxyGettersAndSetters = 'Date|Hours|Minutes|Seconds|Milliseconds'.split('|'),
        unitMillisecondFactors = {
            'Milliseconds' : 1,
            'Seconds' : 1e3,
            'Minutes' : 6e4,
            'Hours' : 36e5,
            'Days' : 864e5,
            'Months' : 2592e6,
            'Years' : 31536e6
        },

        unitAliases = {
            ms : 'millisecond',
            s : 'second',
            m : 'minute',
            h : 'hour',
            d : 'day',
            w : 'week',
            M : 'month',
            y : 'year'
        },

        // format function strings
        formatFunctions = {},

        // tokens to ordinalize and pad
        ordinalizeTokens = 'DDD w W M D d'.split(' '),
        paddedTokens = 'M D H h m s w W'.split(' '),

        formatTokenFunctions = {
            M    : function () {
                return this.month() + 1;
            },
            MMM  : function (format) {
                return this.lang().monthsShort(this, format);
            },
            MMMM : function (format) {
                return this.lang().months(this, format);
            },
            D    : function () {
                return this.date();
            },
            DDD  : function () {
                return this.dayOfYear();
            },
            d    : function () {
                return this.day();
            },
            dd   : function (format) {
                return this.lang().weekdaysMin(this, format);
            },
            ddd  : function (format) {
                return this.lang().weekdaysShort(this, format);
            },
            dddd : function (format) {
                return this.lang().weekdays(this, format);
            },
            w    : function () {
                return this.week();
            },
            W    : function () {
                return this.isoWeek();
            },
            YY   : function () {
                return leftZeroFill(this.year() % 100, 2);
            },
            YYYY : function () {
                return leftZeroFill(this.year(), 4);
            },
            YYYYY : function () {
                return leftZeroFill(this.year(), 5);
            },
            gg   : function () {
                return leftZeroFill(this.weekYear() % 100, 2);
            },
            gggg : function () {
                return this.weekYear();
            },
            ggggg : function () {
                return leftZeroFill(this.weekYear(), 5);
            },
            GG   : function () {
                return leftZeroFill(this.isoWeekYear() % 100, 2);
            },
            GGGG : function () {
                return this.isoWeekYear();
            },
            GGGGG : function () {
                return leftZeroFill(this.isoWeekYear(), 5);
            },
            e : function () {
                return this.weekday();
            },
            E : function () {
                return this.isoWeekday();
            },
            a    : function () {
                return this.lang().meridiem(this.hours(), this.minutes(), true);
            },
            A    : function () {
                return this.lang().meridiem(this.hours(), this.minutes(), false);
            },
            H    : function () {
                return this.hours();
            },
            h    : function () {
                return this.hours() % 12 || 12;
            },
            m    : function () {
                return this.minutes();
            },
            s    : function () {
                return this.seconds();
            },
            S    : function () {
                return ~~(this.milliseconds() / 100);
            },
            SS   : function () {
                return leftZeroFill(~~(this.milliseconds() / 10), 2);
            },
            SSS  : function () {
                return leftZeroFill(this.milliseconds(), 3);
            },
            Z    : function () {
                var a = -this.zone(),
                    b = "+";
                if (a < 0) {
                    a = -a;
                    b = "-";
                }
                return b + leftZeroFill(~~(a / 60), 2) + ":" + leftZeroFill(~~a % 60, 2);
            },
            ZZ   : function () {
                var a = -this.zone(),
                    b = "+";
                if (a < 0) {
                    a = -a;
                    b = "-";
                }
                return b + leftZeroFill(~~(10 * a / 6), 4);
            },
            z : function () {
                return this.zoneAbbr();
            },
            zz : function () {
                return this.zoneName();
            },
            X    : function () {
                return this.unix();
            }
        };

    function padToken(func, count) {
        return function (a) {
            return leftZeroFill(func.call(this, a), count);
        };
    }
    function ordinalizeToken(func, period) {
        return function (a) {
            return this.lang().ordinal(func.call(this, a), period);
        };
    }

    while (ordinalizeTokens.length) {
        i = ordinalizeTokens.pop();
        formatTokenFunctions[i + 'o'] = ordinalizeToken(formatTokenFunctions[i], i);
    }
    while (paddedTokens.length) {
        i = paddedTokens.pop();
        formatTokenFunctions[i + i] = padToken(formatTokenFunctions[i], 2);
    }
    formatTokenFunctions.DDDD = padToken(formatTokenFunctions.DDD, 3);


    /************************************
        Constructors
    ************************************/

    function Language() {

    }

    // Moment prototype object
    function Moment(config) {
        extend(this, config);
    }

    // Duration Constructor
    function Duration(duration) {
        var years = duration.years || duration.year || duration.y || 0,
            months = duration.months || duration.month || duration.M || 0,
            weeks = duration.weeks || duration.week || duration.w || 0,
            days = duration.days || duration.day || duration.d || 0,
            hours = duration.hours || duration.hour || duration.h || 0,
            minutes = duration.minutes || duration.minute || duration.m || 0,
            seconds = duration.seconds || duration.second || duration.s || 0,
            milliseconds = duration.milliseconds || duration.millisecond || duration.ms || 0;

        // store reference to input for deterministic cloning
        this._input = duration;

        // representation for dateAddRemove
        this._milliseconds = milliseconds +
            seconds * 1e3 + // 1000
            minutes * 6e4 + // 1000 * 60
            hours * 36e5; // 1000 * 60 * 60
        // Because of dateAddRemove treats 24 hours as different from a
        // day when working around DST, we need to store them separately
        this._days = days +
            weeks * 7;
        // It is impossible translate months into days without knowing
        // which months you are are talking about, so we have to store
        // it separately.
        this._months = months +
            years * 12;

        this._data = {};

        this._bubble();
    }


    /************************************
        Helpers
    ************************************/


    function extend(a, b) {
        for (var i in b) {
            if (b.hasOwnProperty(i)) {
                a[i] = b[i];
            }
        }
        return a;
    }

    function absRound(number) {
        if (number < 0) {
            return Math.ceil(number);
        } else {
            return Math.floor(number);
        }
    }

    // left zero fill a number
    // see http://jsperf.com/left-zero-filling for performance comparison
    function leftZeroFill(number, targetLength) {
        var output = number + '';
        while (output.length < targetLength) {
            output = '0' + output;
        }
        return output;
    }

    // helper function for _.addTime and _.subtractTime
    function addOrSubtractDurationFromMoment(mom, duration, isAdding, ignoreUpdateOffset) {
        var milliseconds = duration._milliseconds,
            days = duration._days,
            months = duration._months,
            minutes,
            hours,
            currentDate;

        if (milliseconds) {
            mom._d.setTime(+mom._d + milliseconds * isAdding);
        }
        // store the minutes and hours so we can restore them
        if (days || months) {
            minutes = mom.minute();
            hours = mom.hour();
        }
        if (days) {
            mom.date(mom.date() + days * isAdding);
        }
        if (months) {
            mom.month(mom.month() + months * isAdding);
        }
        if (milliseconds && !ignoreUpdateOffset) {
            moment.updateOffset(mom);
        }
        // restore the minutes and hours after possibly changing dst
        if (days || months) {
            mom.minute(minutes);
            mom.hour(hours);
        }
    }

    // check if is an array
    function isArray(input) {
        return Object.prototype.toString.call(input) === '[object Array]';
    }

    // compare two arrays, return the number of differences
    function compareArrays(array1, array2) {
        var len = Math.min(array1.length, array2.length),
            lengthDiff = Math.abs(array1.length - array2.length),
            diffs = 0,
            i;
        for (i = 0; i < len; i++) {
            if (~~array1[i] !== ~~array2[i]) {
                diffs++;
            }
        }
        return diffs + lengthDiff;
    }

    function normalizeUnits(units) {
        return units ? unitAliases[units] || units.toLowerCase().replace(/(.)s$/, '$1') : units;
    }


    /************************************
        Languages
    ************************************/


    Language.prototype = {
        set : function (config) {
            var prop, i;
            for (i in config) {
                prop = config[i];
                if (typeof prop === 'function') {
                    this[i] = prop;
                } else {
                    this['_' + i] = prop;
                }
            }
        },

        _months : "January_February_March_April_May_June_July_August_September_October_November_December".split("_"),
        months : function (m) {
            return this._months[m.month()];
        },

        _monthsShort : "Jan_Feb_Mar_Apr_May_Jun_Jul_Aug_Sep_Oct_Nov_Dec".split("_"),
        monthsShort : function (m) {
            return this._monthsShort[m.month()];
        },

        monthsParse : function (monthName) {
            var i, mom, regex;

            if (!this._monthsParse) {
                this._monthsParse = [];
            }

            for (i = 0; i < 12; i++) {
                // make the regex if we don't have it already
                if (!this._monthsParse[i]) {
                    mom = moment([2000, i]);
                    regex = '^' + this.months(mom, '') + '|^' + this.monthsShort(mom, '');
                    this._monthsParse[i] = new RegExp(regex.replace('.', ''), 'i');
                }
                // test the regex
                if (this._monthsParse[i].test(monthName)) {
                    return i;
                }
            }
        },

        _weekdays : "Sunday_Monday_Tuesday_Wednesday_Thursday_Friday_Saturday".split("_"),
        weekdays : function (m) {
            return this._weekdays[m.day()];
        },

        _weekdaysShort : "Sun_Mon_Tue_Wed_Thu_Fri_Sat".split("_"),
        weekdaysShort : function (m) {
            return this._weekdaysShort[m.day()];
        },

        _weekdaysMin : "Su_Mo_Tu_We_Th_Fr_Sa".split("_"),
        weekdaysMin : function (m) {
            return this._weekdaysMin[m.day()];
        },

        weekdaysParse : function (weekdayName) {
            var i, mom, regex;

            if (!this._weekdaysParse) {
                this._weekdaysParse = [];
            }

            for (i = 0; i < 7; i++) {
                // make the regex if we don't have it already
                if (!this._weekdaysParse[i]) {
                    mom = moment([2000, 1]).day(i);
                    regex = '^' + this.weekdays(mom, '') + '|^' + this.weekdaysShort(mom, '') + '|^' + this.weekdaysMin(mom, '');
                    this._weekdaysParse[i] = new RegExp(regex.replace('.', ''), 'i');
                }
                // test the regex
                if (this._weekdaysParse[i].test(weekdayName)) {
                    return i;
                }
            }
        },

        _longDateFormat : {
            LT : "h:mm A",
            L : "MM/DD/YYYY",
            LL : "MMMM D YYYY",
            LLL : "MMMM D YYYY LT",
            LLLL : "dddd, MMMM D YYYY LT"
        },
        longDateFormat : function (key) {
            var output = this._longDateFormat[key];
            if (!output && this._longDateFormat[key.toUpperCase()]) {
                output = this._longDateFormat[key.toUpperCase()].replace(/MMMM|MM|DD|dddd/g, function (val) {
                    return val.slice(1);
                });
                this._longDateFormat[key] = output;
            }
            return output;
        },

        isPM : function (input) {
            return ((input + '').toLowerCase()[0] === 'p');
        },

        _meridiemParse : /[ap]\.?m?\.?/i,
        meridiem : function (hours, minutes, isLower) {
            if (hours > 11) {
                return isLower ? 'pm' : 'PM';
            } else {
                return isLower ? 'am' : 'AM';
            }
        },

        _calendar : {
            sameDay : '[Today at] LT',
            nextDay : '[Tomorrow at] LT',
            nextWeek : 'dddd [at] LT',
            lastDay : '[Yesterday at] LT',
            lastWeek : '[Last] dddd [at] LT',
            sameElse : 'L'
        },
        calendar : function (key, mom) {
            var output = this._calendar[key];
            return typeof output === 'function' ? output.apply(mom) : output;
        },

        _relativeTime : {
            future : "in %s",
            past : "%s ago",
            s : "a few seconds",
            m : "a minute",
            mm : "%d minutes",
            h : "an hour",
            hh : "%d hours",
            d : "a day",
            dd : "%d days",
            M : "a month",
            MM : "%d months",
            y : "a year",
            yy : "%d years"
        },
        relativeTime : function (number, withoutSuffix, string, isFuture) {
            var output = this._relativeTime[string];
            return (typeof output === 'function') ?
                output(number, withoutSuffix, string, isFuture) :
                output.replace(/%d/i, number);
        },
        pastFuture : function (diff, output) {
            var format = this._relativeTime[diff > 0 ? 'future' : 'past'];
            return typeof format === 'function' ? format(output) : format.replace(/%s/i, output);
        },

        ordinal : function (number) {
            return this._ordinal.replace("%d", number);
        },
        _ordinal : "%d",

        preparse : function (string) {
            return string;
        },

        postformat : function (string) {
            return string;
        },

        week : function (mom) {
            return weekOfYear(mom, this._week.dow, this._week.doy).week;
        },
        _week : {
            dow : 0, // Sunday is the first day of the week.
            doy : 6  // The week that contains Jan 1st is the first week of the year.
        }
    };

    // Loads a language definition into the `languages` cache.  The function
    // takes a key and optionally values.  If not in the browser and no values
    // are provided, it will load the language file module.  As a convenience,
    // this function also returns the language values.
    function loadLang(key, values) {
        values.abbr = key;
        if (!languages[key]) {
            languages[key] = new Language();
        }
        languages[key].set(values);
        return languages[key];
    }

    // Determines which language definition to use and returns it.
    //
    // With no parameters, it will return the global language.  If you
    // pass in a language key, such as 'en', it will return the
    // definition for 'en', so long as 'en' has already been loaded using
    // moment.lang.
    function getLangDefinition(key) {
        if (!key) {
            return moment.fn._lang;
        }
        if (!languages[key] && hasModule) {
            try {
                require('./lang/' + key);
            } catch (e) {
                // call with no params to set to default
                return moment.fn._lang;
            }
        }
        return languages[key];
    }


    /************************************
        Formatting
    ************************************/


    function removeFormattingTokens(input) {
        if (input.match(/\[.*\]/)) {
            return input.replace(/^\[|\]$/g, "");
        }
        return input.replace(/\\/g, "");
    }

    function makeFormatFunction(format) {
        var array = format.match(formattingTokens), i, length;

        for (i = 0, length = array.length; i < length; i++) {
            if (formatTokenFunctions[array[i]]) {
                array[i] = formatTokenFunctions[array[i]];
            } else {
                array[i] = removeFormattingTokens(array[i]);
            }
        }

        return function (mom) {
            var output = "";
            for (i = 0; i < length; i++) {
                output += array[i] instanceof Function ? array[i].call(mom, format) : array[i];
            }
            return output;
        };
    }

    // format date using native date object
    function formatMoment(m, format) {
        var i = 5;

        function replaceLongDateFormatTokens(input) {
            return m.lang().longDateFormat(input) || input;
        }

        while (i-- && localFormattingTokens.test(format)) {
            format = format.replace(localFormattingTokens, replaceLongDateFormatTokens);
        }

        if (!formatFunctions[format]) {
            formatFunctions[format] = makeFormatFunction(format);
        }

        return formatFunctions[format](m);
    }


    /************************************
        Parsing
    ************************************/


    // get the regex to find the next token
    function getParseRegexForToken(token, config) {
        switch (token) {
        case 'DDDD':
            return parseTokenThreeDigits;
        case 'YYYY':
            return parseTokenFourDigits;
        case 'YYYYY':
            return parseTokenSixDigits;
        case 'S':
        case 'SS':
        case 'SSS':
        case 'DDD':
            return parseTokenOneToThreeDigits;
        case 'MMM':
        case 'MMMM':
        case 'dd':
        case 'ddd':
        case 'dddd':
            return parseTokenWord;
        case 'a':
        case 'A':
            return getLangDefinition(config._l)._meridiemParse;
        case 'X':
            return parseTokenTimestampMs;
        case 'Z':
        case 'ZZ':
            return parseTokenTimezone;
        case 'T':
            return parseTokenT;
        case 'MM':
        case 'DD':
        case 'YY':
        case 'HH':
        case 'hh':
        case 'mm':
        case 'ss':
        case 'M':
        case 'D':
        case 'd':
        case 'H':
        case 'h':
        case 'm':
        case 's':
            return parseTokenOneOrTwoDigits;
        default :
            return new RegExp(token.replace('\\', ''));
        }
    }

    function timezoneMinutesFromString(string) {
        var tzchunk = (parseTokenTimezone.exec(string) || [])[0],
            parts = (tzchunk + '').match(parseTimezoneChunker) || ['-', 0, 0],
            minutes = +(parts[1] * 60) + ~~parts[2];

        return parts[0] === '+' ? -minutes : minutes;
    }

    // function to convert string input to date
    function addTimeToArrayFromToken(token, input, config) {
        var a, datePartArray = config._a;

        switch (token) {
        // MONTH
        case 'M' : // fall through to MM
        case 'MM' :
            datePartArray[1] = (input == null) ? 0 : ~~input - 1;
            break;
        case 'MMM' : // fall through to MMMM
        case 'MMMM' :
            a = getLangDefinition(config._l).monthsParse(input);
            // if we didn't find a month name, mark the date as invalid.
            if (a != null) {
                datePartArray[1] = a;
            } else {
                config._isValid = false;
            }
            break;
        // DAY OF MONTH
        case 'D' : // fall through to DDDD
        case 'DD' : // fall through to DDDD
        case 'DDD' : // fall through to DDDD
        case 'DDDD' :
            if (input != null) {
                datePartArray[2] = ~~input;
            }
            break;
        // YEAR
        case 'YY' :
            datePartArray[0] = ~~input + (~~input > 68 ? 1900 : 2000);
            break;
        case 'YYYY' :
        case 'YYYYY' :
            datePartArray[0] = ~~input;
            break;
        // AM / PM
        case 'a' : // fall through to A
        case 'A' :
            config._isPm = getLangDefinition(config._l).isPM(input);
            break;
        // 24 HOUR
        case 'H' : // fall through to hh
        case 'HH' : // fall through to hh
        case 'h' : // fall through to hh
        case 'hh' :
            datePartArray[3] = ~~input;
            break;
        // MINUTE
        case 'm' : // fall through to mm
        case 'mm' :
            datePartArray[4] = ~~input;
            break;
        // SECOND
        case 's' : // fall through to ss
        case 'ss' :
            datePartArray[5] = ~~input;
            break;
        // MILLISECOND
        case 'S' :
        case 'SS' :
        case 'SSS' :
            datePartArray[6] = ~~ (('0.' + input) * 1000);
            break;
        // UNIX TIMESTAMP WITH MS
        case 'X':
            config._d = new Date(parseFloat(input) * 1000);
            break;
        // TIMEZONE
        case 'Z' : // fall through to ZZ
        case 'ZZ' :
            config._useUTC = true;
            config._tzm = timezoneMinutesFromString(input);
            break;
        }

        // if the input is null, the date is not valid
        if (input == null) {
            config._isValid = false;
        }
    }

    // convert an array to a date.
    // the array should mirror the parameters below
    // note: all values past the year are optional and will default to the lowest possible value.
    // [year, month, day , hour, minute, second, millisecond]
    function dateFromArray(config) {
        var i, date, input = [];

        if (config._d) {
            return;
        }

        for (i = 0; i < 7; i++) {
            config._a[i] = input[i] = (config._a[i] == null) ? (i === 2 ? 1 : 0) : config._a[i];
        }

        // add the offsets to the time to be parsed so that we can have a clean array for checking isValid
        input[3] += ~~((config._tzm || 0) / 60);
        input[4] += ~~((config._tzm || 0) % 60);

        date = new Date(0);

        if (config._useUTC) {
            date.setUTCFullYear(input[0], input[1], input[2]);
            date.setUTCHours(input[3], input[4], input[5], input[6]);
        } else {
            date.setFullYear(input[0], input[1], input[2]);
            date.setHours(input[3], input[4], input[5], input[6]);
        }

        config._d = date;
    }

    // date from string and format string
    function makeDateFromStringAndFormat(config) {
        // This array is used to make a Date, either with `new Date` or `Date.UTC`
        var tokens = config._f.match(formattingTokens),
            string = config._i,
            i, parsedInput;

        config._a = [];

        for (i = 0; i < tokens.length; i++) {
            parsedInput = (getParseRegexForToken(tokens[i], config).exec(string) || [])[0];
            if (parsedInput) {
                string = string.slice(string.indexOf(parsedInput) + parsedInput.length);
            }
            // don't parse if its not a known token
            if (formatTokenFunctions[tokens[i]]) {
                addTimeToArrayFromToken(tokens[i], parsedInput, config);
            }
        }

        // add remaining unparsed input to the string
        if (string) {
            config._il = string;
        }

        // handle am pm
        if (config._isPm && config._a[3] < 12) {
            config._a[3] += 12;
        }
        // if is 12 am, change hours to 0
        if (config._isPm === false && config._a[3] === 12) {
            config._a[3] = 0;
        }
        // return
        dateFromArray(config);
    }

    // date from string and array of format strings
    function makeDateFromStringAndArray(config) {
        var tempConfig,
            tempMoment,
            bestMoment,

            scoreToBeat = 99,
            i,
            currentScore;

        for (i = 0; i < config._f.length; i++) {
            tempConfig = extend({}, config);
            tempConfig._f = config._f[i];
            makeDateFromStringAndFormat(tempConfig);
            tempMoment = new Moment(tempConfig);

            currentScore = compareArrays(tempConfig._a, tempMoment.toArray());

            // if there is any input that was not parsed
            // add a penalty for that format
            if (tempMoment._il) {
                currentScore += tempMoment._il.length;
            }

            if (currentScore < scoreToBeat) {
                scoreToBeat = currentScore;
                bestMoment = tempMoment;
            }
        }

        extend(config, bestMoment);
    }

    // date from iso format
    function makeDateFromString(config) {
        var i,
            string = config._i,
            match = isoRegex.exec(string);

        if (match) {
            // match[2] should be "T" or undefined
            config._f = 'YYYY-MM-DD' + (match[2] || " ");
            for (i = 0; i < 4; i++) {
                if (isoTimes[i][1].exec(string)) {
                    config._f += isoTimes[i][0];
                    break;
                }
            }
            if (parseTokenTimezone.exec(string)) {
                config._f += " Z";
            }
            makeDateFromStringAndFormat(config);
        } else {
            config._d = new Date(string);
        }
    }

    function makeDateFromInput(config) {
        var input = config._i,
            matched = aspNetJsonRegex.exec(input);

        if (input === undefined) {
            config._d = new Date();
        } else if (matched) {
            config._d = new Date(+matched[1]);
        } else if (typeof input === 'string') {
            makeDateFromString(config);
        } else if (isArray(input)) {
            config._a = input.slice(0);
            dateFromArray(config);
        } else {
            config._d = input instanceof Date ? new Date(+input) : new Date(input);
        }
    }


    /************************************
        Relative Time
    ************************************/


    // helper function for moment.fn.from, moment.fn.fromNow, and moment.duration.fn.humanize
    function substituteTimeAgo(string, number, withoutSuffix, isFuture, lang) {
        return lang.relativeTime(number || 1, !!withoutSuffix, string, isFuture);
    }

    function relativeTime(milliseconds, withoutSuffix, lang) {
        var seconds = round(Math.abs(milliseconds) / 1000),
            minutes = round(seconds / 60),
            hours = round(minutes / 60),
            days = round(hours / 24),
            years = round(days / 365),
            args = seconds < 45 && ['s', seconds] ||
                minutes === 1 && ['m'] ||
                minutes < 45 && ['mm', minutes] ||
                hours === 1 && ['h'] ||
                hours < 22 && ['hh', hours] ||
                days === 1 && ['d'] ||
                days <= 25 && ['dd', days] ||
                days <= 45 && ['M'] ||
                days < 345 && ['MM', round(days / 30)] ||
                years === 1 && ['y'] || ['yy', years];
        args[2] = withoutSuffix;
        args[3] = milliseconds > 0;
        args[4] = lang;
        return substituteTimeAgo.apply({}, args);
    }


    /************************************
        Week of Year
    ************************************/


    // firstDayOfWeek       0 = sun, 6 = sat
    //                      the day of the week that starts the week
    //                      (usually sunday or monday)
    // firstDayOfWeekOfYear 0 = sun, 6 = sat
    //                      the first week is the week that contains the first
    //                      of this day of the week
    //                      (eg. ISO weeks use thursday (4))
    function weekOfYear(mom, firstDayOfWeek, firstDayOfWeekOfYear) {
        var end = firstDayOfWeekOfYear - firstDayOfWeek,
            daysToDayOfWeek = firstDayOfWeekOfYear - mom.day(),
            adjustedMoment;


        if (daysToDayOfWeek > end) {
            daysToDayOfWeek -= 7;
        }

        if (daysToDayOfWeek < end - 7) {
            daysToDayOfWeek += 7;
        }

        adjustedMoment = moment(mom).add('d', daysToDayOfWeek);
        return {
            week: Math.ceil(adjustedMoment.dayOfYear() / 7),
            year: adjustedMoment.year()
        };
    }


    /************************************
        Top Level Functions
    ************************************/

    function makeMoment(config) {
        var input = config._i,
            format = config._f;

        if (input === null || input === '') {
            return null;
        }

        if (typeof input === 'string') {
            config._i = input = getLangDefinition().preparse(input);
        }

        if (moment.isMoment(input)) {
            config = extend({}, input);
            config._d = new Date(+input._d);
        } else if (format) {
            if (isArray(format)) {
                makeDateFromStringAndArray(config);
            } else {
                makeDateFromStringAndFormat(config);
            }
        } else {
            makeDateFromInput(config);
        }

        return new Moment(config);
    }

    moment = function (input, format, lang) {
        return makeMoment({
            _i : input,
            _f : format,
            _l : lang,
            _isUTC : false
        });
    };

    // creating with utc
    moment.utc = function (input, format, lang) {
        return makeMoment({
            _useUTC : true,
            _isUTC : true,
            _l : lang,
            _i : input,
            _f : format
        });
    };

    // creating with unix timestamp (in seconds)
    moment.unix = function (input) {
        return moment(input * 1000);
    };

    // duration
    moment.duration = function (input, key) {
        var isDuration = moment.isDuration(input),
            isNumber = (typeof input === 'number'),
            duration = (isDuration ? input._input : (isNumber ? {} : input)),
            matched = aspNetTimeSpanJsonRegex.exec(input),
            sign,
            ret;

        if (isNumber) {
            if (key) {
                duration[key] = input;
            } else {
                duration.milliseconds = input;
            }
        } else if (matched) {
            sign = (matched[1] === "-") ? -1 : 1;
            duration = {
                y: 0,
                d: ~~matched[2] * sign,
                h: ~~matched[3] * sign,
                m: ~~matched[4] * sign,
                s: ~~matched[5] * sign,
                ms: ~~matched[6] * sign
            };
        }

        ret = new Duration(duration);

        if (isDuration && input.hasOwnProperty('_lang')) {
            ret._lang = input._lang;
        }

        return ret;
    };

    // version number
    moment.version = VERSION;

    // default format
    moment.defaultFormat = isoFormat;

    // This function will be called whenever a moment is mutated.
    // It is intended to keep the offset in sync with the timezone.
    moment.updateOffset = function () {};

    // This function will load languages and then set the global language.  If
    // no arguments are passed in, it will simply return the current global
    // language key.
    moment.lang = function (key, values) {
        if (!key) {
            return moment.fn._lang._abbr;
        }
        if (values) {
            loadLang(key, values);
        } else if (!languages[key]) {
            getLangDefinition(key);
        }
        moment.duration.fn._lang = moment.fn._lang = getLangDefinition(key);
    };

    // returns language data
    moment.langData = function (key) {
        if (key && key._lang && key._lang._abbr) {
            key = key._lang._abbr;
        }
        return getLangDefinition(key);
    };

    // compare moment object
    moment.isMoment = function (obj) {
        return obj instanceof Moment;
    };

    // for typechecking Duration objects
    moment.isDuration = function (obj) {
        return obj instanceof Duration;
    };


    /************************************
        Moment Prototype
    ************************************/


    moment.fn = Moment.prototype = {

        clone : function () {
            return moment(this);
        },

        valueOf : function () {
            return +this._d + ((this._offset || 0) * 60000);
        },

        unix : function () {
            return Math.floor(+this / 1000);
        },

        toString : function () {
            return this.format("ddd MMM DD YYYY HH:mm:ss [GMT]ZZ");
        },

        toDate : function () {
            return this._offset ? new Date(+this) : this._d;
        },

        toISOString : function () {
            return formatMoment(moment(this).utc(), 'YYYY-MM-DD[T]HH:mm:ss.SSS[Z]');
        },

        toArray : function () {
            var m = this;
            return [
                m.year(),
                m.month(),
                m.date(),
                m.hours(),
                m.minutes(),
                m.seconds(),
                m.milliseconds()
            ];
        },

        isValid : function () {
            if (this._isValid == null) {
                if (this._a) {
                    this._isValid = !compareArrays(this._a, (this._isUTC ? moment.utc(this._a) : moment(this._a)).toArray());
                } else {
                    this._isValid = !isNaN(this._d.getTime());
                }
            }
            return !!this._isValid;
        },

        utc : function () {
            return this.zone(0);
        },

        local : function () {
            this.zone(0);
            this._isUTC = false;
            return this;
        },

        format : function (inputString) {
            var output = formatMoment(this, inputString || moment.defaultFormat);
            return this.lang().postformat(output);
        },

        add : function (input, val) {
            var dur;
            // switch args to support add('s', 1) and add(1, 's')
            if (typeof input === 'string') {
                dur = moment.duration(+val, input);
            } else {
                dur = moment.duration(input, val);
            }
            addOrSubtractDurationFromMoment(this, dur, 1);
            return this;
        },

        subtract : function (input, val) {
            var dur;
            // switch args to support subtract('s', 1) and subtract(1, 's')
            if (typeof input === 'string') {
                dur = moment.duration(+val, input);
            } else {
                dur = moment.duration(input, val);
            }
            addOrSubtractDurationFromMoment(this, dur, -1);
            return this;
        },

        diff : function (input, units, asFloat) {
            var that = this._isUTC ? moment(input).zone(this._offset || 0) : moment(input).local(),
                zoneDiff = (this.zone() - that.zone()) * 6e4,
                diff, output;

            units = normalizeUnits(units);

            if (units === 'year' || units === 'month') {
                // average number of days in the months in the given dates
                diff = (this.daysInMonth() + that.daysInMonth()) * 432e5; // 24 * 60 * 60 * 1000 / 2
                // difference in months
                output = ((this.year() - that.year()) * 12) + (this.month() - that.month());
                // adjust by taking difference in days, average number of days
                // and dst in the given months.
                output += ((this - moment(this).startOf('month')) -
                        (that - moment(that).startOf('month'))) / diff;
                // same as above but with zones, to negate all dst
                output -= ((this.zone() - moment(this).startOf('month').zone()) -
                        (that.zone() - moment(that).startOf('month').zone())) * 6e4 / diff;
                if (units === 'year') {
                    output = output / 12;
                }
            } else {
                diff = (this - that);
                output = units === 'second' ? diff / 1e3 : // 1000
                    units === 'minute' ? diff / 6e4 : // 1000 * 60
                    units === 'hour' ? diff / 36e5 : // 1000 * 60 * 60
                    units === 'day' ? (diff - zoneDiff) / 864e5 : // 1000 * 60 * 60 * 24, negate dst
                    units === 'week' ? (diff - zoneDiff) / 6048e5 : // 1000 * 60 * 60 * 24 * 7, negate dst
                    diff;
            }
            return asFloat ? output : absRound(output);
        },

        from : function (time, withoutSuffix) {
            return moment.duration(this.diff(time)).lang(this.lang()._abbr).humanize(!withoutSuffix);
        },

        fromNow : function (withoutSuffix) {
            return this.from(moment(), withoutSuffix);
        },

        calendar : function () {
            var diff = this.diff(moment().startOf('day'), 'days', true),
                format = diff < -6 ? 'sameElse' :
                diff < -1 ? 'lastWeek' :
                diff < 0 ? 'lastDay' :
                diff < 1 ? 'sameDay' :
                diff < 2 ? 'nextDay' :
                diff < 7 ? 'nextWeek' : 'sameElse';
            return this.format(this.lang().calendar(format, this));
        },

        isLeapYear : function () {
            var year = this.year();
            return (year % 4 === 0 && year % 100 !== 0) || year % 400 === 0;
        },

        isDST : function () {
            return (this.zone() < this.clone().month(0).zone() ||
                this.zone() < this.clone().month(5).zone());
        },

        day : function (input) {
            var day = this._isUTC ? this._d.getUTCDay() : this._d.getDay();
            if (input != null) {
                if (typeof input === 'string') {
                    input = this.lang().weekdaysParse(input);
                    if (typeof input !== 'number') {
                        return this;
                    }
                }
                return this.add({ d : input - day });
            } else {
                return day;
            }
        },

        month : function (input) {
            var utc = this._isUTC ? 'UTC' : '',
                dayOfMonth,
                daysInMonth;

            if (input != null) {
                if (typeof input === 'string') {
                    input = this.lang().monthsParse(input);
                    if (typeof input !== 'number') {
                        return this;
                    }
                }

                dayOfMonth = this.date();
                this.date(1);
                this._d['set' + utc + 'Month'](input);
                this.date(Math.min(dayOfMonth, this.daysInMonth()));

                moment.updateOffset(this);
                return this;
            } else {
                return this._d['get' + utc + 'Month']();
            }
        },

        startOf: function (units) {
            units = normalizeUnits(units);
            // the following switch intentionally omits break keywords
            // to utilize falling through the cases.
            switch (units) {
            case 'year':
                this.month(0);
                /* falls through */
            case 'month':
                this.date(1);
                /* falls through */
            case 'week':
            case 'day':
                this.hours(0);
                /* falls through */
            case 'hour':
                this.minutes(0);
                /* falls through */
            case 'minute':
                this.seconds(0);
                /* falls through */
            case 'second':
                this.milliseconds(0);
                /* falls through */
            }

            // weeks are a special case
            if (units === 'week') {
                this.weekday(0);
            }

            return this;
        },

        endOf: function (units) {
            return this.startOf(units).add(units, 1).subtract('ms', 1);
        },

        isAfter: function (input, units) {
            units = typeof units !== 'undefined' ? units : 'millisecond';
            return +this.clone().startOf(units) > +moment(input).startOf(units);
        },

        isBefore: function (input, units) {
            units = typeof units !== 'undefined' ? units : 'millisecond';
            return +this.clone().startOf(units) < +moment(input).startOf(units);
        },

        isSame: function (input, units) {
            units = typeof units !== 'undefined' ? units : 'millisecond';
            return +this.clone().startOf(units) === +moment(input).startOf(units);
        },

        min: function (other) {
            other = moment.apply(null, arguments);
            return other < this ? this : other;
        },

        max: function (other) {
            other = moment.apply(null, arguments);
            return other > this ? this : other;
        },

        zone : function (input) {
            var offset = this._offset || 0;
            if (input != null) {
                if (typeof input === "string") {
                    input = timezoneMinutesFromString(input);
                }
                if (Math.abs(input) < 16) {
                    input = input * 60;
                }
                this._offset = input;
                this._isUTC = true;
                if (offset !== input) {
                    addOrSubtractDurationFromMoment(this, moment.duration(offset - input, 'm'), 1, true);
                }
            } else {
                return this._isUTC ? offset : this._d.getTimezoneOffset();
            }
            return this;
        },

        zoneAbbr : function () {
            return this._isUTC ? "UTC" : "";
        },

        zoneName : function () {
            return this._isUTC ? "Coordinated Universal Time" : "";
        },

        daysInMonth : function () {
            return moment.utc([this.year(), this.month() + 1, 0]).date();
        },

        dayOfYear : function (input) {
            var dayOfYear = round((moment(this).startOf('day') - moment(this).startOf('year')) / 864e5) + 1;
            return input == null ? dayOfYear : this.add("d", (input - dayOfYear));
        },

        weekYear : function (input) {
            var year = weekOfYear(this, this.lang()._week.dow, this.lang()._week.doy).year;
            return input == null ? year : this.add("y", (input - year));
        },

        isoWeekYear : function (input) {
            var year = weekOfYear(this, 1, 4).year;
            return input == null ? year : this.add("y", (input - year));
        },

        week : function (input) {
            var week = this.lang().week(this);
            return input == null ? week : this.add("d", (input - week) * 7);
        },

        isoWeek : function (input) {
            var week = weekOfYear(this, 1, 4).week;
            return input == null ? week : this.add("d", (input - week) * 7);
        },

        weekday : function (input) {
            var weekday = (this._d.getDay() + 7 - this.lang()._week.dow) % 7;
            return input == null ? weekday : this.add("d", input - weekday);
        },

        isoWeekday : function (input) {
            // behaves the same as moment#day except
            // as a getter, returns 7 instead of 0 (1-7 range instead of 0-6)
            // as a setter, sunday should belong to the previous week.
            return input == null ? this.day() || 7 : this.day(this.day() % 7 ? input : input - 7);
        },

        // If passed a language key, it will set the language for this
        // instance.  Otherwise, it will return the language configuration
        // variables for this instance.
        lang : function (key) {
            if (key === undefined) {
                return this._lang;
            } else {
                this._lang = getLangDefinition(key);
                return this;
            }
        }
    };

    // helper for adding shortcuts
    function makeGetterAndSetter(name, key) {
        moment.fn[name] = moment.fn[name + 's'] = function (input) {
            var utc = this._isUTC ? 'UTC' : '';
            if (input != null) {
                this._d['set' + utc + key](input);
                moment.updateOffset(this);
                return this;
            } else {
                return this._d['get' + utc + key]();
            }
        };
    }

    // loop through and add shortcuts (Month, Date, Hours, Minutes, Seconds, Milliseconds)
    for (i = 0; i < proxyGettersAndSetters.length; i ++) {
        makeGetterAndSetter(proxyGettersAndSetters[i].toLowerCase().replace(/s$/, ''), proxyGettersAndSetters[i]);
    }

    // add shortcut for year (uses different syntax than the getter/setter 'year' == 'FullYear')
    makeGetterAndSetter('year', 'FullYear');

    // add plural methods
    moment.fn.days = moment.fn.day;
    moment.fn.months = moment.fn.month;
    moment.fn.weeks = moment.fn.week;
    moment.fn.isoWeeks = moment.fn.isoWeek;

    // add aliased format methods
    moment.fn.toJSON = moment.fn.toISOString;

    /************************************
        Duration Prototype
    ************************************/


    moment.duration.fn = Duration.prototype = {
        _bubble : function () {
            var milliseconds = this._milliseconds,
                days = this._days,
                months = this._months,
                data = this._data,
                seconds, minutes, hours, years;

            // The following code bubbles up values, see the tests for
            // examples of what that means.
            data.milliseconds = milliseconds % 1000;

            seconds = absRound(milliseconds / 1000);
            data.seconds = seconds % 60;

            minutes = absRound(seconds / 60);
            data.minutes = minutes % 60;

            hours = absRound(minutes / 60);
            data.hours = hours % 24;

            days += absRound(hours / 24);
            data.days = days % 30;

            months += absRound(days / 30);
            data.months = months % 12;

            years = absRound(months / 12);
            data.years = years;
        },

        weeks : function () {
            return absRound(this.days() / 7);
        },

        valueOf : function () {
            return this._milliseconds +
              this._days * 864e5 +
              (this._months % 12) * 2592e6 +
              ~~(this._months / 12) * 31536e6;
        },

        humanize : function (withSuffix) {
            var difference = +this,
                output = relativeTime(difference, !withSuffix, this.lang());

            if (withSuffix) {
                output = this.lang().pastFuture(difference, output);
            }

            return this.lang().postformat(output);
        },

        add : function (input, val) {
            // supports only 2.0-style add(1, 's') or add(moment)
            var dur = moment.duration(input, val);

            this._milliseconds += dur._milliseconds;
            this._days += dur._days;
            this._months += dur._months;

            this._bubble();

            return this;
        },

        subtract : function (input, val) {
            var dur = moment.duration(input, val);

            this._milliseconds -= dur._milliseconds;
            this._days -= dur._days;
            this._months -= dur._months;

            this._bubble();

            return this;
        },

        get : function (units) {
            units = normalizeUnits(units);
            return this[units.toLowerCase() + 's']();
        },

        as : function (units) {
            units = normalizeUnits(units);
            return this['as' + units.charAt(0).toUpperCase() + units.slice(1) + 's']();
        },

        lang : moment.fn.lang
    };

    function makeDurationGetter(name) {
        moment.duration.fn[name] = function () {
            return this._data[name];
        };
    }

    function makeDurationAsGetter(name, factor) {
        moment.duration.fn['as' + name] = function () {
            return +this / factor;
        };
    }

    for (i in unitMillisecondFactors) {
        if (unitMillisecondFactors.hasOwnProperty(i)) {
            makeDurationAsGetter(i, unitMillisecondFactors[i]);
            makeDurationGetter(i.toLowerCase());
        }
    }

    makeDurationAsGetter('Weeks', 6048e5);
    moment.duration.fn.asMonths = function () {
        return (+this - this.years() * 31536e6) / 2592e6 + this.years() * 12;
    };


    /************************************
        Default Lang
    ************************************/


    // Set default language, other languages will inherit from English.
    moment.lang('en', {
        ordinal : function (number) {
            var b = number % 10,
                output = (~~ (number % 100 / 10) === 1) ? 'th' :
                (b === 1) ? 'st' :
                (b === 2) ? 'nd' :
                (b === 3) ? 'rd' : 'th';
            return number + output;
        }
    });


    /************************************
        Exposing Moment
    ************************************/


    // CommonJS module is defined
    if (hasModule) {
        module.exports = moment;
    }
    /*global ender:false */
    if (typeof ender === 'undefined') {
        // here, `this` means `window` in the browser, or `global` on the server
        // add `moment` as a global object via a string identifier,
        // for Closure Compiler "advanced" mode
        this['moment'] = moment;
    }
    /*global define:false */
    if (typeof define === "function" && define.amd) {
        define("moment", [], function () {
            return moment;
        });
    }
    /************************************
        Exposing Moment
    ************************************/

    this['moment'] = moment;

}).call(typeof Kalendae === 'undefined' ? window : Kalendae);

if (!Kalendae.moment) {
	if (window.moment) {
		Kalendae.moment = window.moment;
	} else {
		throw "Kalendae requires moment.js. You must use kalendae.standalone.js if moment is not available on the page.";
	}
}

moment = Kalendae.moment;

//function to get the total number of days since the epoch.
moment.fn.yearDay = function (input) {
	var yearday = Math.floor(this._d / 86400000);
    return (typeof input === 'undefined') ? yearday :
        this.add({ d : input - yearday });
};

today = Kalendae.moment().startOf('day');
if (typeof jQuery !== 'undefined' && (typeof document.addEventListener === 'function' || util.isIE8())) {
	jQuery.fn.kalendae = function (options) {
		this.each(function (i, e) {
			if (e.tagName === 'INPUT') {
				//if element is an input, bind a popup calendar to the input.
				jQuery(e).data('kalendae', new Kalendae.Input(e, options));
			} else {
				//otherwise, insert a flat calendar into the element.
				jQuery(e).data('kalendae', new Kalendae(jQuery.extend({}, {attachTo:e}, options)));
			}
		});
		return this;
	};
}


})();

!function(a,b){"object"==typeof exports&&"undefined"!=typeof module?module.exports=b():"function"==typeof define&&define.amd?define(b):a.moment=b()}(this,function(){"use strict";function a(){return Gd.apply(null,arguments)}function b(a){Gd=a}function c(a){return"[object Array]"===Object.prototype.toString.call(a)}function d(a){return a instanceof Date||"[object Date]"===Object.prototype.toString.call(a)}function e(a,b){var c,d=[];for(c=0;c<a.length;++c)d.push(b(a[c],c));return d}function f(a,b){return Object.prototype.hasOwnProperty.call(a,b)}function g(a,b){for(var c in b)f(b,c)&&(a[c]=b[c]);return f(b,"toString")&&(a.toString=b.toString),f(b,"valueOf")&&(a.valueOf=b.valueOf),a}function h(a,b,c,d){return za(a,b,c,d,!0).utc()}function i(){return{empty:!1,unusedTokens:[],unusedInput:[],overflow:-2,charsLeftOver:0,nullInput:!1,invalidMonth:null,invalidFormat:!1,userInvalidated:!1,iso:!1}}function j(a){return null==a._pf&&(a._pf=i()),a._pf}function k(a){if(null==a._isValid){var b=j(a);a._isValid=!isNaN(a._d.getTime())&&b.overflow<0&&!b.empty&&!b.invalidMonth&&!b.nullInput&&!b.invalidFormat&&!b.userInvalidated,a._strict&&(a._isValid=a._isValid&&0===b.charsLeftOver&&0===b.unusedTokens.length&&void 0===b.bigHour)}return a._isValid}function l(a){var b=h(0/0);return null!=a?g(j(b),a):j(b).userInvalidated=!0,b}function m(a,b){var c,d,e;if("undefined"!=typeof b._isAMomentObject&&(a._isAMomentObject=b._isAMomentObject),"undefined"!=typeof b._i&&(a._i=b._i),"undefined"!=typeof b._f&&(a._f=b._f),"undefined"!=typeof b._l&&(a._l=b._l),"undefined"!=typeof b._strict&&(a._strict=b._strict),"undefined"!=typeof b._tzm&&(a._tzm=b._tzm),"undefined"!=typeof b._isUTC&&(a._isUTC=b._isUTC),"undefined"!=typeof b._offset&&(a._offset=b._offset),"undefined"!=typeof b._pf&&(a._pf=j(b)),"undefined"!=typeof b._locale&&(a._locale=b._locale),Id.length>0)for(c in Id)d=Id[c],e=b[d],"undefined"!=typeof e&&(a[d]=e);return a}function n(b){m(this,b),this._d=new Date(+b._d),Jd===!1&&(Jd=!0,a.updateOffset(this),Jd=!1)}function o(a){return a instanceof n||null!=a&&null!=a._isAMomentObject}function p(a){var b=+a,c=0;return 0!==b&&isFinite(b)&&(c=b>=0?Math.floor(b):Math.ceil(b)),c}function q(a,b,c){var d,e=Math.min(a.length,b.length),f=Math.abs(a.length-b.length),g=0;for(d=0;e>d;d++)(c&&a[d]!==b[d]||!c&&p(a[d])!==p(b[d]))&&g++;return g+f}function r(){}function s(a){return a?a.toLowerCase().replace("_","-"):a}function t(a){for(var b,c,d,e,f=0;f<a.length;){for(e=s(a[f]).split("-"),b=e.length,c=s(a[f+1]),c=c?c.split("-"):null;b>0;){if(d=u(e.slice(0,b).join("-")))return d;if(c&&c.length>=b&&q(e,c,!0)>=b-1)break;b--}f++}return null}function u(a){var b=null;if(!Kd[a]&&"undefined"!=typeof module&&module&&module.exports)try{b=Hd._abbr,require("./locale/"+a),v(b)}catch(c){}return Kd[a]}function v(a,b){var c;return a&&(c="undefined"==typeof b?x(a):w(a,b),c&&(Hd=c)),Hd._abbr}function w(a,b){return null!==b?(b.abbr=a,Kd[a]||(Kd[a]=new r),Kd[a].set(b),v(a),Kd[a]):(delete Kd[a],null)}function x(a){var b;if(a&&a._locale&&a._locale._abbr&&(a=a._locale._abbr),!a)return Hd;if(!c(a)){if(b=u(a))return b;a=[a]}return t(a)}function y(a,b){var c=a.toLowerCase();Ld[c]=Ld[c+"s"]=Ld[b]=a}function z(a){return"string"==typeof a?Ld[a]||Ld[a.toLowerCase()]:void 0}function A(a){var b,c,d={};for(c in a)f(a,c)&&(b=z(c),b&&(d[b]=a[c]));return d}function B(b,c){return function(d){return null!=d?(D(this,b,d),a.updateOffset(this,c),this):C(this,b)}}function C(a,b){return a._d["get"+(a._isUTC?"UTC":"")+b]()}function D(a,b,c){return a._d["set"+(a._isUTC?"UTC":"")+b](c)}function E(a,b){var c;if("object"==typeof a)for(c in a)this.set(c,a[c]);else if(a=z(a),"function"==typeof this[a])return this[a](b);return this}function F(a,b,c){for(var d=""+Math.abs(a),e=a>=0;d.length<b;)d="0"+d;return(e?c?"+":"":"-")+d}function G(a,b,c,d){var e=d;"string"==typeof d&&(e=function(){return this[d]()}),a&&(Pd[a]=e),b&&(Pd[b[0]]=function(){return F(e.apply(this,arguments),b[1],b[2])}),c&&(Pd[c]=function(){return this.localeData().ordinal(e.apply(this,arguments),a)})}function H(a){return a.match(/\[[\s\S]/)?a.replace(/^\[|\]$/g,""):a.replace(/\\/g,"")}function I(a){var b,c,d=a.match(Md);for(b=0,c=d.length;c>b;b++)Pd[d[b]]?d[b]=Pd[d[b]]:d[b]=H(d[b]);return function(e){var f="";for(b=0;c>b;b++)f+=d[b]instanceof Function?d[b].call(e,a):d[b];return f}}function J(a,b){return a.isValid()?(b=K(b,a.localeData()),Od[b]||(Od[b]=I(b)),Od[b](a)):a.localeData().invalidDate()}function K(a,b){function c(a){return b.longDateFormat(a)||a}var d=5;for(Nd.lastIndex=0;d>=0&&Nd.test(a);)a=a.replace(Nd,c),Nd.lastIndex=0,d-=1;return a}function L(a,b,c){ce[a]="function"==typeof b?b:function(a){return a&&c?c:b}}function M(a,b){return f(ce,a)?ce[a](b._strict,b._locale):new RegExp(N(a))}function N(a){return a.replace("\\","").replace(/\\(\[)|\\(\])|\[([^\]\[]*)\]|\\(.)/g,function(a,b,c,d,e){return b||c||d||e}).replace(/[-\/\\^$*+?.()|[\]{}]/g,"\\$&")}function O(a,b){var c,d=b;for("string"==typeof a&&(a=[a]),"number"==typeof b&&(d=function(a,c){c[b]=p(a)}),c=0;c<a.length;c++)de[a[c]]=d}function P(a,b){O(a,function(a,c,d,e){d._w=d._w||{},b(a,d._w,d,e)})}function Q(a,b,c){null!=b&&f(de,a)&&de[a](b,c._a,c,a)}function R(a,b){return new Date(Date.UTC(a,b+1,0)).getUTCDate()}function S(a){return this._months[a.month()]}function T(a){return this._monthsShort[a.month()]}function U(a,b,c){var d,e,f;for(this._monthsParse||(this._monthsParse=[],this._longMonthsParse=[],this._shortMonthsParse=[]),d=0;12>d;d++){if(e=h([2e3,d]),c&&!this._longMonthsParse[d]&&(this._longMonthsParse[d]=new RegExp("^"+this.months(e,"").replace(".","")+"$","i"),this._shortMonthsParse[d]=new RegExp("^"+this.monthsShort(e,"").replace(".","")+"$","i")),c||this._monthsParse[d]||(f="^"+this.months(e,"")+"|^"+this.monthsShort(e,""),this._monthsParse[d]=new RegExp(f.replace(".",""),"i")),c&&"MMMM"===b&&this._longMonthsParse[d].test(a))return d;if(c&&"MMM"===b&&this._shortMonthsParse[d].test(a))return d;if(!c&&this._monthsParse[d].test(a))return d}}function V(a,b){var c;return"string"==typeof b&&(b=a.localeData().monthsParse(b),"number"!=typeof b)?a:(c=Math.min(a.date(),R(a.year(),b)),a._d["set"+(a._isUTC?"UTC":"")+"Month"](b,c),a)}function W(b){return null!=b?(V(this,b),a.updateOffset(this,!0),this):C(this,"Month")}function X(){return R(this.year(),this.month())}function Y(a){var b,c=a._a;return c&&-2===j(a).overflow&&(b=c[fe]<0||c[fe]>11?fe:c[ge]<1||c[ge]>R(c[ee],c[fe])?ge:c[he]<0||c[he]>24||24===c[he]&&(0!==c[ie]||0!==c[je]||0!==c[ke])?he:c[ie]<0||c[ie]>59?ie:c[je]<0||c[je]>59?je:c[ke]<0||c[ke]>999?ke:-1,j(a)._overflowDayOfYear&&(ee>b||b>ge)&&(b=ge),j(a).overflow=b),a}function Z(b){a.suppressDeprecationWarnings===!1&&"undefined"!=typeof console&&console.warn&&console.warn("Deprecation warning: "+b)}function $(a,b){var c=!0,d=a+"\n"+(new Error).stack;return g(function(){return c&&(Z(d),c=!1),b.apply(this,arguments)},b)}function _(a,b){ne[a]||(Z(b),ne[a]=!0)}function aa(a){var b,c,d=a._i,e=oe.exec(d);if(e){for(j(a).iso=!0,b=0,c=pe.length;c>b;b++)if(pe[b][1].exec(d)){a._f=pe[b][0]+(e[6]||" ");break}for(b=0,c=qe.length;c>b;b++)if(qe[b][1].exec(d)){a._f+=qe[b][0];break}d.match(_d)&&(a._f+="Z"),ta(a)}else a._isValid=!1}function ba(b){var c=re.exec(b._i);return null!==c?void(b._d=new Date(+c[1])):(aa(b),void(b._isValid===!1&&(delete b._isValid,a.createFromInputFallback(b))))}function ca(a,b,c,d,e,f,g){var h=new Date(a,b,c,d,e,f,g);return 1970>a&&h.setFullYear(a),h}function da(a){var b=new Date(Date.UTC.apply(null,arguments));return 1970>a&&b.setUTCFullYear(a),b}function ea(a){return fa(a)?366:365}function fa(a){return a%4===0&&a%100!==0||a%400===0}function ga(){return fa(this.year())}function ha(a,b,c){var d,e=c-b,f=c-a.day();return f>e&&(f-=7),e-7>f&&(f+=7),d=Aa(a).add(f,"d"),{week:Math.ceil(d.dayOfYear()/7),year:d.year()}}function ia(a){return ha(a,this._week.dow,this._week.doy).week}function ja(){return this._week.dow}function ka(){return this._week.doy}function la(a){var b=this.localeData().week(this);return null==a?b:this.add(7*(a-b),"d")}function ma(a){var b=ha(this,1,4).week;return null==a?b:this.add(7*(a-b),"d")}function na(a,b,c,d,e){var f,g,h=da(a,0,1).getUTCDay();return h=0===h?7:h,c=null!=c?c:e,f=e-h+(h>d?7:0)-(e>h?7:0),g=7*(b-1)+(c-e)+f+1,{year:g>0?a:a-1,dayOfYear:g>0?g:ea(a-1)+g}}function oa(a){var b=Math.round((this.clone().startOf("day")-this.clone().startOf("year"))/864e5)+1;return null==a?b:this.add(a-b,"d")}function pa(a,b,c){return null!=a?a:null!=b?b:c}function qa(a){var b=new Date;return a._useUTC?[b.getUTCFullYear(),b.getUTCMonth(),b.getUTCDate()]:[b.getFullYear(),b.getMonth(),b.getDate()]}function ra(a){var b,c,d,e,f=[];if(!a._d){for(d=qa(a),a._w&&null==a._a[ge]&&null==a._a[fe]&&sa(a),a._dayOfYear&&(e=pa(a._a[ee],d[ee]),a._dayOfYear>ea(e)&&(j(a)._overflowDayOfYear=!0),c=da(e,0,a._dayOfYear),a._a[fe]=c.getUTCMonth(),a._a[ge]=c.getUTCDate()),b=0;3>b&&null==a._a[b];++b)a._a[b]=f[b]=d[b];for(;7>b;b++)a._a[b]=f[b]=null==a._a[b]?2===b?1:0:a._a[b];24===a._a[he]&&0===a._a[ie]&&0===a._a[je]&&0===a._a[ke]&&(a._nextDay=!0,a._a[he]=0),a._d=(a._useUTC?da:ca).apply(null,f),null!=a._tzm&&a._d.setUTCMinutes(a._d.getUTCMinutes()-a._tzm),a._nextDay&&(a._a[he]=24)}}function sa(a){var b,c,d,e,f,g,h;b=a._w,null!=b.GG||null!=b.W||null!=b.E?(f=1,g=4,c=pa(b.GG,a._a[ee],ha(Aa(),1,4).year),d=pa(b.W,1),e=pa(b.E,1)):(f=a._locale._week.dow,g=a._locale._week.doy,c=pa(b.gg,a._a[ee],ha(Aa(),f,g).year),d=pa(b.w,1),null!=b.d?(e=b.d,f>e&&++d):e=null!=b.e?b.e+f:f),h=na(c,d,e,g,f),a._a[ee]=h.year,a._dayOfYear=h.dayOfYear}function ta(b){if(b._f===a.ISO_8601)return void aa(b);b._a=[],j(b).empty=!0;var c,d,e,f,g,h=""+b._i,i=h.length,k=0;for(e=K(b._f,b._locale).match(Md)||[],c=0;c<e.length;c++)f=e[c],d=(h.match(M(f,b))||[])[0],d&&(g=h.substr(0,h.indexOf(d)),g.length>0&&j(b).unusedInput.push(g),h=h.slice(h.indexOf(d)+d.length),k+=d.length),Pd[f]?(d?j(b).empty=!1:j(b).unusedTokens.push(f),Q(f,d,b)):b._strict&&!d&&j(b).unusedTokens.push(f);j(b).charsLeftOver=i-k,h.length>0&&j(b).unusedInput.push(h),j(b).bigHour===!0&&b._a[he]<=12&&b._a[he]>0&&(j(b).bigHour=void 0),b._a[he]=ua(b._locale,b._a[he],b._meridiem),ra(b),Y(b)}function ua(a,b,c){var d;return null==c?b:null!=a.meridiemHour?a.meridiemHour(b,c):null!=a.isPM?(d=a.isPM(c),d&&12>b&&(b+=12),d||12!==b||(b=0),b):b}function va(a){var b,c,d,e,f;if(0===a._f.length)return j(a).invalidFormat=!0,void(a._d=new Date(0/0));for(e=0;e<a._f.length;e++)f=0,b=m({},a),null!=a._useUTC&&(b._useUTC=a._useUTC),b._f=a._f[e],ta(b),k(b)&&(f+=j(b).charsLeftOver,f+=10*j(b).unusedTokens.length,j(b).score=f,(null==d||d>f)&&(d=f,c=b));g(a,c||b)}function wa(a){if(!a._d){var b=A(a._i);a._a=[b.year,b.month,b.day||b.date,b.hour,b.minute,b.second,b.millisecond],ra(a)}}function xa(a){var b,e=a._i,f=a._f;return a._locale=a._locale||x(a._l),null===e||void 0===f&&""===e?l({nullInput:!0}):("string"==typeof e&&(a._i=e=a._locale.preparse(e)),o(e)?new n(Y(e)):(c(f)?va(a):f?ta(a):d(e)?a._d=e:ya(a),b=new n(Y(a)),b._nextDay&&(b.add(1,"d"),b._nextDay=void 0),b))}function ya(b){var f=b._i;void 0===f?b._d=new Date:d(f)?b._d=new Date(+f):"string"==typeof f?ba(b):c(f)?(b._a=e(f.slice(0),function(a){return parseInt(a,10)}),ra(b)):"object"==typeof f?wa(b):"number"==typeof f?b._d=new Date(f):a.createFromInputFallback(b)}function za(a,b,c,d,e){var f={};return"boolean"==typeof c&&(d=c,c=void 0),f._isAMomentObject=!0,f._useUTC=f._isUTC=e,f._l=c,f._i=a,f._f=b,f._strict=d,xa(f)}function Aa(a,b,c,d){return za(a,b,c,d,!1)}function Ba(a,b){var d,e;if(1===b.length&&c(b[0])&&(b=b[0]),!b.length)return Aa();for(d=b[0],e=1;e<b.length;++e)b[e][a](d)&&(d=b[e]);return d}function Ca(){var a=[].slice.call(arguments,0);return Ba("isBefore",a)}function Da(){var a=[].slice.call(arguments,0);return Ba("isAfter",a)}function Ea(a){var b=A(a),c=b.year||0,d=b.quarter||0,e=b.month||0,f=b.week||0,g=b.day||0,h=b.hour||0,i=b.minute||0,j=b.second||0,k=b.millisecond||0;this._milliseconds=+k+1e3*j+6e4*i+36e5*h,this._days=+g+7*f,this._months=+e+3*d+12*c,this._data={},this._locale=x(),this._bubble()}function Fa(a){return a instanceof Ea}function Ga(a,b){G(a,0,0,function(){var a=this.utcOffset(),c="+";return 0>a&&(a=-a,c="-"),c+F(~~(a/60),2)+b+F(~~a%60,2)})}function Ha(a){var b=(a||"").match(_d)||[],c=b[b.length-1]||[],d=(c+"").match(we)||["-",0,0],e=+(60*d[1])+p(d[2]);return"+"===d[0]?e:-e}function Ia(b,c){var e,f;return c._isUTC?(e=c.clone(),f=(o(b)||d(b)?+b:+Aa(b))-+e,e._d.setTime(+e._d+f),a.updateOffset(e,!1),e):Aa(b).local();return c._isUTC?Aa(b).zone(c._offset||0):Aa(b).local()}function Ja(a){return 15*-Math.round(a._d.getTimezoneOffset()/15)}function Ka(b,c){var d,e=this._offset||0;return null!=b?("string"==typeof b&&(b=Ha(b)),Math.abs(b)<16&&(b=60*b),!this._isUTC&&c&&(d=Ja(this)),this._offset=b,this._isUTC=!0,null!=d&&this.add(d,"m"),e!==b&&(!c||this._changeInProgress?$a(this,Va(b-e,"m"),1,!1):this._changeInProgress||(this._changeInProgress=!0,a.updateOffset(this,!0),this._changeInProgress=null)),this):this._isUTC?e:Ja(this)}function La(a,b){return null!=a?("string"!=typeof a&&(a=-a),this.utcOffset(a,b),this):-this.utcOffset()}function Ma(a){return this.utcOffset(0,a)}function Na(a){return this._isUTC&&(this.utcOffset(0,a),this._isUTC=!1,a&&this.subtract(Ja(this),"m")),this}function Oa(){return this._tzm?this.utcOffset(this._tzm):"string"==typeof this._i&&this.utcOffset(Ha(this._i)),this}function Pa(a){return a=a?Aa(a).utcOffset():0,(this.utcOffset()-a)%60===0}function Qa(){return this.utcOffset()>this.clone().month(0).utcOffset()||this.utcOffset()>this.clone().month(5).utcOffset()}function Ra(){if(this._a){var a=this._isUTC?h(this._a):Aa(this._a);return this.isValid()&&q(this._a,a.toArray())>0}return!1}function Sa(){return!this._isUTC}function Ta(){return this._isUTC}function Ua(){return this._isUTC&&0===this._offset}function Va(a,b){var c,d,e,g=a,h=null;return Fa(a)?g={ms:a._milliseconds,d:a._days,M:a._months}:"number"==typeof a?(g={},b?g[b]=a:g.milliseconds=a):(h=xe.exec(a))?(c="-"===h[1]?-1:1,g={y:0,d:p(h[ge])*c,h:p(h[he])*c,m:p(h[ie])*c,s:p(h[je])*c,ms:p(h[ke])*c}):(h=ye.exec(a))?(c="-"===h[1]?-1:1,g={y:Wa(h[2],c),M:Wa(h[3],c),d:Wa(h[4],c),h:Wa(h[5],c),m:Wa(h[6],c),s:Wa(h[7],c),w:Wa(h[8],c)}):null==g?g={}:"object"==typeof g&&("from"in g||"to"in g)&&(e=Ya(Aa(g.from),Aa(g.to)),g={},g.ms=e.milliseconds,g.M=e.months),d=new Ea(g),Fa(a)&&f(a,"_locale")&&(d._locale=a._locale),d}function Wa(a,b){var c=a&&parseFloat(a.replace(",","."));return(isNaN(c)?0:c)*b}function Xa(a,b){var c={milliseconds:0,months:0};return c.months=b.month()-a.month()+12*(b.year()-a.year()),a.clone().add(c.months,"M").isAfter(b)&&--c.months,c.milliseconds=+b-+a.clone().add(c.months,"M"),c}function Ya(a,b){var c;return b=Ia(b,a),a.isBefore(b)?c=Xa(a,b):(c=Xa(b,a),c.milliseconds=-c.milliseconds,c.months=-c.months),c}function Za(a,b){return function(c,d){var e,f;return null===d||isNaN(+d)||(_(b,"moment()."+b+"(period, number) is deprecated. Please use moment()."+b+"(number, period)."),f=c,c=d,d=f),c="string"==typeof c?+c:c,e=Va(c,d),$a(this,e,a),this}}function $a(b,c,d,e){var f=c._milliseconds,g=c._days,h=c._months;e=null==e?!0:e,f&&b._d.setTime(+b._d+f*d),g&&D(b,"Date",C(b,"Date")+g*d),h&&V(b,C(b,"Month")+h*d),e&&a.updateOffset(b,g||h)}function _a(a){var b=a||Aa(),c=Ia(b,this).startOf("day"),d=this.diff(c,"days",!0),e=-6>d?"sameElse":-1>d?"lastWeek":0>d?"lastDay":1>d?"sameDay":2>d?"nextDay":7>d?"nextWeek":"sameElse";return this.format(this.localeData().calendar(e,this,Aa(b)))}function ab(){return new n(this)}function bb(a,b){var c;return b=z("undefined"!=typeof b?b:"millisecond"),"millisecond"===b?(a=o(a)?a:Aa(a),+this>+a):(c=o(a)?+a:+Aa(a),c<+this.clone().startOf(b))}function cb(a,b){var c;return b=z("undefined"!=typeof b?b:"millisecond"),"millisecond"===b?(a=o(a)?a:Aa(a),+a>+this):(c=o(a)?+a:+Aa(a),+this.clone().endOf(b)<c)}function db(a,b,c){return this.isAfter(a,c)&&this.isBefore(b,c)}function eb(a,b){var c;return b=z(b||"millisecond"),"millisecond"===b?(a=o(a)?a:Aa(a),+this===+a):(c=+Aa(a),+this.clone().startOf(b)<=c&&c<=+this.clone().endOf(b))}function fb(a){return 0>a?Math.ceil(a):Math.floor(a)}function gb(a,b,c){var d,e,f=Ia(a,this),g=6e4*(f.utcOffset()-this.utcOffset());return b=z(b),"year"===b||"month"===b||"quarter"===b?(e=hb(this,f),"quarter"===b?e/=3:"year"===b&&(e/=12)):(d=this-f,e="second"===b?d/1e3:"minute"===b?d/6e4:"hour"===b?d/36e5:"day"===b?(d-g)/864e5:"week"===b?(d-g)/6048e5:d),c?e:fb(e)}function hb(a,b){var c,d,e=12*(b.year()-a.year())+(b.month()-a.month()),f=a.clone().add(e,"months");return 0>b-f?(c=a.clone().add(e-1,"months"),d=(b-f)/(f-c)):(c=a.clone().add(e+1,"months"),d=(b-f)/(c-f)),-(e+d)}function ib(){return this.clone().locale("en").format("ddd MMM DD YYYY HH:mm:ss [GMT]ZZ")}function jb(){var a=this.clone().utc();return 0<a.year()&&a.year()<=9999?"function"==typeof Date.prototype.toISOString?this.toDate().toISOString():J(a,"YYYY-MM-DD[T]HH:mm:ss.SSS[Z]"):J(a,"YYYYYY-MM-DD[T]HH:mm:ss.SSS[Z]")}function kb(b){var c=J(this,b||a.defaultFormat);return this.localeData().postformat(c)}function lb(a,b){return this.isValid()?Va({to:this,from:a}).locale(this.locale()).humanize(!b):this.localeData().invalidDate()}function mb(a){return this.from(Aa(),a)}function nb(a,b){return this.isValid()?Va({from:this,to:a}).locale(this.locale()).humanize(!b):this.localeData().invalidDate()}function ob(a){return this.to(Aa(),a)}function pb(a){var b;return void 0===a?this._locale._abbr:(b=x(a),null!=b&&(this._locale=b),this)}function qb(){return this._locale}function rb(a){switch(a=z(a)){case"year":this.month(0);case"quarter":case"month":this.date(1);case"week":case"isoWeek":case"day":this.hours(0);case"hour":this.minutes(0);case"minute":this.seconds(0);case"second":this.milliseconds(0)}return"week"===a&&this.weekday(0),"isoWeek"===a&&this.isoWeekday(1),"quarter"===a&&this.month(3*Math.floor(this.month()/3)),this}function sb(a){return a=z(a),void 0===a||"millisecond"===a?this:this.startOf(a).add(1,"isoWeek"===a?"week":a).subtract(1,"ms")}function tb(){return+this._d-6e4*(this._offset||0)}function ub(){return Math.floor(+this/1e3)}function vb(){return this._offset?new Date(+this):this._d}function wb(){var a=this;return[a.year(),a.month(),a.date(),a.hour(),a.minute(),a.second(),a.millisecond()]}function xb(){return k(this)}function yb(){return g({},j(this))}function zb(){return j(this).overflow}function Ab(a,b){G(0,[a,a.length],0,b)}function Bb(a,b,c){return ha(Aa([a,11,31+b-c]),b,c).week}function Cb(a){var b=ha(this,this.localeData()._week.dow,this.localeData()._week.doy).year;return null==a?b:this.add(a-b,"y")}function Db(a){var b=ha(this,1,4).year;return null==a?b:this.add(a-b,"y")}function Eb(){return Bb(this.year(),1,4)}function Fb(){var a=this.localeData()._week;return Bb(this.year(),a.dow,a.doy)}function Gb(a){return null==a?Math.ceil((this.month()+1)/3):this.month(3*(a-1)+this.month()%3)}function Hb(a,b){if("string"==typeof a)if(isNaN(a)){if(a=b.weekdaysParse(a),"number"!=typeof a)return null}else a=parseInt(a,10);return a}function Ib(a){return this._weekdays[a.day()]}function Jb(a){return this._weekdaysShort[a.day()]}function Kb(a){return this._weekdaysMin[a.day()]}function Lb(a){var b,c,d;for(this._weekdaysParse||(this._weekdaysParse=[]),b=0;7>b;b++)if(this._weekdaysParse[b]||(c=Aa([2e3,1]).day(b),d="^"+this.weekdays(c,"")+"|^"+this.weekdaysShort(c,"")+"|^"+this.weekdaysMin(c,""),this._weekdaysParse[b]=new RegExp(d.replace(".",""),"i")),this._weekdaysParse[b].test(a))return b}function Mb(a){var b=this._isUTC?this._d.getUTCDay():this._d.getDay();return null!=a?(a=Hb(a,this.localeData()),this.add(a-b,"d")):b}function Nb(a){var b=(this.day()+7-this.localeData()._week.dow)%7;return null==a?b:this.add(a-b,"d")}function Ob(a){return null==a?this.day()||7:this.day(this.day()%7?a:a-7)}function Pb(a,b){G(a,0,0,function(){return this.localeData().meridiem(this.hours(),this.minutes(),b)})}function Qb(a,b){return b._meridiemParse}function Rb(a){return"p"===(a+"").toLowerCase().charAt(0)}function Sb(a,b,c){return a>11?c?"pm":"PM":c?"am":"AM"}function Tb(a){G(0,[a,3],0,"millisecond")}function Ub(){return this._isUTC?"UTC":""}function Vb(){return this._isUTC?"Coordinated Universal Time":""}function Wb(a){return Aa(1e3*a)}function Xb(){return Aa.apply(null,arguments).parseZone()}function Yb(a,b,c){var d=this._calendar[a];return"function"==typeof d?d.call(b,c):d}function Zb(a){var b=this._longDateFormat[a];return!b&&this._longDateFormat[a.toUpperCase()]&&(b=this._longDateFormat[a.toUpperCase()].replace(/MMMM|MM|DD|dddd/g,function(a){return a.slice(1)}),this._longDateFormat[a]=b),b}function $b(){return this._invalidDate}function _b(a){return this._ordinal.replace("%d",a)}function ac(a){return a}function bc(a,b,c,d){var e=this._relativeTime[c];return"function"==typeof e?e(a,b,c,d):e.replace(/%d/i,a)}function cc(a,b){var c=this._relativeTime[a>0?"future":"past"];return"function"==typeof c?c(b):c.replace(/%s/i,b)}function dc(a){var b,c;for(c in a)b=a[c],"function"==typeof b?this[c]=b:this["_"+c]=b;this._ordinalParseLenient=new RegExp(this._ordinalParse.source+"|"+/\d{1,2}/.source)}function ec(a,b,c,d){var e=x(),f=h().set(d,b);return e[c](f,a)}function fc(a,b,c,d,e){if("number"==typeof a&&(b=a,a=void 0),a=a||"",null!=b)return ec(a,b,c,e);var f,g=[];for(f=0;d>f;f++)g[f]=ec(a,f,c,e);return g}function gc(a,b){return fc(a,b,"months",12,"month")}function hc(a,b){return fc(a,b,"monthsShort",12,"month")}function ic(a,b){return fc(a,b,"weekdays",7,"day")}function jc(a,b){return fc(a,b,"weekdaysShort",7,"day")}function kc(a,b){return fc(a,b,"weekdaysMin",7,"day")}function lc(){var a=this._data;return this._milliseconds=Ue(this._milliseconds),this._days=Ue(this._days),this._months=Ue(this._months),a.milliseconds=Ue(a.milliseconds),a.seconds=Ue(a.seconds),a.minutes=Ue(a.minutes),a.hours=Ue(a.hours),a.months=Ue(a.months),a.years=Ue(a.years),this}function mc(a,b,c,d){var e=Va(b,c);return a._milliseconds+=d*e._milliseconds,a._days+=d*e._days,a._months+=d*e._months,a._bubble()}function nc(a,b){return mc(this,a,b,1)}function oc(a,b){return mc(this,a,b,-1)}function pc(){var a,b,c,d=this._milliseconds,e=this._days,f=this._months,g=this._data,h=0;return g.milliseconds=d%1e3,a=fb(d/1e3),g.seconds=a%60,b=fb(a/60),g.minutes=b%60,c=fb(b/60),g.hours=c%24,e+=fb(c/24),h=fb(qc(e)),e-=fb(rc(h)),f+=fb(e/30),e%=30,h+=fb(f/12),f%=12,g.days=e,g.months=f,g.years=h,this}function qc(a){return 400*a/146097}function rc(a){return 146097*a/400}function sc(a){var b,c,d=this._milliseconds;if(a=z(a),"month"===a||"year"===a)return b=this._days+d/864e5,c=this._months+12*qc(b),"month"===a?c:c/12;switch(b=this._days+Math.round(rc(this._months/12)),a){case"week":return b/7+d/6048e5;case"day":return b+d/864e5;case"hour":return 24*b+d/36e5;case"minute":return 1440*b+d/6e4;case"second":return 86400*b+d/1e3;case"millisecond":return Math.floor(864e5*b)+d;default:throw new Error("Unknown unit "+a)}}function tc(){return this._milliseconds+864e5*this._days+this._months%12*2592e6+31536e6*p(this._months/12)}function uc(a){return function(){return this.as(a)}}function vc(a){return a=z(a),this[a+"s"]()}function wc(a){return function(){return this._data[a]}}function xc(){return fb(this.days()/7)}function yc(a,b,c,d,e){return e.relativeTime(b||1,!!c,a,d)}function zc(a,b,c){var d=Va(a).abs(),e=jf(d.as("s")),f=jf(d.as("m")),g=jf(d.as("h")),h=jf(d.as("d")),i=jf(d.as("M")),j=jf(d.as("y")),k=e<kf.s&&["s",e]||1===f&&["m"]||f<kf.m&&["mm",f]||1===g&&["h"]||g<kf.h&&["hh",g]||1===h&&["d"]||h<kf.d&&["dd",h]||1===i&&["M"]||i<kf.M&&["MM",i]||1===j&&["y"]||["yy",j];return k[2]=b,k[3]=+a>0,k[4]=c,yc.apply(null,k)}function Ac(a,b){return void 0===kf[a]?!1:void 0===b?kf[a]:(kf[a]=b,!0)}function Bc(a){var b=this.localeData(),c=zc(this,!a,b);return a&&(c=b.pastFuture(+this,c)),b.postformat(c)}function Cc(){var a=lf(this.years()),b=lf(this.months()),c=lf(this.days()),d=lf(this.hours()),e=lf(this.minutes()),f=lf(this.seconds()+this.milliseconds()/1e3),g=this.asSeconds();return g?(0>g?"-":"")+"P"+(a?a+"Y":"")+(b?b+"M":"")+(c?c+"D":"")+(d||e||f?"T":"")+(d?d+"H":"")+(e?e+"M":"")+(f?f+"S":""):"P0D"}
//! moment.js locale configuration
//! locale : belarusian (be)
//! author : Dmitry Demidov : https://github.com/demidov91
//! author: Praleska: http://praleska.pro/
//! Author : Menelion Elensúle : https://github.com/Oire
	function Dc(a,b){var c=a.split("_");return b%10===1&&b%100!==11?c[0]:b%10>=2&&4>=b%10&&(10>b%100||b%100>=20)?c[1]:c[2]}function Ec(a,b,c){var d={mm:b?"хвіліна_хвіліны_хвілін":"хвіліну_хвіліны_хвілін",hh:b?"гадзіна_гадзіны_гадзін":"гадзіну_гадзіны_гадзін",dd:"дзень_дні_дзён",MM:"месяц_месяцы_месяцаў",yy:"год_гады_гадоў"};return"m"===c?b?"хвіліна":"хвіліну":"h"===c?b?"гадзіна":"гадзіну":a+" "+Dc(d[c],+a)}function Fc(a,b){var c={nominative:"студзень_люты_сакавік_красавік_травень_чэрвень_ліпень_жнівень_верасень_кастрычнік_лістапад_снежань".split("_"),accusative:"студзеня_лютага_сакавіка_красавіка_траўня_чэрвеня_ліпеня_жніўня_верасня_кастрычніка_лістапада_снежня".split("_")},d=/D[oD]?(\[[^\[\]]*\]|\s+)+MMMM?/.test(b)?"accusative":"nominative";return c[d][a.month()]}function Gc(a,b){var c={nominative:"нядзеля_панядзелак_аўторак_серада_чацвер_пятніца_субота".split("_"),accusative:"нядзелю_панядзелак_аўторак_сераду_чацвер_пятніцу_суботу".split("_")},d=/\[ ?[Вв] ?(?:мінулую|наступную)? ?\] ?dddd/.test(b)?"accusative":"nominative";return c[d][a.day()]}
//! moment.js locale configuration
//! locale : breton (br)
//! author : Jean-Baptiste Le Duigou : https://github.com/jbleduigou
	function Hc(a,b,c){var d={mm:"munutenn",MM:"miz",dd:"devezh"};return a+" "+Kc(d[c],a)}function Ic(a){switch(Jc(a)){case 1:case 3:case 4:case 5:case 9:return a+" bloaz";default:return a+" vloaz"}}function Jc(a){return a>9?Jc(a%10):a}function Kc(a,b){return 2===b?Lc(a):a}function Lc(a){var b={m:"v",b:"v",d:"z"};return void 0===b[a.charAt(0)]?a:b[a.charAt(0)]+a.substring(1)}
//! moment.js locale configuration
//! locale : bosnian (bs)
//! author : Nedim Cholich : https://github.com/frontyard
//! based on (hr) translation by Bojan Marković
	function Mc(a,b,c){var d=a+" ";switch(c){case"m":return b?"jedna minuta":"jedne minute";case"mm":return d+=1===a?"minuta":2===a||3===a||4===a?"minute":"minuta";case"h":return b?"jedan sat":"jednog sata";case"hh":return d+=1===a?"sat":2===a||3===a||4===a?"sata":"sati";case"dd":return d+=1===a?"dan":"dana";case"MM":return d+=1===a?"mjesec":2===a||3===a||4===a?"mjeseca":"mjeseci";case"yy":return d+=1===a?"godina":2===a||3===a||4===a?"godine":"godina"}}function Nc(a){return a>1&&5>a&&1!==~~(a/10)}function Oc(a,b,c,d){var e=a+" ";switch(c){case"s":return b||d?"pár sekund":"pár sekundami";case"m":return b?"minuta":d?"minutu":"minutou";case"mm":return b||d?e+(Nc(a)?"minuty":"minut"):e+"minutami";break;case"h":return b?"hodina":d?"hodinu":"hodinou";case"hh":return b||d?e+(Nc(a)?"hodiny":"hodin"):e+"hodinami";break;case"d":return b||d?"den":"dnem";case"dd":return b||d?e+(Nc(a)?"dny":"dní"):e+"dny";break;case"M":return b||d?"měsíc":"měsícem";case"MM":return b||d?e+(Nc(a)?"měsíce":"měsíců"):e+"měsíci";break;case"y":return b||d?"rok":"rokem";case"yy":return b||d?e+(Nc(a)?"roky":"let"):e+"lety"}}
//! moment.js locale configuration
//! locale : austrian german (de-at)
//! author : lluchs : https://github.com/lluchs
//! author: Menelion Elensúle: https://github.com/Oire
//! author : Martin Groller : https://github.com/MadMG
	function Pc(a,b,c,d){var e={m:["eine Minute","einer Minute"],h:["eine Stunde","einer Stunde"],d:["ein Tag","einem Tag"],dd:[a+" Tage",a+" Tagen"],M:["ein Monat","einem Monat"],MM:[a+" Monate",a+" Monaten"],y:["ein Jahr","einem Jahr"],yy:[a+" Jahre",a+" Jahren"]};return b?e[c][0]:e[c][1]}
//! moment.js locale configuration
//! locale : german (de)
//! author : lluchs : https://github.com/lluchs
//! author: Menelion Elensúle: https://github.com/Oire
	function Qc(a,b,c,d){var e={m:["eine Minute","einer Minute"],h:["eine Stunde","einer Stunde"],d:["ein Tag","einem Tag"],dd:[a+" Tage",a+" Tagen"],M:["ein Monat","einem Monat"],MM:[a+" Monate",a+" Monaten"],y:["ein Jahr","einem Jahr"],yy:[a+" Jahre",a+" Jahren"]};return b?e[c][0]:e[c][1]}
//! moment.js locale configuration
//! locale : estonian (et)
//! author : Henry Kehlmann : https://github.com/madhenry
//! improvements : Illimar Tambek : https://github.com/ragulka
	function Rc(a,b,c,d){var e={s:["mõne sekundi","mõni sekund","paar sekundit"],m:["ühe minuti","üks minut"],mm:[a+" minuti",a+" minutit"],h:["ühe tunni","tund aega","üks tund"],hh:[a+" tunni",a+" tundi"],d:["ühe päeva","üks päev"],M:["kuu aja","kuu aega","üks kuu"],MM:[a+" kuu",a+" kuud"],y:["ühe aasta","aasta","üks aasta"],yy:[a+" aasta",a+" aastat"]};return b?e[c][2]?e[c][2]:e[c][1]:d?e[c][0]:e[c][1]}function Sc(a,b,c,d){var e="";switch(c){case"s":return d?"muutaman sekunnin":"muutama sekunti";case"m":return d?"minuutin":"minuutti";case"mm":e=d?"minuutin":"minuuttia";break;case"h":return d?"tunnin":"tunti";case"hh":e=d?"tunnin":"tuntia";break;case"d":return d?"päivän":"päivä";case"dd":e=d?"päivän":"päivää";break;case"M":return d?"kuukauden":"kuukausi";case"MM":e=d?"kuukauden":"kuukautta";break;case"y":return d?"vuoden":"vuosi";case"yy":e=d?"vuoden":"vuotta"}return e=Tc(a,d)+" "+e}function Tc(a,b){return 10>a?b?If[a]:Hf[a]:a}
//! moment.js locale configuration
//! locale : hrvatski (hr)
//! author : Bojan Marković : https://github.com/bmarkovic
	function Uc(a,b,c){var d=a+" ";switch(c){case"m":return b?"jedna minuta":"jedne minute";case"mm":return d+=1===a?"minuta":2===a||3===a||4===a?"minute":"minuta";case"h":return b?"jedan sat":"jednog sata";case"hh":return d+=1===a?"sat":2===a||3===a||4===a?"sata":"sati";case"dd":return d+=1===a?"dan":"dana";case"MM":return d+=1===a?"mjesec":2===a||3===a||4===a?"mjeseca":"mjeseci";case"yy":return d+=1===a?"godina":2===a||3===a||4===a?"godine":"godina"}}function Vc(a,b,c,d){var e=a;switch(c){case"s":return d||b?"néhány másodperc":"néhány másodperce";case"m":return"egy"+(d||b?" perc":" perce");case"mm":return e+(d||b?" perc":" perce");case"h":return"egy"+(d||b?" óra":" órája");case"hh":return e+(d||b?" óra":" órája");case"d":return"egy"+(d||b?" nap":" napja");case"dd":return e+(d||b?" nap":" napja");case"M":return"egy"+(d||b?" hónap":" hónapja");case"MM":return e+(d||b?" hónap":" hónapja");case"y":return"egy"+(d||b?" év":" éve");case"yy":return e+(d||b?" év":" éve")}return""}function Wc(a){return(a?"":"[múlt] ")+"["+Nf[this.day()]+"] LT[-kor]"}
//! moment.js locale configuration
//! locale : Armenian (hy-am)
//! author : Armendarabyan : https://github.com/armendarabyan
	function Xc(a,b){var c={nominative:"հունվար_փետրվար_մարտ_ապրիլ_մայիս_հունիս_հուլիս_օգոստոս_սեպտեմբեր_հոկտեմբեր_նոյեմբեր_դեկտեմբեր".split("_"),accusative:"հունվարի_փետրվարի_մարտի_ապրիլի_մայիսի_հունիսի_հուլիսի_օգոստոսի_սեպտեմբերի_հոկտեմբերի_նոյեմբերի_դեկտեմբերի".split("_")},d=/D[oD]?(\[[^\[\]]*\]|\s+)+MMMM?/.test(b)?"accusative":"nominative";return c[d][a.month()]}function Yc(a,b){var c="հնվ_փտր_մրտ_ապր_մյս_հնս_հլս_օգս_սպտ_հկտ_նմբ_դկտ".split("_");return c[a.month()]}function Zc(a,b){var c="կիրակի_երկուշաբթի_երեքշաբթի_չորեքշաբթի_հինգշաբթի_ուրբաթ_շաբաթ".split("_");return c[a.day()]}
//! moment.js locale configuration
//! locale : icelandic (is)
//! author : Hinrik Örn Sigurðsson : https://github.com/hinrik
	function $c(a){return a%100===11?!0:a%10===1?!1:!0}function _c(a,b,c,d){var e=a+" ";switch(c){case"s":return b||d?"nokkrar sekúndur":"nokkrum sekúndum";case"m":return b?"mínúta":"mínútu";case"mm":return $c(a)?e+(b||d?"mínútur":"mínútum"):b?e+"mínúta":e+"mínútu";case"hh":return $c(a)?e+(b||d?"klukkustundir":"klukkustundum"):e+"klukkustund";case"d":return b?"dagur":d?"dag":"degi";case"dd":return $c(a)?b?e+"dagar":e+(d?"daga":"dögum"):b?e+"dagur":e+(d?"dag":"degi");case"M":return b?"mánuður":d?"mánuð":"mánuði";case"MM":return $c(a)?b?e+"mánuðir":e+(d?"mánuði":"mánuðum"):b?e+"mánuður":e+(d?"mánuð":"mánuði");case"y":return b||d?"ár":"ári";case"yy":return $c(a)?e+(b||d?"ár":"árum"):e+(b||d?"ár":"ári")}}
//! moment.js locale configuration
//! locale : Georgian (ka)
//! author : Irakli Janiashvili : https://github.com/irakli-janiashvili
	function ad(a,b){var c={nominative:"იანვარი_თებერვალი_მარტი_აპრილი_მაისი_ივნისი_ივლისი_აგვისტო_სექტემბერი_ოქტომბერი_ნოემბერი_დეკემბერი".split("_"),accusative:"იანვარს_თებერვალს_მარტს_აპრილის_მაისს_ივნისს_ივლისს_აგვისტს_სექტემბერს_ოქტომბერს_ნოემბერს_დეკემბერს".split("_")},d=/D[oD] *MMMM?/.test(b)?"accusative":"nominative";return c[d][a.month()]}function bd(a,b){var c={nominative:"კვირა_ორშაბათი_სამშაბათი_ოთხშაბათი_ხუთშაბათი_პარასკევი_შაბათი".split("_"),accusative:"კვირას_ორშაბათს_სამშაბათს_ოთხშაბათს_ხუთშაბათს_პარასკევს_შაბათს".split("_")},d=/(წინა|შემდეგ)/.test(b)?"accusative":"nominative";return c[d][a.day()]}
//! moment.js locale configuration
//! locale : Luxembourgish (lb)
//! author : mweimerskirch : https://github.com/mweimerskirch, David Raison : https://github.com/kwisatz
	function cd(a,b,c,d){var e={m:["eng Minutt","enger Minutt"],h:["eng Stonn","enger Stonn"],d:["een Dag","engem Dag"],M:["ee Mount","engem Mount"],y:["ee Joer","engem Joer"]};return b?e[c][0]:e[c][1]}function dd(a){var b=a.substr(0,a.indexOf(" "));return fd(b)?"a "+a:"an "+a}function ed(a){var b=a.substr(0,a.indexOf(" "));return fd(b)?"viru "+a:"virun "+a}function fd(a){if(a=parseInt(a,10),isNaN(a))return!1;if(0>a)return!0;if(10>a)return a>=4&&7>=a?!0:!1;if(100>a){var b=a%10,c=a/10;return fd(0===b?c:b)}if(1e4>a){for(;a>=10;)a/=10;return fd(a)}return a/=1e3,fd(a)}function gd(a,b,c,d){return b?"kelios sekundės":d?"kelių sekundžių":"kelias sekundes"}function hd(a,b,c,d){return b?jd(c)[0]:d?jd(c)[1]:jd(c)[2]}function id(a){return a%10===0||a>10&&20>a}function jd(a){return Of[a].split("_")}function kd(a,b,c,d){var e=a+" ";return 1===a?e+hd(a,b,c[0],d):b?e+(id(a)?jd(c)[1]:jd(c)[0]):d?e+jd(c)[1]:e+(id(a)?jd(c)[1]:jd(c)[2])}function ld(a,b){var c=-1===b.indexOf("dddd HH:mm"),d=Pf[a.day()];return c?d:d.substring(0,d.length-2)+"į"}function md(a,b,c){return c?b%10===1&&11!==b?a[2]:a[3]:b%10===1&&11!==b?a[0]:a[1]}function nd(a,b,c){return a+" "+md(Qf[c],a,b)}function od(a,b,c){return md(Qf[c],a,b)}function pd(a,b){return b?"dažas sekundes":"dažām sekundēm"}function qd(a){return 5>a%10&&a%10>1&&~~(a/10)%10!==1}function rd(a,b,c){var d=a+" ";switch(c){case"m":return b?"minuta":"minutę";case"mm":return d+(qd(a)?"minuty":"minut");case"h":return b?"godzina":"godzinę";case"hh":return d+(qd(a)?"godziny":"godzin");case"MM":return d+(qd(a)?"miesiące":"miesięcy");case"yy":return d+(qd(a)?"lata":"lat")}}
//! moment.js locale configuration
//! locale : romanian (ro)
//! author : Vlad Gurdiga : https://github.com/gurdiga
//! author : Valentin Agachi : https://github.com/avaly
	function sd(a,b,c){var d={mm:"minute",hh:"ore",dd:"zile",MM:"luni",yy:"ani"},e=" ";return(a%100>=20||a>=100&&a%100===0)&&(e=" de "),a+e+d[c]}
//! moment.js locale configuration
//! locale : russian (ru)
//! author : Viktorminator : https://github.com/Viktorminator
//! Author : Menelion Elensúle : https://github.com/Oire
	function td(a,b){var c=a.split("_");return b%10===1&&b%100!==11?c[0]:b%10>=2&&4>=b%10&&(10>b%100||b%100>=20)?c[1]:c[2]}function ud(a,b,c){var d={mm:b?"минута_минуты_минут":"минуту_минуты_минут",hh:"час_часа_часов",dd:"день_дня_дней",MM:"месяц_месяца_месяцев",yy:"год_года_лет"};return"m"===c?b?"минута":"минуту":a+" "+td(d[c],+a)}function vd(a,b){var c={nominative:"январь_февраль_март_апрель_май_июнь_июль_август_сентябрь_октябрь_ноябрь_декабрь".split("_"),accusative:"января_февраля_марта_апреля_мая_июня_июля_августа_сентября_октября_ноября_декабря".split("_")},d=/D[oD]?(\[[^\[\]]*\]|\s+)+MMMM?/.test(b)?"accusative":"nominative";return c[d][a.month()]}function wd(a,b){var c={nominative:"янв_фев_март_апр_май_июнь_июль_авг_сен_окт_ноя_дек".split("_"),accusative:"янв_фев_мар_апр_мая_июня_июля_авг_сен_окт_ноя_дек".split("_")},d=/D[oD]?(\[[^\[\]]*\]|\s+)+MMMM?/.test(b)?"accusative":"nominative";return c[d][a.month()]}function xd(a,b){var c={nominative:"воскресенье_понедельник_вторник_среда_четверг_пятница_суббота".split("_"),accusative:"воскресенье_понедельник_вторник_среду_четверг_пятницу_субботу".split("_")},d=/\[ ?[Вв] ?(?:прошлую|следующую|эту)? ?\] ?dddd/.test(b)?"accusative":"nominative";return c[d][a.day()]}function yd(a){return a>1&&5>a}function zd(a,b,c,d){var e=a+" ";switch(c){case"s":return b||d?"pár sekúnd":"pár sekundami";case"m":return b?"minúta":d?"minútu":"minútou";case"mm":return b||d?e+(yd(a)?"minúty":"minút"):e+"minútami";break;case"h":return b?"hodina":d?"hodinu":"hodinou";case"hh":return b||d?e+(yd(a)?"hodiny":"hodín"):e+"hodinami";break;case"d":return b||d?"deň":"dňom";case"dd":return b||d?e+(yd(a)?"dni":"dní"):e+"dňami";break;case"M":return b||d?"mesiac":"mesiacom";case"MM":return b||d?e+(yd(a)?"mesiace":"mesiacov"):e+"mesiacmi";break;case"y":return b||d?"rok":"rokom";case"yy":return b||d?e+(yd(a)?"roky":"rokov"):e+"rokmi"}}
//! moment.js locale configuration
//! locale : slovenian (sl)
//! author : Robert Sedovšek : https://github.com/sedovsek
	function Ad(a,b,c,d){var e=a+" ";switch(c){case"s":return b||d?"nekaj sekund":"nekaj sekundami";case"m":return b?"ena minuta":"eno minuto";case"mm":return e+=1===a?b?"minuta":"minuto":2===a?b||d?"minuti":"minutama":5>a?b||d?"minute":"minutami":b||d?"minut":"minutami";case"h":return b?"ena ura":"eno uro";case"hh":return e+=1===a?b?"ura":"uro":2===a?b||d?"uri":"urama":5>a?b||d?"ure":"urami":b||d?"ur":"urami";case"d":return b||d?"en dan":"enim dnem";case"dd":return e+=1===a?b||d?"dan":"dnem":2===a?b||d?"dni":"dnevoma":b||d?"dni":"dnevi";case"M":return b||d?"en mesec":"enim mesecem";case"MM":return e+=1===a?b||d?"mesec":"mesecem":2===a?b||d?"meseca":"mesecema":5>a?b||d?"mesece":"meseci":b||d?"mesecev":"meseci";case"y":return b||d?"eno leto":"enim letom";case"yy":return e+=1===a?b||d?"leto":"letom":2===a?b||d?"leti":"letoma":5>a?b||d?"leta":"leti":b||d?"let":"leti"}}
//! moment.js locale configuration
//! locale : ukrainian (uk)
//! author : zemlanin : https://github.com/zemlanin
//! Author : Menelion Elensúle : https://github.com/Oire
	function Bd(a,b){var c=a.split("_");return b%10===1&&b%100!==11?c[0]:b%10>=2&&4>=b%10&&(10>b%100||b%100>=20)?c[1]:c[2]}function Cd(a,b,c){var d={mm:"хвилина_хвилини_хвилин",hh:"година_години_годин",dd:"день_дні_днів",MM:"місяць_місяці_місяців",yy:"рік_роки_років"};return"m"===c?b?"хвилина":"хвилину":"h"===c?b?"година":"годину":a+" "+Bd(d[c],+a)}function Dd(a,b){var c={nominative:"січень_лютий_березень_квітень_травень_червень_липень_серпень_вересень_жовтень_листопад_грудень".split("_"),accusative:"січня_лютого_березня_квітня_травня_червня_липня_серпня_вересня_жовтня_листопада_грудня".split("_")},d=/D[oD]? *MMMM?/.test(b)?"accusative":"nominative";return c[d][a.month()]}function Ed(a,b){var c={nominative:"неділя_понеділок_вівторок_середа_четвер_п’ятниця_субота".split("_"),accusative:"неділю_понеділок_вівторок_середу_четвер_п’ятницю_суботу".split("_"),genitive:"неділі_понеділка_вівторка_середи_четверга_п’ятниці_суботи".split("_")},d=/(\[[ВвУу]\]) ?dddd/.test(b)?"accusative":/\[?(?:минулої|наступної)? ?\] ?dddd/.test(b)?"genitive":"nominative";return c[d][a.day()]}function Fd(a){return function(){return a+"о"+(11===this.hours()?"б":"")+"] LT"}}var Gd,Hd,Id=a.momentProperties=[],Jd=!1,Kd={},Ld={},Md=/(\[[^\[]*\])|(\\)?(Mo|MM?M?M?|Do|DDDo|DD?D?D?|ddd?d?|do?|w[o|w]?|W[o|W]?|Q|YYYYYY|YYYYY|YYYY|YY|gg(ggg?)?|GG(GGG?)?|e|E|a|A|hh?|HH?|mm?|ss?|S{1,4}|x|X|zz?|ZZ?|.)/g,Nd=/(\[[^\[]*\])|(\\)?(LTS|LT|LL?L?L?|l{1,4})/g,Od={},Pd={},Qd=/\d/,Rd=/\d\d/,Sd=/\d{3}/,Td=/\d{4}/,Ud=/[+-]?\d{6}/,Vd=/\d\d?/,Wd=/\d{1,3}/,Xd=/\d{1,4}/,Yd=/[+-]?\d{1,6}/,Zd=/\d+/,$d=/[+-]?\d+/,_d=/Z|[+-]\d\d:?\d\d/gi,ae=/[+-]?\d+(\.\d{1,3})?/,be=/[0-9]*['a-z\u00A0-\u05FF\u0700-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+|[\u0600-\u06FF\/]+(\s*?[\u0600-\u06FF]+){1,2}/i,ce={},de={},ee=0,fe=1,ge=2,he=3,ie=4,je=5,ke=6;G("M",["MM",2],"Mo",function(){return this.month()+1}),G("MMM",0,0,function(a){return this.localeData().monthsShort(this,a)}),G("MMMM",0,0,function(a){return this.localeData().months(this,a)}),y("month","M"),L("M",Vd),L("MM",Vd,Rd),L("MMM",be),L("MMMM",be),O(["M","MM"],function(a,b){b[fe]=p(a)-1}),O(["MMM","MMMM"],function(a,b,c,d){var e=c._locale.monthsParse(a,d,c._strict);null!=e?b[fe]=e:j(c).invalidMonth=a});var le="January_February_March_April_May_June_July_August_September_October_November_December".split("_"),me="Jan_Feb_Mar_Apr_May_Jun_Jul_Aug_Sep_Oct_Nov_Dec".split("_"),ne={};a.suppressDeprecationWarnings=!1;var oe=/^\s*(?:[+-]\d{6}|\d{4})-(?:(\d\d-\d\d)|(W\d\d$)|(W\d\d-\d)|(\d\d\d))((T| )(\d\d(:\d\d(:\d\d(\.\d+)?)?)?)?([\+\-]\d\d(?::?\d\d)?|\s*Z)?)?$/,pe=[["YYYYYY-MM-DD",/[+-]\d{6}-\d{2}-\d{2}/],["YYYY-MM-DD",/\d{4}-\d{2}-\d{2}/],["GGGG-[W]WW-E",/\d{4}-W\d{2}-\d/],["GGGG-[W]WW",/\d{4}-W\d{2}/],["YYYY-DDD",/\d{4}-\d{3}/]],qe=[["HH:mm:ss.SSSS",/(T| )\d\d:\d\d:\d\d\.\d+/],["HH:mm:ss",/(T| )\d\d:\d\d:\d\d/],["HH:mm",/(T| )\d\d:\d\d/],["HH",/(T| )\d\d/]],re=/^\/?Date\((\-?\d+)/i;a.createFromInputFallback=$("moment construction falls back to js Date. This is discouraged and will be removed in upcoming major release. Please refer to https://github.com/moment/moment/issues/1407 for more info.",function(a){a._d=new Date(a._i+(a._useUTC?" UTC":""))}),G(0,["YY",2],0,function(){return this.year()%100}),G(0,["YYYY",4],0,"year"),G(0,["YYYYY",5],0,"year"),G(0,["YYYYYY",6,!0],0,"year"),y("year","y"),L("Y",$d),L("YY",Vd,Rd),L("YYYY",Xd,Td),L("YYYYY",Yd,Ud),L("YYYYYY",Yd,Ud),O(["YYYY","YYYYY","YYYYYY"],ee),O("YY",function(b,c){c[ee]=a.parseTwoDigitYear(b)}),a.parseTwoDigitYear=function(a){return p(a)+(p(a)>68?1900:2e3)};var se=B("FullYear",!1);G("w",["ww",2],"wo","week"),G("W",["WW",2],"Wo","isoWeek"),y("week","w"),y("isoWeek","W"),L("w",Vd),L("ww",Vd,Rd),L("W",Vd),L("WW",Vd,Rd),P(["w","ww","W","WW"],function(a,b,c,d){b[d.substr(0,1)]=p(a)});var te={dow:0,doy:6};G("DDD",["DDDD",3],"DDDo","dayOfYear"),y("dayOfYear","DDD"),L("DDD",Wd),L("DDDD",Sd),O(["DDD","DDDD"],function(a,b,c){c._dayOfYear=p(a)}),a.ISO_8601=function(){};var ue=$("moment().min is deprecated, use moment.min instead. https://github.com/moment/moment/issues/1548",function(){var a=Aa.apply(null,arguments);return this>a?this:a}),ve=$("moment().max is deprecated, use moment.max instead. https://github.com/moment/moment/issues/1548",function(){var a=Aa.apply(null,arguments);return a>this?this:a});Ga("Z",":"),Ga("ZZ",""),L("Z",_d),L("ZZ",_d),O(["Z","ZZ"],function(a,b,c){c._useUTC=!0,c._tzm=Ha(a)});var we=/([\+\-]|\d\d)/gi;a.updateOffset=function(){};var xe=/(\-)?(?:(\d*)\.)?(\d+)\:(\d+)(?:\:(\d+)\.?(\d{3})?)?/,ye=/^(-)?P(?:(?:([0-9,.]*)Y)?(?:([0-9,.]*)M)?(?:([0-9,.]*)D)?(?:T(?:([0-9,.]*)H)?(?:([0-9,.]*)M)?(?:([0-9,.]*)S)?)?|([0-9,.]*)W)$/;Va.fn=Ea.prototype;var ze=Za(1,"add"),Ae=Za(-1,"subtract");a.defaultFormat="YYYY-MM-DDTHH:mm:ssZ";var Be=$("moment().lang() is deprecated. Instead, use moment().localeData() to get the language configuration. Use moment().locale() to change languages.",function(a){return void 0===a?this.localeData():this.locale(a)});G(0,["gg",2],0,function(){return this.weekYear()%100}),G(0,["GG",2],0,function(){return this.isoWeekYear()%100}),Ab("gggg","weekYear"),Ab("ggggg","weekYear"),Ab("GGGG","isoWeekYear"),Ab("GGGGG","isoWeekYear"),y("weekYear","gg"),y("isoWeekYear","GG"),L("G",$d),L("g",$d),L("GG",Vd,Rd),L("gg",Vd,Rd),L("GGGG",Xd,Td),L("gggg",Xd,Td),L("GGGGG",Yd,Ud),L("ggggg",Yd,Ud),P(["gggg","ggggg","GGGG","GGGGG"],function(a,b,c,d){b[d.substr(0,2)]=p(a)}),P(["gg","GG"],function(b,c,d,e){c[e]=a.parseTwoDigitYear(b)}),G("Q",0,0,"quarter"),y("quarter","Q"),L("Q",Qd),O("Q",function(a,b){b[fe]=3*(p(a)-1)}),G("D",["DD",2],"Do","date"),y("date","D"),L("D",Vd),L("DD",Vd,Rd),L("Do",function(a,b){return a?b._ordinalParse:b._ordinalParseLenient}),O(["D","DD"],ge),O("Do",function(a,b){b[ge]=p(a.match(Vd)[0],10)});var Ce=B("Date",!0);G("d",0,"do","day"),G("dd",0,0,function(a){return this.localeData().weekdaysMin(this,a)}),G("ddd",0,0,function(a){return this.localeData().weekdaysShort(this,a)}),G("dddd",0,0,function(a){return this.localeData().weekdays(this,a)}),G("e",0,0,"weekday"),G("E",0,0,"isoWeekday"),y("day","d"),y("weekday","e"),y("isoWeekday","E"),L("d",Vd),L("e",Vd),L("E",Vd),L("dd",be),L("ddd",be),L("dddd",be),P(["dd","ddd","dddd"],function(a,b,c){var d=c._locale.weekdaysParse(a);null!=d?b.d=d:j(c).invalidWeekday=a}),P(["d","e","E"],function(a,b,c,d){b[d]=p(a)});var De="Sunday_Monday_Tuesday_Wednesday_Thursday_Friday_Saturday".split("_"),Ee="Sun_Mon_Tue_Wed_Thu_Fri_Sat".split("_"),Fe="Su_Mo_Tu_We_Th_Fr_Sa".split("_");G("H",["HH",2],0,"hour"),G("h",["hh",2],0,function(){return this.hours()%12||12}),Pb("a",!0),Pb("A",!1),y("hour","h"),L("a",Qb),L("A",Qb),L("H",Vd),L("h",Vd),L("HH",Vd,Rd),L("hh",Vd,Rd),O(["H","HH"],he),O(["a","A"],function(a,b,c){c._isPm=c._locale.isPM(a),c._meridiem=a}),O(["h","hh"],function(a,b,c){b[he]=p(a),j(c).bigHour=!0});var Ge=/[ap]\.?m?\.?/i,He=B("Hours",!0);G("m",["mm",2],0,"minute"),y("minute","m"),L("m",Vd),L("mm",Vd,Rd),O(["m","mm"],ie);var Ie=B("Minutes",!1);G("s",["ss",2],0,"second"),y("second","s"),L("s",Vd),L("ss",Vd,Rd),O(["s","ss"],je);var Je=B("Seconds",!1);G("S",0,0,function(){return~~(this.millisecond()/100)}),G(0,["SS",2],0,function(){return~~(this.millisecond()/10)}),Tb("SSS"),Tb("SSSS"),y("millisecond","ms"),L("S",Wd,Qd),L("SS",Wd,Rd),L("SSS",Wd,Sd),L("SSSS",Zd),O(["S","SS","SSS","SSSS"],function(a,b){b[ke]=p(1e3*("0."+a))});var Ke=B("Milliseconds",!1);G("z",0,0,"zoneAbbr"),G("zz",0,0,"zoneName");var Le=n.prototype;Le.add=ze,Le.calendar=_a,Le.clone=ab,Le.diff=gb,Le.endOf=sb,Le.format=kb,Le.from=lb,Le.fromNow=mb,Le.to=nb,Le.toNow=ob,Le.get=E,Le.invalidAt=zb,Le.isAfter=bb,Le.isBefore=cb,Le.isBetween=db,Le.isSame=eb,Le.isValid=xb,Le.lang=Be,Le.locale=pb,Le.localeData=qb,Le.max=ve,Le.min=ue,Le.parsingFlags=yb,Le.set=E,Le.startOf=rb,Le.subtract=Ae,Le.toArray=wb,Le.toDate=vb,Le.toISOString=jb,Le.toJSON=jb,Le.toString=ib,Le.unix=ub,Le.valueOf=tb,Le.year=se,Le.isLeapYear=ga,Le.weekYear=Cb,Le.isoWeekYear=Db,Le.quarter=Le.quarters=Gb,Le.month=W,Le.daysInMonth=X,Le.week=Le.weeks=la,Le.isoWeek=Le.isoWeeks=ma,Le.weeksInYear=Fb,Le.isoWeeksInYear=Eb,Le.date=Ce,Le.day=Le.days=Mb,Le.weekday=Nb,Le.isoWeekday=Ob,Le.dayOfYear=oa,Le.hour=Le.hours=He,Le.minute=Le.minutes=Ie,Le.second=Le.seconds=Je,Le.millisecond=Le.milliseconds=Ke,Le.utcOffset=Ka,Le.utc=Ma,Le.local=Na,Le.parseZone=Oa,Le.hasAlignedHourOffset=Pa,Le.isDST=Qa,Le.isDSTShifted=Ra,Le.isLocal=Sa,Le.isUtcOffset=Ta,Le.isUtc=Ua,Le.isUTC=Ua,Le.zoneAbbr=Ub,Le.zoneName=Vb,Le.dates=$("dates accessor is deprecated. Use date instead.",Ce),Le.months=$("months accessor is deprecated. Use month instead",W),Le.years=$("years accessor is deprecated. Use year instead",se),Le.zone=$("moment().zone is deprecated, use moment().utcOffset instead. https://github.com/moment/moment/issues/1779",La);var Me=Le,Ne={sameDay:"[Today at] LT",nextDay:"[Tomorrow at] LT",nextWeek:"dddd [at] LT",lastDay:"[Yesterday at] LT",lastWeek:"[Last] dddd [at] LT",sameElse:"L"},Oe={LTS:"h:mm:ss A",LT:"h:mm A",L:"MM/DD/YYYY",LL:"MMMM D, YYYY",LLL:"MMMM D, YYYY LT",LLLL:"dddd, MMMM D, YYYY LT"},Pe="Invalid date",Qe="%d",Re=/\d{1,2}/,Se={future:"in %s",past:"%s ago",s:"a few seconds",m:"a minute",mm:"%d minutes",h:"an hour",hh:"%d hours",d:"a day",dd:"%d days",M:"a month",MM:"%d months",y:"a year",yy:"%d years"},Te=r.prototype;Te._calendar=Ne,Te.calendar=Yb,Te._longDateFormat=Oe,Te.longDateFormat=Zb,Te._invalidDate=Pe,Te.invalidDate=$b,Te._ordinal=Qe,Te.ordinal=_b,Te._ordinalParse=Re,Te.preparse=ac,Te.postformat=ac,Te._relativeTime=Se,Te.relativeTime=bc,Te.pastFuture=cc,Te.set=dc,Te.months=S,Te._months=le,Te.monthsShort=T,Te._monthsShort=me,Te.monthsParse=U,Te.week=ia,Te._week=te,Te.firstDayOfYear=ka,Te.firstDayOfWeek=ja,Te.weekdays=Ib,Te._weekdays=De,Te.weekdaysMin=Kb,Te._weekdaysMin=Fe,Te.weekdaysShort=Jb,Te._weekdaysShort=Ee,Te.weekdaysParse=Lb,Te.isPM=Rb,Te._meridiemParse=Ge,Te.meridiem=Sb,v("en",{ordinalParse:/\d{1,2}(th|st|nd|rd)/,ordinal:function(a){var b=a%10,c=1===p(a%100/10)?"th":1===b?"st":2===b?"nd":3===b?"rd":"th";return a+c}}),a.lang=$("moment.lang is deprecated. Use moment.locale instead.",v),a.langData=$("moment.langData is deprecated. Use moment.localeData instead.",x);var Ue=Math.abs,Ve=uc("ms"),We=uc("s"),Xe=uc("m"),Ye=uc("h"),Ze=uc("d"),$e=uc("w"),_e=uc("M"),af=uc("y"),bf=wc("milliseconds"),cf=wc("seconds"),df=wc("minutes"),ef=wc("hours"),ff=wc("days"),gf=wc("months"),hf=wc("years"),jf=Math.round,kf={s:45,m:45,h:22,d:26,M:11},lf=Math.abs,mf=Ea.prototype;mf.abs=lc,mf.add=nc,mf.subtract=oc,mf.as=sc,mf.asMilliseconds=Ve,mf.asSeconds=We,mf.asMinutes=Xe,mf.asHours=Ye,mf.asDays=Ze,mf.asWeeks=$e,mf.asMonths=_e,mf.asYears=af,mf.valueOf=tc,mf._bubble=pc,mf.get=vc,mf.milliseconds=bf,mf.seconds=cf,mf.minutes=df,mf.hours=ef,mf.days=ff,mf.weeks=xc,mf.months=gf,mf.years=hf,mf.humanize=Bc,mf.toISOString=Cc,mf.toString=Cc,mf.toJSON=Cc,mf.locale=pb,mf.localeData=qb,mf.toIsoString=$("toIsoString() is deprecated. Please use toISOString() instead (notice the capitals)",Cc),mf.lang=Be,G("X",0,0,"unix"),G("x",0,0,"valueOf"),L("x",$d),L("X",ae),O("X",function(a,b,c){c._d=new Date(1e3*parseFloat(a,10))}),O("x",function(a,b,c){c._d=new Date(p(a))}),
//! moment.js
//! version : 2.10.3
//! authors : Tim Wood, Iskren Chernev, Moment.js contributors
//! license : MIT
//! momentjs.com
		a.version="2.10.3",b(Aa),a.fn=Me,a.min=Ca,a.max=Da,a.utc=h,a.unix=Wb,a.months=gc,a.isDate=d,a.locale=v,a.invalid=l,a.duration=Va,a.isMoment=o,a.weekdays=ic,a.parseZone=Xb,a.localeData=x,a.isDuration=Fa,a.monthsShort=hc,a.weekdaysMin=kc,a.defineLocale=w,a.weekdaysShort=jc,a.normalizeUnits=z,a.relativeTimeThreshold=Ac;var nf=a,of=(nf.defineLocale("af",{months:"Januarie_Februarie_Maart_April_Mei_Junie_Julie_Augustus_September_Oktober_November_Desember".split("_"),monthsShort:"Jan_Feb_Mar_Apr_Mei_Jun_Jul_Aug_Sep_Okt_Nov_Des".split("_"),weekdays:"Sondag_Maandag_Dinsdag_Woensdag_Donderdag_Vrydag_Saterdag".split("_"),weekdaysShort:"Son_Maa_Din_Woe_Don_Vry_Sat".split("_"),weekdaysMin:"So_Ma_Di_Wo_Do_Vr_Sa".split("_"),meridiemParse:/vm|nm/i,isPM:function(a){return/^nm$/i.test(a)},meridiem:function(a,b,c){return 12>a?c?"vm":"VM":c?"nm":"NM"},longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD/MM/YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd, D MMMM YYYY LT"},calendar:{sameDay:"[Vandag om] LT",nextDay:"[Môre om] LT",nextWeek:"dddd [om] LT",lastDay:"[Gister om] LT",lastWeek:"[Laas] dddd [om] LT",sameElse:"L"},relativeTime:{future:"oor %s",past:"%s gelede",s:"'n paar sekondes",m:"'n minuut",mm:"%d minute",h:"'n uur",hh:"%d ure",d:"'n dag",dd:"%d dae",M:"'n maand",MM:"%d maande",y:"'n jaar",yy:"%d jaar"},ordinalParse:/\d{1,2}(ste|de)/,ordinal:function(a){return a+(1===a||8===a||a>=20?"ste":"de")},week:{dow:1,doy:4}}),nf.defineLocale("ar-ma",{months:"يناير_فبراير_مارس_أبريل_ماي_يونيو_يوليوز_غشت_شتنبر_أكتوبر_نونبر_دجنبر".split("_"),monthsShort:"يناير_فبراير_مارس_أبريل_ماي_يونيو_يوليوز_غشت_شتنبر_أكتوبر_نونبر_دجنبر".split("_"),weekdays:"الأحد_الإتنين_الثلاثاء_الأربعاء_الخميس_الجمعة_السبت".split("_"),weekdaysShort:"احد_اتنين_ثلاثاء_اربعاء_خميس_جمعة_سبت".split("_"),weekdaysMin:"ح_ن_ث_ر_خ_ج_س".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD/MM/YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd D MMMM YYYY LT"},calendar:{sameDay:"[اليوم على الساعة] LT",nextDay:"[غدا على الساعة] LT",nextWeek:"dddd [على الساعة] LT",lastDay:"[أمس على الساعة] LT",lastWeek:"dddd [على الساعة] LT",sameElse:"L"},relativeTime:{future:"في %s",past:"منذ %s",s:"ثوان",m:"دقيقة",mm:"%d دقائق",h:"ساعة",hh:"%d ساعات",d:"يوم",dd:"%d أيام",M:"شهر",MM:"%d أشهر",y:"سنة",yy:"%d سنوات"},week:{dow:6,doy:12}}),{1:"١",2:"٢",3:"٣",4:"٤",5:"٥",6:"٦",7:"٧",8:"٨",9:"٩",0:"٠"}),pf={"١":"1","٢":"2","٣":"3","٤":"4","٥":"5","٦":"6","٧":"7","٨":"8","٩":"9","٠":"0"},qf=(nf.defineLocale("ar-sa",{months:"يناير_فبراير_مارس_أبريل_مايو_يونيو_يوليو_أغسطس_سبتمبر_أكتوبر_نوفمبر_ديسمبر".split("_"),monthsShort:"يناير_فبراير_مارس_أبريل_مايو_يونيو_يوليو_أغسطس_سبتمبر_أكتوبر_نوفمبر_ديسمبر".split("_"),weekdays:"الأحد_الإثنين_الثلاثاء_الأربعاء_الخميس_الجمعة_السبت".split("_"),weekdaysShort:"أحد_إثنين_ثلاثاء_أربعاء_خميس_جمعة_سبت".split("_"),weekdaysMin:"ح_ن_ث_ر_خ_ج_س".split("_"),longDateFormat:{LT:"HH:mm",LTS:"HH:mm:ss",L:"DD/MM/YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd D MMMM YYYY LT"},meridiemParse:/ص|م/,isPM:function(a){return"م"===a},meridiem:function(a,b,c){return 12>a?"ص":"م"},calendar:{sameDay:"[اليوم على الساعة] LT",nextDay:"[غدا على الساعة] LT",nextWeek:"dddd [على الساعة] LT",lastDay:"[أمس على الساعة] LT",lastWeek:"dddd [على الساعة] LT",sameElse:"L"},relativeTime:{future:"في %s",past:"منذ %s",s:"ثوان",m:"دقيقة",mm:"%d دقائق",h:"ساعة",hh:"%d ساعات",d:"يوم",dd:"%d أيام",M:"شهر",MM:"%d أشهر",y:"سنة",yy:"%d سنوات"},preparse:function(a){return a.replace(/[١٢٣٤٥٦٧٨٩٠]/g,function(a){return pf[a]}).replace(/،/g,",")},postformat:function(a){return a.replace(/\d/g,function(a){return of[a]}).replace(/,/g,"،")},week:{dow:6,doy:12}}),nf.defineLocale("ar-tn",{months:"جانفي_فيفري_مارس_أفريل_ماي_جوان_جويلية_أوت_سبتمبر_أكتوبر_نوفمبر_ديسمبر".split("_"),monthsShort:"جانفي_فيفري_مارس_أفريل_ماي_جوان_جويلية_أوت_سبتمبر_أكتوبر_نوفمبر_ديسمبر".split("_"),weekdays:"الأحد_الإثنين_الثلاثاء_الأربعاء_الخميس_الجمعة_السبت".split("_"),weekdaysShort:"أحد_إثنين_ثلاثاء_أربعاء_خميس_جمعة_سبت".split("_"),weekdaysMin:"ح_ن_ث_ر_خ_ج_س".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD/MM/YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd D MMMM YYYY LT"},calendar:{sameDay:"[اليوم على الساعة] LT",nextDay:"[غدا على الساعة] LT",nextWeek:"dddd [على الساعة] LT",lastDay:"[أمس على الساعة] LT",lastWeek:"dddd [على الساعة] LT",sameElse:"L"},relativeTime:{future:"في %s",past:"منذ %s",s:"ثوان",m:"دقيقة",mm:"%d دقائق",h:"ساعة",hh:"%d ساعات",d:"يوم",dd:"%d أيام",M:"شهر",MM:"%d أشهر",y:"سنة",yy:"%d سنوات"},week:{dow:1,doy:4}}),{1:"١",2:"٢",3:"٣",4:"٤",5:"٥",6:"٦",7:"٧",8:"٨",9:"٩",0:"٠"}),rf={"١":"1","٢":"2","٣":"3","٤":"4","٥":"5","٦":"6","٧":"7","٨":"8","٩":"9","٠":"0"},sf=function(a){return 0===a?0:1===a?1:2===a?2:a%100>=3&&10>=a%100?3:a%100>=11?4:5},tf={s:["أقل من ثانية","ثانية واحدة",["ثانيتان","ثانيتين"],"%d ثوان","%d ثانية","%d ثانية"],m:["أقل من دقيقة","دقيقة واحدة",["دقيقتان","دقيقتين"],"%d دقائق","%d دقيقة","%d دقيقة"],h:["أقل من ساعة","ساعة واحدة",["ساعتان","ساعتين"],"%d ساعات","%d ساعة","%d ساعة"],d:["أقل من يوم","يوم واحد",["يومان","يومين"],"%d أيام","%d يومًا","%d يوم"],M:["أقل من شهر","شهر واحد",["شهران","شهرين"],"%d أشهر","%d شهرا","%d شهر"],y:["أقل من عام","عام واحد",["عامان","عامين"],"%d أعوام","%d عامًا","%d عام"]},uf=function(a){return function(b,c,d,e){var f=sf(b),g=tf[a][sf(b)];return 2===f&&(g=g[c?0:1]),g.replace(/%d/i,b)}},vf=["كانون الثاني يناير","شباط فبراير","آذار مارس","نيسان أبريل","أيار مايو","حزيران يونيو","تموز يوليو","آب أغسطس","أيلول سبتمبر","تشرين الأول أكتوبر","تشرين الثاني نوفمبر","كانون الأول ديسمبر"],wf=(nf.defineLocale("ar",{months:vf,monthsShort:vf,weekdays:"الأحد_الإثنين_الثلاثاء_الأربعاء_الخميس_الجمعة_السبت".split("_"),weekdaysShort:"أحد_إثنين_ثلاثاء_أربعاء_خميس_جمعة_سبت".split("_"),weekdaysMin:"ح_ن_ث_ر_خ_ج_س".split("_"),longDateFormat:{LT:"HH:mm",LTS:"HH:mm:ss",L:"D/‏M/‏YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd D MMMM YYYY LT"},meridiemParse:/ص|م/,isPM:function(a){return"م"===a},meridiem:function(a,b,c){return 12>a?"ص":"م"},calendar:{sameDay:"[اليوم عند الساعة] LT",nextDay:"[غدًا عند الساعة] LT",nextWeek:"dddd [عند الساعة] LT",lastDay:"[أمس عند الساعة] LT",lastWeek:"dddd [عند الساعة] LT",sameElse:"L"},relativeTime:{future:"بعد %s",past:"منذ %s",s:uf("s"),m:uf("m"),mm:uf("m"),h:uf("h"),hh:uf("h"),d:uf("d"),dd:uf("d"),M:uf("M"),MM:uf("M"),y:uf("y"),yy:uf("y")},preparse:function(a){return a.replace(/\u200f/g,"").replace(/[١٢٣٤٥٦٧٨٩٠]/g,function(a){return rf[a]}).replace(/،/g,",")},postformat:function(a){return a.replace(/\d/g,function(a){return qf[a]}).replace(/,/g,"،")},week:{dow:6,doy:12}}),{1:"-inci",5:"-inci",8:"-inci",70:"-inci",80:"-inci",2:"-nci",7:"-nci",20:"-nci",50:"-nci",3:"-üncü",4:"-üncü",100:"-üncü",6:"-ncı",9:"-uncu",10:"-uncu",30:"-uncu",60:"-ıncı",90:"-ıncı"}),xf=(nf.defineLocale("az",{months:"yanvar_fevral_mart_aprel_may_iyun_iyul_avqust_sentyabr_oktyabr_noyabr_dekabr".split("_"),monthsShort:"yan_fev_mar_apr_may_iyn_iyl_avq_sen_okt_noy_dek".split("_"),weekdays:"Bazar_Bazar ertəsi_Çərşənbə axşamı_Çərşənbə_Cümə axşamı_Cümə_Şənbə".split("_"),weekdaysShort:"Baz_BzE_ÇAx_Çər_CAx_Cüm_Şən".split("_"),weekdaysMin:"Bz_BE_ÇA_Çə_CA_Cü_Şə".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD.MM.YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd, D MMMM YYYY LT"},calendar:{sameDay:"[bugün saat] LT",nextDay:"[sabah saat] LT",nextWeek:"[gələn həftə] dddd [saat] LT",lastDay:"[dünən] LT",lastWeek:"[keçən həftə] dddd [saat] LT",sameElse:"L"},relativeTime:{future:"%s sonra",past:"%s əvvəl",s:"birneçə saniyyə",m:"bir dəqiqə",mm:"%d dəqiqə",h:"bir saat",hh:"%d saat",d:"bir gün",dd:"%d gün",M:"bir ay",MM:"%d ay",y:"bir il",yy:"%d il"},meridiemParse:/gecə|səhər|gündüz|axşam/,isPM:function(a){return/^(gündüz|axşam)$/.test(a)},meridiem:function(a,b,c){return 4>a?"gecə":12>a?"səhər":17>a?"gündüz":"axşam"},ordinalParse:/\d{1,2}-(ıncı|inci|nci|üncü|ncı|uncu)/,ordinal:function(a){if(0===a)return a+"-ıncı";var b=a%10,c=a%100-b,d=a>=100?100:null;return a+(wf[b]||wf[c]||wf[d])},week:{dow:1,doy:7}}),nf.defineLocale("be",{months:Fc,monthsShort:"студ_лют_сак_крас_трав_чэрв_ліп_жнів_вер_каст_ліст_снеж".split("_"),weekdays:Gc,weekdaysShort:"нд_пн_ат_ср_чц_пт_сб".split("_"),weekdaysMin:"нд_пн_ат_ср_чц_пт_сб".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD.MM.YYYY",LL:"D MMMM YYYY г.",LLL:"D MMMM YYYY г., LT",LLLL:"dddd, D MMMM YYYY г., LT"},calendar:{sameDay:"[Сёння ў] LT",nextDay:"[Заўтра ў] LT",lastDay:"[Учора ў] LT",nextWeek:function(){return"[У] dddd [ў] LT"},lastWeek:function(){switch(this.day()){case 0:case 3:case 5:case 6:return"[У мінулую] dddd [ў] LT";case 1:case 2:case 4:return"[У мінулы] dddd [ў] LT"}},sameElse:"L"},relativeTime:{future:"праз %s",past:"%s таму",s:"некалькі секунд",m:Ec,mm:Ec,h:Ec,hh:Ec,d:"дзень",dd:Ec,M:"месяц",MM:Ec,y:"год",yy:Ec},meridiemParse:/ночы|раніцы|дня|вечара/,isPM:function(a){return/^(дня|вечара)$/.test(a)},meridiem:function(a,b,c){return 4>a?"ночы":12>a?"раніцы":17>a?"дня":"вечара"},ordinalParse:/\d{1,2}-(і|ы|га)/,ordinal:function(a,b){switch(b){case"M":case"d":case"DDD":case"w":case"W":return a%10!==2&&a%10!==3||a%100===12||a%100===13?a+"-ы":a+"-і";case"D":return a+"-га";default:return a}},week:{dow:1,doy:7}}),nf.defineLocale("bg",{months:"януари_февруари_март_април_май_юни_юли_август_септември_октомври_ноември_декември".split("_"),monthsShort:"янр_фев_мар_апр_май_юни_юли_авг_сеп_окт_ное_дек".split("_"),weekdays:"неделя_понеделник_вторник_сряда_четвъртък_петък_събота".split("_"),weekdaysShort:"нед_пон_вто_сря_чет_пет_съб".split("_"),weekdaysMin:"нд_пн_вт_ср_чт_пт_сб".split("_"),longDateFormat:{LT:"H:mm",LTS:"LT:ss",L:"D.MM.YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd, D MMMM YYYY LT"},calendar:{sameDay:"[Днес в] LT",nextDay:"[Утре в] LT",nextWeek:"dddd [в] LT",lastDay:"[Вчера в] LT",lastWeek:function(){switch(this.day()){case 0:case 3:case 6:return"[В изминалата] dddd [в] LT";case 1:case 2:case 4:case 5:return"[В изминалия] dddd [в] LT"}},sameElse:"L"},relativeTime:{future:"след %s",past:"преди %s",s:"няколко секунди",m:"минута",mm:"%d минути",h:"час",hh:"%d часа",d:"ден",dd:"%d дни",M:"месец",MM:"%d месеца",y:"година",yy:"%d години"},ordinalParse:/\d{1,2}-(ев|ен|ти|ви|ри|ми)/,ordinal:function(a){var b=a%10,c=a%100;return 0===a?a+"-ев":0===c?a+"-ен":c>10&&20>c?a+"-ти":1===b?a+"-ви":2===b?a+"-ри":7===b||8===b?a+"-ми":a+"-ти"},week:{dow:1,doy:7}}),{1:"১",2:"২",3:"৩",4:"৪",5:"৫",6:"৬",7:"৭",8:"৮",9:"৯",0:"০"}),yf={"১":"1","২":"2","৩":"3","৪":"4","৫":"5","৬":"6","৭":"7","৮":"8","৯":"9","০":"0"},zf=(nf.defineLocale("bn",{months:"জানুয়ারী_ফেবুয়ারী_মার্চ_এপ্রিল_মে_জুন_জুলাই_অগাস্ট_সেপ্টেম্বর_অক্টোবর_নভেম্বর_ডিসেম্বর".split("_"),monthsShort:"জানু_ফেব_মার্চ_এপর_মে_জুন_জুল_অগ_সেপ্ট_অক্টো_নভ_ডিসেম্".split("_"),weekdays:"রবিবার_সোমবার_মঙ্গলবার_বুধবার_বৃহস্পত্তিবার_শুক্রুবার_শনিবার".split("_"),weekdaysShort:"রবি_সোম_মঙ্গল_বুধ_বৃহস্পত্তি_শুক্রু_শনি".split("_"),weekdaysMin:"রব_সম_মঙ্গ_বু_ব্রিহ_শু_শনি".split("_"),longDateFormat:{LT:"A h:mm সময়",LTS:"A h:mm:ss সময়",L:"DD/MM/YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY, LT",LLLL:"dddd, D MMMM YYYY, LT"},calendar:{sameDay:"[আজ] LT",nextDay:"[আগামীকাল] LT",nextWeek:"dddd, LT",lastDay:"[গতকাল] LT",lastWeek:"[গত] dddd, LT",sameElse:"L"},relativeTime:{future:"%s পরে",past:"%s আগে",s:"কএক সেকেন্ড",m:"এক মিনিট",mm:"%d মিনিট",h:"এক ঘন্টা",hh:"%d ঘন্টা",d:"এক দিন",dd:"%d দিন",M:"এক মাস",MM:"%d মাস",y:"এক বছর",yy:"%d বছর"},preparse:function(a){return a.replace(/[১২৩৪৫৬৭৮৯০]/g,function(a){return yf[a]})},postformat:function(a){return a.replace(/\d/g,function(a){return xf[a]})},meridiemParse:/রাত|শকাল|দুপুর|বিকেল|রাত/,isPM:function(a){return/^(দুপুর|বিকেল|রাত)$/.test(a)},meridiem:function(a,b,c){return 4>a?"রাত":10>a?"শকাল":17>a?"দুপুর":20>a?"বিকেল":"রাত"},week:{dow:0,doy:6}}),{1:"༡",2:"༢",3:"༣",4:"༤",5:"༥",6:"༦",7:"༧",8:"༨",9:"༩",0:"༠"}),Af={"༡":"1","༢":"2","༣":"3","༤":"4","༥":"5","༦":"6","༧":"7","༨":"8","༩":"9","༠":"0"},Bf=(nf.defineLocale("bo",{months:"ཟླ་བ་དང་པོ_ཟླ་བ་གཉིས་པ_ཟླ་བ་གསུམ་པ_ཟླ་བ་བཞི་པ_ཟླ་བ་ལྔ་པ_ཟླ་བ་དྲུག་པ_ཟླ་བ་བདུན་པ_ཟླ་བ་བརྒྱད་པ_ཟླ་བ་དགུ་པ_ཟླ་བ་བཅུ་པ_ཟླ་བ་བཅུ་གཅིག་པ_ཟླ་བ་བཅུ་གཉིས་པ".split("_"),monthsShort:"ཟླ་བ་དང་པོ_ཟླ་བ་གཉིས་པ_ཟླ་བ་གསུམ་པ_ཟླ་བ་བཞི་པ_ཟླ་བ་ལྔ་པ_ཟླ་བ་དྲུག་པ_ཟླ་བ་བདུན་པ_ཟླ་བ་བརྒྱད་པ_ཟླ་བ་དགུ་པ_ཟླ་བ་བཅུ་པ_ཟླ་བ་བཅུ་གཅིག་པ_ཟླ་བ་བཅུ་གཉིས་པ".split("_"),weekdays:"གཟའ་ཉི་མ་_གཟའ་ཟླ་བ་_གཟའ་མིག་དམར་_གཟའ་ལྷག་པ་_གཟའ་ཕུར་བུ_གཟའ་པ་སངས་_གཟའ་སྤེན་པ་".split("_"),weekdaysShort:"ཉི་མ་_ཟླ་བ་_མིག་དམར་_ལྷག་པ་_ཕུར་བུ_པ་སངས་_སྤེན་པ་".split("_"),weekdaysMin:"ཉི་མ་_ཟླ་བ་_མིག་དམར་_ལྷག་པ་_ཕུར་བུ_པ་སངས་_སྤེན་པ་".split("_"),longDateFormat:{LT:"A h:mm",LTS:"LT:ss",L:"DD/MM/YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY, LT",LLLL:"dddd, D MMMM YYYY, LT"},calendar:{sameDay:"[དི་རིང] LT",nextDay:"[སང་ཉིན] LT",nextWeek:"[བདུན་ཕྲག་རྗེས་མ], LT",lastDay:"[ཁ་སང] LT",lastWeek:"[བདུན་ཕྲག་མཐའ་མ] dddd, LT",sameElse:"L"},relativeTime:{future:"%s ལ་",past:"%s སྔན་ལ",s:"ལམ་སང",m:"སྐར་མ་གཅིག",mm:"%d སྐར་མ",h:"ཆུ་ཚོད་གཅིག",hh:"%d ཆུ་ཚོད",d:"ཉིན་གཅིག",dd:"%d ཉིན་",M:"ཟླ་བ་གཅིག",MM:"%d ཟླ་བ",y:"ལོ་གཅིག",yy:"%d ལོ"},preparse:function(a){return a.replace(/[༡༢༣༤༥༦༧༨༩༠]/g,function(a){return Af[a]})},postformat:function(a){return a.replace(/\d/g,function(a){return zf[a]})},meridiemParse:/མཚན་མོ|ཞོགས་ཀས|ཉིན་གུང|དགོང་དག|མཚན་མོ/,isPM:function(a){return/^(ཉིན་གུང|དགོང་དག|མཚན་མོ)$/.test(a)},meridiem:function(a,b,c){return 4>a?"མཚན་མོ":10>a?"ཞོགས་ཀས":17>a?"ཉིན་གུང":20>a?"དགོང་དག":"མཚན་མོ"},week:{dow:0,doy:6}}),nf.defineLocale("br",{months:"Genver_C'hwevrer_Meurzh_Ebrel_Mae_Mezheven_Gouere_Eost_Gwengolo_Here_Du_Kerzu".split("_"),monthsShort:"Gen_C'hwe_Meu_Ebr_Mae_Eve_Gou_Eos_Gwe_Her_Du_Ker".split("_"),weekdays:"Sul_Lun_Meurzh_Merc'her_Yaou_Gwener_Sadorn".split("_"),weekdaysShort:"Sul_Lun_Meu_Mer_Yao_Gwe_Sad".split("_"),weekdaysMin:"Su_Lu_Me_Mer_Ya_Gw_Sa".split("_"),longDateFormat:{LT:"h[e]mm A",LTS:"h[e]mm:ss A",L:"DD/MM/YYYY",LL:"D [a viz] MMMM YYYY",LLL:"D [a viz] MMMM YYYY LT",LLLL:"dddd, D [a viz] MMMM YYYY LT"},calendar:{sameDay:"[Hiziv da] LT",nextDay:"[Warc'hoazh da] LT",nextWeek:"dddd [da] LT",lastDay:"[Dec'h da] LT",lastWeek:"dddd [paset da] LT",sameElse:"L"},relativeTime:{future:"a-benn %s",past:"%s 'zo",s:"un nebeud segondennoù",m:"ur vunutenn",mm:Hc,h:"un eur",hh:"%d eur",d:"un devezh",dd:Hc,M:"ur miz",MM:Hc,y:"ur bloaz",yy:Ic},ordinalParse:/\d{1,2}(añ|vet)/,ordinal:function(a){var b=1===a?"añ":"vet";return a+b},week:{dow:1,doy:4}}),nf.defineLocale("bs",{months:"januar_februar_mart_april_maj_juni_juli_august_septembar_oktobar_novembar_decembar".split("_"),monthsShort:"jan._feb._mar._apr._maj._jun._jul._aug._sep._okt._nov._dec.".split("_"),weekdays:"nedjelja_ponedjeljak_utorak_srijeda_četvrtak_petak_subota".split("_"),weekdaysShort:"ned._pon._uto._sri._čet._pet._sub.".split("_"),weekdaysMin:"ne_po_ut_sr_če_pe_su".split("_"),longDateFormat:{LT:"H:mm",LTS:"LT:ss",L:"DD. MM. YYYY",LL:"D. MMMM YYYY",LLL:"D. MMMM YYYY LT",LLLL:"dddd, D. MMMM YYYY LT"},calendar:{sameDay:"[danas u] LT",nextDay:"[sutra u] LT",nextWeek:function(){switch(this.day()){case 0:return"[u] [nedjelju] [u] LT";case 3:return"[u] [srijedu] [u] LT";case 6:return"[u] [subotu] [u] LT";case 1:case 2:case 4:case 5:return"[u] dddd [u] LT"}},lastDay:"[jučer u] LT",lastWeek:function(){switch(this.day()){case 0:case 3:return"[prošlu] dddd [u] LT";case 6:return"[prošle] [subote] [u] LT";case 1:case 2:case 4:case 5:return"[prošli] dddd [u] LT"}},sameElse:"L"},relativeTime:{future:"za %s",past:"prije %s",s:"par sekundi",m:Mc,mm:Mc,h:Mc,hh:Mc,d:"dan",dd:Mc,M:"mjesec",MM:Mc,y:"godinu",yy:Mc},ordinalParse:/\d{1,2}\./,ordinal:"%d.",week:{dow:1,doy:7}}),nf.defineLocale("ca",{months:"gener_febrer_març_abril_maig_juny_juliol_agost_setembre_octubre_novembre_desembre".split("_"),monthsShort:"gen._febr._mar._abr._mai._jun._jul._ag._set._oct._nov._des.".split("_"),weekdays:"diumenge_dilluns_dimarts_dimecres_dijous_divendres_dissabte".split("_"),weekdaysShort:"dg._dl._dt._dc._dj._dv._ds.".split("_"),weekdaysMin:"Dg_Dl_Dt_Dc_Dj_Dv_Ds".split("_"),longDateFormat:{LT:"H:mm",LTS:"LT:ss",L:"DD/MM/YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd D MMMM YYYY LT"},calendar:{sameDay:function(){return"[avui a "+(1!==this.hours()?"les":"la")+"] LT"},nextDay:function(){return"[demà a "+(1!==this.hours()?"les":"la")+"] LT"},nextWeek:function(){return"dddd [a "+(1!==this.hours()?"les":"la")+"] LT"},lastDay:function(){return"[ahir a "+(1!==this.hours()?"les":"la")+"] LT"},lastWeek:function(){return"[el] dddd [passat a "+(1!==this.hours()?"les":"la")+"] LT"},sameElse:"L"},relativeTime:{future:"en %s",past:"fa %s",s:"uns segons",m:"un minut",mm:"%d minuts",h:"una hora",hh:"%d hores",d:"un dia",dd:"%d dies",M:"un mes",MM:"%d mesos",y:"un any",yy:"%d anys"},ordinalParse:/\d{1,2}(r|n|t|è|a)/,ordinal:function(a,b){var c=1===a?"r":2===a?"n":3===a?"r":4===a?"t":"è";return("w"===b||"W"===b)&&(c="a"),a+c},week:{dow:1,doy:4}}),"leden_únor_březen_duben_květen_červen_červenec_srpen_září_říjen_listopad_prosinec".split("_")),Cf="led_úno_bře_dub_kvě_čvn_čvc_srp_zář_říj_lis_pro".split("_"),Df=(nf.defineLocale("cs",{months:Bf,monthsShort:Cf,monthsParse:function(a,b){var c,d=[];for(c=0;12>c;c++)d[c]=new RegExp("^"+a[c]+"$|^"+b[c]+"$","i");return d}(Bf,Cf),weekdays:"neděle_pondělí_úterý_středa_čtvrtek_pátek_sobota".split("_"),weekdaysShort:"ne_po_út_st_čt_pá_so".split("_"),weekdaysMin:"ne_po_út_st_čt_pá_so".split("_"),longDateFormat:{LT:"H:mm",LTS:"LT:ss",L:"DD.MM.YYYY",LL:"D. MMMM YYYY",LLL:"D. MMMM YYYY LT",LLLL:"dddd D. MMMM YYYY LT"},calendar:{sameDay:"[dnes v] LT",nextDay:"[zítra v] LT",nextWeek:function(){switch(this.day()){case 0:return"[v neděli v] LT";case 1:case 2:return"[v] dddd [v] LT";case 3:return"[ve středu v] LT";case 4:return"[ve čtvrtek v] LT";case 5:return"[v pátek v] LT";case 6:return"[v sobotu v] LT"}},lastDay:"[včera v] LT",lastWeek:function(){switch(this.day()){case 0:return"[minulou neděli v] LT";case 1:case 2:return"[minulé] dddd [v] LT";case 3:return"[minulou středu v] LT";case 4:case 5:return"[minulý] dddd [v] LT";case 6:return"[minulou sobotu v] LT"}},sameElse:"L"},relativeTime:{future:"za %s",past:"před %s",s:Oc,m:Oc,mm:Oc,h:Oc,hh:Oc,d:Oc,dd:Oc,M:Oc,MM:Oc,y:Oc,yy:Oc},ordinalParse:/\d{1,2}\./,ordinal:"%d.",week:{dow:1,doy:4}}),nf.defineLocale("cv",{months:"кӑрлач_нарӑс_пуш_ака_май_ҫӗртме_утӑ_ҫурла_авӑн_юпа_чӳк_раштав".split("_"),monthsShort:"кӑр_нар_пуш_ака_май_ҫӗр_утӑ_ҫур_авн_юпа_чӳк_раш".split("_"),weekdays:"вырсарникун_тунтикун_ытларикун_юнкун_кӗҫнерникун_эрнекун_шӑматкун".split("_"),weekdaysShort:"выр_тун_ытл_юн_кӗҫ_эрн_шӑм".split("_"),weekdaysMin:"вр_тн_ыт_юн_кҫ_эр_шм".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD-MM-YYYY",LL:"YYYY [ҫулхи] MMMM [уйӑхӗн] D[-мӗшӗ]",LLL:"YYYY [ҫулхи] MMMM [уйӑхӗн] D[-мӗшӗ], LT",LLLL:"dddd, YYYY [ҫулхи] MMMM [уйӑхӗн] D[-мӗшӗ], LT"},calendar:{sameDay:"[Паян] LT [сехетре]",nextDay:"[Ыран] LT [сехетре]",lastDay:"[Ӗнер] LT [сехетре]",nextWeek:"[Ҫитес] dddd LT [сехетре]",lastWeek:"[Иртнӗ] dddd LT [сехетре]",sameElse:"L"},relativeTime:{future:function(a){var b=/сехет$/i.exec(a)?"рен":/ҫул$/i.exec(a)?"тан":"ран";return a+b},past:"%s каялла",s:"пӗр-ик ҫеккунт",m:"пӗр минут",mm:"%d минут",h:"пӗр сехет",hh:"%d сехет",d:"пӗр кун",dd:"%d кун",M:"пӗр уйӑх",MM:"%d уйӑх",y:"пӗр ҫул",yy:"%d ҫул"},ordinalParse:/\d{1,2}-мӗш/,ordinal:"%d-мӗш",week:{dow:1,doy:7}}),nf.defineLocale("cy",{months:"Ionawr_Chwefror_Mawrth_Ebrill_Mai_Mehefin_Gorffennaf_Awst_Medi_Hydref_Tachwedd_Rhagfyr".split("_"),monthsShort:"Ion_Chwe_Maw_Ebr_Mai_Meh_Gor_Aws_Med_Hyd_Tach_Rhag".split("_"),weekdays:"Dydd Sul_Dydd Llun_Dydd Mawrth_Dydd Mercher_Dydd Iau_Dydd Gwener_Dydd Sadwrn".split("_"),weekdaysShort:"Sul_Llun_Maw_Mer_Iau_Gwe_Sad".split("_"),weekdaysMin:"Su_Ll_Ma_Me_Ia_Gw_Sa".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD/MM/YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd, D MMMM YYYY LT"},calendar:{sameDay:"[Heddiw am] LT",nextDay:"[Yfory am] LT",nextWeek:"dddd [am] LT",lastDay:"[Ddoe am] LT",lastWeek:"dddd [diwethaf am] LT",sameElse:"L"},relativeTime:{future:"mewn %s",past:"%s yn ôl",s:"ychydig eiliadau",m:"munud",mm:"%d munud",h:"awr",hh:"%d awr",d:"diwrnod",dd:"%d diwrnod",M:"mis",MM:"%d mis",y:"blwyddyn",yy:"%d flynedd"},ordinalParse:/\d{1,2}(fed|ain|af|il|ydd|ed|eg)/,ordinal:function(a){var b=a,c="",d=["","af","il","ydd","ydd","ed","ed","ed","fed","fed","fed","eg","fed","eg","eg","fed","eg","eg","fed","eg","fed"];return b>20?c=40===b||50===b||60===b||80===b||100===b?"fed":"ain":b>0&&(c=d[b]),a+c},week:{dow:1,doy:4}}),nf.defineLocale("da",{months:"januar_februar_marts_april_maj_juni_juli_august_september_oktober_november_december".split("_"),monthsShort:"jan_feb_mar_apr_maj_jun_jul_aug_sep_okt_nov_dec".split("_"),weekdays:"søndag_mandag_tirsdag_onsdag_torsdag_fredag_lørdag".split("_"),weekdaysShort:"søn_man_tir_ons_tor_fre_lør".split("_"),weekdaysMin:"sø_ma_ti_on_to_fr_lø".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD/MM/YYYY",LL:"D. MMMM YYYY",LLL:"D. MMMM YYYY LT",LLLL:"dddd [d.] D. MMMM YYYY LT"},calendar:{sameDay:"[I dag kl.] LT",nextDay:"[I morgen kl.] LT",nextWeek:"dddd [kl.] LT",lastDay:"[I går kl.] LT",lastWeek:"[sidste] dddd [kl] LT",sameElse:"L"},relativeTime:{future:"om %s",past:"%s siden",s:"få sekunder",m:"et minut",mm:"%d minutter",h:"en time",hh:"%d timer",d:"en dag",dd:"%d dage",M:"en måned",MM:"%d måneder",y:"et år",yy:"%d år"},ordinalParse:/\d{1,2}\./,ordinal:"%d.",week:{dow:1,doy:4}}),nf.defineLocale("de-at",{months:"Jänner_Februar_März_April_Mai_Juni_Juli_August_September_Oktober_November_Dezember".split("_"),monthsShort:"Jän._Febr._Mrz._Apr._Mai_Jun._Jul._Aug._Sept._Okt._Nov._Dez.".split("_"),weekdays:"Sonntag_Montag_Dienstag_Mittwoch_Donnerstag_Freitag_Samstag".split("_"),weekdaysShort:"So._Mo._Di._Mi._Do._Fr._Sa.".split("_"),weekdaysMin:"So_Mo_Di_Mi_Do_Fr_Sa".split("_"),longDateFormat:{LT:"HH:mm",LTS:"HH:mm:ss",L:"DD.MM.YYYY",LL:"D. MMMM YYYY",LLL:"D. MMMM YYYY LT",LLLL:"dddd, D. MMMM YYYY LT"},calendar:{sameDay:"[Heute um] LT [Uhr]",sameElse:"L",nextDay:"[Morgen um] LT [Uhr]",nextWeek:"dddd [um] LT [Uhr]",lastDay:"[Gestern um] LT [Uhr]",lastWeek:"[letzten] dddd [um] LT [Uhr]"},relativeTime:{future:"in %s",past:"vor %s",s:"ein paar Sekunden",m:Pc,mm:"%d Minuten",h:Pc,hh:"%d Stunden",d:Pc,dd:Pc,M:Pc,MM:Pc,y:Pc,yy:Pc},ordinalParse:/\d{1,2}\./,ordinal:"%d.",week:{dow:1,doy:4}}),nf.defineLocale("de",{months:"Januar_Februar_März_April_Mai_Juni_Juli_August_September_Oktober_November_Dezember".split("_"),monthsShort:"Jan._Febr._Mrz._Apr._Mai_Jun._Jul._Aug._Sept._Okt._Nov._Dez.".split("_"),weekdays:"Sonntag_Montag_Dienstag_Mittwoch_Donnerstag_Freitag_Samstag".split("_"),weekdaysShort:"So._Mo._Di._Mi._Do._Fr._Sa.".split("_"),weekdaysMin:"So_Mo_Di_Mi_Do_Fr_Sa".split("_"),longDateFormat:{LT:"HH:mm",LTS:"HH:mm:ss",L:"DD.MM.YYYY",LL:"D. MMMM YYYY",LLL:"D. MMMM YYYY LT",LLLL:"dddd, D. MMMM YYYY LT"},calendar:{sameDay:"[Heute um] LT [Uhr]",sameElse:"L",nextDay:"[Morgen um] LT [Uhr]",nextWeek:"dddd [um] LT [Uhr]",lastDay:"[Gestern um] LT [Uhr]",lastWeek:"[letzten] dddd [um] LT [Uhr]"},relativeTime:{future:"in %s",past:"vor %s",s:"ein paar Sekunden",m:Qc,mm:"%d Minuten",h:Qc,hh:"%d Stunden",d:Qc,dd:Qc,M:Qc,MM:Qc,y:Qc,yy:Qc},ordinalParse:/\d{1,2}\./,ordinal:"%d.",week:{dow:1,doy:4}}),nf.defineLocale("el",{monthsNominativeEl:"Ιανουάριος_Φεβρουάριος_Μάρτιος_Απρίλιος_Μάιος_Ιούνιος_Ιούλιος_Αύγουστος_Σεπτέμβριος_Οκτώβριος_Νοέμβριος_Δεκέμβριος".split("_"),monthsGenitiveEl:"Ιανουαρίου_Φεβρουαρίου_Μαρτίου_Απριλίου_Μαΐου_Ιουνίου_Ιουλίου_Αυγούστου_Σεπτεμβρίου_Οκτωβρίου_Νοεμβρίου_Δεκεμβρίου".split("_"),months:function(a,b){return/D/.test(b.substring(0,b.indexOf("MMMM")))?this._monthsGenitiveEl[a.month()]:this._monthsNominativeEl[a.month()]},monthsShort:"Ιαν_Φεβ_Μαρ_Απρ_Μαϊ_Ιουν_Ιουλ_Αυγ_Σεπ_Οκτ_Νοε_Δεκ".split("_"),weekdays:"Κυριακή_Δευτέρα_Τρίτη_Τετάρτη_Πέμπτη_Παρασκευή_Σάββατο".split("_"),weekdaysShort:"Κυρ_Δευ_Τρι_Τετ_Πεμ_Παρ_Σαβ".split("_"),weekdaysMin:"Κυ_Δε_Τρ_Τε_Πε_Πα_Σα".split("_"),meridiem:function(a,b,c){return a>11?c?"μμ":"ΜΜ":c?"πμ":"ΠΜ"},isPM:function(a){return"μ"===(a+"").toLowerCase()[0]},meridiemParse:/[ΠΜ]\.?Μ?\.?/i,longDateFormat:{LT:"h:mm A",LTS:"h:mm:ss A",L:"DD/MM/YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd, D MMMM YYYY LT"},calendarEl:{sameDay:"[Σήμερα {}] LT",nextDay:"[Αύριο {}] LT",nextWeek:"dddd [{}] LT",lastDay:"[Χθες {}] LT",lastWeek:function(){switch(this.day()){case 6:return"[το προηγούμενο] dddd [{}] LT";default:return"[την προηγούμενη] dddd [{}] LT"}},sameElse:"L"},calendar:function(a,b){var c=this._calendarEl[a],d=b&&b.hours();return"function"==typeof c&&(c=c.apply(b)),c.replace("{}",d%12===1?"στη":"στις")},relativeTime:{future:"σε %s",past:"%s πριν",s:"λίγα δευτερόλεπτα",m:"ένα λεπτό",mm:"%d λεπτά",h:"μία ώρα",hh:"%d ώρες",d:"μία μέρα",dd:"%d μέρες",M:"ένας μήνας",MM:"%d μήνες",y:"ένας χρόνος",yy:"%d χρόνια"},ordinalParse:/\d{1,2}η/,ordinal:"%dη",week:{dow:1,doy:4}}),nf.defineLocale("en-au",{months:"January_February_March_April_May_June_July_August_September_October_November_December".split("_"),monthsShort:"Jan_Feb_Mar_Apr_May_Jun_Jul_Aug_Sep_Oct_Nov_Dec".split("_"),weekdays:"Sunday_Monday_Tuesday_Wednesday_Thursday_Friday_Saturday".split("_"),weekdaysShort:"Sun_Mon_Tue_Wed_Thu_Fri_Sat".split("_"),weekdaysMin:"Su_Mo_Tu_We_Th_Fr_Sa".split("_"),longDateFormat:{LT:"h:mm A",LTS:"h:mm:ss A",L:"DD/MM/YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd, D MMMM YYYY LT"},calendar:{sameDay:"[Today at] LT",nextDay:"[Tomorrow at] LT",nextWeek:"dddd [at] LT",lastDay:"[Yesterday at] LT",lastWeek:"[Last] dddd [at] LT",sameElse:"L"},relativeTime:{future:"in %s",past:"%s ago",s:"a few seconds",m:"a minute",mm:"%d minutes",h:"an hour",hh:"%d hours",d:"a day",dd:"%d days",M:"a month",MM:"%d months",y:"a year",yy:"%d years"},ordinalParse:/\d{1,2}(st|nd|rd|th)/,ordinal:function(a){var b=a%10,c=1===~~(a%100/10)?"th":1===b?"st":2===b?"nd":3===b?"rd":"th";return a+c},week:{dow:1,doy:4}}),nf.defineLocale("en-ca",{months:"January_February_March_April_May_June_July_August_September_October_November_December".split("_"),monthsShort:"Jan_Feb_Mar_Apr_May_Jun_Jul_Aug_Sep_Oct_Nov_Dec".split("_"),weekdays:"Sunday_Monday_Tuesday_Wednesday_Thursday_Friday_Saturday".split("_"),weekdaysShort:"Sun_Mon_Tue_Wed_Thu_Fri_Sat".split("_"),weekdaysMin:"Su_Mo_Tu_We_Th_Fr_Sa".split("_"),longDateFormat:{LT:"h:mm A",LTS:"h:mm:ss A",L:"YYYY-MM-DD",LL:"D MMMM, YYYY",LLL:"D MMMM, YYYY LT",LLLL:"dddd, D MMMM, YYYY LT"},calendar:{sameDay:"[Today at] LT",nextDay:"[Tomorrow at] LT",nextWeek:"dddd [at] LT",lastDay:"[Yesterday at] LT",lastWeek:"[Last] dddd [at] LT",sameElse:"L"},relativeTime:{future:"in %s",past:"%s ago",s:"a few seconds",m:"a minute",mm:"%d minutes",h:"an hour",hh:"%d hours",d:"a day",dd:"%d days",M:"a month",MM:"%d months",y:"a year",yy:"%d years"},ordinalParse:/\d{1,2}(st|nd|rd|th)/,ordinal:function(a){var b=a%10,c=1===~~(a%100/10)?"th":1===b?"st":2===b?"nd":3===b?"rd":"th";return a+c}}),nf.defineLocale("en-gb",{months:"January_February_March_April_May_June_July_August_September_October_November_December".split("_"),monthsShort:"Jan_Feb_Mar_Apr_May_Jun_Jul_Aug_Sep_Oct_Nov_Dec".split("_"),weekdays:"Sunday_Monday_Tuesday_Wednesday_Thursday_Friday_Saturday".split("_"),weekdaysShort:"Sun_Mon_Tue_Wed_Thu_Fri_Sat".split("_"),weekdaysMin:"Su_Mo_Tu_We_Th_Fr_Sa".split("_"),longDateFormat:{LT:"HH:mm",LTS:"HH:mm:ss",L:"DD/MM/YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd, D MMMM YYYY LT"},calendar:{sameDay:"[Today at] LT",nextDay:"[Tomorrow at] LT",nextWeek:"dddd [at] LT",lastDay:"[Yesterday at] LT",lastWeek:"[Last] dddd [at] LT",sameElse:"L"},relativeTime:{future:"in %s",past:"%s ago",s:"a few seconds",m:"a minute",mm:"%d minutes",h:"an hour",hh:"%d hours",d:"a day",dd:"%d days",M:"a month",MM:"%d months",y:"a year",yy:"%d years"},ordinalParse:/\d{1,2}(st|nd|rd|th)/,ordinal:function(a){var b=a%10,c=1===~~(a%100/10)?"th":1===b?"st":2===b?"nd":3===b?"rd":"th";return a+c},week:{dow:1,doy:4}}),nf.defineLocale("eo",{months:"januaro_februaro_marto_aprilo_majo_junio_julio_aŭgusto_septembro_oktobro_novembro_decembro".split("_"),monthsShort:"jan_feb_mar_apr_maj_jun_jul_aŭg_sep_okt_nov_dec".split("_"),weekdays:"Dimanĉo_Lundo_Mardo_Merkredo_Ĵaŭdo_Vendredo_Sabato".split("_"),weekdaysShort:"Dim_Lun_Mard_Merk_Ĵaŭ_Ven_Sab".split("_"),weekdaysMin:"Di_Lu_Ma_Me_Ĵa_Ve_Sa".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"YYYY-MM-DD",LL:"D[-an de] MMMM, YYYY",LLL:"D[-an de] MMMM, YYYY LT",LLLL:"dddd, [la] D[-an de] MMMM, YYYY LT"},meridiemParse:/[ap]\.t\.m/i,isPM:function(a){return"p"===a.charAt(0).toLowerCase()},meridiem:function(a,b,c){return a>11?c?"p.t.m.":"P.T.M.":c?"a.t.m.":"A.T.M."},calendar:{sameDay:"[Hodiaŭ je] LT",nextDay:"[Morgaŭ je] LT",nextWeek:"dddd [je] LT",lastDay:"[Hieraŭ je] LT",lastWeek:"[pasinta] dddd [je] LT",sameElse:"L"},relativeTime:{future:"je %s",past:"antaŭ %s",s:"sekundoj",m:"minuto",mm:"%d minutoj",h:"horo",hh:"%d horoj",d:"tago",dd:"%d tagoj",M:"monato",MM:"%d monatoj",y:"jaro",yy:"%d jaroj"},ordinalParse:/\d{1,2}a/,ordinal:"%da",week:{dow:1,doy:7}}),"Ene._Feb._Mar._Abr._May._Jun._Jul._Ago._Sep._Oct._Nov._Dic.".split("_")),Ef="Ene_Feb_Mar_Abr_May_Jun_Jul_Ago_Sep_Oct_Nov_Dic".split("_"),Ff=(nf.defineLocale("es",{months:"Enero_Febrero_Marzo_Abril_Mayo_Junio_Julio_Agosto_Septiembre_Octubre_Noviembre_Diciembre".split("_"),monthsShort:function(a,b){return/-MMM-/.test(b)?Ef[a.month()]:Df[a.month()]},weekdays:"Domingo_Lunes_Martes_Miércoles_Jueves_Viernes_Sábado".split("_"),weekdaysShort:"Dom._Lun._Mar._Mié._Jue._Vie._Sáb.".split("_"),weekdaysMin:"Do_Lu_Ma_Mi_Ju_Vi_Sá".split("_"),longDateFormat:{LT:"H:mm",LTS:"LT:ss",L:"DD/MM/YYYY",LL:"D [de] MMMM [de] YYYY",LLL:"D [de] MMMM [de] YYYY LT",LLLL:"dddd, D [de] MMMM [de] YYYY LT"},calendar:{sameDay:function(){return"[hoy a la"+(1!==this.hours()?"s":"")+"] LT"},nextDay:function(){return"[mañana a la"+(1!==this.hours()?"s":"")+"] LT"},nextWeek:function(){return"dddd [a la"+(1!==this.hours()?"s":"")+"] LT"},lastDay:function(){return"[ayer a la"+(1!==this.hours()?"s":"")+"] LT"},lastWeek:function(){return"[el] dddd [pasado a la"+(1!==this.hours()?"s":"")+"] LT"},sameElse:"L"},relativeTime:{future:"en %s",past:"hace %s",s:"unos segundos",m:"un minuto",mm:"%d minutos",h:"una hora",hh:"%d horas",d:"un día",dd:"%d días",M:"un mes",MM:"%d meses",y:"un año",yy:"%d años"},ordinalParse:/\d{1,2}º/,ordinal:"%dº",week:{dow:1,doy:4}}),nf.defineLocale("et",{months:"jaanuar_veebruar_märts_aprill_mai_juuni_juuli_august_september_oktoober_november_detsember".split("_"),monthsShort:"jaan_veebr_märts_apr_mai_juuni_juuli_aug_sept_okt_nov_dets".split("_"),weekdays:"pühapäev_esmaspäev_teisipäev_kolmapäev_neljapäev_reede_laupäev".split("_"),weekdaysShort:"P_E_T_K_N_R_L".split("_"),weekdaysMin:"P_E_T_K_N_R_L".split("_"),longDateFormat:{LT:"H:mm",LTS:"LT:ss",L:"DD.MM.YYYY",LL:"D. MMMM YYYY",LLL:"D. MMMM YYYY LT",LLLL:"dddd, D. MMMM YYYY LT"},calendar:{sameDay:"[Täna,] LT",nextDay:"[Homme,] LT",nextWeek:"[Järgmine] dddd LT",lastDay:"[Eile,] LT",lastWeek:"[Eelmine] dddd LT",sameElse:"L"},relativeTime:{future:"%s pärast",past:"%s tagasi",s:Rc,m:Rc,mm:Rc,h:Rc,hh:Rc,d:Rc,dd:"%d päeva",M:Rc,MM:Rc,y:Rc,yy:Rc},ordinalParse:/\d{1,2}\./,ordinal:"%d.",week:{dow:1,doy:4}}),nf.defineLocale("eu",{months:"urtarrila_otsaila_martxoa_apirila_maiatza_ekaina_uztaila_abuztua_iraila_urria_azaroa_abendua".split("_"),monthsShort:"urt._ots._mar._api._mai._eka._uzt._abu._ira._urr._aza._abe.".split("_"),weekdays:"igandea_astelehena_asteartea_asteazkena_osteguna_ostirala_larunbata".split("_"),weekdaysShort:"ig._al._ar._az._og._ol._lr.".split("_"),weekdaysMin:"ig_al_ar_az_og_ol_lr".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"YYYY-MM-DD",LL:"YYYY[ko] MMMM[ren] D[a]",LLL:"YYYY[ko] MMMM[ren] D[a] LT",LLLL:"dddd, YYYY[ko] MMMM[ren] D[a] LT",l:"YYYY-M-D",ll:"YYYY[ko] MMM D[a]",lll:"YYYY[ko] MMM D[a] LT",llll:"ddd, YYYY[ko] MMM D[a] LT"},calendar:{sameDay:"[gaur] LT[etan]",nextDay:"[bihar] LT[etan]",nextWeek:"dddd LT[etan]",lastDay:"[atzo] LT[etan]",lastWeek:"[aurreko] dddd LT[etan]",sameElse:"L"},relativeTime:{future:"%s barru",past:"duela %s",s:"segundo batzuk",m:"minutu bat",mm:"%d minutu",h:"ordu bat",hh:"%d ordu",d:"egun bat",
		dd:"%d egun",M:"hilabete bat",MM:"%d hilabete",y:"urte bat",yy:"%d urte"},ordinalParse:/\d{1,2}\./,ordinal:"%d.",week:{dow:1,doy:7}}),{1:"۱",2:"۲",3:"۳",4:"۴",5:"۵",6:"۶",7:"۷",8:"۸",9:"۹",0:"۰"}),Gf={"۱":"1","۲":"2","۳":"3","۴":"4","۵":"5","۶":"6","۷":"7","۸":"8","۹":"9","۰":"0"},Hf=(nf.defineLocale("fa",{months:"ژانویه_فوریه_مارس_آوریل_مه_ژوئن_ژوئیه_اوت_سپتامبر_اکتبر_نوامبر_دسامبر".split("_"),monthsShort:"ژانویه_فوریه_مارس_آوریل_مه_ژوئن_ژوئیه_اوت_سپتامبر_اکتبر_نوامبر_دسامبر".split("_"),weekdays:"یک‌شنبه_دوشنبه_سه‌شنبه_چهارشنبه_پنج‌شنبه_جمعه_شنبه".split("_"),weekdaysShort:"یک‌شنبه_دوشنبه_سه‌شنبه_چهارشنبه_پنج‌شنبه_جمعه_شنبه".split("_"),weekdaysMin:"ی_د_س_چ_پ_ج_ش".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD/MM/YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd, D MMMM YYYY LT"},meridiemParse:/قبل از ظهر|بعد از ظهر/,isPM:function(a){return/بعد از ظهر/.test(a)},meridiem:function(a,b,c){return 12>a?"قبل از ظهر":"بعد از ظهر"},calendar:{sameDay:"[امروز ساعت] LT",nextDay:"[فردا ساعت] LT",nextWeek:"dddd [ساعت] LT",lastDay:"[دیروز ساعت] LT",lastWeek:"dddd [پیش] [ساعت] LT",sameElse:"L"},relativeTime:{future:"در %s",past:"%s پیش",s:"چندین ثانیه",m:"یک دقیقه",mm:"%d دقیقه",h:"یک ساعت",hh:"%d ساعت",d:"یک روز",dd:"%d روز",M:"یک ماه",MM:"%d ماه",y:"یک سال",yy:"%d سال"},preparse:function(a){return a.replace(/[۰-۹]/g,function(a){return Gf[a]}).replace(/،/g,",")},postformat:function(a){return a.replace(/\d/g,function(a){return Ff[a]}).replace(/,/g,"،")},ordinalParse:/\d{1,2}م/,ordinal:"%dم",week:{dow:6,doy:12}}),"nolla yksi kaksi kolme neljä viisi kuusi seitsemän kahdeksan yhdeksän".split(" ")),If=["nolla","yhden","kahden","kolmen","neljän","viiden","kuuden",Hf[7],Hf[8],Hf[9]],Jf=(nf.defineLocale("fi",{months:"tammikuu_helmikuu_maaliskuu_huhtikuu_toukokuu_kesäkuu_heinäkuu_elokuu_syyskuu_lokakuu_marraskuu_joulukuu".split("_"),monthsShort:"tammi_helmi_maalis_huhti_touko_kesä_heinä_elo_syys_loka_marras_joulu".split("_"),weekdays:"sunnuntai_maanantai_tiistai_keskiviikko_torstai_perjantai_lauantai".split("_"),weekdaysShort:"su_ma_ti_ke_to_pe_la".split("_"),weekdaysMin:"su_ma_ti_ke_to_pe_la".split("_"),longDateFormat:{LT:"HH.mm",LTS:"HH.mm.ss",L:"DD.MM.YYYY",LL:"Do MMMM[ta] YYYY",LLL:"Do MMMM[ta] YYYY, [klo] LT",LLLL:"dddd, Do MMMM[ta] YYYY, [klo] LT",l:"D.M.YYYY",ll:"Do MMM YYYY",lll:"Do MMM YYYY, [klo] LT",llll:"ddd, Do MMM YYYY, [klo] LT"},calendar:{sameDay:"[tänään] [klo] LT",nextDay:"[huomenna] [klo] LT",nextWeek:"dddd [klo] LT",lastDay:"[eilen] [klo] LT",lastWeek:"[viime] dddd[na] [klo] LT",sameElse:"L"},relativeTime:{future:"%s päästä",past:"%s sitten",s:Sc,m:Sc,mm:Sc,h:Sc,hh:Sc,d:Sc,dd:Sc,M:Sc,MM:Sc,y:Sc,yy:Sc},ordinalParse:/\d{1,2}\./,ordinal:"%d.",week:{dow:1,doy:4}}),nf.defineLocale("fo",{months:"januar_februar_mars_apríl_mai_juni_juli_august_september_oktober_november_desember".split("_"),monthsShort:"jan_feb_mar_apr_mai_jun_jul_aug_sep_okt_nov_des".split("_"),weekdays:"sunnudagur_mánadagur_týsdagur_mikudagur_hósdagur_fríggjadagur_leygardagur".split("_"),weekdaysShort:"sun_mán_týs_mik_hós_frí_ley".split("_"),weekdaysMin:"su_má_tý_mi_hó_fr_le".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD/MM/YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd D. MMMM, YYYY LT"},calendar:{sameDay:"[Í dag kl.] LT",nextDay:"[Í morgin kl.] LT",nextWeek:"dddd [kl.] LT",lastDay:"[Í gjár kl.] LT",lastWeek:"[síðstu] dddd [kl] LT",sameElse:"L"},relativeTime:{future:"um %s",past:"%s síðani",s:"fá sekund",m:"ein minutt",mm:"%d minuttir",h:"ein tími",hh:"%d tímar",d:"ein dagur",dd:"%d dagar",M:"ein mánaði",MM:"%d mánaðir",y:"eitt ár",yy:"%d ár"},ordinalParse:/\d{1,2}\./,ordinal:"%d.",week:{dow:1,doy:4}}),nf.defineLocale("fr-ca",{months:"janvier_février_mars_avril_mai_juin_juillet_août_septembre_octobre_novembre_décembre".split("_"),monthsShort:"janv._févr._mars_avr._mai_juin_juil._août_sept._oct._nov._déc.".split("_"),weekdays:"dimanche_lundi_mardi_mercredi_jeudi_vendredi_samedi".split("_"),weekdaysShort:"dim._lun._mar._mer._jeu._ven._sam.".split("_"),weekdaysMin:"Di_Lu_Ma_Me_Je_Ve_Sa".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"YYYY-MM-DD",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd D MMMM YYYY LT"},calendar:{sameDay:"[Aujourd'hui à] LT",nextDay:"[Demain à] LT",nextWeek:"dddd [à] LT",lastDay:"[Hier à] LT",lastWeek:"dddd [dernier à] LT",sameElse:"L"},relativeTime:{future:"dans %s",past:"il y a %s",s:"quelques secondes",m:"une minute",mm:"%d minutes",h:"une heure",hh:"%d heures",d:"un jour",dd:"%d jours",M:"un mois",MM:"%d mois",y:"un an",yy:"%d ans"},ordinalParse:/\d{1,2}(er|)/,ordinal:function(a){return a+(1===a?"er":"")}}),nf.defineLocale("fr",{months:"janvier_février_mars_avril_mai_juin_juillet_août_septembre_octobre_novembre_décembre".split("_"),monthsShort:"janv._févr._mars_avr._mai_juin_juil._août_sept._oct._nov._déc.".split("_"),weekdays:"dimanche_lundi_mardi_mercredi_jeudi_vendredi_samedi".split("_"),weekdaysShort:"dim._lun._mar._mer._jeu._ven._sam.".split("_"),weekdaysMin:"Di_Lu_Ma_Me_Je_Ve_Sa".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD/MM/YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd D MMMM YYYY LT"},calendar:{sameDay:"[Aujourd'hui à] LT",nextDay:"[Demain à] LT",nextWeek:"dddd [à] LT",lastDay:"[Hier à] LT",lastWeek:"dddd [dernier à] LT",sameElse:"L"},relativeTime:{future:"dans %s",past:"il y a %s",s:"quelques secondes",m:"une minute",mm:"%d minutes",h:"une heure",hh:"%d heures",d:"un jour",dd:"%d jours",M:"un mois",MM:"%d mois",y:"un an",yy:"%d ans"},ordinalParse:/\d{1,2}(er|)/,ordinal:function(a){return a+(1===a?"er":"")},week:{dow:1,doy:4}}),"jan._feb._mrt._apr._mai_jun._jul._aug._sep._okt._nov._des.".split("_")),Kf="jan_feb_mrt_apr_mai_jun_jul_aug_sep_okt_nov_des".split("_"),Lf=(nf.defineLocale("fy",{months:"jannewaris_febrewaris_maart_april_maaie_juny_july_augustus_septimber_oktober_novimber_desimber".split("_"),monthsShort:function(a,b){return/-MMM-/.test(b)?Kf[a.month()]:Jf[a.month()]},weekdays:"snein_moandei_tiisdei_woansdei_tongersdei_freed_sneon".split("_"),weekdaysShort:"si._mo._ti._wo._to._fr._so.".split("_"),weekdaysMin:"Si_Mo_Ti_Wo_To_Fr_So".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD-MM-YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd D MMMM YYYY LT"},calendar:{sameDay:"[hjoed om] LT",nextDay:"[moarn om] LT",nextWeek:"dddd [om] LT",lastDay:"[juster om] LT",lastWeek:"[ôfrûne] dddd [om] LT",sameElse:"L"},relativeTime:{future:"oer %s",past:"%s lyn",s:"in pear sekonden",m:"ien minút",mm:"%d minuten",h:"ien oere",hh:"%d oeren",d:"ien dei",dd:"%d dagen",M:"ien moanne",MM:"%d moannen",y:"ien jier",yy:"%d jierren"},ordinalParse:/\d{1,2}(ste|de)/,ordinal:function(a){return a+(1===a||8===a||a>=20?"ste":"de")},week:{dow:1,doy:4}}),nf.defineLocale("gl",{months:"Xaneiro_Febreiro_Marzo_Abril_Maio_Xuño_Xullo_Agosto_Setembro_Outubro_Novembro_Decembro".split("_"),monthsShort:"Xan._Feb._Mar._Abr._Mai._Xuñ._Xul._Ago._Set._Out._Nov._Dec.".split("_"),weekdays:"Domingo_Luns_Martes_Mércores_Xoves_Venres_Sábado".split("_"),weekdaysShort:"Dom._Lun._Mar._Mér._Xov._Ven._Sáb.".split("_"),weekdaysMin:"Do_Lu_Ma_Mé_Xo_Ve_Sá".split("_"),longDateFormat:{LT:"H:mm",LTS:"LT:ss",L:"DD/MM/YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd D MMMM YYYY LT"},calendar:{sameDay:function(){return"[hoxe "+(1!==this.hours()?"ás":"á")+"] LT"},nextDay:function(){return"[mañá "+(1!==this.hours()?"ás":"á")+"] LT"},nextWeek:function(){return"dddd ["+(1!==this.hours()?"ás":"a")+"] LT"},lastDay:function(){return"[onte "+(1!==this.hours()?"á":"a")+"] LT"},lastWeek:function(){return"[o] dddd [pasado "+(1!==this.hours()?"ás":"a")+"] LT"},sameElse:"L"},relativeTime:{future:function(a){return"uns segundos"===a?"nuns segundos":"en "+a},past:"hai %s",s:"uns segundos",m:"un minuto",mm:"%d minutos",h:"unha hora",hh:"%d horas",d:"un día",dd:"%d días",M:"un mes",MM:"%d meses",y:"un ano",yy:"%d anos"},ordinalParse:/\d{1,2}º/,ordinal:"%dº",week:{dow:1,doy:7}}),nf.defineLocale("he",{months:"ינואר_פברואר_מרץ_אפריל_מאי_יוני_יולי_אוגוסט_ספטמבר_אוקטובר_נובמבר_דצמבר".split("_"),monthsShort:"ינו׳_פבר׳_מרץ_אפר׳_מאי_יוני_יולי_אוג׳_ספט׳_אוק׳_נוב׳_דצמ׳".split("_"),weekdays:"ראשון_שני_שלישי_רביעי_חמישי_שישי_שבת".split("_"),weekdaysShort:"א׳_ב׳_ג׳_ד׳_ה׳_ו׳_ש׳".split("_"),weekdaysMin:"א_ב_ג_ד_ה_ו_ש".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD/MM/YYYY",LL:"D [ב]MMMM YYYY",LLL:"D [ב]MMMM YYYY LT",LLLL:"dddd, D [ב]MMMM YYYY LT",l:"D/M/YYYY",ll:"D MMM YYYY",lll:"D MMM YYYY LT",llll:"ddd, D MMM YYYY LT"},calendar:{sameDay:"[היום ב־]LT",nextDay:"[מחר ב־]LT",nextWeek:"dddd [בשעה] LT",lastDay:"[אתמול ב־]LT",lastWeek:"[ביום] dddd [האחרון בשעה] LT",sameElse:"L"},relativeTime:{future:"בעוד %s",past:"לפני %s",s:"מספר שניות",m:"דקה",mm:"%d דקות",h:"שעה",hh:function(a){return 2===a?"שעתיים":a+" שעות"},d:"יום",dd:function(a){return 2===a?"יומיים":a+" ימים"},M:"חודש",MM:function(a){return 2===a?"חודשיים":a+" חודשים"},y:"שנה",yy:function(a){return 2===a?"שנתיים":a%10===0&&10!==a?a+" שנה":a+" שנים"}}}),{1:"१",2:"२",3:"३",4:"४",5:"५",6:"६",7:"७",8:"८",9:"९",0:"०"}),Mf={"१":"1","२":"2","३":"3","४":"4","५":"5","६":"6","७":"7","८":"8","९":"9","०":"0"},Nf=(nf.defineLocale("hi",{months:"जनवरी_फ़रवरी_मार्च_अप्रैल_मई_जून_जुलाई_अगस्त_सितम्बर_अक्टूबर_नवम्बर_दिसम्बर".split("_"),monthsShort:"जन._फ़र._मार्च_अप्रै._मई_जून_जुल._अग._सित._अक्टू._नव._दिस.".split("_"),weekdays:"रविवार_सोमवार_मंगलवार_बुधवार_गुरूवार_शुक्रवार_शनिवार".split("_"),weekdaysShort:"रवि_सोम_मंगल_बुध_गुरू_शुक्र_शनि".split("_"),weekdaysMin:"र_सो_मं_बु_गु_शु_श".split("_"),longDateFormat:{LT:"A h:mm बजे",LTS:"A h:mm:ss बजे",L:"DD/MM/YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY, LT",LLLL:"dddd, D MMMM YYYY, LT"},calendar:{sameDay:"[आज] LT",nextDay:"[कल] LT",nextWeek:"dddd, LT",lastDay:"[कल] LT",lastWeek:"[पिछले] dddd, LT",sameElse:"L"},relativeTime:{future:"%s में",past:"%s पहले",s:"कुछ ही क्षण",m:"एक मिनट",mm:"%d मिनट",h:"एक घंटा",hh:"%d घंटे",d:"एक दिन",dd:"%d दिन",M:"एक महीने",MM:"%d महीने",y:"एक वर्ष",yy:"%d वर्ष"},preparse:function(a){return a.replace(/[१२३४५६७८९०]/g,function(a){return Mf[a]})},postformat:function(a){return a.replace(/\d/g,function(a){return Lf[a]})},meridiemParse:/रात|सुबह|दोपहर|शाम/,meridiemHour:function(a,b){return 12===a&&(a=0),"रात"===b?4>a?a:a+12:"सुबह"===b?a:"दोपहर"===b?a>=10?a:a+12:"शाम"===b?a+12:void 0},meridiem:function(a,b,c){return 4>a?"रात":10>a?"सुबह":17>a?"दोपहर":20>a?"शाम":"रात"},week:{dow:0,doy:6}}),nf.defineLocale("hr",{months:"siječanj_veljača_ožujak_travanj_svibanj_lipanj_srpanj_kolovoz_rujan_listopad_studeni_prosinac".split("_"),monthsShort:"sij._velj._ožu._tra._svi._lip._srp._kol._ruj._lis._stu._pro.".split("_"),weekdays:"nedjelja_ponedjeljak_utorak_srijeda_četvrtak_petak_subota".split("_"),weekdaysShort:"ned._pon._uto._sri._čet._pet._sub.".split("_"),weekdaysMin:"ne_po_ut_sr_če_pe_su".split("_"),longDateFormat:{LT:"H:mm",LTS:"LT:ss",L:"DD. MM. YYYY",LL:"D. MMMM YYYY",LLL:"D. MMMM YYYY LT",LLLL:"dddd, D. MMMM YYYY LT"},calendar:{sameDay:"[danas u] LT",nextDay:"[sutra u] LT",nextWeek:function(){switch(this.day()){case 0:return"[u] [nedjelju] [u] LT";case 3:return"[u] [srijedu] [u] LT";case 6:return"[u] [subotu] [u] LT";case 1:case 2:case 4:case 5:return"[u] dddd [u] LT"}},lastDay:"[jučer u] LT",lastWeek:function(){switch(this.day()){case 0:case 3:return"[prošlu] dddd [u] LT";case 6:return"[prošle] [subote] [u] LT";case 1:case 2:case 4:case 5:return"[prošli] dddd [u] LT"}},sameElse:"L"},relativeTime:{future:"za %s",past:"prije %s",s:"par sekundi",m:Uc,mm:Uc,h:Uc,hh:Uc,d:"dan",dd:Uc,M:"mjesec",MM:Uc,y:"godinu",yy:Uc},ordinalParse:/\d{1,2}\./,ordinal:"%d.",week:{dow:1,doy:7}}),"vasárnap hétfőn kedden szerdán csütörtökön pénteken szombaton".split(" ")),Of=(nf.defineLocale("hu",{months:"január_február_március_április_május_június_július_augusztus_szeptember_október_november_december".split("_"),monthsShort:"jan_feb_márc_ápr_máj_jún_júl_aug_szept_okt_nov_dec".split("_"),weekdays:"vasárnap_hétfő_kedd_szerda_csütörtök_péntek_szombat".split("_"),weekdaysShort:"vas_hét_kedd_sze_csüt_pén_szo".split("_"),weekdaysMin:"v_h_k_sze_cs_p_szo".split("_"),longDateFormat:{LT:"H:mm",LTS:"LT:ss",L:"YYYY.MM.DD.",LL:"YYYY. MMMM D.",LLL:"YYYY. MMMM D., LT",LLLL:"YYYY. MMMM D., dddd LT"},meridiemParse:/de|du/i,isPM:function(a){return"u"===a.charAt(1).toLowerCase()},meridiem:function(a,b,c){return 12>a?c===!0?"de":"DE":c===!0?"du":"DU"},calendar:{sameDay:"[ma] LT[-kor]",nextDay:"[holnap] LT[-kor]",nextWeek:function(){return Wc.call(this,!0)},lastDay:"[tegnap] LT[-kor]",lastWeek:function(){return Wc.call(this,!1)},sameElse:"L"},relativeTime:{future:"%s múlva",past:"%s",s:Vc,m:Vc,mm:Vc,h:Vc,hh:Vc,d:Vc,dd:Vc,M:Vc,MM:Vc,y:Vc,yy:Vc},ordinalParse:/\d{1,2}\./,ordinal:"%d.",week:{dow:1,doy:7}}),nf.defineLocale("hy-am",{months:Xc,monthsShort:Yc,weekdays:Zc,weekdaysShort:"կրկ_երկ_երք_չրք_հնգ_ուրբ_շբթ".split("_"),weekdaysMin:"կրկ_երկ_երք_չրք_հնգ_ուրբ_շբթ".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD.MM.YYYY",LL:"D MMMM YYYY թ.",LLL:"D MMMM YYYY թ., LT",LLLL:"dddd, D MMMM YYYY թ., LT"},calendar:{sameDay:"[այսօր] LT",nextDay:"[վաղը] LT",lastDay:"[երեկ] LT",nextWeek:function(){return"dddd [օրը ժամը] LT"},lastWeek:function(){return"[անցած] dddd [օրը ժամը] LT"},sameElse:"L"},relativeTime:{future:"%s հետո",past:"%s առաջ",s:"մի քանի վայրկյան",m:"րոպե",mm:"%d րոպե",h:"ժամ",hh:"%d ժամ",d:"օր",dd:"%d օր",M:"ամիս",MM:"%d ամիս",y:"տարի",yy:"%d տարի"},meridiemParse:/գիշերվա|առավոտվա|ցերեկվա|երեկոյան/,isPM:function(a){return/^(ցերեկվա|երեկոյան)$/.test(a)},meridiem:function(a){return 4>a?"գիշերվա":12>a?"առավոտվա":17>a?"ցերեկվա":"երեկոյան"},ordinalParse:/\d{1,2}|\d{1,2}-(ին|րդ)/,ordinal:function(a,b){switch(b){case"DDD":case"w":case"W":case"DDDo":return 1===a?a+"-ին":a+"-րդ";default:return a}},week:{dow:1,doy:7}}),nf.defineLocale("id",{months:"Januari_Februari_Maret_April_Mei_Juni_Juli_Agustus_September_Oktober_November_Desember".split("_"),monthsShort:"Jan_Feb_Mar_Apr_Mei_Jun_Jul_Ags_Sep_Okt_Nov_Des".split("_"),weekdays:"Minggu_Senin_Selasa_Rabu_Kamis_Jumat_Sabtu".split("_"),weekdaysShort:"Min_Sen_Sel_Rab_Kam_Jum_Sab".split("_"),weekdaysMin:"Mg_Sn_Sl_Rb_Km_Jm_Sb".split("_"),longDateFormat:{LT:"HH.mm",LTS:"LT.ss",L:"DD/MM/YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY [pukul] LT",LLLL:"dddd, D MMMM YYYY [pukul] LT"},meridiemParse:/pagi|siang|sore|malam/,meridiemHour:function(a,b){return 12===a&&(a=0),"pagi"===b?a:"siang"===b?a>=11?a:a+12:"sore"===b||"malam"===b?a+12:void 0},meridiem:function(a,b,c){return 11>a?"pagi":15>a?"siang":19>a?"sore":"malam"},calendar:{sameDay:"[Hari ini pukul] LT",nextDay:"[Besok pukul] LT",nextWeek:"dddd [pukul] LT",lastDay:"[Kemarin pukul] LT",lastWeek:"dddd [lalu pukul] LT",sameElse:"L"},relativeTime:{future:"dalam %s",past:"%s yang lalu",s:"beberapa detik",m:"semenit",mm:"%d menit",h:"sejam",hh:"%d jam",d:"sehari",dd:"%d hari",M:"sebulan",MM:"%d bulan",y:"setahun",yy:"%d tahun"},week:{dow:1,doy:7}}),nf.defineLocale("is",{months:"janúar_febrúar_mars_apríl_maí_júní_júlí_ágúst_september_október_nóvember_desember".split("_"),monthsShort:"jan_feb_mar_apr_maí_jún_júl_ágú_sep_okt_nóv_des".split("_"),weekdays:"sunnudagur_mánudagur_þriðjudagur_miðvikudagur_fimmtudagur_föstudagur_laugardagur".split("_"),weekdaysShort:"sun_mán_þri_mið_fim_fös_lau".split("_"),weekdaysMin:"Su_Má_Þr_Mi_Fi_Fö_La".split("_"),longDateFormat:{LT:"H:mm",LTS:"LT:ss",L:"DD/MM/YYYY",LL:"D. MMMM YYYY",LLL:"D. MMMM YYYY [kl.] LT",LLLL:"dddd, D. MMMM YYYY [kl.] LT"},calendar:{sameDay:"[í dag kl.] LT",nextDay:"[á morgun kl.] LT",nextWeek:"dddd [kl.] LT",lastDay:"[í gær kl.] LT",lastWeek:"[síðasta] dddd [kl.] LT",sameElse:"L"},relativeTime:{future:"eftir %s",past:"fyrir %s síðan",s:_c,m:_c,mm:_c,h:"klukkustund",hh:_c,d:_c,dd:_c,M:_c,MM:_c,y:_c,yy:_c},ordinalParse:/\d{1,2}\./,ordinal:"%d.",week:{dow:1,doy:4}}),nf.defineLocale("it",{months:"gennaio_febbraio_marzo_aprile_maggio_giugno_luglio_agosto_settembre_ottobre_novembre_dicembre".split("_"),monthsShort:"gen_feb_mar_apr_mag_giu_lug_ago_set_ott_nov_dic".split("_"),weekdays:"Domenica_Lunedì_Martedì_Mercoledì_Giovedì_Venerdì_Sabato".split("_"),weekdaysShort:"Dom_Lun_Mar_Mer_Gio_Ven_Sab".split("_"),weekdaysMin:"D_L_Ma_Me_G_V_S".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD/MM/YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd, D MMMM YYYY LT"},calendar:{sameDay:"[Oggi alle] LT",nextDay:"[Domani alle] LT",nextWeek:"dddd [alle] LT",lastDay:"[Ieri alle] LT",lastWeek:function(){switch(this.day()){case 0:return"[la scorsa] dddd [alle] LT";default:return"[lo scorso] dddd [alle] LT"}},sameElse:"L"},relativeTime:{future:function(a){return(/^[0-9].+$/.test(a)?"tra":"in")+" "+a},past:"%s fa",s:"alcuni secondi",m:"un minuto",mm:"%d minuti",h:"un'ora",hh:"%d ore",d:"un giorno",dd:"%d giorni",M:"un mese",MM:"%d mesi",y:"un anno",yy:"%d anni"},ordinalParse:/\d{1,2}º/,ordinal:"%dº",week:{dow:1,doy:4}}),nf.defineLocale("ja",{months:"1月_2月_3月_4月_5月_6月_7月_8月_9月_10月_11月_12月".split("_"),monthsShort:"1月_2月_3月_4月_5月_6月_7月_8月_9月_10月_11月_12月".split("_"),weekdays:"日曜日_月曜日_火曜日_水曜日_木曜日_金曜日_土曜日".split("_"),weekdaysShort:"日_月_火_水_木_金_土".split("_"),weekdaysMin:"日_月_火_水_木_金_土".split("_"),longDateFormat:{LT:"Ah時m分",LTS:"LTs秒",L:"YYYY/MM/DD",LL:"YYYY年M月D日",LLL:"YYYY年M月D日LT",LLLL:"YYYY年M月D日LT dddd"},meridiemParse:/午前|午後/i,isPM:function(a){return"午後"===a},meridiem:function(a,b,c){return 12>a?"午前":"午後"},calendar:{sameDay:"[今日] LT",nextDay:"[明日] LT",nextWeek:"[来週]dddd LT",lastDay:"[昨日] LT",lastWeek:"[前週]dddd LT",sameElse:"L"},relativeTime:{future:"%s後",past:"%s前",s:"数秒",m:"1分",mm:"%d分",h:"1時間",hh:"%d時間",d:"1日",dd:"%d日",M:"1ヶ月",MM:"%dヶ月",y:"1年",yy:"%d年"}}),nf.defineLocale("jv",{months:"Januari_Februari_Maret_April_Mei_Juni_Juli_Agustus_September_Oktober_Nopember_Desember".split("_"),monthsShort:"Jan_Feb_Mar_Apr_Mei_Jun_Jul_Ags_Sep_Okt_Nop_Des".split("_"),weekdays:"Minggu_Senen_Seloso_Rebu_Kemis_Jemuwah_Septu".split("_"),weekdaysShort:"Min_Sen_Sel_Reb_Kem_Jem_Sep".split("_"),weekdaysMin:"Mg_Sn_Sl_Rb_Km_Jm_Sp".split("_"),longDateFormat:{LT:"HH.mm",LTS:"LT.ss",L:"DD/MM/YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY [pukul] LT",LLLL:"dddd, D MMMM YYYY [pukul] LT"},meridiemParse:/enjing|siyang|sonten|ndalu/,meridiemHour:function(a,b){return 12===a&&(a=0),"enjing"===b?a:"siyang"===b?a>=11?a:a+12:"sonten"===b||"ndalu"===b?a+12:void 0},meridiem:function(a,b,c){return 11>a?"enjing":15>a?"siyang":19>a?"sonten":"ndalu"},calendar:{sameDay:"[Dinten puniko pukul] LT",nextDay:"[Mbenjang pukul] LT",nextWeek:"dddd [pukul] LT",lastDay:"[Kala wingi pukul] LT",lastWeek:"dddd [kepengker pukul] LT",sameElse:"L"},relativeTime:{future:"wonten ing %s",past:"%s ingkang kepengker",s:"sawetawis detik",m:"setunggal menit",mm:"%d menit",h:"setunggal jam",hh:"%d jam",d:"sedinten",dd:"%d dinten",M:"sewulan",MM:"%d wulan",y:"setaun",yy:"%d taun"},week:{dow:1,doy:7}}),nf.defineLocale("ka",{months:ad,monthsShort:"იან_თებ_მარ_აპრ_მაი_ივნ_ივლ_აგვ_სექ_ოქტ_ნოე_დეკ".split("_"),weekdays:bd,weekdaysShort:"კვი_ორშ_სამ_ოთხ_ხუთ_პარ_შაბ".split("_"),weekdaysMin:"კვ_ორ_სა_ოთ_ხუ_პა_შა".split("_"),longDateFormat:{LT:"h:mm A",LTS:"h:mm:ss A",L:"DD/MM/YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd, D MMMM YYYY LT"},calendar:{sameDay:"[დღეს] LT[-ზე]",nextDay:"[ხვალ] LT[-ზე]",lastDay:"[გუშინ] LT[-ზე]",nextWeek:"[შემდეგ] dddd LT[-ზე]",lastWeek:"[წინა] dddd LT-ზე",sameElse:"L"},relativeTime:{future:function(a){return/(წამი|წუთი|საათი|წელი)/.test(a)?a.replace(/ი$/,"ში"):a+"ში"},past:function(a){return/(წამი|წუთი|საათი|დღე|თვე)/.test(a)?a.replace(/(ი|ე)$/,"ის წინ"):/წელი/.test(a)?a.replace(/წელი$/,"წლის წინ"):void 0},s:"რამდენიმე წამი",m:"წუთი",mm:"%d წუთი",h:"საათი",hh:"%d საათი",d:"დღე",dd:"%d დღე",M:"თვე",MM:"%d თვე",y:"წელი",yy:"%d წელი"},ordinalParse:/0|1-ლი|მე-\d{1,2}|\d{1,2}-ე/,ordinal:function(a){return 0===a?a:1===a?a+"-ლი":20>a||100>=a&&a%20===0||a%100===0?"მე-"+a:a+"-ე"},week:{dow:1,doy:7}}),nf.defineLocale("km",{months:"មករា_កុម្ភៈ_មិនា_មេសា_ឧសភា_មិថុនា_កក្កដា_សីហា_កញ្ញា_តុលា_វិច្ឆិកា_ធ្នូ".split("_"),monthsShort:"មករា_កុម្ភៈ_មិនា_មេសា_ឧសភា_មិថុនា_កក្កដា_សីហា_កញ្ញា_តុលា_វិច្ឆិកា_ធ្នូ".split("_"),weekdays:"អាទិត្យ_ច័ន្ទ_អង្គារ_ពុធ_ព្រហស្បតិ៍_សុក្រ_សៅរ៍".split("_"),weekdaysShort:"អាទិត្យ_ច័ន្ទ_អង្គារ_ពុធ_ព្រហស្បតិ៍_សុក្រ_សៅរ៍".split("_"),weekdaysMin:"អាទិត្យ_ច័ន្ទ_អង្គារ_ពុធ_ព្រហស្បតិ៍_សុក្រ_សៅរ៍".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD/MM/YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd, D MMMM YYYY LT"},calendar:{sameDay:"[ថ្ងៃនៈ ម៉ោង] LT",nextDay:"[ស្អែក ម៉ោង] LT",nextWeek:"dddd [ម៉ោង] LT",lastDay:"[ម្សិលមិញ ម៉ោង] LT",lastWeek:"dddd [សប្តាហ៍មុន] [ម៉ោង] LT",sameElse:"L"},relativeTime:{future:"%sទៀត",past:"%sមុន",s:"ប៉ុន្មានវិនាទី",m:"មួយនាទី",mm:"%d នាទី",h:"មួយម៉ោង",hh:"%d ម៉ោង",d:"មួយថ្ងៃ",dd:"%d ថ្ងៃ",M:"មួយខែ",MM:"%d ខែ",y:"មួយឆ្នាំ",yy:"%d ឆ្នាំ"},week:{dow:1,doy:4}}),nf.defineLocale("ko",{months:"1월_2월_3월_4월_5월_6월_7월_8월_9월_10월_11월_12월".split("_"),monthsShort:"1월_2월_3월_4월_5월_6월_7월_8월_9월_10월_11월_12월".split("_"),weekdays:"일요일_월요일_화요일_수요일_목요일_금요일_토요일".split("_"),weekdaysShort:"일_월_화_수_목_금_토".split("_"),weekdaysMin:"일_월_화_수_목_금_토".split("_"),longDateFormat:{LT:"A h시 m분",LTS:"A h시 m분 s초",L:"YYYY.MM.DD",LL:"YYYY년 MMMM D일",LLL:"YYYY년 MMMM D일 LT",LLLL:"YYYY년 MMMM D일 dddd LT"},calendar:{sameDay:"오늘 LT",nextDay:"내일 LT",nextWeek:"dddd LT",lastDay:"어제 LT",lastWeek:"지난주 dddd LT",sameElse:"L"},relativeTime:{future:"%s 후",past:"%s 전",s:"몇초",ss:"%d초",m:"일분",mm:"%d분",h:"한시간",hh:"%d시간",d:"하루",dd:"%d일",M:"한달",MM:"%d달",y:"일년",yy:"%d년"},ordinalParse:/\d{1,2}일/,ordinal:"%d일",meridiemParse:/오전|오후/,isPM:function(a){return"오후"===a},meridiem:function(a,b,c){return 12>a?"오전":"오후"}}),nf.defineLocale("lb",{months:"Januar_Februar_Mäerz_Abrëll_Mee_Juni_Juli_August_September_Oktober_November_Dezember".split("_"),monthsShort:"Jan._Febr._Mrz._Abr._Mee_Jun._Jul._Aug._Sept._Okt._Nov._Dez.".split("_"),weekdays:"Sonndeg_Méindeg_Dënschdeg_Mëttwoch_Donneschdeg_Freideg_Samschdeg".split("_"),weekdaysShort:"So._Mé._Dë._Më._Do._Fr._Sa.".split("_"),weekdaysMin:"So_Mé_Dë_Më_Do_Fr_Sa".split("_"),longDateFormat:{LT:"H:mm [Auer]",LTS:"H:mm:ss [Auer]",L:"DD.MM.YYYY",LL:"D. MMMM YYYY",LLL:"D. MMMM YYYY LT",LLLL:"dddd, D. MMMM YYYY LT"},calendar:{sameDay:"[Haut um] LT",sameElse:"L",nextDay:"[Muer um] LT",nextWeek:"dddd [um] LT",lastDay:"[Gëschter um] LT",lastWeek:function(){switch(this.day()){case 2:case 4:return"[Leschten] dddd [um] LT";default:return"[Leschte] dddd [um] LT"}}},relativeTime:{future:dd,past:ed,s:"e puer Sekonnen",m:cd,mm:"%d Minutten",h:cd,hh:"%d Stonnen",d:cd,dd:"%d Deeg",M:cd,MM:"%d Méint",y:cd,yy:"%d Joer"},ordinalParse:/\d{1,2}\./,ordinal:"%d.",week:{dow:1,doy:4}}),{m:"minutė_minutės_minutę",mm:"minutės_minučių_minutes",h:"valanda_valandos_valandą",hh:"valandos_valandų_valandas",d:"diena_dienos_dieną",dd:"dienos_dienų_dienas",M:"mėnuo_mėnesio_mėnesį",MM:"mėnesiai_mėnesių_mėnesius",y:"metai_metų_metus",yy:"metai_metų_metus"}),Pf="sekmadienis_pirmadienis_antradienis_trečiadienis_ketvirtadienis_penktadienis_šeštadienis".split("_"),Qf=(nf.defineLocale("lt",{months:"sausio_vasario_kovo_balandžio_gegužės_birželio_liepos_rugpjūčio_rugsėjo_spalio_lapkričio_gruodžio".split("_"),monthsShort:"sau_vas_kov_bal_geg_bir_lie_rgp_rgs_spa_lap_grd".split("_"),weekdays:ld,weekdaysShort:"Sek_Pir_Ant_Tre_Ket_Pen_Šeš".split("_"),weekdaysMin:"S_P_A_T_K_Pn_Š".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"YYYY-MM-DD",LL:"YYYY [m.] MMMM D [d.]",LLL:"YYYY [m.] MMMM D [d.], LT [val.]",LLLL:"YYYY [m.] MMMM D [d.], dddd, LT [val.]",l:"YYYY-MM-DD",ll:"YYYY [m.] MMMM D [d.]",lll:"YYYY [m.] MMMM D [d.], LT [val.]",llll:"YYYY [m.] MMMM D [d.], ddd, LT [val.]"},calendar:{sameDay:"[Šiandien] LT",nextDay:"[Rytoj] LT",nextWeek:"dddd LT",lastDay:"[Vakar] LT",lastWeek:"[Praėjusį] dddd LT",sameElse:"L"},relativeTime:{future:"po %s",past:"prieš %s",s:gd,m:hd,mm:kd,h:hd,hh:kd,d:hd,dd:kd,M:hd,MM:kd,y:hd,yy:kd},ordinalParse:/\d{1,2}-oji/,ordinal:function(a){return a+"-oji"},week:{dow:1,doy:4}}),{m:"minūtes_minūtēm_minūte_minūtes".split("_"),mm:"minūtes_minūtēm_minūte_minūtes".split("_"),h:"stundas_stundām_stunda_stundas".split("_"),hh:"stundas_stundām_stunda_stundas".split("_"),d:"dienas_dienām_diena_dienas".split("_"),dd:"dienas_dienām_diena_dienas".split("_"),M:"mēneša_mēnešiem_mēnesis_mēneši".split("_"),MM:"mēneša_mēnešiem_mēnesis_mēneši".split("_"),y:"gada_gadiem_gads_gadi".split("_"),yy:"gada_gadiem_gads_gadi".split("_")}),Rf=(nf.defineLocale("lv",{months:"janvāris_februāris_marts_aprīlis_maijs_jūnijs_jūlijs_augusts_septembris_oktobris_novembris_decembris".split("_"),monthsShort:"jan_feb_mar_apr_mai_jūn_jūl_aug_sep_okt_nov_dec".split("_"),weekdays:"svētdiena_pirmdiena_otrdiena_trešdiena_ceturtdiena_piektdiena_sestdiena".split("_"),weekdaysShort:"Sv_P_O_T_C_Pk_S".split("_"),weekdaysMin:"Sv_P_O_T_C_Pk_S".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD.MM.YYYY.",LL:"YYYY. [gada] D. MMMM",LLL:"YYYY. [gada] D. MMMM, LT",LLLL:"YYYY. [gada] D. MMMM, dddd, LT"},calendar:{sameDay:"[Šodien pulksten] LT",nextDay:"[Rīt pulksten] LT",nextWeek:"dddd [pulksten] LT",lastDay:"[Vakar pulksten] LT",lastWeek:"[Pagājušā] dddd [pulksten] LT",sameElse:"L"},relativeTime:{future:"pēc %s",past:"pirms %s",s:pd,m:od,mm:nd,h:od,hh:nd,d:od,dd:nd,M:od,MM:nd,y:od,yy:nd},ordinalParse:/\d{1,2}\./,ordinal:"%d.",week:{dow:1,doy:4}}),{words:{m:["jedan minut","jednog minuta"],mm:["minut","minuta","minuta"],h:["jedan sat","jednog sata"],hh:["sat","sata","sati"],dd:["dan","dana","dana"],MM:["mjesec","mjeseca","mjeseci"],yy:["godina","godine","godina"]},correctGrammaticalCase:function(a,b){return 1===a?b[0]:a>=2&&4>=a?b[1]:b[2]},translate:function(a,b,c){var d=Rf.words[c];return 1===c.length?b?d[0]:d[1]:a+" "+Rf.correctGrammaticalCase(a,d)}}),Sf=(nf.defineLocale("me",{months:["januar","februar","mart","april","maj","jun","jul","avgust","septembar","oktobar","novembar","decembar"],monthsShort:["jan.","feb.","mar.","apr.","maj","jun","jul","avg.","sep.","okt.","nov.","dec."],weekdays:["nedjelja","ponedjeljak","utorak","srijeda","četvrtak","petak","subota"],weekdaysShort:["ned.","pon.","uto.","sri.","čet.","pet.","sub."],weekdaysMin:["ne","po","ut","sr","če","pe","su"],longDateFormat:{LT:"H:mm",LTS:"LT:ss",L:"DD. MM. YYYY",LL:"D. MMMM YYYY",LLL:"D. MMMM YYYY LT",LLLL:"dddd, D. MMMM YYYY LT"},calendar:{sameDay:"[danas u] LT",nextDay:"[sjutra u] LT",nextWeek:function(){switch(this.day()){case 0:return"[u] [nedjelju] [u] LT";case 3:return"[u] [srijedu] [u] LT";case 6:return"[u] [subotu] [u] LT";case 1:case 2:case 4:case 5:return"[u] dddd [u] LT"}},lastDay:"[juče u] LT",lastWeek:function(){var a=["[prošle] [nedjelje] [u] LT","[prošlog] [ponedjeljka] [u] LT","[prošlog] [utorka] [u] LT","[prošle] [srijede] [u] LT","[prošlog] [četvrtka] [u] LT","[prošlog] [petka] [u] LT","[prošle] [subote] [u] LT"];return a[this.day()]},sameElse:"L"},relativeTime:{future:"za %s",past:"prije %s",s:"nekoliko sekundi",m:Rf.translate,mm:Rf.translate,h:Rf.translate,hh:Rf.translate,d:"dan",dd:Rf.translate,M:"mjesec",MM:Rf.translate,y:"godinu",yy:Rf.translate},ordinalParse:/\d{1,2}\./,ordinal:"%d.",week:{dow:1,doy:7}}),nf.defineLocale("mk",{months:"јануари_февруари_март_април_мај_јуни_јули_август_септември_октомври_ноември_декември".split("_"),monthsShort:"јан_фев_мар_апр_мај_јун_јул_авг_сеп_окт_ное_дек".split("_"),weekdays:"недела_понеделник_вторник_среда_четврток_петок_сабота".split("_"),weekdaysShort:"нед_пон_вто_сре_чет_пет_саб".split("_"),weekdaysMin:"нe_пo_вт_ср_че_пе_сa".split("_"),longDateFormat:{LT:"H:mm",LTS:"LT:ss",L:"D.MM.YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd, D MMMM YYYY LT"},calendar:{sameDay:"[Денес во] LT",nextDay:"[Утре во] LT",nextWeek:"dddd [во] LT",lastDay:"[Вчера во] LT",lastWeek:function(){switch(this.day()){case 0:case 3:case 6:return"[Во изминатата] dddd [во] LT";case 1:case 2:case 4:case 5:return"[Во изминатиот] dddd [во] LT"}},sameElse:"L"},relativeTime:{future:"после %s",past:"пред %s",s:"неколку секунди",m:"минута",mm:"%d минути",h:"час",hh:"%d часа",d:"ден",dd:"%d дена",M:"месец",MM:"%d месеци",y:"година",yy:"%d години"},ordinalParse:/\d{1,2}-(ев|ен|ти|ви|ри|ми)/,ordinal:function(a){var b=a%10,c=a%100;return 0===a?a+"-ев":0===c?a+"-ен":c>10&&20>c?a+"-ти":1===b?a+"-ви":2===b?a+"-ри":7===b||8===b?a+"-ми":a+"-ти"},week:{dow:1,doy:7}}),nf.defineLocale("ml",{months:"ജനുവരി_ഫെബ്രുവരി_മാർച്ച്_ഏപ്രിൽ_മേയ്_ജൂൺ_ജൂലൈ_ഓഗസ്റ്റ്_സെപ്റ്റംബർ_ഒക്ടോബർ_നവംബർ_ഡിസംബർ".split("_"),monthsShort:"ജനു._ഫെബ്രു._മാർ._ഏപ്രി._മേയ്_ജൂൺ_ജൂലൈ._ഓഗ._സെപ്റ്റ._ഒക്ടോ._നവം._ഡിസം.".split("_"),weekdays:"ഞായറാഴ്ച_തിങ്കളാഴ്ച_ചൊവ്വാഴ്ച_ബുധനാഴ്ച_വ്യാഴാഴ്ച_വെള്ളിയാഴ്ച_ശനിയാഴ്ച".split("_"),weekdaysShort:"ഞായർ_തിങ്കൾ_ചൊവ്വ_ബുധൻ_വ്യാഴം_വെള്ളി_ശനി".split("_"),weekdaysMin:"ഞാ_തി_ചൊ_ബു_വ്യാ_വെ_ശ".split("_"),longDateFormat:{LT:"A h:mm -നു",LTS:"A h:mm:ss -നു",L:"DD/MM/YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY, LT",LLLL:"dddd, D MMMM YYYY, LT"},calendar:{sameDay:"[ഇന്ന്] LT",nextDay:"[നാളെ] LT",nextWeek:"dddd, LT",lastDay:"[ഇന്നലെ] LT",lastWeek:"[കഴിഞ്ഞ] dddd, LT",sameElse:"L"},relativeTime:{future:"%s കഴിഞ്ഞ്",past:"%s മുൻപ്",s:"അൽപ നിമിഷങ്ങൾ",m:"ഒരു മിനിറ്റ്",mm:"%d മിനിറ്റ്",h:"ഒരു മണിക്കൂർ",hh:"%d മണിക്കൂർ",d:"ഒരു ദിവസം",dd:"%d ദിവസം",M:"ഒരു മാസം",MM:"%d മാസം",y:"ഒരു വർഷം",yy:"%d വർഷം"},meridiemParse:/രാത്രി|രാവിലെ|ഉച്ച കഴിഞ്ഞ്|വൈകുന്നേരം|രാത്രി/i,isPM:function(a){return/^(ഉച്ച കഴിഞ്ഞ്|വൈകുന്നേരം|രാത്രി)$/.test(a)},meridiem:function(a,b,c){return 4>a?"രാത്രി":12>a?"രാവിലെ":17>a?"ഉച്ച കഴിഞ്ഞ്":20>a?"വൈകുന്നേരം":"രാത്രി"}}),{1:"१",2:"२",3:"३",4:"४",5:"५",6:"६",7:"७",8:"८",9:"९",0:"०"}),Tf={"१":"1","२":"2","३":"3","४":"4","५":"5","६":"6","७":"7","८":"8","९":"9","०":"0"},Uf=(nf.defineLocale("mr",{months:"जानेवारी_फेब्रुवारी_मार्च_एप्रिल_मे_जून_जुलै_ऑगस्ट_सप्टेंबर_ऑक्टोबर_नोव्हेंबर_डिसेंबर".split("_"),monthsShort:"जाने._फेब्रु._मार्च._एप्रि._मे._जून._जुलै._ऑग._सप्टें._ऑक्टो._नोव्हें._डिसें.".split("_"),weekdays:"रविवार_सोमवार_मंगळवार_बुधवार_गुरूवार_शुक्रवार_शनिवार".split("_"),weekdaysShort:"रवि_सोम_मंगळ_बुध_गुरू_शुक्र_शनि".split("_"),weekdaysMin:"र_सो_मं_बु_गु_शु_श".split("_"),longDateFormat:{LT:"A h:mm वाजता",LTS:"A h:mm:ss वाजता",L:"DD/MM/YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY, LT",LLLL:"dddd, D MMMM YYYY, LT"},calendar:{sameDay:"[आज] LT",nextDay:"[उद्या] LT",nextWeek:"dddd, LT",lastDay:"[काल] LT",lastWeek:"[मागील] dddd, LT",sameElse:"L"},relativeTime:{future:"%s नंतर",past:"%s पूर्वी",s:"सेकंद",m:"एक मिनिट",mm:"%d मिनिटे",h:"एक तास",hh:"%d तास",d:"एक दिवस",dd:"%d दिवस",M:"एक महिना",MM:"%d महिने",y:"एक वर्ष",yy:"%d वर्षे"},preparse:function(a){return a.replace(/[१२३४५६७८९०]/g,function(a){return Tf[a]})},postformat:function(a){return a.replace(/\d/g,function(a){return Sf[a]})},meridiemParse:/रात्री|सकाळी|दुपारी|सायंकाळी/,meridiemHour:function(a,b){return 12===a&&(a=0),"रात्री"===b?4>a?a:a+12:"सकाळी"===b?a:"दुपारी"===b?a>=10?a:a+12:"सायंकाळी"===b?a+12:void 0},meridiem:function(a,b,c){return 4>a?"रात्री":10>a?"सकाळी":17>a?"दुपारी":20>a?"सायंकाळी":"रात्री"},week:{dow:0,doy:6}}),nf.defineLocale("ms-my",{months:"Januari_Februari_Mac_April_Mei_Jun_Julai_Ogos_September_Oktober_November_Disember".split("_"),monthsShort:"Jan_Feb_Mac_Apr_Mei_Jun_Jul_Ogs_Sep_Okt_Nov_Dis".split("_"),weekdays:"Ahad_Isnin_Selasa_Rabu_Khamis_Jumaat_Sabtu".split("_"),weekdaysShort:"Ahd_Isn_Sel_Rab_Kha_Jum_Sab".split("_"),weekdaysMin:"Ah_Is_Sl_Rb_Km_Jm_Sb".split("_"),longDateFormat:{LT:"HH.mm",LTS:"LT.ss",L:"DD/MM/YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY [pukul] LT",LLLL:"dddd, D MMMM YYYY [pukul] LT"},meridiemParse:/pagi|tengahari|petang|malam/,meridiemHour:function(a,b){return 12===a&&(a=0),"pagi"===b?a:"tengahari"===b?a>=11?a:a+12:"petang"===b||"malam"===b?a+12:void 0},meridiem:function(a,b,c){return 11>a?"pagi":15>a?"tengahari":19>a?"petang":"malam"},calendar:{sameDay:"[Hari ini pukul] LT",nextDay:"[Esok pukul] LT",nextWeek:"dddd [pukul] LT",lastDay:"[Kelmarin pukul] LT",lastWeek:"dddd [lepas pukul] LT",sameElse:"L"},relativeTime:{future:"dalam %s",past:"%s yang lepas",s:"beberapa saat",m:"seminit",mm:"%d minit",h:"sejam",hh:"%d jam",d:"sehari",dd:"%d hari",M:"sebulan",MM:"%d bulan",y:"setahun",yy:"%d tahun"},week:{dow:1,doy:7}}),{1:"၁",2:"၂",3:"၃",4:"၄",5:"၅",6:"၆",7:"၇",8:"၈",9:"၉",0:"၀"}),Vf={"၁":"1","၂":"2","၃":"3","၄":"4","၅":"5",
		"၆":"6","၇":"7","၈":"8","၉":"9","၀":"0"},Wf=(nf.defineLocale("my",{months:"ဇန်နဝါရီ_ဖေဖော်ဝါရီ_မတ်_ဧပြီ_မေ_ဇွန်_ဇူလိုင်_သြဂုတ်_စက်တင်ဘာ_အောက်တိုဘာ_နိုဝင်ဘာ_ဒီဇင်ဘာ".split("_"),monthsShort:"ဇန်_ဖေ_မတ်_ပြီ_မေ_ဇွန်_လိုင်_သြ_စက်_အောက်_နို_ဒီ".split("_"),weekdays:"တနင်္ဂနွေ_တနင်္လာ_အင်္ဂါ_ဗုဒ္ဓဟူး_ကြာသပတေး_သောကြာ_စနေ".split("_"),weekdaysShort:"နွေ_လာ_ဂါ_ဟူး_ကြာ_သော_နေ".split("_"),weekdaysMin:"နွေ_လာ_ဂါ_ဟူး_ကြာ_သော_နေ".split("_"),longDateFormat:{LT:"HH:mm",LTS:"HH:mm:ss",L:"DD/MM/YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd D MMMM YYYY LT"},calendar:{sameDay:"[ယနေ.] LT [မှာ]",nextDay:"[မနက်ဖြန်] LT [မှာ]",nextWeek:"dddd LT [မှာ]",lastDay:"[မနေ.က] LT [မှာ]",lastWeek:"[ပြီးခဲ့သော] dddd LT [မှာ]",sameElse:"L"},relativeTime:{future:"လာမည့် %s မှာ",past:"လွန်ခဲ့သော %s က",s:"စက္ကန်.အနည်းငယ်",m:"တစ်မိနစ်",mm:"%d မိနစ်",h:"တစ်နာရီ",hh:"%d နာရီ",d:"တစ်ရက်",dd:"%d ရက်",M:"တစ်လ",MM:"%d လ",y:"တစ်နှစ်",yy:"%d နှစ်"},preparse:function(a){return a.replace(/[၁၂၃၄၅၆၇၈၉၀]/g,function(a){return Vf[a]})},postformat:function(a){return a.replace(/\d/g,function(a){return Uf[a]})},week:{dow:1,doy:4}}),nf.defineLocale("nb",{months:"januar_februar_mars_april_mai_juni_juli_august_september_oktober_november_desember".split("_"),monthsShort:"jan_feb_mar_apr_mai_jun_jul_aug_sep_okt_nov_des".split("_"),weekdays:"søndag_mandag_tirsdag_onsdag_torsdag_fredag_lørdag".split("_"),weekdaysShort:"søn_man_tirs_ons_tors_fre_lør".split("_"),weekdaysMin:"sø_ma_ti_on_to_fr_lø".split("_"),longDateFormat:{LT:"H.mm",LTS:"LT.ss",L:"DD.MM.YYYY",LL:"D. MMMM YYYY",LLL:"D. MMMM YYYY [kl.] LT",LLLL:"dddd D. MMMM YYYY [kl.] LT"},calendar:{sameDay:"[i dag kl.] LT",nextDay:"[i morgen kl.] LT",nextWeek:"dddd [kl.] LT",lastDay:"[i går kl.] LT",lastWeek:"[forrige] dddd [kl.] LT",sameElse:"L"},relativeTime:{future:"om %s",past:"for %s siden",s:"noen sekunder",m:"ett minutt",mm:"%d minutter",h:"en time",hh:"%d timer",d:"en dag",dd:"%d dager",M:"en måned",MM:"%d måneder",y:"ett år",yy:"%d år"},ordinalParse:/\d{1,2}\./,ordinal:"%d.",week:{dow:1,doy:4}}),{1:"१",2:"२",3:"३",4:"४",5:"५",6:"६",7:"७",8:"८",9:"९",0:"०"}),Xf={"१":"1","२":"2","३":"3","४":"4","५":"5","६":"6","७":"7","८":"8","९":"9","०":"0"},Yf=(nf.defineLocale("ne",{months:"जनवरी_फेब्रुवरी_मार्च_अप्रिल_मई_जुन_जुलाई_अगष्ट_सेप्टेम्बर_अक्टोबर_नोभेम्बर_डिसेम्बर".split("_"),monthsShort:"जन._फेब्रु._मार्च_अप्रि._मई_जुन_जुलाई._अग._सेप्ट._अक्टो._नोभे._डिसे.".split("_"),weekdays:"आइतबार_सोमबार_मङ्गलबार_बुधबार_बिहिबार_शुक्रबार_शनिबार".split("_"),weekdaysShort:"आइत._सोम._मङ्गल._बुध._बिहि._शुक्र._शनि.".split("_"),weekdaysMin:"आइ._सो._मङ्_बु._बि._शु._श.".split("_"),longDateFormat:{LT:"Aको h:mm बजे",LTS:"Aको h:mm:ss बजे",L:"DD/MM/YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY, LT",LLLL:"dddd, D MMMM YYYY, LT"},preparse:function(a){return a.replace(/[१२३४५६७८९०]/g,function(a){return Xf[a]})},postformat:function(a){return a.replace(/\d/g,function(a){return Wf[a]})},meridiemParse:/राती|बिहान|दिउँसो|बेलुका|साँझ|राती/,meridiemHour:function(a,b){return 12===a&&(a=0),"राती"===b?3>a?a:a+12:"बिहान"===b?a:"दिउँसो"===b?a>=10?a:a+12:"बेलुका"===b||"साँझ"===b?a+12:void 0},meridiem:function(a,b,c){return 3>a?"राती":10>a?"बिहान":15>a?"दिउँसो":18>a?"बेलुका":20>a?"साँझ":"राती"},calendar:{sameDay:"[आज] LT",nextDay:"[भोली] LT",nextWeek:"[आउँदो] dddd[,] LT",lastDay:"[हिजो] LT",lastWeek:"[गएको] dddd[,] LT",sameElse:"L"},relativeTime:{future:"%sमा",past:"%s अगाडी",s:"केही समय",m:"एक मिनेट",mm:"%d मिनेट",h:"एक घण्टा",hh:"%d घण्टा",d:"एक दिन",dd:"%d दिन",M:"एक महिना",MM:"%d महिना",y:"एक बर्ष",yy:"%d बर्ष"},week:{dow:1,doy:7}}),"jan._feb._mrt._apr._mei_jun._jul._aug._sep._okt._nov._dec.".split("_")),Zf="jan_feb_mrt_apr_mei_jun_jul_aug_sep_okt_nov_dec".split("_"),$f=(nf.defineLocale("nl",{months:"januari_februari_maart_april_mei_juni_juli_augustus_september_oktober_november_december".split("_"),monthsShort:function(a,b){return/-MMM-/.test(b)?Zf[a.month()]:Yf[a.month()]},weekdays:"zondag_maandag_dinsdag_woensdag_donderdag_vrijdag_zaterdag".split("_"),weekdaysShort:"zo._ma._di._wo._do._vr._za.".split("_"),weekdaysMin:"Zo_Ma_Di_Wo_Do_Vr_Za".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD-MM-YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd D MMMM YYYY LT"},calendar:{sameDay:"[vandaag om] LT",nextDay:"[morgen om] LT",nextWeek:"dddd [om] LT",lastDay:"[gisteren om] LT",lastWeek:"[afgelopen] dddd [om] LT",sameElse:"L"},relativeTime:{future:"over %s",past:"%s geleden",s:"een paar seconden",m:"één minuut",mm:"%d minuten",h:"één uur",hh:"%d uur",d:"één dag",dd:"%d dagen",M:"één maand",MM:"%d maanden",y:"één jaar",yy:"%d jaar"},ordinalParse:/\d{1,2}(ste|de)/,ordinal:function(a){return a+(1===a||8===a||a>=20?"ste":"de")},week:{dow:1,doy:4}}),nf.defineLocale("nn",{months:"januar_februar_mars_april_mai_juni_juli_august_september_oktober_november_desember".split("_"),monthsShort:"jan_feb_mar_apr_mai_jun_jul_aug_sep_okt_nov_des".split("_"),weekdays:"sundag_måndag_tysdag_onsdag_torsdag_fredag_laurdag".split("_"),weekdaysShort:"sun_mån_tys_ons_tor_fre_lau".split("_"),weekdaysMin:"su_må_ty_on_to_fr_lø".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD.MM.YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd D MMMM YYYY LT"},calendar:{sameDay:"[I dag klokka] LT",nextDay:"[I morgon klokka] LT",nextWeek:"dddd [klokka] LT",lastDay:"[I går klokka] LT",lastWeek:"[Føregåande] dddd [klokka] LT",sameElse:"L"},relativeTime:{future:"om %s",past:"for %s sidan",s:"nokre sekund",m:"eit minutt",mm:"%d minutt",h:"ein time",hh:"%d timar",d:"ein dag",dd:"%d dagar",M:"ein månad",MM:"%d månader",y:"eit år",yy:"%d år"},ordinalParse:/\d{1,2}\./,ordinal:"%d.",week:{dow:1,doy:4}}),"styczeń_luty_marzec_kwiecień_maj_czerwiec_lipiec_sierpień_wrzesień_październik_listopad_grudzień".split("_")),_f="stycznia_lutego_marca_kwietnia_maja_czerwca_lipca_sierpnia_września_października_listopada_grudnia".split("_"),ag=(nf.defineLocale("pl",{months:function(a,b){return""===b?"("+_f[a.month()]+"|"+$f[a.month()]+")":/D MMMM/.test(b)?_f[a.month()]:$f[a.month()]},monthsShort:"sty_lut_mar_kwi_maj_cze_lip_sie_wrz_paź_lis_gru".split("_"),weekdays:"niedziela_poniedziałek_wtorek_środa_czwartek_piątek_sobota".split("_"),weekdaysShort:"nie_pon_wt_śr_czw_pt_sb".split("_"),weekdaysMin:"N_Pn_Wt_Śr_Cz_Pt_So".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD.MM.YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd, D MMMM YYYY LT"},calendar:{sameDay:"[Dziś o] LT",nextDay:"[Jutro o] LT",nextWeek:"[W] dddd [o] LT",lastDay:"[Wczoraj o] LT",lastWeek:function(){switch(this.day()){case 0:return"[W zeszłą niedzielę o] LT";case 3:return"[W zeszłą środę o] LT";case 6:return"[W zeszłą sobotę o] LT";default:return"[W zeszły] dddd [o] LT"}},sameElse:"L"},relativeTime:{future:"za %s",past:"%s temu",s:"kilka sekund",m:rd,mm:rd,h:rd,hh:rd,d:"1 dzień",dd:"%d dni",M:"miesiąc",MM:rd,y:"rok",yy:rd},ordinalParse:/\d{1,2}\./,ordinal:"%d.",week:{dow:1,doy:4}}),nf.defineLocale("pt-br",{months:"Janeiro_Fevereiro_Março_Abril_Maio_Junho_Julho_Agosto_Setembro_Outubro_Novembro_Dezembro".split("_"),monthsShort:"Jan_Fev_Mar_Abr_Mai_Jun_Jul_Ago_Set_Out_Nov_Dez".split("_"),weekdays:"Domingo_Segunda-Feira_Terça-Feira_Quarta-Feira_Quinta-Feira_Sexta-Feira_Sábado".split("_"),weekdaysShort:"Dom_Seg_Ter_Qua_Qui_Sex_Sáb".split("_"),weekdaysMin:"Dom_2ª_3ª_4ª_5ª_6ª_Sáb".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD/MM/YYYY",LL:"D [de] MMMM [de] YYYY",LLL:"D [de] MMMM [de] YYYY [às] LT",LLLL:"dddd, D [de] MMMM [de] YYYY [às] LT"},calendar:{sameDay:"[Hoje às] LT",nextDay:"[Amanhã às] LT",nextWeek:"dddd [às] LT",lastDay:"[Ontem às] LT",lastWeek:function(){return 0===this.day()||6===this.day()?"[Último] dddd [às] LT":"[Última] dddd [às] LT"},sameElse:"L"},relativeTime:{future:"em %s",past:"%s atrás",s:"segundos",m:"um minuto",mm:"%d minutos",h:"uma hora",hh:"%d horas",d:"um dia",dd:"%d dias",M:"um mês",MM:"%d meses",y:"um ano",yy:"%d anos"},ordinalParse:/\d{1,2}º/,ordinal:"%dº"}),nf.defineLocale("pt",{months:"Janeiro_Fevereiro_Março_Abril_Maio_Junho_Julho_Agosto_Setembro_Outubro_Novembro_Dezembro".split("_"),monthsShort:"Jan_Fev_Mar_Abr_Mai_Jun_Jul_Ago_Set_Out_Nov_Dez".split("_"),weekdays:"Domingo_Segunda-Feira_Terça-Feira_Quarta-Feira_Quinta-Feira_Sexta-Feira_Sábado".split("_"),weekdaysShort:"Dom_Seg_Ter_Qua_Qui_Sex_Sáb".split("_"),weekdaysMin:"Dom_2ª_3ª_4ª_5ª_6ª_Sáb".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD/MM/YYYY",LL:"D [de] MMMM [de] YYYY",LLL:"D [de] MMMM [de] YYYY LT",LLLL:"dddd, D [de] MMMM [de] YYYY LT"},calendar:{sameDay:"[Hoje às] LT",nextDay:"[Amanhã às] LT",nextWeek:"dddd [às] LT",lastDay:"[Ontem às] LT",lastWeek:function(){return 0===this.day()||6===this.day()?"[Último] dddd [às] LT":"[Última] dddd [às] LT"},sameElse:"L"},relativeTime:{future:"em %s",past:"há %s",s:"segundos",m:"um minuto",mm:"%d minutos",h:"uma hora",hh:"%d horas",d:"um dia",dd:"%d dias",M:"um mês",MM:"%d meses",y:"um ano",yy:"%d anos"},ordinalParse:/\d{1,2}º/,ordinal:"%dº",week:{dow:1,doy:4}}),nf.defineLocale("ro",{months:"ianuarie_februarie_martie_aprilie_mai_iunie_iulie_august_septembrie_octombrie_noiembrie_decembrie".split("_"),monthsShort:"ian._febr._mart._apr._mai_iun._iul._aug._sept._oct._nov._dec.".split("_"),weekdays:"duminică_luni_marți_miercuri_joi_vineri_sâmbătă".split("_"),weekdaysShort:"Dum_Lun_Mar_Mie_Joi_Vin_Sâm".split("_"),weekdaysMin:"Du_Lu_Ma_Mi_Jo_Vi_Sâ".split("_"),longDateFormat:{LT:"H:mm",LTS:"LT:ss",L:"DD.MM.YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY H:mm",LLLL:"dddd, D MMMM YYYY H:mm"},calendar:{sameDay:"[azi la] LT",nextDay:"[mâine la] LT",nextWeek:"dddd [la] LT",lastDay:"[ieri la] LT",lastWeek:"[fosta] dddd [la] LT",sameElse:"L"},relativeTime:{future:"peste %s",past:"%s în urmă",s:"câteva secunde",m:"un minut",mm:sd,h:"o oră",hh:sd,d:"o zi",dd:sd,M:"o lună",MM:sd,y:"un an",yy:sd},week:{dow:1,doy:7}}),nf.defineLocale("ru",{months:vd,monthsShort:wd,weekdays:xd,weekdaysShort:"вс_пн_вт_ср_чт_пт_сб".split("_"),weekdaysMin:"вс_пн_вт_ср_чт_пт_сб".split("_"),monthsParse:[/^янв/i,/^фев/i,/^мар/i,/^апр/i,/^ма[й|я]/i,/^июн/i,/^июл/i,/^авг/i,/^сен/i,/^окт/i,/^ноя/i,/^дек/i],longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD.MM.YYYY",LL:"D MMMM YYYY г.",LLL:"D MMMM YYYY г., LT",LLLL:"dddd, D MMMM YYYY г., LT"},calendar:{sameDay:"[Сегодня в] LT",nextDay:"[Завтра в] LT",lastDay:"[Вчера в] LT",nextWeek:function(){return 2===this.day()?"[Во] dddd [в] LT":"[В] dddd [в] LT"},lastWeek:function(a){if(a.week()===this.week())return 2===this.day()?"[Во] dddd [в] LT":"[В] dddd [в] LT";switch(this.day()){case 0:return"[В прошлое] dddd [в] LT";case 1:case 2:case 4:return"[В прошлый] dddd [в] LT";case 3:case 5:case 6:return"[В прошлую] dddd [в] LT"}},sameElse:"L"},relativeTime:{future:"через %s",past:"%s назад",s:"несколько секунд",m:ud,mm:ud,h:"час",hh:ud,d:"день",dd:ud,M:"месяц",MM:ud,y:"год",yy:ud},meridiemParse:/ночи|утра|дня|вечера/i,isPM:function(a){return/^(дня|вечера)$/.test(a)},meridiem:function(a,b,c){return 4>a?"ночи":12>a?"утра":17>a?"дня":"вечера"},ordinalParse:/\d{1,2}-(й|го|я)/,ordinal:function(a,b){switch(b){case"M":case"d":case"DDD":return a+"-й";case"D":return a+"-го";case"w":case"W":return a+"-я";default:return a}},week:{dow:1,doy:7}}),nf.defineLocale("si",{months:"ජනවාරි_පෙබරවාරි_මාර්තු_අප්‍රේල්_මැයි_ජූනි_ජූලි_අගෝස්තු_සැප්තැම්බර්_ඔක්තෝබර්_නොවැම්බර්_දෙසැම්බර්".split("_"),monthsShort:"ජන_පෙබ_මාර්_අප්_මැයි_ජූනි_ජූලි_අගෝ_සැප්_ඔක්_නොවැ_දෙසැ".split("_"),weekdays:"ඉරිදා_සඳුදා_අඟහරුවාදා_බදාදා_බ්‍රහස්පතින්දා_සිකුරාදා_සෙනසුරාදා".split("_"),weekdaysShort:"ඉරි_සඳු_අඟ_බදා_බ්‍රහ_සිකු_සෙන".split("_"),weekdaysMin:"ඉ_ස_අ_බ_බ්‍ර_සි_සෙ".split("_"),longDateFormat:{LT:"a h:mm",LTS:"a h:mm:ss",L:"YYYY/MM/DD",LL:"YYYY MMMM D",LLL:"YYYY MMMM D, LT",LLLL:"YYYY MMMM D [වැනි] dddd, LTS"},calendar:{sameDay:"[අද] LT[ට]",nextDay:"[හෙට] LT[ට]",nextWeek:"dddd LT[ට]",lastDay:"[ඊයේ] LT[ට]",lastWeek:"[පසුගිය] dddd LT[ට]",sameElse:"L"},relativeTime:{future:"%sකින්",past:"%sකට පෙර",s:"තත්පර කිහිපය",m:"මිනිත්තුව",mm:"මිනිත්තු %d",h:"පැය",hh:"පැය %d",d:"දිනය",dd:"දින %d",M:"මාසය",MM:"මාස %d",y:"වසර",yy:"වසර %d"},ordinalParse:/\d{1,2} වැනි/,ordinal:function(a){return a+" වැනි"},meridiem:function(a,b,c){return a>11?c?"ප.ව.":"පස් වරු":c?"පෙ.ව.":"පෙර වරු"}}),"január_február_marec_apríl_máj_jún_júl_august_september_október_november_december".split("_")),bg="jan_feb_mar_apr_máj_jún_júl_aug_sep_okt_nov_dec".split("_"),cg=(nf.defineLocale("sk",{months:ag,monthsShort:bg,monthsParse:function(a,b){var c,d=[];for(c=0;12>c;c++)d[c]=new RegExp("^"+a[c]+"$|^"+b[c]+"$","i");return d}(ag,bg),weekdays:"nedeľa_pondelok_utorok_streda_štvrtok_piatok_sobota".split("_"),weekdaysShort:"ne_po_ut_st_št_pi_so".split("_"),weekdaysMin:"ne_po_ut_st_št_pi_so".split("_"),longDateFormat:{LT:"H:mm",LTS:"LT:ss",L:"DD.MM.YYYY",LL:"D. MMMM YYYY",LLL:"D. MMMM YYYY LT",LLLL:"dddd D. MMMM YYYY LT"},calendar:{sameDay:"[dnes o] LT",nextDay:"[zajtra o] LT",nextWeek:function(){switch(this.day()){case 0:return"[v nedeľu o] LT";case 1:case 2:return"[v] dddd [o] LT";case 3:return"[v stredu o] LT";case 4:return"[vo štvrtok o] LT";case 5:return"[v piatok o] LT";case 6:return"[v sobotu o] LT"}},lastDay:"[včera o] LT",lastWeek:function(){switch(this.day()){case 0:return"[minulú nedeľu o] LT";case 1:case 2:return"[minulý] dddd [o] LT";case 3:return"[minulú stredu o] LT";case 4:case 5:return"[minulý] dddd [o] LT";case 6:return"[minulú sobotu o] LT"}},sameElse:"L"},relativeTime:{future:"za %s",past:"pred %s",s:zd,m:zd,mm:zd,h:zd,hh:zd,d:zd,dd:zd,M:zd,MM:zd,y:zd,yy:zd},ordinalParse:/\d{1,2}\./,ordinal:"%d.",week:{dow:1,doy:4}}),nf.defineLocale("sl",{months:"januar_februar_marec_april_maj_junij_julij_avgust_september_oktober_november_december".split("_"),monthsShort:"jan._feb._mar._apr._maj._jun._jul._avg._sep._okt._nov._dec.".split("_"),weekdays:"nedelja_ponedeljek_torek_sreda_četrtek_petek_sobota".split("_"),weekdaysShort:"ned._pon._tor._sre._čet._pet._sob.".split("_"),weekdaysMin:"ne_po_to_sr_če_pe_so".split("_"),longDateFormat:{LT:"H:mm",LTS:"LT:ss",L:"DD. MM. YYYY",LL:"D. MMMM YYYY",LLL:"D. MMMM YYYY LT",LLLL:"dddd, D. MMMM YYYY LT"},calendar:{sameDay:"[danes ob] LT",nextDay:"[jutri ob] LT",nextWeek:function(){switch(this.day()){case 0:return"[v] [nedeljo] [ob] LT";case 3:return"[v] [sredo] [ob] LT";case 6:return"[v] [soboto] [ob] LT";case 1:case 2:case 4:case 5:return"[v] dddd [ob] LT"}},lastDay:"[včeraj ob] LT",lastWeek:function(){switch(this.day()){case 0:return"[prejšnjo] [nedeljo] [ob] LT";case 3:return"[prejšnjo] [sredo] [ob] LT";case 6:return"[prejšnjo] [soboto] [ob] LT";case 1:case 2:case 4:case 5:return"[prejšnji] dddd [ob] LT"}},sameElse:"L"},relativeTime:{future:"čez %s",past:"pred %s",s:Ad,m:Ad,mm:Ad,h:Ad,hh:Ad,d:Ad,dd:Ad,M:Ad,MM:Ad,y:Ad,yy:Ad},ordinalParse:/\d{1,2}\./,ordinal:"%d.",week:{dow:1,doy:7}}),nf.defineLocale("sq",{months:"Janar_Shkurt_Mars_Prill_Maj_Qershor_Korrik_Gusht_Shtator_Tetor_Nëntor_Dhjetor".split("_"),monthsShort:"Jan_Shk_Mar_Pri_Maj_Qer_Kor_Gus_Sht_Tet_Nën_Dhj".split("_"),weekdays:"E Diel_E Hënë_E Martë_E Mërkurë_E Enjte_E Premte_E Shtunë".split("_"),weekdaysShort:"Die_Hën_Mar_Mër_Enj_Pre_Sht".split("_"),weekdaysMin:"D_H_Ma_Më_E_P_Sh".split("_"),meridiemParse:/PD|MD/,isPM:function(a){return"M"===a.charAt(0)},meridiem:function(a,b,c){return 12>a?"PD":"MD"},longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD/MM/YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd, D MMMM YYYY LT"},calendar:{sameDay:"[Sot në] LT",nextDay:"[Nesër në] LT",nextWeek:"dddd [në] LT",lastDay:"[Dje në] LT",lastWeek:"dddd [e kaluar në] LT",sameElse:"L"},relativeTime:{future:"në %s",past:"%s më parë",s:"disa sekonda",m:"një minutë",mm:"%d minuta",h:"një orë",hh:"%d orë",d:"një ditë",dd:"%d ditë",M:"një muaj",MM:"%d muaj",y:"një vit",yy:"%d vite"},ordinalParse:/\d{1,2}\./,ordinal:"%d.",week:{dow:1,doy:4}}),{words:{m:["један минут","једне минуте"],mm:["минут","минуте","минута"],h:["један сат","једног сата"],hh:["сат","сата","сати"],dd:["дан","дана","дана"],MM:["месец","месеца","месеци"],yy:["година","године","година"]},correctGrammaticalCase:function(a,b){return 1===a?b[0]:a>=2&&4>=a?b[1]:b[2]},translate:function(a,b,c){var d=cg.words[c];return 1===c.length?b?d[0]:d[1]:a+" "+cg.correctGrammaticalCase(a,d)}}),dg=(nf.defineLocale("sr-cyrl",{months:["јануар","фебруар","март","април","мај","јун","јул","август","септембар","октобар","новембар","децембар"],monthsShort:["јан.","феб.","мар.","апр.","мај","јун","јул","авг.","сеп.","окт.","нов.","дец."],weekdays:["недеља","понедељак","уторак","среда","четвртак","петак","субота"],weekdaysShort:["нед.","пон.","уто.","сре.","чет.","пет.","суб."],weekdaysMin:["не","по","ут","ср","че","пе","су"],longDateFormat:{LT:"H:mm",LTS:"LT:ss",L:"DD. MM. YYYY",LL:"D. MMMM YYYY",LLL:"D. MMMM YYYY LT",LLLL:"dddd, D. MMMM YYYY LT"},calendar:{sameDay:"[данас у] LT",nextDay:"[сутра у] LT",nextWeek:function(){switch(this.day()){case 0:return"[у] [недељу] [у] LT";case 3:return"[у] [среду] [у] LT";case 6:return"[у] [суботу] [у] LT";case 1:case 2:case 4:case 5:return"[у] dddd [у] LT"}},lastDay:"[јуче у] LT",lastWeek:function(){var a=["[прошле] [недеље] [у] LT","[прошлог] [понедељка] [у] LT","[прошлог] [уторка] [у] LT","[прошле] [среде] [у] LT","[прошлог] [четвртка] [у] LT","[прошлог] [петка] [у] LT","[прошле] [суботе] [у] LT"];return a[this.day()]},sameElse:"L"},relativeTime:{future:"за %s",past:"пре %s",s:"неколико секунди",m:cg.translate,mm:cg.translate,h:cg.translate,hh:cg.translate,d:"дан",dd:cg.translate,M:"месец",MM:cg.translate,y:"годину",yy:cg.translate},ordinalParse:/\d{1,2}\./,ordinal:"%d.",week:{dow:1,doy:7}}),{words:{m:["jedan minut","jedne minute"],mm:["minut","minute","minuta"],h:["jedan sat","jednog sata"],hh:["sat","sata","sati"],dd:["dan","dana","dana"],MM:["mesec","meseca","meseci"],yy:["godina","godine","godina"]},correctGrammaticalCase:function(a,b){return 1===a?b[0]:a>=2&&4>=a?b[1]:b[2]},translate:function(a,b,c){var d=dg.words[c];return 1===c.length?b?d[0]:d[1]:a+" "+dg.correctGrammaticalCase(a,d)}}),eg=(nf.defineLocale("sr",{months:["januar","februar","mart","april","maj","jun","jul","avgust","septembar","oktobar","novembar","decembar"],monthsShort:["jan.","feb.","mar.","apr.","maj","jun","jul","avg.","sep.","okt.","nov.","dec."],weekdays:["nedelja","ponedeljak","utorak","sreda","četvrtak","petak","subota"],weekdaysShort:["ned.","pon.","uto.","sre.","čet.","pet.","sub."],weekdaysMin:["ne","po","ut","sr","če","pe","su"],longDateFormat:{LT:"H:mm",LTS:"LT:ss",L:"DD. MM. YYYY",LL:"D. MMMM YYYY",LLL:"D. MMMM YYYY LT",LLLL:"dddd, D. MMMM YYYY LT"},calendar:{sameDay:"[danas u] LT",nextDay:"[sutra u] LT",nextWeek:function(){switch(this.day()){case 0:return"[u] [nedelju] [u] LT";case 3:return"[u] [sredu] [u] LT";case 6:return"[u] [subotu] [u] LT";case 1:case 2:case 4:case 5:return"[u] dddd [u] LT"}},lastDay:"[juče u] LT",lastWeek:function(){var a=["[prošle] [nedelje] [u] LT","[prošlog] [ponedeljka] [u] LT","[prošlog] [utorka] [u] LT","[prošle] [srede] [u] LT","[prošlog] [četvrtka] [u] LT","[prošlog] [petka] [u] LT","[prošle] [subote] [u] LT"];return a[this.day()]},sameElse:"L"},relativeTime:{future:"za %s",past:"pre %s",s:"nekoliko sekundi",m:dg.translate,mm:dg.translate,h:dg.translate,hh:dg.translate,d:"dan",dd:dg.translate,M:"mesec",MM:dg.translate,y:"godinu",yy:dg.translate},ordinalParse:/\d{1,2}\./,ordinal:"%d.",week:{dow:1,doy:7}}),nf.defineLocale("sv",{months:"januari_februari_mars_april_maj_juni_juli_augusti_september_oktober_november_december".split("_"),monthsShort:"jan_feb_mar_apr_maj_jun_jul_aug_sep_okt_nov_dec".split("_"),weekdays:"söndag_måndag_tisdag_onsdag_torsdag_fredag_lördag".split("_"),weekdaysShort:"sön_mån_tis_ons_tor_fre_lör".split("_"),weekdaysMin:"sö_må_ti_on_to_fr_lö".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"YYYY-MM-DD",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd D MMMM YYYY LT"},calendar:{sameDay:"[Idag] LT",nextDay:"[Imorgon] LT",lastDay:"[Igår] LT",nextWeek:"[På] dddd LT",lastWeek:"[I] dddd[s] LT",sameElse:"L"},relativeTime:{future:"om %s",past:"för %s sedan",s:"några sekunder",m:"en minut",mm:"%d minuter",h:"en timme",hh:"%d timmar",d:"en dag",dd:"%d dagar",M:"en månad",MM:"%d månader",y:"ett år",yy:"%d år"},ordinalParse:/\d{1,2}(e|a)/,ordinal:function(a){var b=a%10,c=1===~~(a%100/10)?"e":1===b?"a":2===b?"a":"e";return a+c},week:{dow:1,doy:4}}),nf.defineLocale("ta",{months:"ஜனவரி_பிப்ரவரி_மார்ச்_ஏப்ரல்_மே_ஜூன்_ஜூலை_ஆகஸ்ட்_செப்டெம்பர்_அக்டோபர்_நவம்பர்_டிசம்பர்".split("_"),monthsShort:"ஜனவரி_பிப்ரவரி_மார்ச்_ஏப்ரல்_மே_ஜூன்_ஜூலை_ஆகஸ்ட்_செப்டெம்பர்_அக்டோபர்_நவம்பர்_டிசம்பர்".split("_"),weekdays:"ஞாயிற்றுக்கிழமை_திங்கட்கிழமை_செவ்வாய்கிழமை_புதன்கிழமை_வியாழக்கிழமை_வெள்ளிக்கிழமை_சனிக்கிழமை".split("_"),weekdaysShort:"ஞாயிறு_திங்கள்_செவ்வாய்_புதன்_வியாழன்_வெள்ளி_சனி".split("_"),weekdaysMin:"ஞா_தி_செ_பு_வி_வெ_ச".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD/MM/YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY, LT",LLLL:"dddd, D MMMM YYYY, LT"},calendar:{sameDay:"[இன்று] LT",nextDay:"[நாளை] LT",nextWeek:"dddd, LT",lastDay:"[நேற்று] LT",lastWeek:"[கடந்த வாரம்] dddd, LT",sameElse:"L"},relativeTime:{future:"%s இல்",past:"%s முன்",s:"ஒரு சில விநாடிகள்",m:"ஒரு நிமிடம்",mm:"%d நிமிடங்கள்",h:"ஒரு மணி நேரம்",hh:"%d மணி நேரம்",d:"ஒரு நாள்",dd:"%d நாட்கள்",M:"ஒரு மாதம்",MM:"%d மாதங்கள்",y:"ஒரு வருடம்",yy:"%d ஆண்டுகள்"},ordinalParse:/\d{1,2}வது/,ordinal:function(a){return a+"வது"},meridiemParse:/யாமம்|வைகறை|காலை|நண்பகல்|எற்பாடு|மாலை/,meridiem:function(a,b,c){return 2>a?" யாமம்":6>a?" வைகறை":10>a?" காலை":14>a?" நண்பகல்":18>a?" எற்பாடு":22>a?" மாலை":" யாமம்"},meridiemHour:function(a,b){return 12===a&&(a=0),"யாமம்"===b?2>a?a:a+12:"வைகறை"===b||"காலை"===b?a:"நண்பகல்"===b&&a>=10?a:a+12},week:{dow:0,doy:6}}),nf.defineLocale("th",{months:"มกราคม_กุมภาพันธ์_มีนาคม_เมษายน_พฤษภาคม_มิถุนายน_กรกฎาคม_สิงหาคม_กันยายน_ตุลาคม_พฤศจิกายน_ธันวาคม".split("_"),monthsShort:"มกรา_กุมภา_มีนา_เมษา_พฤษภา_มิถุนา_กรกฎา_สิงหา_กันยา_ตุลา_พฤศจิกา_ธันวา".split("_"),weekdays:"อาทิตย์_จันทร์_อังคาร_พุธ_พฤหัสบดี_ศุกร์_เสาร์".split("_"),weekdaysShort:"อาทิตย์_จันทร์_อังคาร_พุธ_พฤหัส_ศุกร์_เสาร์".split("_"),weekdaysMin:"อา._จ._อ._พ._พฤ._ศ._ส.".split("_"),longDateFormat:{LT:"H นาฬิกา m นาที",LTS:"LT s วินาที",L:"YYYY/MM/DD",LL:"D MMMM YYYY",LLL:"D MMMM YYYY เวลา LT",LLLL:"วันddddที่ D MMMM YYYY เวลา LT"},meridiemParse:/ก่อนเที่ยง|หลังเที่ยง/,isPM:function(a){return"หลังเที่ยง"===a},meridiem:function(a,b,c){return 12>a?"ก่อนเที่ยง":"หลังเที่ยง"},calendar:{sameDay:"[วันนี้ เวลา] LT",nextDay:"[พรุ่งนี้ เวลา] LT",nextWeek:"dddd[หน้า เวลา] LT",lastDay:"[เมื่อวานนี้ เวลา] LT",lastWeek:"[วัน]dddd[ที่แล้ว เวลา] LT",sameElse:"L"},relativeTime:{future:"อีก %s",past:"%sที่แล้ว",s:"ไม่กี่วินาที",m:"1 นาที",mm:"%d นาที",h:"1 ชั่วโมง",hh:"%d ชั่วโมง",d:"1 วัน",dd:"%d วัน",M:"1 เดือน",MM:"%d เดือน",y:"1 ปี",yy:"%d ปี"}}),nf.defineLocale("tl-ph",{months:"Enero_Pebrero_Marso_Abril_Mayo_Hunyo_Hulyo_Agosto_Setyembre_Oktubre_Nobyembre_Disyembre".split("_"),monthsShort:"Ene_Peb_Mar_Abr_May_Hun_Hul_Ago_Set_Okt_Nob_Dis".split("_"),weekdays:"Linggo_Lunes_Martes_Miyerkules_Huwebes_Biyernes_Sabado".split("_"),weekdaysShort:"Lin_Lun_Mar_Miy_Huw_Biy_Sab".split("_"),weekdaysMin:"Li_Lu_Ma_Mi_Hu_Bi_Sab".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"MM/D/YYYY",LL:"MMMM D, YYYY",LLL:"MMMM D, YYYY LT",LLLL:"dddd, MMMM DD, YYYY LT"},calendar:{sameDay:"[Ngayon sa] LT",nextDay:"[Bukas sa] LT",nextWeek:"dddd [sa] LT",lastDay:"[Kahapon sa] LT",lastWeek:"dddd [huling linggo] LT",sameElse:"L"},relativeTime:{future:"sa loob ng %s",past:"%s ang nakalipas",s:"ilang segundo",m:"isang minuto",mm:"%d minuto",h:"isang oras",hh:"%d oras",d:"isang araw",dd:"%d araw",M:"isang buwan",MM:"%d buwan",y:"isang taon",yy:"%d taon"},ordinalParse:/\d{1,2}/,ordinal:function(a){return a},week:{dow:1,doy:4}}),{1:"'inci",5:"'inci",8:"'inci",70:"'inci",80:"'inci",2:"'nci",7:"'nci",20:"'nci",50:"'nci",3:"'üncü",4:"'üncü",100:"'üncü",6:"'ncı",9:"'uncu",10:"'uncu",30:"'uncu",60:"'ıncı",90:"'ıncı"}),fg=(nf.defineLocale("tr",{months:"Ocak_Şubat_Mart_Nisan_Mayıs_Haziran_Temmuz_Ağustos_Eylül_Ekim_Kasım_Aralık".split("_"),monthsShort:"Oca_Şub_Mar_Nis_May_Haz_Tem_Ağu_Eyl_Eki_Kas_Ara".split("_"),weekdays:"Pazar_Pazartesi_Salı_Çarşamba_Perşembe_Cuma_Cumartesi".split("_"),weekdaysShort:"Paz_Pts_Sal_Çar_Per_Cum_Cts".split("_"),weekdaysMin:"Pz_Pt_Sa_Ça_Pe_Cu_Ct".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD.MM.YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd, D MMMM YYYY LT"},calendar:{sameDay:"[bugün saat] LT",nextDay:"[yarın saat] LT",nextWeek:"[haftaya] dddd [saat] LT",lastDay:"[dün] LT",lastWeek:"[geçen hafta] dddd [saat] LT",sameElse:"L"},relativeTime:{future:"%s sonra",past:"%s önce",s:"birkaç saniye",m:"bir dakika",mm:"%d dakika",h:"bir saat",hh:"%d saat",d:"bir gün",dd:"%d gün",M:"bir ay",MM:"%d ay",y:"bir yıl",yy:"%d yıl"},ordinalParse:/\d{1,2}'(inci|nci|üncü|ncı|uncu|ıncı)/,ordinal:function(a){if(0===a)return a+"'ıncı";var b=a%10,c=a%100-b,d=a>=100?100:null;return a+(eg[b]||eg[c]||eg[d])},week:{dow:1,doy:7}}),nf.defineLocale("tzm-latn",{months:"innayr_brˤayrˤ_marˤsˤ_ibrir_mayyw_ywnyw_ywlywz_ɣwšt_šwtanbir_ktˤwbrˤ_nwwanbir_dwjnbir".split("_"),monthsShort:"innayr_brˤayrˤ_marˤsˤ_ibrir_mayyw_ywnyw_ywlywz_ɣwšt_šwtanbir_ktˤwbrˤ_nwwanbir_dwjnbir".split("_"),weekdays:"asamas_aynas_asinas_akras_akwas_asimwas_asiḍyas".split("_"),weekdaysShort:"asamas_aynas_asinas_akras_akwas_asimwas_asiḍyas".split("_"),weekdaysMin:"asamas_aynas_asinas_akras_akwas_asimwas_asiḍyas".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD/MM/YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd D MMMM YYYY LT"},calendar:{sameDay:"[asdkh g] LT",nextDay:"[aska g] LT",nextWeek:"dddd [g] LT",lastDay:"[assant g] LT",lastWeek:"dddd [g] LT",sameElse:"L"},relativeTime:{future:"dadkh s yan %s",past:"yan %s",s:"imik",m:"minuḍ",mm:"%d minuḍ",h:"saɛa",hh:"%d tassaɛin",d:"ass",dd:"%d ossan",M:"ayowr",MM:"%d iyyirn",y:"asgas",yy:"%d isgasn"},week:{dow:6,doy:12}}),nf.defineLocale("tzm",{months:"ⵉⵏⵏⴰⵢⵔ_ⴱⵕⴰⵢⵕ_ⵎⴰⵕⵚ_ⵉⴱⵔⵉⵔ_ⵎⴰⵢⵢⵓ_ⵢⵓⵏⵢⵓ_ⵢⵓⵍⵢⵓⵣ_ⵖⵓⵛⵜ_ⵛⵓⵜⴰⵏⴱⵉⵔ_ⴽⵟⵓⴱⵕ_ⵏⵓⵡⴰⵏⴱⵉⵔ_ⴷⵓⵊⵏⴱⵉⵔ".split("_"),monthsShort:"ⵉⵏⵏⴰⵢⵔ_ⴱⵕⴰⵢⵕ_ⵎⴰⵕⵚ_ⵉⴱⵔⵉⵔ_ⵎⴰⵢⵢⵓ_ⵢⵓⵏⵢⵓ_ⵢⵓⵍⵢⵓⵣ_ⵖⵓⵛⵜ_ⵛⵓⵜⴰⵏⴱⵉⵔ_ⴽⵟⵓⴱⵕ_ⵏⵓⵡⴰⵏⴱⵉⵔ_ⴷⵓⵊⵏⴱⵉⵔ".split("_"),weekdays:"ⴰⵙⴰⵎⴰⵙ_ⴰⵢⵏⴰⵙ_ⴰⵙⵉⵏⴰⵙ_ⴰⴽⵔⴰⵙ_ⴰⴽⵡⴰⵙ_ⴰⵙⵉⵎⵡⴰⵙ_ⴰⵙⵉⴹⵢⴰⵙ".split("_"),weekdaysShort:"ⴰⵙⴰⵎⴰⵙ_ⴰⵢⵏⴰⵙ_ⴰⵙⵉⵏⴰⵙ_ⴰⴽⵔⴰⵙ_ⴰⴽⵡⴰⵙ_ⴰⵙⵉⵎⵡⴰⵙ_ⴰⵙⵉⴹⵢⴰⵙ".split("_"),weekdaysMin:"ⴰⵙⴰⵎⴰⵙ_ⴰⵢⵏⴰⵙ_ⴰⵙⵉⵏⴰⵙ_ⴰⴽⵔⴰⵙ_ⴰⴽⵡⴰⵙ_ⴰⵙⵉⵎⵡⴰⵙ_ⴰⵙⵉⴹⵢⴰⵙ".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD/MM/YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd D MMMM YYYY LT"},calendar:{sameDay:"[ⴰⵙⴷⵅ ⴴ] LT",nextDay:"[ⴰⵙⴽⴰ ⴴ] LT",nextWeek:"dddd [ⴴ] LT",lastDay:"[ⴰⵚⴰⵏⵜ ⴴ] LT",lastWeek:"dddd [ⴴ] LT",sameElse:"L"},relativeTime:{future:"ⴷⴰⴷⵅ ⵙ ⵢⴰⵏ %s",past:"ⵢⴰⵏ %s",s:"ⵉⵎⵉⴽ",m:"ⵎⵉⵏⵓⴺ",mm:"%d ⵎⵉⵏⵓⴺ",h:"ⵙⴰⵄⴰ",hh:"%d ⵜⴰⵙⵙⴰⵄⵉⵏ",d:"ⴰⵙⵙ",dd:"%d oⵙⵙⴰⵏ",M:"ⴰⵢoⵓⵔ",MM:"%d ⵉⵢⵢⵉⵔⵏ",y:"ⴰⵙⴳⴰⵙ",yy:"%d ⵉⵙⴳⴰⵙⵏ"},week:{dow:6,doy:12}}),nf.defineLocale("uk",{months:Dd,monthsShort:"січ_лют_бер_квіт_трав_черв_лип_серп_вер_жовт_лист_груд".split("_"),weekdays:Ed,weekdaysShort:"нд_пн_вт_ср_чт_пт_сб".split("_"),weekdaysMin:"нд_пн_вт_ср_чт_пт_сб".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD.MM.YYYY",LL:"D MMMM YYYY р.",LLL:"D MMMM YYYY р., LT",LLLL:"dddd, D MMMM YYYY р., LT"},calendar:{sameDay:Fd("[Сьогодні "),nextDay:Fd("[Завтра "),lastDay:Fd("[Вчора "),nextWeek:Fd("[У] dddd ["),lastWeek:function(){switch(this.day()){case 0:case 3:case 5:case 6:return Fd("[Минулої] dddd [").call(this);case 1:case 2:case 4:return Fd("[Минулого] dddd [").call(this)}},sameElse:"L"},relativeTime:{future:"за %s",past:"%s тому",s:"декілька секунд",m:Cd,mm:Cd,h:"годину",hh:Cd,d:"день",dd:Cd,M:"місяць",MM:Cd,y:"рік",yy:Cd},meridiemParse:/ночі|ранку|дня|вечора/,isPM:function(a){return/^(дня|вечора)$/.test(a)},meridiem:function(a,b,c){return 4>a?"ночі":12>a?"ранку":17>a?"дня":"вечора"},ordinalParse:/\d{1,2}-(й|го)/,ordinal:function(a,b){switch(b){case"M":case"d":case"DDD":case"w":case"W":return a+"-й";case"D":return a+"-го";default:return a}},week:{dow:1,doy:7}}),nf.defineLocale("uz",{months:"январь_февраль_март_апрель_май_июнь_июль_август_сентябрь_октябрь_ноябрь_декабрь".split("_"),monthsShort:"янв_фев_мар_апр_май_июн_июл_авг_сен_окт_ноя_дек".split("_"),weekdays:"Якшанба_Душанба_Сешанба_Чоршанба_Пайшанба_Жума_Шанба".split("_"),weekdaysShort:"Якш_Душ_Сеш_Чор_Пай_Жум_Шан".split("_"),weekdaysMin:"Як_Ду_Се_Чо_Па_Жу_Ша".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD/MM/YYYY",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"D MMMM YYYY, dddd LT"},calendar:{sameDay:"[Бугун соат] LT [да]",nextDay:"[Эртага] LT [да]",nextWeek:"dddd [куни соат] LT [да]",lastDay:"[Кеча соат] LT [да]",lastWeek:"[Утган] dddd [куни соат] LT [да]",sameElse:"L"},relativeTime:{future:"Якин %s ичида",past:"Бир неча %s олдин",s:"фурсат",m:"бир дакика",mm:"%d дакика",h:"бир соат",hh:"%d соат",d:"бир кун",dd:"%d кун",M:"бир ой",MM:"%d ой",y:"бир йил",yy:"%d йил"},week:{dow:1,doy:7}}),nf.defineLocale("vi",{months:"tháng 1_tháng 2_tháng 3_tháng 4_tháng 5_tháng 6_tháng 7_tháng 8_tháng 9_tháng 10_tháng 11_tháng 12".split("_"),monthsShort:"Th01_Th02_Th03_Th04_Th05_Th06_Th07_Th08_Th09_Th10_Th11_Th12".split("_"),weekdays:"chủ nhật_thứ hai_thứ ba_thứ tư_thứ năm_thứ sáu_thứ bảy".split("_"),weekdaysShort:"CN_T2_T3_T4_T5_T6_T7".split("_"),weekdaysMin:"CN_T2_T3_T4_T5_T6_T7".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"DD/MM/YYYY",LL:"D MMMM [năm] YYYY",LLL:"D MMMM [năm] YYYY LT",LLLL:"dddd, D MMMM [năm] YYYY LT",l:"DD/M/YYYY",ll:"D MMM YYYY",lll:"D MMM YYYY LT",llll:"ddd, D MMM YYYY LT"},calendar:{sameDay:"[Hôm nay lúc] LT",nextDay:"[Ngày mai lúc] LT",nextWeek:"dddd [tuần tới lúc] LT",lastDay:"[Hôm qua lúc] LT",lastWeek:"dddd [tuần rồi lúc] LT",sameElse:"L"},relativeTime:{future:"%s tới",past:"%s trước",s:"vài giây",m:"một phút",mm:"%d phút",h:"một giờ",hh:"%d giờ",d:"một ngày",dd:"%d ngày",M:"một tháng",MM:"%d tháng",y:"một năm",yy:"%d năm"},ordinalParse:/\d{1,2}/,ordinal:function(a){return a},week:{dow:1,doy:4}}),nf.defineLocale("zh-cn",{months:"一月_二月_三月_四月_五月_六月_七月_八月_九月_十月_十一月_十二月".split("_"),monthsShort:"1月_2月_3月_4月_5月_6月_7月_8月_9月_10月_11月_12月".split("_"),weekdays:"星期日_星期一_星期二_星期三_星期四_星期五_星期六".split("_"),weekdaysShort:"周日_周一_周二_周三_周四_周五_周六".split("_"),weekdaysMin:"日_一_二_三_四_五_六".split("_"),longDateFormat:{LT:"Ah点mm分",LTS:"Ah点m分s秒",L:"YYYY-MM-DD",LL:"YYYY年MMMD日",LLL:"YYYY年MMMD日LT",LLLL:"YYYY年MMMD日ddddLT",l:"YYYY-MM-DD",ll:"YYYY年MMMD日",lll:"YYYY年MMMD日LT",llll:"YYYY年MMMD日ddddLT"},meridiemParse:/凌晨|早上|上午|中午|下午|晚上/,meridiemHour:function(a,b){return 12===a&&(a=0),"凌晨"===b||"早上"===b||"上午"===b?a:"下午"===b||"晚上"===b?a+12:a>=11?a:a+12},meridiem:function(a,b,c){var d=100*a+b;return 600>d?"凌晨":900>d?"早上":1130>d?"上午":1230>d?"中午":1800>d?"下午":"晚上"},calendar:{sameDay:function(){return 0===this.minutes()?"[今天]Ah[点整]":"[今天]LT"},nextDay:function(){return 0===this.minutes()?"[明天]Ah[点整]":"[明天]LT"},lastDay:function(){return 0===this.minutes()?"[昨天]Ah[点整]":"[昨天]LT"},nextWeek:function(){var a,b;return a=nf().startOf("week"),b=this.unix()-a.unix()>=604800?"[下]":"[本]",0===this.minutes()?b+"dddAh点整":b+"dddAh点mm"},lastWeek:function(){var a,b;return a=nf().startOf("week"),b=this.unix()<a.unix()?"[上]":"[本]",0===this.minutes()?b+"dddAh点整":b+"dddAh点mm"},sameElse:"LL"},ordinalParse:/\d{1,2}(日|月|周)/,ordinal:function(a,b){switch(b){case"d":case"D":case"DDD":return a+"日";case"M":return a+"月";case"w":case"W":return a+"周";default:return a}},relativeTime:{future:"%s内",past:"%s前",s:"几秒",m:"1 分钟",mm:"%d 分钟",h:"1 小时",hh:"%d 小时",d:"1 天",dd:"%d 天",M:"1 个月",MM:"%d 个月",y:"1 年",yy:"%d 年"},week:{dow:1,doy:4}}),nf.defineLocale("zh-tw",{months:"一月_二月_三月_四月_五月_六月_七月_八月_九月_十月_十一月_十二月".split("_"),monthsShort:"1月_2月_3月_4月_5月_6月_7月_8月_9月_10月_11月_12月".split("_"),weekdays:"星期日_星期一_星期二_星期三_星期四_星期五_星期六".split("_"),weekdaysShort:"週日_週一_週二_週三_週四_週五_週六".split("_"),weekdaysMin:"日_一_二_三_四_五_六".split("_"),longDateFormat:{LT:"Ah點mm分",LTS:"Ah點m分s秒",L:"YYYY年MMMD日",LL:"YYYY年MMMD日",LLL:"YYYY年MMMD日LT",LLLL:"YYYY年MMMD日ddddLT",l:"YYYY年MMMD日",ll:"YYYY年MMMD日",lll:"YYYY年MMMD日LT",llll:"YYYY年MMMD日ddddLT"},meridiemParse:/早上|上午|中午|下午|晚上/,meridiemHour:function(a,b){return 12===a&&(a=0),"早上"===b||"上午"===b?a:"中午"===b?a>=11?a:a+12:"下午"===b||"晚上"===b?a+12:void 0},meridiem:function(a,b,c){var d=100*a+b;

		return 900>d?"早上":1130>d?"上午":1230>d?"中午":1800>d?"下午":"晚上"},calendar:{sameDay:"[今天]LT",nextDay:"[明天]LT",nextWeek:"[下]ddddLT",lastDay:"[昨天]LT",lastWeek:"[上]ddddLT",sameElse:"L"},ordinalParse:/\d{1,2}(日|月|週)/,ordinal:function(a,b){switch(b){case"d":case"D":case"DDD":return a+"日";case"M":return a+"月";case"w":case"W":return a+"週";default:return a}},relativeTime:{future:"%s內",past:"%s前",s:"幾秒",m:"一分鐘",mm:"%d分鐘",h:"一小時",hh:"%d小時",d:"一天",dd:"%d天",M:"一個月",MM:"%d個月",y:"一年",yy:"%d年"}}),nf);return fg});