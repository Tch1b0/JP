<template>
	<div id="app">
		<div class="logo">
			<div class="logo-circle">
				<a href="#/" class="main-logo"><img src="./assets/JP.gif" alt="JP"></a>
			</div>
		</div>
		<hr>
		<router-view></router-view>
	</div>
</template>

<script>
export default {
	name: 'app'
}
</script>

<style lang="scss" scope>
$primcolor: #361999;
$seccolor: #78fff1;
$textcolor: snow;

body {
	color: $textcolor;
	font-family: sans-serif;
	background-color: $primcolor;
}

.logo {
	display: flex;
	justify-content: center;
	overflow-y: hidden;
}
img.main-logo {
	width: 75px;
}
.logo-circle {
	background-color: #ff6495;
	border-radius: 100%;
	padding-left: 1.1%;
	padding-top: 1.1%;
	padding-right: 1.2%;
	padding-bottom: .8%;
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
@keyframes fadein {
	from {
		width: 0%;
	}
	to {
		width: 100%;
	}
}
</style>
