<template>
	<div>
		<div class="about-container">
			<about-me />
		</div>
		<div class="project-container">
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
import AboutMe from "./AboutMe.vue";

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
		project: Project,
		AboutMe
	}
};
</script>

<style lang="scss" scoped>
.about-container {
	left: 5%;
	position: fixed;
	display: flex;
	justify-content: left;
	animation: aboutmeslidein 2.5s ease;
}
.project-container {
	display: flex;
	justify-content: center;
}
.projects {
	margin: 0 auto;
}
li {
	list-style-type: none;
}

@keyframes aboutmeslidein {
	from {
		margin-right: 15%;
		opacity: 0%;
	}
	to {
		margin-right: 0%;
		opacity: 100%;
	}
}

@media (min-width: 1250px) and (max-width: 1600px) {
	.about-container {
		left: 1%;
	}
}

@media (max-width: 1250px) {
	.about-container {
		left: 0;
		position: relative;
		justify-content: center;
	}
}
</style>
