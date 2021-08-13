<template>
	<div>
		<div class="box">
			<div class="content">
				<img
					:src="logo"
					alt="Logo"
					width="100px"
					class="project-logo"
				/>
				<h1>{{ title }}</h1>
				<p>{{ description }}</p>
				<button @click="changeLoc(title)">Read more</button>
			</div>
		</div>
	</div>
</template>

<script>
import axios from "axios";

export default {
	name: "project",
	data() {
		return {
			logo: "",
			title: "",
			description: ""
		};
	},
	props: ["index"],
	created() {
		this.getData();
	},
	methods: {
		changeLoc(route) {
			window.location = "#/" + route;
		},
		getData() {
			axios
				.get(`https://api.johannespour.de/post/${this.index}`)
				.then((response) => {
					this.title = response.data["title"];
					this.logo = `https://api.johannespour.de/post/${this.title}/logo`;
					this.description = response.data["description"];
				});
		}
	}
};
</script>

<style lang="scss" scoped>
$boxcolor: rgb(36, 36, 36);
$boxbordercolor: rgba(32, 32, 32, 0.842);
$roundness: 25px;
$contentcrunch: 5%;

$outlinesize: 1.5px;

h1 {
	text-align: center;
	text-shadow: -$outlinesize -$outlinesize 0 #000,
		$outlinesize -$outlinesize 0 #000, -$outlinesize $outlinesize 0 #000,
		$outlinesize $outlinesize 0 #000;
}

.box {
	margin-top: 20px;
	min-width: 350px;
	min-height: 350px;
	max-width: 500px;
	max-height: 500px;
	background-color: $boxcolor;
	border-radius: $roundness;
	border: 1px solid $boxbordercolor;
	justify-content: center;
	text-align: center;
	color: snow;
	font-family: sans-serif;
	animation: slidein 1s ease;
	animation-fill-mode: forwards;
	box-shadow: -5px 2px 1px 0px rgb(27, 27, 27);
}

.content {
	padding-top: $contentcrunch;
	padding-bottom: $contentcrunch;
	padding-right: $contentcrunch;
	padding-left: $contentcrunch;
}
p {
	overflow-wrap: break-word;
}
img {
	min-width: 150px;
	max-width: 300px;
	border-radius: 5px;
}
.blurred-description {
	user-select: none;
	filter: blur(2px);
}
@keyframes slidein {
	from {
		margin-bottom: 20%;
		opacity: 0%;
	}
	to {
		margin-bottom: 0%;
		opacity: 100%;
	}
}
button {
	background-color: #78fff1;
	border-color: rgba(0, 255, 255, 0);
	font-size: 150%;
	color: rgb(36, 36, 36);
	border-radius: 13px;
	filter: blur(1px);

	&:hover {
		cursor: pointer;
		filter: blur(0px);
	}
}
img.project-logo {
	border: 2px solid rgb(27, 27, 27);
}
</style>
