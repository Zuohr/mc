<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Miniport 2.5 by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Transit Mate!</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:300,600,700"
	rel="stylesheet" />
<script src="js/jquery.min.js"></script>
<script src="js/config.js"></script>
<script src="js/skel.min.js"></script>

<SCRIPT>
	function showlocation() {
		navigator.geolocation.watchPosition(callback);
	}
	function callback(position) {
		document.getElementById('lat').innerHTML = position.coords.latitude
				+ ' ' + position.coords.longitude;

	}
</SCRIPT>

<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?sensor=true">
	
</script>

<script>
	var isHome = true;
	var directionsDisplay;
	var map;
	var start = new google.maps.LatLng(40.443552, -79.945870);
	var count = 0;
	var marker = null;

	function initialize() {
		directionsDisplay = new google.maps.DirectionsRenderer();
		var mapOptions = {
			zoom : 15,
			center : start
		}
		map = new google.maps.Map(document.getElementById("map-canvas"),
				mapOptions);
		drawCurrentLocation();
		drawNearestBusStops();

	}

	function drawCurrentLocation() {
		var marker = new google.maps.Marker({
			position : start,
			map : map,
			title : "My location"
		});
	}

	function drawNearestBusStops() {
		var imageStops = 'images/bus-stop20.png';

		var latLngArray = [ new google.maps.Marker({
			position : new google.maps.LatLng(40.444609, -79.945908),
			map : map,
			icon : imageStops,
			title : "Forbes Ave Opp Hamburg Bldg"
		}), new google.maps.Marker({
			position : new google.maps.LatLng(40.444647, -79.943554),
			map : map,
			icon : imageStops,
			title : "Forbes Ave at Morewood Ave FS (Carnegie Mellon)"
		}), new google.maps.Marker({
			position : new google.maps.LatLng(40.444540, -79.948715),
			map : map,
			icon : imageStops,
			title : "Craig St at Forbes"
		}) ];
		var contentString = [
				'<div id="content">'
						+ '<p id="firstHeading">Forbes Ave Opp Hamburg Bldg</p>'
						+ '<p><Buses from this station:</p>'
						+ '<p>28X 58 61A 61B 61C 61D 67 69</p>' + '</div>',
				'<div id="content">'
						+ '<p id="firstHeading">Forbes Ave at Morewood Ave FS (Carnegie Mellon)</p>'
						+ '<p><Buses from this station:</p>'
						+ '<p>28X 58 61A 61B 61C 61D 67 69</p>' + '</div>' ];
		/*var infowindow = new google.maps.InfoWindow({
				content: contentString[0]
			});
		google.maps.event.addListener(latLngArray[0], 'click', function() {
			infowindow.open(map,latLngArray[0]);
		});*/
		for (var i = 0; i < latLngArray.length; i++) {
			var infowindow = new google.maps.InfoWindow({
				content : contentString[i]
			});
			google.maps.event.addListener(latLngArray[i], 'click', function() {
				infowindow.open(map, latLngArray[i]);
			});
		}
		;
	}
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(success);
	} else {
		error('Geo Location is not supported');
	}
