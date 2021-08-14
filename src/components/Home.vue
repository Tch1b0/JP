<template>
	<div>
		<div class="container">
			<div class="projects">
				<li v-for="post in posts" :key="post">
					<project :index="post"></project>
				</li>
			</div>
		</div>
	</div>
</template>

<script>
import Project from "./Project.vue";
import { Requester, PostCollection } from "jp-wrapper";

let requester = new Requester();

var postcollection = new PostCollection(requester);

export default {
	name: "home",
	data() {
		return {
			posts: []
		};
	},
	created() {
		this.getPosts();
	},
	methods: {
		getPosts() {
			postcollection.all_titles().then((data) => {
				this.posts = data;
			});
		}
	},
	components: {
		project: Project
	}
};
</script>

<style lang="scss" scoped>
.container {
	display: flex;
	justify-content: center;
}
.projects {
	margin: 0 auto;
}
li {
	list-style-type: none;
}
</style>
