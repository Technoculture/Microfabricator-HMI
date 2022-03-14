<script lang="ts">
  import Close from "./Icons/Close.svelte";
  import Expanded from "./Icons/Expanded.svelte";
  import TerminalLine from "./TerminalLine.svelte";

  let expanded : boolean = false;
</script>

<div class="bg-black grow flex flex-col w-full">
  <div class="bg-white/10">
    <div class="text-white font-light flex">
      <span class="grow p-2 px-4">Log</span>
      <div class="flex flex-col active:bg-orange-500">
        {#if expanded}
        <Close class="p-2 grow place-self-center" on:click={()=>{ expanded = true; }}/>
        {:else}
        <Expanded class="p-2 mx-2 grow place-self-center" on:click={()=>{ expanded = false; }}/>
        {/if}
      </div>
    </div>
  </div>
  <div class="px-2 touch-auto overflow-scroll scrollbar-hide text-white font-mono text-xs">
  <TerminalLine>slsakjdlaskjdalskdjalskdjaslkdjalsd </TerminalLine>
  <TerminalLine>slsakjdlaskjdalskdjalskdjaslkdjalsd </TerminalLine>
  <TerminalLine>slsakjdlaskjdalskdjalskdjaslkdjalsd </TerminalLine>
  <TerminalLine>slsakjdlaskjdalskdjalskdjaslkdjalsd </TerminalLine>
  <TerminalLine>slsakjdlaskjdalskdjalskdjaslkdjalsd </TerminalLine>
  <TerminalLine>slsakjdlaskjdalskdjalskdjaslkdjalsd </TerminalLine>
  <TerminalLine>slsakjdlaskjdalskdjalskdjaslkdjalsd </TerminalLine>
  <TerminalLine>slsakjdlaskjdalskdjalskdjaslkdjalsd </TerminalLine>
  <TerminalLine>slsakjdlaskjdalskdjalskdjaslkdjalsd </TerminalLine>
  <TerminalLine>slsakjdlaskjdalskdjalskdjaslkdjalsd </TerminalLine>
  </div>
</div>
