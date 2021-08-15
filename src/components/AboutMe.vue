<template>
	<div>
		<div class="box">
			<img src="./../assets/Tch1b0.gif" class="project-logo" />
			<div class="content">
				<p v-html="text"></p>
			</div>
		</div>
	</div>
</template>

<script>
import showdown from "showdown";

var converter = new showdown.Converter();
converter.setOption;
let age = calculateAge(new Date(2005, 4, 18));
var about = `
# Me
I am **Johannes Pour**(_alias **Tch1b0**_) and <br>I am a _${age}-year-old_ **developer** from **Germany**.<br><br>
* **[Github](https://github.com/Tch1b0)**
* **[itch.io](https://tch1b0.itch.io)**
* **[pypi](https://pypi.org/user/Tch1b0/)**
* **[npm](https://www.npmjs.com/~tch1b0)**
* **[Contact me](&#109;&#97;&#105;&#108;&#116;&#111;&#58;%4A%6F%68%61%6E%6E%65%73%40%62%65%6E%31%31%2E%64%65)**
`;

export default {
	name: "aboutme",
	data() {
		return {
			text: converter.makeHtml(about)
		};
	}
};

function calculateAge(date) {
	var difference = Date.now() - date.getTime();
	var ageDt = new Date(difference);

	return Math.abs(ageDt.getUTCFullYear() - 1970);
}
</script>

<style lang="scss" scoped>
.project-logo {
	margin-top: 7%;
	max-width: 200px;
}
.box {
	border: 2px solid #ff6495;
	box-shadow: -5px 2px 1px 0px #ce3f6c;
}
.content {
	text-align: left;
}
</style>
