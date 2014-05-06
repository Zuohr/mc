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
<noscript>
	<link rel="stylesheet" href="css/skel-noscript.css" />
	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="css/style-desktop.css" />
</noscript>
<!--[if lte IE 9]><link rel="stylesheet" href="css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><script src="js/html5shiv.js"></script><link rel="stylesheet" href="css/ie8.css" /><![endif]-->
<!--[if lte IE 7]><link rel="stylesheet" href="css/ie7.css" /><![endif]-->

</head>
<body onload="showlocation()">

	<!-- Nav -->
	<nav id="nav">
		<ul class="container">
			<li><a href="#top">Home</a></li>
			<li><a href="#contact">Find Bus</a></li>
			<li><a href="#work">What's Around</a></li>
			<li><a href="#portfolio">Subscribe</a></li>
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

	<script type="text/javascript"
		src="http://maps.google.com/maps/api/js?sensor=true"></script>

	<script>
		function success(position) {
			var mapcanvas = document.createElement('div');
			mapcanvas.id = 'mapcontainer';
			mapcanvas.style.height = '200px';
			mapcanvas.style.width = '380px';

			document.getElementById('ma').appendChild(mapcanvas);

			var coords = new google.maps.LatLng(position.coords.latitude,
					position.coords.longitude);

			var options = {
				zoom : 15,
				center : coords,
				mapTypeControl : false,
				navigationControlOptions : {
					style : google.maps.NavigationControlStyle.SMALL
				},
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};
			var map = new google.maps.Map(document
					.getElementById("mapcontainer"), options);

			var marker = new google.maps.Marker({
				position : coords,
				map : map,
				title : "You are here!"
			});
		}

		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(success);
		} else {
			error('Geo Location is not supported');
		}
	</script>
	<div class="wrapper wrapper-style4">
		<article id="contact" class="container small">
			<header>

				<span>Your Current Location

					<article id="ma"></article>


				</span>
			</header>
			<h2>Find a Bus Near You!</h2>
			<div>
				<div class="row">
					<div class="12u">
						<form method="post" action="#">
							<div>
								<div class="row half">
									<div class="6u">
										<input type="text" name="name" list="DataList"
											required="required" id="name"
											placeholder="Destination/Bus Route" />
										<datalist id="DataList">
											<option value="Centre Ave at Morewood Ave"></option>
											<option value="Centre Ave at Millvale Ave"></option>
											<option value="Centre Ave Opp Neville St"></option>
											<option value="Centre Ave at Melwood Ave"></option>
											<option value="Craig St at Centre Ave Fs"></option>
											<option value="Craig St at Bayard St"></option>
											<option value="Craig St at 5th Ave"></option>
										</datalist>
									</div>

								</div>
								<div class="row">
									<div class="12u">
										<a href="#" class="button form-button-submit">Search</a> <a
											href="#" class="button button-alt form-button-reset">Clear
											Form</a>
									</div>
								</div>
							</div>
						</form>
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