<script lang="ts">
  import Close from "./Icons/Close.svelte";
  import Expanded from "./Icons/Expanded.svelte";
  import TerminalLine from "./TerminalLine.svelte";

  let expanded : boolean = false;

  type logline = {
    text: string,
    isPausable?: boolean,
    isComplete?: boolean,
    isResumable?: boolean
  };
  let log : logline[] = [
    { text: "Light Engine Auto-calliberation" },
    { text: "Exposure initiated for 2m 30s at 321mJ/cm2 (21%)", isPausable: true },
    { text: "Exposure complete", isComplete: true },
    { text: "Exposure initiated for 1m 10s at 167mJ/cm2 (12%)", isPausable: true },
    { text: "Exposure complete", isComplete: true },
    { text: "Exposure initiated for 1m 10s at 167mJ/cm2 (12%)", isPausable: true },
    { text: "Exposure Paused after 32s of exposure", isResumable: true }
  ];
</script>

<div class="bg-black grow flex flex-col w-full">
  <div class="bg-white/10">
    <div class="text-white font-light flex">
      <span class="grow p-2 px-4">History</span>
      <div class="flex flex-col active:bg-orange-500">
        {#if expanded}
        <Close class="p-2 grow place-self-center" on:click={()=>{ expanded = true; }}/>
        {:else}
        <Expanded class="p-2 mx-2 grow place-self-center" on:click={()=>{ expanded = false; }}/>
        {/if}
      </div>
    </div>
  </div>
  <div class="px-2 pb-4 pt-2 touch-auto overflow-scroll scrollbar-hide text-white font-mono text-xs">
    {#each log as line, index}
      <TerminalLine 
        isComplete={line.isComplete} 
        isPausable={line.isPausable}
        isResumable={line.isResumable}
        isLast={index === log.length - 1}
        >
        {line.text}</TerminalLine>
    {/each}
  </div>
</div>
