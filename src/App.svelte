<script lang="ts">
  import naked from "./assets/mfab-naked.png";
  import { Icon, InformationCircle, Play } from "svelte-hero-icons";
</script>

<main>
  <div class="w-screen h-screen max-h-[480px] max-w-[800px] bg-gray-100">
    <div class="grid gap-6 grid-cols-6 grid-rows-5 w-full h-full p-10">
      <div class="row-span-4 col-span-2 rounded-2xl bg-black/50 shadow-xl backdrop-blur-sm ring-1 ring-slate-200">
        <img src={naked} alt="" class="pt-12" />
      </div>
      <div class="row-span-2 bg-black/50 rounded-xl shadow-xl flex flex-col backdrop-blur-sm">
        <span class="text-sm p-3 text-white text-thin"> Wafer Mask Distance</span>
        <div class="grow w-full flex place-content-center bg-black rounded-xl ring-1 ring-white shadow-xl">
          <span class="text-orange-600 text-xl place-self-center justify-center">2.8um</span>
        </div>
      </div>
      <div class="row-span-2"> Duration </div>
      <div class="row-span-2"> Clamp </div>
      <div class="row-span-2"> Vibration </div>
      <div class="row-span-2"> Access Module </div>
      <div class="row-span-2"> Light Intensity </div>
      <div class="row-span-2"></div>
      <div class="row-span-2"></div>
      <div class="rounded-xl flex bg-black/50 shadow-xl backdrop-blur-sm ring-1 ring-slate-200"><Icon src="{InformationCircle}" class="h-12 text-white place-self-center"/></div>
      <div class="bg-black/50 shadow-xl backdrop-blur-sm ring-1 ring-slate-200 rounded-xl">
        <div class="bg-green-400 w-2 inset-0" />
      </div>
      <div>4S</div>
      <div>365nm</div>
      <div class="col-span-2 flex bg-black/50 shadow-xl backdrop-blur-sm ring-1 ring-slate-200 text-white rounded-xl place-content-center">
        <span class="place-self-center text-2xl mr-4">00:00:00</span>
        <Icon src="{Play}" class="place-self-center h-12 w-12" />
      </div>
    </div>
  </div>
</main>
