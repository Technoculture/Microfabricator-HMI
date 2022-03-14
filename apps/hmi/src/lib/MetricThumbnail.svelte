<script lang="ts">
  export let state : boolean = false;

  let state_string : string = "";
  if(state) {
    state_string = "m-2 text-orange-500";
  } else {
    state_string = "m-0";
  }

  let className : string = "";
  export { className as class };
</script>

<div class="h-20 w-full flex bg-black shadow-xl text-orange-600 text-xl overflow-hidden">
  <div class={`${state_string} ${className} grow relative flex place-content-center overflow-hidden bg-black`}>
    <slot />
  </div>
</div>
