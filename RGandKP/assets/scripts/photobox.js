﻿/*!
photobox v1.5
(c) 2012 Yair Even Or <http://dropthebit.com>
	
which is by itself based on code from Slimbox v1.7 - The ultimate lightweight Lightbox clone
(c) 2007-2009 Christophe Beyls <http://www.digitalia.be>
	
Uses jQuery-mousewheel Version: 3.0.6
(c) 2009 Brandon Aaron <http://brandonaaron.net>
	
MIT-style license.
*/

(function ($, doc) {
    var win = $(window), Photobox, options, images = [], imageLinks, activeImage = -1, activeURL, prevImage, nextImage, autoPlayTimer = false, thumbsStripe, docElm, APControl,
		transitionend = "transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd",
		isOldIE = !('placeholder' in doc.createElement('input')),
		isIe = !!window.ActiveXObject,
		isMobile = 'ontouchend' in doc,
		thumbsContainerWidth, thumbsTotalWidth, activeThumb = $(),
		blankImg = "data:image/gif;base64,R0lGODlhAQABAIAAAP///////yH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==",
		transformOrigin = getPrefixed('transformOrigin'),
		transition = getPrefixed('transition'),

    // Preload images
		preload = {}, preloadPrev = new Image(), preloadNext = new Image(),
    // DOM elements
		closeBtn, image, prevBtn, nextBtn, caption, pbLoader, autoplayBtn, thumbs,

		defaults = {
		    loop: true, 			// Allows to navigate between first and last images
		    thumbs: true, 			// Show gallery thumbnails below the presented photo
		    counter: true, 			// Counter text. Use {x} for current image and {y} for total e.g. Image {x} of {y}
		    title: true, 			// show the original alt or title attribute of the image's thumbnail
		    autoplay: false, 			// should autoplay on first time or not
		    time: 3000, 			// autoplay interna, in miliseconds (less than 1000 will hide the autoplay button)
		    hideFlash: true, 			// Hides flash elements on the page when photobox is activated. NOTE: flash elements must have wmode parameter set to "opaque" or "transparent" if this is set to false
		    keys: {
		        close: '27, 88, 67', 	// keycodes to close Picbox, default: Esc (27), 'x' (88), 'c' (67)
		        prev: '37, 80',            // keycodes to navigate to the previous image, default: Left arrow (37), 'p' (80)
		        next: '39, 78'             // keycodes to navigate to the next image, default: Right arrow (39), 'n' (78)
		    }
		},

    // DOM structure
		overlay = $('<div id="pbOverlay">').hide().append(
					pbLoader = $('<div class="pbLoader"><b></b><b></b><b></b></div>'),
					prevBtn = $('<div id="pbPrevBtn" class="prevNext"><b></b></div>').on('click', next_prev),
					nextBtn = $('<div id="pbNextBtn" class="prevNext"><b></b></div>').on('click', next_prev),
					imageWrap = $('<div class="imageWrap">').append(
						image = $('<img>')
					)[0],
					closeBtn = $('<div id="pbCloseBtn">').append('<b>×</b>').on('click', close)[0],
					autoplayBtn = $('<div id="pbAutoplayBtn">').append(
						$('<div class="pbProgress">')
					),
					caption = $('<div id="pbCaption">').append('<div class="title"><div class="counter">',
						thumbs = $('<div>').addClass('pbThumbs')
					)
				);
    /*
    Initialization (on DOM ready)
    */
    $(doc).ready(function () {
        // if useragent is IE < 10 (user deserves a slap on the face, but I gotta support them still...)
        isOldIE && overlay.addClass('msie');

        autoplayBtn.on('click', APControl.toggle);
        // attach a delegated event on the thumbs container
        thumbs.on('click', 'a', thumbsStripe.click);
        // enable scrolling gesture on mobile
        isMobile && thumbs.css('overflow', 'auto');

        $(doc.body).prepend($(overlay));

        // need this for later:
        docElm = doc.documentElement;
    });

    $.fn.photobox = function (target, settings) {
        if (typeof target != 'string')
            target = 'a';

        var _options = $.extend({}, defaults, settings || {}),
			photobox = new Photobox(_options, this, target);
        photobox.init();

        return this;
    }

    Photobox = function (_options, object, target) {
        this.options = $.extend({}, _options);
        this.target = target;
        this.selector = $(object || doc);

        this.thumbsList = null;
        // filter the links which actually HAS an image as a child
        var filtered = this.imageLinksFilter(object.find(target));

        this.imageLinks = filtered[0];
        this.images = filtered[1];
    };

    Photobox.prototype = {
        init: function () {
            var that = this;
            // Saves the unique Options object to the "selector" object to handle multiple galleries
            this.selector.data('_photobox', this);

            // only generates the thumbStripe once, and listen for any DOM changes on the selector element, if so, re-generate
            if (this.options.thumbs)
            // generate gallery thumbnails every time (cause links might have been changed dynamicly)
                this.thumbsList = thumbsStripe.generate(this.imageLinks);

            // Removed in favor of event delegation
            //$(imageLinks).off('click').on('click', openPhotobox );
            this.selector.on('click.photobox', this.target, function (e) {
                e.preventDefault();
                that.open(this);
            });

            // if any node was added or removed from the Selector of the gallery
            this.observerTimeout = null;

            if (this.selector[0].nodeType == 1) // observe normal nodes
                this.observeDOM(this.selector[0], function () {
                    // use a timeout to prevent more than DOM change event fireing at once, and also to overcome the fact that IE's DOMNodeRemoved is fired BEFORE elements were actually removed
                    clearTimeout(this.observerTimeout);
                    this.observerTimeout = setTimeout(function () {
                        var filtered = that.imageLinksFilter(that.selector.find(that.target));
                        that.imageLinks = filtered[0];
                        that.images = filtered[1];
                        that.thumbsList = thumbsStripe.generate(that.imageLinks);
                    }, 50);
                });
        },
        open: function (link) {
            var startImage = $.inArray(link, this.imageLinks);
            // if image link does not exist in the imageLinks array (probably means it's not a valid part of the galery)
            if (startImage == -1) return false;

            // load the right gallery selector...
            options = this.options;
            images = this.images;
            // clean up if another gallery was veiwed before, which had a thumbsList
            thumbs.html(this.thumbsList);

            overlay[options.thumbs ? 'addClass' : 'removeClass']('thumbs');

            // things to hide if there are less than 2 images
            if (this.images.length < 2)
                overlay.removeClass('thumbs hasArrows hasCounter hasAutoplay');
            else {
                overlay.addClass('hasArrows hasCounter')

                // check is the autoplay button should be visible (per gallery) and if so, should it autoplay or not.
                if (options.time > 1000) {
                    overlay.addClass('hasAutoplay');
                    if (options.autoplay)
                        APControl.progress.start();
                    else
                        APControl.pause();
                }
                else
                    overlay.removeClass('hasAutoplay');
            }

            setup(1);
            return changeImage(startImage, true);
        },
        imageLinksFilter: function (obj) {
            var images = [];
            return [obj.filter(function (i) {
                var link = this, firstChild = link.firstElementChild || this.children[0];
                // if no img child found in the link
                if (!firstChild || !firstChild.tagName || firstChild.tagName.toLowerCase() != 'img')
                    return false; // remove from array
                images.push([link.href, firstChild.getAttribute('alt') || firstChild.getAttribute('title')]);
                return true;
            }), images];
        },
        //check if DOM nodes were added or removed, to re-build the imageLinks and thumbnails
        observeDOM: (function () {
            var MutationObserver = window.MutationObserver || window.WebKitMutationObserver,
				eventListenerSupported = window.addEventListener;

            return function (obj, callback) {
                if (MutationObserver) {
                    // define a new observer
                    var obs = new MutationObserver(function (mutations, observer) {
                        if (mutations[0].addedNodes.length || mutations[0].removedNodes.length)
                            callback();
                    });
                    // have the observer observe foo for changes in children
                    obs.observe(obj, { childList: true, subtree: true });
                }
                else if (eventListenerSupported) {
                    obj.addEventListener('DOMNodeInserted', callback, false);
                    obj.addEventListener('DOMNodeRemoved', callback, false);
                }
            }
        })()
    }

    // manage the (bottom) thumbs strip
    thumbsStripe = {
        // returns a <ul> element which is populated with all the gallery links and thumbs
        generate: function (imageLinks) {
            var thumbsList = $('<ul>'), link, elements = [], i, title;

            for (i = imageLinks.toArray().length; i--; ) {
                link = imageLinks[i];
                title = link.children[0].title || link.children[0].alt || '';
                elements.push('<li><a href="' + link.href + '"><img src="' + link.children[0].src + '" alt="" title="' + title + '" /></a></li>');
            };

            thumbsList.html(elements.reverse().join(''));
            return thumbsList;
        },

        click: function (e) {
            e.preventDefault();

            activeThumb.removeClass('active');
            activeThumb = $(this).parent().addClass('active');

            var imageIndex = $(this.parentNode).index();
            return changeImage(imageIndex, 0, 1);
        }
    }

    // Autoplay controller
    APControl = {
        play: function () {
            autoPlayTimer = setTimeout(function () { changeImage(nextImage) }, options.time);
            APControl.progress.start();
            autoplayBtn.removeClass('play');
            APControl.setTitle('Click to stop autoplay');
            options.autoplay = true;
        },
        pause: function () {
            clearTimeout(autoPlayTimer);
            APControl.progress.reset();
            autoplayBtn.addClass('play');
            APControl.setTitle('Click to resume autoplay');
            options.autoplay = false;
        },
        progress: {
            reset: function () {
                autoplayBtn.find('div').removeAttr('style');
                setTimeout(function () { autoplayBtn.removeClass('playing') }, 200);
            },
            start: function () {
                if (!isOldIE)
                    autoplayBtn.find('div').css(transition, options.time + 'ms');
                autoplayBtn.addClass('playing');
            }
        },
        // sets the button Title property
        setTitle: function (text) {
            if (text)
                autoplayBtn.prop('title', text + ' (every ' + options.time / 1000 + ' seconds)');
        },
        // the button onClick handler
        toggle: function (e) {
            e.stopPropagation();
            if (options.autoplay)
                APControl.pause();
            else {
                APControl.play();
            }
        }
    }

    function getPrefixed(prop) {
        var i, s = doc.createElement('p').style, v = ['ms', 'O', 'Moz', 'Webkit'];
        if (s[prop] == '') return prop;
        prop = prop[0].toUpperCase() + prop.slice(1);
        for (i = v.length; i--; )
            if (s[v[i] + prop] == '')
                return (v[i] + prop);
    }

    // things that should happend everytime the gallery opens or closes
    function setup(open) {
        if (open) {
            // a hack to change the image src to nothing, because you can't do that in CHROME
            image[0].src = blankImg;
            image.css({ 'transition': '0s' }).removeAttr('style'); // reset any transition that might be on the element

            overlay.show().addClass('show');

            // cancel prppogation up to the overlay container so it won't close
            overlay.on('click', 'img', function (e) {
                e.stopPropagation();
            });

            overlay.on(transitionend, function () {
                overlay.off(transitionend).addClass('on'); // class 'on' is set when the initial fade-in of the overlay is done
            });

            if (isOldIE)
                overlay.trigger('MSTransitionEnd');

            if (options.thumbs) {
                activeThumb.removeAttr('class');
                $(win).on('resize.photobox', thumbsWindowResize);
                thumbsWindowResize(); // initiate the function for the first time without any window resize
            }
        }

        if (options.hideFlash) {
            $.each(["object", "embed"], function (i, val) {
                $(val).each(function () {
                    if (open) this._photobox = this.style.visibility;
                    this.style.visibility = open ? "hidden" : this._photobox;
                });
            });
        }

        var fn = open ? "on" : "off";
        $(doc)[fn]({ "keydown.photobox": keyDown, "mousewheel.photobox": scrollZoom });
    }

    function thumbsWindowResize() {
        thumbsContainerWidth = thumbs[0].clientWidth;
        thumbsTotalWidth = thumbs[0].firstChild.clientWidth;

        var state = thumbsTotalWidth > thumbsContainerWidth ? 'on' : 'off';
        !isMobile && thumbs[state]('mousemove', thumbsMove);
    }

    function thumbsMove(e) {
        var ratio = thumbsTotalWidth / thumbsContainerWidth;
        thumbs[0].scrollLeft = e.pageX * ratio - 500;
    }

    // Highlights the thumb which represents the photo and centers the thumbs viewer on it
    function changeActiveThumb(index, delay, thumbClick) {
        activeThumb.removeClass('active');
        activeThumb = thumbs.find('li').eq(index).addClass('active');
        if (thumbClick) return;
        // set the scrollLeft position of the thumbs list to show the active thumb
        var pos = activeThumb[0].offsetLeft + (activeThumb[0].clientWidth) / 2 - docElm.clientWidth / 2;

        delay && thumbs.delay(800);
        !delay && thumbs.stop();
        thumbs.animate({ scrollLeft: pos }, 500, 'swing');
        //thumbs[0].scrollLeft = pos;
    }

    function keyDown(event) {
        var code = event.keyCode, ok = options.keys, result;
        // Prevent default keyboard action (like navigating inside the page)
        return ok.close.indexOf(code) >= 0 && close() ||
               ok.next.indexOf(code) >= 0 && next_prev('next') ||
               ok.prev.indexOf(code) >= 0 && next_prev('prev') || true;
    }

    function next_prev(direction) {
        // don't get crazy when user clicks next or prev buttons rapidly
        if (overlay.hasClass('hide'))
            return false;
        var img = (this.id == 'pbPrevBtn' || direction == 'prev') ? prevImage : nextImage,
			mouseOverThumbs = thumbs.css('clear') == 'both';

        changeImage(img, 0, mouseOverThumbs);
        return false;
    }

    function changeImage(imageIndex, firstTime, thumbClick) {
        if (!imageIndex || imageIndex < 0)
            imageIndex = 0;

        activeImage = imageIndex;
        activeURL = images[imageIndex][0];
        prevImage = (activeImage || (options.loop ? images.length : 0)) - 1;
        nextImage = ((activeImage + 1) % images.length) || (options.loop ? 0 : -1);

        stop();

        overlay.addClass('pbLoading').removeClass('error');

        !options.loop && imageIndex == images.length - 1 ? nextBtn.addClass('hide') : nextBtn.removeClass('hide');
        !options.loop && imageIndex == 0 ? prevBtn.addClass('hide') : prevBtn.removeClass('hide');

        if (options.thumbs)
            changeActiveThumb(imageIndex, firstTime, thumbClick);

        if (prevImage >= 0) preloadPrev.src = images[prevImage][0];
        if (nextImage >= 0) preloadNext.src = images[nextImage][0];


        options.counter && caption.find('.counter').text('( ' + (activeImage + 1) + ' / ' + images.length + ' )');
        options.title && caption.find('.title').text(images[imageIndex][1]);

        if (isOldIE) overlay.addClass('hide'); // should wait for the image onload. just hide the image while old ie display the preloader
        //image.siblings().hide();
        options.autoplay && APControl.progress.reset();
        preload = new Image();
        preload.onload = function () { showImage(firstTime) };
        preload.onerror = function () { imageError() };
        preload.src = activeURL;
    }

    // handles all image loading error (if image is dead)
    function imageError() {
        overlay.removeClass("pbLoading").addClass('error');
        image[0].src = blankImg; // set the source to a blank image
        preload.onerror = null;
    }

    function showImage(firstTime) {
        overlay.removeClass("pbLoading").addClass('hide'); // while transitioning an image, do not apply the 'zoomable' class
        image.removeClass('zoomable');

        if (!firstTime) {
            image.on(transitionend, show);
            // manually trigger for browser lacking transitions support
            if (isOldIE)
                show();
        }
        else
            show();

        // after hiding the last seen image, show the new one
        function show() {
            image.off(transitionend).css({ 'transition': '0s' });
            image[0].src = activeURL;
            image[0].className = 'prepare';

            // filthy hack for the transitionend event, but cannot work without it:
            setTimeout(function () {
                overlay.removeClass('hide');
                image.removeAttr('style').prop('class', '');
                setTimeout(function () {
                    image[0].className = '';
                    image.on(transitionend, showImageEnd);
                    if (isOldIE) showImageEnd(); // IE9 and below don't support transitionEnd...
                }, 0);
            }, 50);
        }
    }

    function showImageEnd() {
        image.off(transitionend);
        image.addClass('zoomable');
        if (autoplayBtn && options.autoplay) {
            APControl.play();
        }
    }

    function scrollZoom(e, delta) {
        var zoomLevel = image.data('zoom') || 1,
			getSize = image[0].getBoundingClientRect();

        zoomLevel = zoomLevel + (delta / 10);

        if (zoomLevel < 0.1)
            zoomLevel = 0.1;

        image.data('zoom', zoomLevel).css({ 'transform': 'scale(' + zoomLevel + ')' });

        // check if dragging should take effect (if image is larger than the window
        if (getSize.height > docElm.clientHeight || getSize.width > docElm.clientWidth) {
            $(doc).on('mousemove.photobox', imageReposition);
        }
        else {
            $(doc).off('mousemove.photobox');
            image[0].style[transformOrigin] = '50% 50%';
        }

        return false;
    }
    // moves the image around during zoom mode on mousemove event
    function imageReposition(e) {
        var y = (e.clientY / docElm.clientHeight) * (docElm.clientHeight + 200) - 100, // extend the range of the Y axis by 100 each side
			yDelta = y / docElm.clientHeight * 100,
			xDelta = e.clientX / docElm.clientWidth * 100,
			origin = xDelta.toFixed(2) + '% ' + yDelta.toFixed(2) + '%';

        image[0].style[transformOrigin] = origin;
    }

    function stop() {
        clearTimeout(autoPlayTimer);
        $(doc).off('mousemove.photobox');
        preload.onload = function () { };
        preload.src = preloadPrev.src = preloadNext.src = activeURL;
    }

    function close() {
        stop();
        setup();

        overlay.removeClass('on').addClass('hide');

        image.on(transitionend, hide);
        isOldIE && hide();

        function hide() {
            overlay.removeClass('show on hide');
            image.removeAttr('class').removeAttr('src').removeAttr('style').off().data('zoom', 1);
            if (isIe)
                setTimeout(function () { overlay.hide(); }, 200);
        }

        // fallback if the 'transitionend' method didn't catch
        setTimeout(hide, 500);

        return false;
    }


    /*! Copyright (c) 2011 Brandon Aaron (http://brandonaaron.net)
    * Licensed under the MIT License (LICENSE.txt).
    *
    * Version: 3.0.6
    */
    var types = ['DOMMouseScroll', 'mousewheel'];

    if ($.event.fixHooks) {
        for (var i = types.length; i; )
            $.event.fixHooks[types[--i]] = $.event.mouseHooks;
    }

    $.event.special.mousewheel = {
        setup: function () {
            if (this.addEventListener) {
                for (var i = types.length; i; )
                    this.addEventListener(types[--i], handler, false);
            } else
                this.onmousewheel = handler;
        },
        teardown: function () {
            if (this.removeEventListener) {
                for (var i = types.length; i; )
                    this.removeEventListener(types[--i], handler, false);
            } else
                this.onmousewheel = null;
        }
    };

    $.fn.extend({
        mousewheel: function (fn) {
            return fn ? this.bind("mousewheel", fn) : this.trigger("mousewheel");
        },
        unmousewheel: function (fn) {
            return this.unbind("mousewheel", fn);
        }
    });


    function handler(event) {
        var orgEvent = event || window.event, args = [].slice.call(arguments, 1), delta = 0, returnValue = true, deltaX = 0, deltaY = 0;
        event = $.event.fix(orgEvent);
        event.type = "mousewheel";

        // Old school scrollwheel delta
        if (orgEvent.wheelDelta) { delta = orgEvent.wheelDelta / 120; }
        if (orgEvent.detail) { delta = -orgEvent.detail / 3; }

        // New school multidimensional scroll (touchpads) deltas
        deltaY = delta;

        // Gecko
        if (orgEvent.axis !== undefined && orgEvent.axis === orgEvent.HORIZONTAL_AXIS) {
            deltaY = 0;
            deltaX = -1 * delta;
        }

        // Webkit
        if (orgEvent.wheelDeltaY !== undefined) { deltaY = orgEvent.wheelDeltaY / 120; }
        if (orgEvent.wheelDeltaX !== undefined) { deltaX = -1 * orgEvent.wheelDeltaX / 120; }

        // Add event and delta to the front of the arguments
        args.unshift(event, delta, deltaX, deltaY);
        return ($.event.dispatch || $.event.handle).apply(this, args);
    }
})(jQuery, document);