<script lang="ts">
  // export let isStoppable : boolean = false;
  export let isPausable : boolean = false;
  export let isComplete : boolean = false;
  export let isResumable : boolean = false;
  export let isLast : boolean = false;

  enum linetype {
    INFO,
    WARN,
    ERROR,
    SUCCESS
  };
  export let type : linetype = linetype.INFO;

  let type_style : string = "";
  switch (type) {
    case linetype.INFO:
      type_style = "text-gray-400";
      break;
    case linetype.WARN:
      type_style = "text-yellow-400";
    default:
      type_style = "text-white";
      break;
  }
  const date_time_text : string = "23:56";
</script>

<div class="flex gap-2 text-xs">
  <span class="text-orange-400 font-extralight">
    {date_time_text}> 
  </span>
  <span class={`grow ${type_style}`}>
    <slot /> 
    {#if isLast}
      {#if isResumable}
        <button class="bg-cyan-700 active:bg-cyan-500 px-2 rounded-lg mr-2 text-white">Resume ></button>
      {/if}
      {#if isPausable}
        <button class="bg-orange-600 active:bg-orange-400 px-2 rounded-lg mr-1 text-white">Pause ></button>
        <button class="bg-red-800 active:bg-orange-600 px-2 rounded-lg text-white">Stop ></button>
      {/if}
    {/if}
    {#if isComplete}
      <button class="bg-green-700 active:bg-green-500 px-2 rounded-lg text-white">Redo ></button>
    {/if}
  </span>
</div>
