<template>
	<div>
		<div class="box useinslide">
			<div class="content">
				<img :src="post.logo_url" alt="Logo" class="project-logo" />
				<h1>{{ post.title }}</h1>
				<p>{{ post.description }}</p>
				<button @click="changeLoc(post.title)">Read more</button>
			</div>
		</div>
	</div>
</template>

<script>
import { Post, PostCollection, Requester } from "jp-wrapper";

let requester = new Requester();

var postcollection = new PostCollection(requester);

export default {
	name: "project",
	data() {
		return {
			post: Post
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
			postcollection.by_title(this.index).then((data) => {
				this.post = data;
				console.log(data);
			});
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

p {
	overflow-wrap: break-word;
}
.blurred-description {
	user-select: none;
	filter: blur(2px);
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
