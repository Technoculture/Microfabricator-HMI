<script lang="ts">
  export let state : boolean = false;

  let state_string : string = "";
  if(state) {
    state_string = "m-2 ring-1 ring-green-300 rounded-xl text-green-300";
  } else {
    state_string = "m-0";
  }

  let className : string = "";
  export { className as class };
</script>

<div class="h-20 w-full flex bg-black rounded-2xl ring-white ring-1 active:ring-1 shadow-xl text-orange-600 text-xl overflow-hidden">
  <div class={`${state_string} ${className} grow relative flex place-content-center overflow-hidden bg-black`}>
    <slot />
  </div>
</div>
