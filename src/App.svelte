<script lang="ts">
  // Assets and Icons
  import naked from "./assets/mfab-naked.png";
  import family from "./assets/family.png"
  import Play from "./lib/Icons/Play.svelte";
  import Calculator from "./lib/Icons/Calculator.svelte";
  import InfoCircle from "./lib/Icons/InfoCircle.svelte";

  // Components
  import Card from './lib/Card.svelte';
  import Progress from "./lib/Progress.svelte";
  import MetricThumbnail from "./lib/MetricThumbnail.svelte";
</script>

<main>
  <div class="w-screen h-screen max-h-[480px] max-w-[800px] shadow-inner bg-gradient-to-br from-slate-50 via-pink-50 to-slate-200 select-none">
    <div class="grid gap-6 grid-cols-6 grid-rows-5 w-full h-full p-10 ">
      <Card class="row-span-4 col-span-2">
        <img src={naked} alt="" class="pt-12" />
      </Card>

      <Card title="Wafer Mask Distance">
        <MetricThumbnail>
          <div class="absolute inset-0 w-8 overflow-y-scroll">
            <div class="flex flex-col">
              <span class="text-orange-500 flex flex-row h-1.5">--</span>
              <span class="text-white h-1.5">-</span>
              <span class="text-white h-1.5">-</span>
              <span class="text-white h-1.5">-</span>
              <span class="text-white h-1.5">-</span>
              <span class="text-orange-500 flex h-1.5">--</span>
              <span class="text-white h-1.5">-</span>
              <span class="text-white h-1.5">-</span>
              <span class="text-white h-1.5">-</span>
              <span class="text-white h-1.5">-</span>
              <span class="text-orange-500 flex h-1.5">--</span>
            </div>
          </div>
          <span class="place-self-center justify-center">
            2.8um
          </span>
        </MetricThumbnail>
      </Card>

      <Card title="Duration">
        <MetricThumbnail>
        </MetricThumbnail>
      </Card>

      <Card title="Clamp">
        <MetricThumbnail>
        </MetricThumbnail>
      </Card>

      <Card title="Vibration">
        <MetricThumbnail>
        </MetricThumbnail>
      </Card>

      <Card title="Access Module">
        <MetricThumbnail>
        </MetricThumbnail>
      </Card>

      <Card title="Light Intensity">
        <MetricThumbnail>
        </MetricThumbnail>
      </Card>

      <Card class="col-span-2 row-span-2 overflow-hidden flex" >
        <img src={family} alt="" class="object-cover" />
      </Card>

      <Card class="flex overflow-hidden">
        <div class="flex flex-grow h-full active:bg-black/20">
        <InfoCircle class="text-white grow text-center place-self-center"/>
        </div>
      </Card>

      <Card class="flex overflow-hidden" >
        <div class="flex flex-grow h-full active:bg-black/20">
          <Calculator class="text-white grow text-center place-self-center"/>
        </div>
      </Card>

      <Card class="col-span-2 flex text-white text-center font-extralight text-xl overflow-hidden" >
        <div class="flex flex-grow h-full active:bg-black/20">
          <span class="flex-grow place-self-center">
            4S
          </span>
        </div>
        <div class="flex flex-grow h-full active:bg-black/20">
          <span class="flex-grow place-self-center">
            365nm
          </span>
        </div>
      </Card>

      <Card class="col-span-2 flex flex-col h-full text-white justify-between overflow-hidden" >
        <div class="flex grow h-full">
          <span class="place-self-center text-center text-2xl flex-grow font-extralight pt-1">00:00:00</span>
          <div class="flex flex-grow h-full active:bg-black/20 place-self-center pt-1"> 
            <Play class="place-self-center grow" />
          </div>
        </div>
        <Progress class="flex" />
      </Card>
    </div>
  </div>
</main>
