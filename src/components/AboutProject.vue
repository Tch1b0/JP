<template>
	<div class="container">
		<img :src="banner" alt="Banner" class="banner" />
		<div class="box">
			<div class="about">
				<img :src="logo" alt="Logo" width="150px" />
				<h1>{{ title }}</h1>
				<hr />
				<div v-html="longDescription" class="content"></div>
			</div>
		</div>
	</div>
</template>

<script>
import axios from "axios";
import showdown from "showdown";

var converter = new showdown.Converter();

export default {
	data() {
		return {
			title: "",
			logo: "",
			banner: "",
			description: "",
			longDescription: ""
		};
	},
	created() {
		this.getData();
	},
	methods: {
		getData() {
			axios
				.get(
					`https://api.johannespour.de/post/${this.$route.params["name"]}`
				)
				.then((response) => {
					this.title = response.data["title"];
					if (this.title === undefined) {
						window.location = "/";
					}
					this.description = response.data["description"];
					this.logo = `https://api.johannespour.de/post/${this.title}/logo`;
					this.banner = `https://api.johannespour.de/post/${this.title}/banner`;
					this.longDescription = this.markdownToHtml(
						response.data["long-description"]
					);
				})
				.catch(() => {
					window.location = "/";
				});
		},
		markdownToHtml(markdown) {
			return converter.makeHtml(markdown);
		}
	}
};
</script>
<style lang="scss" scoped>
$outlinesize: 1.5px;

h1 {
	text-align: center;
	text-shadow: -$outlinesize -$outlinesize 0 #000,
		$outlinesize -$outlinesize 0 #000, -$outlinesize $outlinesize 0 #000,
		$outlinesize $outlinesize 0 #000;
}
div.about {
	margin-top: 5%;
	margin-bottom: 5%;
	margin-left: 5%;
	margin-right: 5%;
	text-align: center;
}
div.container {
	display: flex;
	justify-content: center;
}
div.box {
	position: absolute;
	margin: 0 auto;
	background-color: rgb(39, 43, 65);
	border-radius: 17px;
	margin-left: 1%;
	margin-right: 1%;
	min-width: 250px;
	max-width: 1100px;
	overflow-x: hidden;
	box-shadow: -5px 2px 1px 0px rgb(27, 30, 49);
}
img {
	border-radius: 5px;
}
img.banner {
	position: absolute;
	filter: blur(5px);
	width: 77%;
	min-width: 0px;
	max-width: 1300px;
	overflow-x: hidden;
	overflow-y: hidden;
	border-radius: 25px;
	border: 5px solid #ff6495;
}
hr {
	background-color: #ff6495;
	border: 0px;
}
div.content {
	text-align: left;
	a {
		color: yellow;
	}
	img {
		max-width: 500px;
	}
}
</style>
