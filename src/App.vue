<template>
	<div id="app">
		<div class="logo">
			<div class="logo-circle">
				<a href="#/" class="main-logo">
					<img src="./assets/JP.gif" alt="JP" class="main-logo" />
				</a>
			</div>
		</div>
		<hr />
		<router-view></router-view>
	</div>
</template>

<script>
export default {
	name: "app"
};
</script>

<style lang="scss">
$primcolor: #361999;
$seccolor: #78fff1;
$textcolor: snow;

$boxcolor: rgb(36, 36, 36);
$boxbordercolor: rgba(32, 32, 32, 0.842);
$roundness: 25px;
$contentcrunch: 5%;
$boxtopmargin: 20px;

body {
	color: $textcolor;
	font-family: sans-serif;
	background-color: $primcolor;
}

a {
	font-size: 125%;
	color: yellow;
	text-decoration: none;
}

.logo {
	display: flex;
	justify-content: center;
	overflow-y: hidden;
}
img {
	max-width: 300px;
	border-radius: 5px;
	border: 1px solid $boxbordercolor;
}
img.project-logo {
	min-width: 150px;
	max-width: 300px;
	border-radius: 5px;
}
img.main-logo {
	width: 75px;
	border: 0px solid black;
}
.logo-circle {
	margin: 0px 0px 0px 0px;
	background-color: #ff6495;
	border-radius: 100%;
	padding-left: 1.1%;
	padding-top: 1.1%;
	padding-right: 1.2%;
	padding-bottom: 0.8%;
	margin-bottom: 1%;
	box-shadow: -5px 2px 1px 0px #ce3f6c;
}
hr {
	background-color: $seccolor;
	border: 1px solid $seccolor;
	height: 5px;
	filter: blur(2px);
	animation: fadein 1s ease;
	animation-fill-mode: forwards;
}
.box {
	margin-top: $boxtopmargin;
	min-width: 350px;
	min-height: 350px;
	background-color: $boxcolor;
	border-radius: $roundness;
	border: 1px solid $boxbordercolor;
	justify-content: center;
	text-align: center;
	animation: slidein 2s ease;
	color: snow;
	font-family: sans-serif;
	box-shadow: -5px 2px 1px 0px rgb(27, 27, 27);
}
.content {
	padding-top: $contentcrunch;
	padding-bottom: $contentcrunch;
	padding-right: $contentcrunch;
	padding-left: $contentcrunch;

	hr {
		height: 1px;
	}
	p {
		margin-bottom: 2%;
	}
	img {
		margin-bottom: 3%;
	}
	h1,
	h2,
	h3 {
		bottom: 0;
	}
}

@keyframes fadein {
	from {
		width: 0%;
	}
	to {
		width: 100%;
	}
}

@media (max-width: 500px) {
	img.main-logo {
		width: 65px;
		margin-left: 15%;
		margin-top: 17%;
	}
	.logo-circle {
		width: 90px;
		height: 90px;
	}
}
@media (min-width: 500px) {
	img.main-logo {
		width: 75px;
		border: 0px solid black;
	}

	.logo-circle {
		margin: 0px 0px 0px 0px;
		background-color: #ff6495;
		border-radius: 100%;
		padding-left: 1.1%;
		padding-top: 1.1%;
		padding-right: 1.2%;
		padding-bottom: 0.8%;
		margin-bottom: 1%;
		box-shadow: -5px 2px 1px 0px #ce3f6c;
	}
}

@keyframes slidein {
	from {
		margin-top: 25%;
		opacity: 0%;
	}
	to {
		margin-top: $boxtopmargin;
		opacity: 100%;
	}
}
</style>
