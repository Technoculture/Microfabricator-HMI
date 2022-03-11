<script lang="ts">
  import logo from "./assets/splash.jpg";
  import Counter from "./lib/Counter.svelte";
</script>

<main>
  <div class="h-[480px] w-[800px] overflow-hidden">
    <img src={logo} alt="Svelte Logo" class="h-96" />

    <div class="flex flex-col">
      <Counter />
      <Counter />
      <Counter />
    </div>

    <p>
      Visit <a href="http://www.technoculture.io">technoculture.io</a> to learn more.
    </p>
  </div>
</main>

<style>
  @tailwind utilities;
  @tailwind components;
  @tailwind base;
</style>