</script>
<script>
	var directionsDisplay;
	var directionsService = new google.maps.DirectionsService();
	var map1;
	var start = new google.maps.LatLng(40.443552, -79.945870);
	var end = new google.maps.LatLng(40.4541633, -79.9444427);
	var count = 0;
	var busArray = [ new google.maps.LatLng(40.434096, -79.922908),
			new google.maps.LatLng(40.436366, -79.922865),
			new google.maps.LatLng(40.437526, -79.922887),
			new google.maps.LatLng(40.438097, -79.924346),
			new google.maps.LatLng(40.438097, -79.926041),
			new google.maps.LatLng(40.437983, -79.928745),
			new google.maps.LatLng(40.437869, -79.930418),
			new google.maps.LatLng(40.438424, -79.933658),
			new google.maps.LatLng(40.439486, -79.934667),
			new google.maps.LatLng(40.441086, -79.936169) ];
	var image = 'images/bus.png';
	var marker = null;

	function initialize1() {
		directionsDisplay = new google.maps.DirectionsRenderer();
		var mapOptions = {
			zoom : 13,
			center : start
		}
		map1 = new google.maps.Map(document.getElementById("map-canvas1"),
				mapOptions);
		directionsDisplay.setMap(map1);
	}

	function calcRoute() {
		var request = {
			origin : start,
			destination : end,
			travelMode : google.maps.TravelMode.TRANSIT,
			transitOptions : {
				departureTime : new Date(1346675679473)
			},
			provideRouteAlternatives : true
		};
		var routes1;
		var routes2;
		directionsService.route(request, function(result, status) {
			routes1 = result.routes[0];
			routes2 = result.routes[1];
			if (status == google.maps.DirectionsStatus.OK) {
				if (document.getElementById('route').value != '71A') {
					result.routes[0] = result.routes[2];
				}
				directionsDisplay.setDirections(result);
			}
		});
		setInterval("drawBus();", 2000);
	}

	function getBusArray() {
		return busArray[(count++) % 10];
	}

	function drawBus() {
		if (marker != null) {
			marker.setMap(null);
		}
		marker = new google.maps.Marker({
			position : busArray[(count++) % 10],
			map : map1,
			icon : image,
			title : 'Bus is here'
		});
	}

	function changeDisplay() {
		var homeBlock = document.getElementById("home");
		var resultBlock = document.getElementById("result");
		if (homeBlock.style.display == "block") {
			homeBlock.style.display = "none";
			resultBlock.style.display = "block";
			initialize1();
			calcRoute();
		} else {
			homeBlock.style.display = "block";
			resultBlock.style.display = "none";
		}
	}
</script>
<noscript>
	<link rel="stylesheet" href="css/skel-noscript.css" />
	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="css/style-desktop.css" />
</noscript>
<!--[if lte IE 9]><link rel="stylesheet" href="css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><script src="js/html5shiv.js"></script><link rel="stylesheet" href="css/ie8.css" /><![endif]-->
<!--[if lte IE 7]><link rel="stylesheet" href="css/ie7.css" /><![endif]-->
<style type="text/css">
#map-canvas,#map-canvas1 {
	height: 220px;
	width: 360px
}

#home {
	display: block;
}

#result {
	display: none;
}
</style>

