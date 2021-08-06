import Vue from 'vue';
import VueRouter from 'vue-router';
import App from './App.vue';
import Home from './components/Home.vue';
import AboutProject from './components/AboutProject.vue'

Vue.use(VueRouter);

const routes = [
	{path: "/", component: Home},
	{path: "/:name", component: AboutProject}
];

const router = new VueRouter({
	routes
});

new Vue({
	el: '#app',
	router,
	render: h => h(App)
});
