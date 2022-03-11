<script lang="ts">
  import naked from "./assets/mfab-naked.png";
  import Play from "./lib/Icons/Play.svelte";
  import InfoCircle from "./lib/Icons/InfoCircle.svelte";
  import Card from './lib/Card.svelte';
  import Progress from "./lib/Progress.svelte";
  import MetricThumbnail from "./lib/MetricThumbnail.svelte";
</script>

<main>
  <div class="w-screen h-screen max-h-[480px] max-w-[800px] shadow-inner bg-gradient-to-b from-slate-100 to-slate-300">
    <div class="grid gap-6 grid-cols-6 grid-rows-5 w-full h-full p-10">
      <Card class="row-span-4 col-span-2">
        <img src={naked} alt="" class="pt-12" />
      </Card>

      <Card title="Wafer Mask Distance">
        <MetricThumbnail>
          <span class="place-self-center justify-center">2.8um</span>
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

      <Card class="col-span-2 row-span-2" ></Card>

      <Card class="flex">
        <InfoCircle class="text-white grow text-center place-self-center"/>
      </Card>

      <Card class="row-span-1 relative overflow-hidden" >
        <Progress />
      </Card>

      <Card class="flex" >
        <span class="place-self-center grow text-white text-center font-extralight text-xl">
          4S
        </span>
      </Card>
      <Card class="flex" >
        <span class="place-self-center grow text-white text-center text-xl font-extralight">
          365nm
        </span>
      </Card>


      <Card class="col-span-2 flex text-white px-6" >
        <span class="place-self-center text-2xl grow pr-4 font-extralight">00:00:00</span>
        <Play class="place-self-center" />
      </Card>

    </div>
  </div>
</main>