</head>
<body onload="initialize();">

	<!-- Nav -->
	<nav id="nav">
		<ul class="container">
			<li><a href="#top">Home</a></li>
			<li><a href="#contact">Find Bus</a></li>
			<li><a href="#work">What's Around</a></li>
			<li><a href="#portfolio">Subscribe</a></li>
			<li><a
				href="https://policy-portal.truste.com/core/privacy-policy/eBiz/c14b44c8-660c-457f-ac6d-eeee6ebed927#landingPage">Privacy
					Policy</a></li>
		</ul>
	</nav>

	<!-- Home -->

	<div class="wrapper wrapper-style1 wrapper-first">
		<article class="container" id="top">
			<div class="row">
				<div class="4u">
					<span class="me image image-full"><img src="images/me.jpg"
						alt="" /></span>
				</div>
				<div class="8u">
					<span id="lat"></span>
					<header>
						<h1>
							Welcome to<strong> Transit Mate</strong>.
						</h1>
					</header>

					<p>PAAC Buses a click away. Real time updates that reduce
						waiting times. Never miss a bus by Subscribing to our alerts.
						Discover great places and events!</p>
					<a href="#contact" class="button button-big">Start Travelling</a>
				</div>
			</div>
		</article>
	</div>
	<!-- Contact -->

	<div class="wrapper wrapper-style4" id="home">
		<article id="contact" class="container small">
			<!--<header>
				<span>Your Current Location
					<article id="ma"></article>
				</span>
			</header>-->
			<h2>Find a Bus Near You!</h2>
			<div>
				<div class="row">
					<div class="12u">
						<form method="post" action="#">
							<div>
								<div class="row half">
									<div class="6u" align="center">
										<table align="center" width="90%">
											<tr>
												<td>From</td>
												<td><input type="text" name="origin"
													value="My location"
													onclick="if (this.value=='My location') {this.value='';}"
													required="required" id="name" placeholder="Origin"
													align="center" /></td>
											</tr>
											<tr>
												<td>To</td>
												<td><input type="text" name="end" required="required"
													id="name" placeholder="Destination/Bus Route" /></td>
											</tr>
											<tr>
												<td>Depart at&nbsp;&nbsp;&nbsp;</td>
												<td><input type="text" name="time" required="required"
													id="time" placeholder="hh:mm" value="Leave now"
													onclick="if (this.value == 'Leave now') {this.value = '';}" />
												</td>
											</tr>
										</table>

										<!-- <datalist id="DataList">
											<option value="Centre Ave at Morewood Ave"></option>
											<option value="Centre Ave at Millvale Ave"></option>
											<option value="Centre Ave Opp Neville St"></option>
											<option value="Centre Ave at Melwood Ave"></option>
											<option value="Craig St at Centre Ave Fs"></option>
											<option value="Craig St at Bayard St"></option>
											<option value="Craig St at 5th Ave"></option>
										</datalist></li> -->

									</div>
								</div>
								<div class="row">
									<div class="12u">
										<input type="button" value="Search" id="home" class="button"
											onclick="changeDisplay()" />
									</div>
								</div>
								<span>
									<div id="map-canvas"></div>
								</span>
							</div>
						</form>
					</div>
				</div>

			</div>
		</article>
	</div>

	<div class="wrapper wrapper-style3" id="result">
		<article id="contact" class="container small">
			<header>
				<div align="center" id="panel">
					<b>Show route </b> <select id="route" onchange="calcRoute();">
						<option value="61C-71A">61C - 71A</option>
						<option value="71A">71A</option>
					</select> <input type="button" value="Back" onclick="changeDisplay()" />
				</div>
			</header>
			<div>
				<div class="row">
					<div class="4u">

						<article class="box box-style2">
							<h3 align="center">61C - 71A</h3>
							<p align="center">
								<b>arrive in 5 min, take 15 min in total</b>
							</p>
							<p align="center">
								<b>61C (in 5 min)</b>
							</p>
							<table>
								<tr>
									<td>Get on at</td>
									<td>Forbes Ave Opp Hamburg Bldg (about 3 min)</td>
								</tr>
								<tr>
									<td>Get off at</td>
									<td>5th Ave at Bigelow Blvd (Pitt) (5 min, 4 stops)</td>
								</tr>
								<tr>
									<td>Currently at</td>
									<td>5th Ave at Bigelow Blvd (Pitt) (3 stops away)</td>
								</tr>
								<tr>
									<td>Estimated Arrival&nbsp;&nbsp;&nbsp;</td>
									<td>12:07 pm</td>
								</tr>
								<tr>
									<td>Wait Time</td>
									<td>6 min</td>
								</tr>
							</table>
							<button class="button">Subscribe</button>
							<hr>
							<p align="center">
								<b>71A (in 9 min)</b>
							</p>
							<table>
								<tr>
									<td>Get on at</td>
									<td>5th Ave at Bigelow Blvd (Pitt) (about 0 min)</td>
								</tr>
								<tr>
									<td>Get off at</td>
									<td>Centre Ave at Morewood Ave (6 min, 9 stops)</td>
								</tr>
								<tr>
									<td>Currently at</td>
									<td>5th Ave at Bigelow Blvd (Pitt) (2 stops away)</td>
								</tr>
								<tr>
									<td>Estimated Arrival&nbsp;&nbsp;&nbsp;</td>
									<td>12:07 pm</td>
								</tr>
								<tr>
									<td>Wait Time</td>
									<td>6 min</td>
								</tr>
							</table>
							<button class="button">Subscribe</button>
						</article>
						<article class="box box-style2">
							<h3 align="center">71A</h3>
							<p align="center">
								<b>arrive in 13 min, take 23 min in total</b>
							</p>
							<table>
								<tr>
									<td>Get on at</td>
									<td>Craig St at Park Plaza (about 10 min)</td>
								</tr>
								<tr>
									<td>Get off at</td>
									<td>Centre Ave at Morewood Ave (10 min, 6 stops)</td>
								</tr>
								<tr>
									<td>Currently at</td>
									<td>5th Ave at Bigelow Blvd (Pitt) (8 stops away)</td>
								</tr>
								<tr>
									<td>Estimated Arrival&nbsp;&nbsp;&nbsp;</td>
									<td>12:07 pm</td>
								</tr>
								<tr>
									<td>Wait Time</td>
									<td>3 min</td>
								</tr>
							</table>
							<button class="button">Subscribe</button>
						</article>
					</div>
				</div>

			</div>

		</article>
	</div>
	<!-- Work -->
	<div class="wrapper wrapper-style2">
		<article id="work">
			<header>
				<h2>What's Around.</h2>
				<span>Find Amazing Food, Great Places & Events Near You .</span>
			</header>
			<div class="container">
				<div class="row">
					<div class="4u">
						<section class="box box-style1">
							<span class="fa featured fa-comments-o"></span>
							<h3>Consequat lorem</h3>
							<p>Ornare nulla proin odio consequat sapien vestibulum ipsum
								primis sed amet consequat lorem dolore.</p>
						</section>
					</div>
					<div class="4u">
						<section class="box box-style1">
							<span class="fa featured fa-file-o"></span>
							<h3>Lorem dolor tempus</h3>
							<p>Ornare nulla proin odio consequat sapien vestibulum ipsum
								primis sed amet consequat lorem dolore.</p>
						</section>
					</div>
					<div class="4u">
						<section class="box box-style1">
							<span class="fa featured fa-thumbs-o-up"></span>
							<h3>Feugiat posuere</h3>
							<p>Ornare nulla proin odio consequat sapien vestibulum ipsum
								primis sed amet consequat lorem dolore.</p>
						</section>
					</div>
				</div>
			</div>
			<footer>
				<p>Lorem ipsum dolor sit sapien vestibulum ipsum primis?</p>
				<a href="#portfolio" class="button button-big">See some of my
					recent work</a>
			</footer>
		</article>
	</div>

	<!-- Portfolio -->
	<div class="wrapper wrapper-style3">
		<article id="portfolio">
			<header>
				<h2>Subscribe to PAAC Buses!</h2>
				<span>Never miss or wait for a bus with our up-to-date
					alerts.</span>
			</header>
			<div class="container">
				<div class="row">
					<div class="12u"></div>
				</div>
				<div class="row">
					<div class="4u">
						<article class="box box-style2">
							<a href="http://flypixel.com/generic-smartphone/8949517882265310"
								class="image image-full"><img src="images/portfolio01.jpg"
								alt="" /></a>
							<h3>
								<a
									href="http://flypixel.com/generic-smartphone/8949517882265310">Magna
									feugiat</a>
							</h3>
							<p>Ornare nulla proin odio consequat.</p>
						</article>
					</div>
					<div class="4u">
						<article class="box box-style2">
							<a href="http://flypixel.com/n33" class="image image-full"><img
								src="images/portfolio02.jpg" alt="" /></a>
							<h3>
								<a href="http://flypixel.com/n33">Veroeros primis</a>
							</h3>
							<p>Ornare nulla proin odio consequat.</p>
						</article>
					</div>
					<div class="4u">
						<article class="box box-style2">
							<a href="http://flypixel.com/wood-ui-kit/3574765984616310"
								class="image image-full"><img src="images/portfolio03.jpg"
								alt="" /></a>
							<h3>
								<a href="http://flypixel.com/wood-ui-kit/3574765984616310">Lorem
									ipsum</a>
							</h3>
							<p>Ornare nulla proin odio consequat.</p>
						</article>
					</div>
				</div>
				<div class="row">
					<div class="4u">
						<article class="box box-style2">
							<a href="http://flypixel.com/n33-pattern-set-1/3522389001865317"
								class="image image-full"><img src="images/portfolio04.jpg"
								alt="" /></a>
							<h3>
								<a href="http://flypixel.com/n33-pattern-set-1/3522389001865317">Tempus
									dolore</a>
							</h3>
							<p>Ornare nulla proin odio consequat.</p>
						</article>
					</div>
					<div class="4u">
						<article class="box box-style2">
							<a href="http://flypixel.com/cityscape/9803996277226316"
								class="image image-full"><img src="images/portfolio05.jpg"
								alt="" /></a>
							<h3>
								<a href="http://flypixel.com/cityscape/9803996277226316">Feugiat
									aliquam</a>
							</h3>
							<p>Ornare nulla proin odio consequat.</p>
						</article>
					</div>
					<div class="4u">
						<article class="box box-style2">
							<a href="http://flypixel.com/n33" class="image image-full"><img
								src="images/portfolio06.jpg" alt="" /></a>
							<h3>
								<a href="http://flypixel.com/n33">Sed amet ornare</a>
							</h3>
							<p>Ornare nulla proin odio consequat.</p>
						</article>
					</div>
				</div>
			</div>
			<footer>
				<a href="#top" class="button button-big">Back to Top</a>
			</footer>
			<div class="row">
				<div class="12u">
					<hr />
					<h3>Find Us on ...</h3>
					<ul class="social">
						<li class="twitter"><a href="http://twitter.com/n33co"
							class="fa fa-twitter"><span>Twitter</span></a></li>
						<li class="facebook"><a href="#" class="fa fa-facebook"><span>Facebook</span></a></li>
						<li class="dribbble"><a href="http://dribbble.com/n33"
							class="fa fa-dribbble"><span>Dribbble</span></a></li>
						<li class="linkedin"><a href="#" class="fa fa-linkedin"><span>LinkedIn</span></a></li>
						<li class="tumblr"><a href="#" class="fa fa-tumblr"><span>Tumblr</span></a></li>
						<li class="googleplus"><a href="#" class="fa fa-google-plus"><span>Google+</span></a></li>
						<li class="github"><a href="http://github.com/n33"
							class="fa fa-github"><span>Github</span></a></li>
						<!--
									<li class="rss"><a href="#" class="fa fa-rss"><span>RSS</span></a></li>
									<li class="instagram"><a href="#" class="fa fa-instagram"><span>Instagram</span></a></li>
									<li class="foursquare"><a href="#" class="fa fa-foursquare"><span>Foursquare</span></a></li>
									<li class="skype"><a href="#" class="fa fa-skype"><span>Skype</span></a></li>
									<li class="soundcloud"><a href="#" class="fa fa-soundcloud"><span>Soundcloud</span></a></li>
									<li class="youtube"><a href="#" class="fa fa-youtube"><span>YouTube</span></a></li>
									<li class="blogger"><a href="#" class="fa fa-blogger"><span>Blogger</span></a></li>
									<li class="flickr"><a href="#" class="fa fa-flickr"><span>Flickr</span></a></li>
									<li class="vimeo"><a href="#" class="fa fa-vimeo"><span>Vimeo</span></a></li>
									-->
					</ul>
					<hr />
				</div>
			</div>
			<footer>
				<ul id="copyright">
					<li>&copy; 2013 Jane Doe</li>
					<li>Images: <a href="http://fotogrph.com">fotogrph</a></li>
					<li>Design: <a href="http://html5up.net/">HTML5 UP</a></li>
				</ul>
			</footer>
		</article>
	</div>
</body>
</html>