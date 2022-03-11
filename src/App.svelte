<script lang="ts">
  import logo from "./assets/splash.jpg";
  import Counter from "./lib/Counter.svelte";
</script>

<main>
  <img src={logo} alt="Svelte Logo" class="h-96" />

  <Counter />

  <p>
    Visit <a href="http://www.technoculture.io">technoculture.io</a>
  </p>
</main>

<style>
  @tailwind utilities;
  @tailwind components;
  @tailwind base;
</style>
