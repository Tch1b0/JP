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
import Project from "./Project.vue"
import axios from "../../node_modules/axios/index"

export default {
    name: "home",
    data() {
        return {
            posts: []
        }
    },
    created() {
        this.getPosts()
    },
    methods: {
        getPosts() {
            axios.get("https://api.johannespour.de/posts/titles")
            .then((response) => {
                this.posts = response.data;
            });
        }
    },
    components: {
        "project": Project
    }
}
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