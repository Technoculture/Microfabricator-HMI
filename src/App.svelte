<script lang="ts">
  import naked from "./assets/mfab-naked.png";
  import Counter from "./lib/Counter.svelte";
  import { Icon, InformationCircle } from "svelte-hero-icons";
</script>

<main>
  <div class="w-screen h-screen max-h-[480px] max-w-[800px] overflow-hidden bg-gray-100">
    <div class="grid gap-6 grid-cols-6 grid-rows-5 w-full h-full p-10">
      <div class="row-span-4 col-span-2 rounded-2xl bg-slate-200 shadow-2xl"><img src={naked} alt="" class="pt-12" /></div>
      <div class="row-span-2"> Wafer Mask Distance </div>
      <div class="row-span-2"> Duration </div>
      <div class="row-span-2"> Clamp </div>
      <div class="row-span-2"> Vibration </div>
      <div class="row-span-2"> Access Module </div>
      <div class="row-span-2"> Light Intensity </div>
      <div class="row-span-2"></div>
      <div class="row-span-2"></div>
      <div class="bg-slate-800 rounded-xl flex"><Icon src="{InformationCircle}" class="h-12 text-gray-400 place-self-center"/></div>
      <div class="bg-red-300 rounded-xl">
        <div class="bg-green-400 w-2 inset-0" />
      </div>
    </div>
  </div>
</main>
