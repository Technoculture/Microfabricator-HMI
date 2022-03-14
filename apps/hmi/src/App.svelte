<script lang="ts">
  // Assets and Icons
  import naked from "./assets/mfab-naked.png";
  import Play from "./lib/Icons/Play.svelte";

  // Components
  import Card from './lib/Card.svelte';
  import Progress from "./lib/Progress.svelte";
  import MetricThumbnail from "./lib/MetricThumbnail.svelte";
  import Terminal from "./lib/Terminal.svelte";

  let show_controls: boolean = true;

  let enlarged_terminal : string = "col-span-2 row-span-2";
  if(!show_controls) {
    enlarged_terminal = "col-span-2 row-span-4";
  }
</script>

<main>
  <div class="w-screen h-screen max-h-[480px] max-w-[800px] shadow-inner bg-gradient-to-br from-slate-100 via-slate-200 to-slate-400 select-none">
    <div class="grid gap-6 grid-cols-6 grid-rows-5 w-full h-full p-10">
      <Card class="row-span-4 col-span-2 flex flex-col">
        <div class="flex snap-center overflow-x-scroll scrollbar-hide snap-x snap-mandatory">
          <img src={naked} alt="" class="snap-center object-cover" />
        </div>

        <!-- <dev class="flex flex-col w-full h-full text-white font-extralight">
          <span class="p-2 px-4 ">Wafer Mask Distance</span>
          <div class="m-2 grow flex flex-col ring-1 rounded-xl ring-white bg-black overflow-hidden">
            <img src={family} alt="" class="object-cover grow" />
          </div>
        </dev> -->
        <div class="flex grow">
          <!-- <Card class="flex overflow-hidden grow rounded-none">
          <div class="flex grow active:bg-black">
            <InfoCircle class="text-white grow text-center place-self-center"/>
          </div>
          </Card>

          <Card class="flex overflow-hidden grow rounded-none bg-slate-800">
            <div class="flex grow h-full active:bg-black">
              <Calculator class="text-white grow text-center place-self-center"/>
            </div>
          </Card> -->
          <Card class="col-span-2 flex text-white text-center font-extralight text-xl overflow-hidden grow rounded-none" hasRing={true}>
            <div class="flex flex-grow h-full active:bg-black ">
              <span class="flex-grow place-self-center">
                4S
              </span>
            </div>
            <div class="flex flex-grow h-full active:bg-black" >
              <span class="flex-grow place-self-center">
                365nm
              </span>
            </div>
          </Card>
        </div>
      </Card>

      <Card title="Wafer Stage" show={show_controls} hasRing={true} disabled={false}>
        <MetricThumbnail state={true}>
          <span class="place-self-center text-left">Open</span>
        </MetricThumbnail>
      </Card>

      <Card title="Wafer Clamp" show={show_controls} hasRing={true} disabled={false}>
        <MetricThumbnail state={false}>
          <span class="place-self-center">Off</span>
        </MetricThumbnail>
      </Card>

      <Card title="Wafer Mask Gap" show={show_controls} hasRing={true} disabled={false}>
        <MetricThumbnail>
          <div class="absolute left-0 w-full overflow-auto touch-pan-y">
            <div class="flex">
              <svg height="100px" width="100px" viewBox="0 0 100 100" stroke="white" stroke-width="1">
                <path d="M100 00 H85 Z" stroke="orange" />
                <path d="M100 05 H90 Z" />
                <path d="M100 10 H90 Z" />
                <path d="M100 15 H90 Z" />
                <path d="M100 20 H90 Z" />
                <path d="M100 25 H85 Z" stroke="orange" />
                <path d="M100 30 H90 Z" />
                <path d="M100 35 H90 Z" />
                <path d="M100 40 H90 Z" />
                <path d="M100 45 H90 Z" />
                <path d="M100 50 H85 Z" stroke="orange" />
                <path d="M100 55 H90 Z" />
                <path d="M100 60 H90 Z" />
                <path d="M100 65 H90 Z" />
                <path d="M100 70 H90 Z" />
                <path d="M100 75 H85 Z" stroke="orange" />
                <path d="M100 80 H90 Z" />
                <path d="M100 85 H90 Z" />
                <path d="M100 95 H90 Z" />
                <path d="M100 100 H90 Z" />
                <path d="M100 105 H85 Z" stroke="orange" />
                <path d="M100 110 H90 Z" />
                <path d="M100 115 H90 Z" />
                <path d="M100 120 H90 Z" />
                <path d="M100 125 H90 Z" />
                <path d="M100 130 H85 Z" stroke="orange" />
                <path d="M100 135 H90 Z" />
                <path d="M100 140 H90 Z" />
                <path d="M100 145 H90 Z" />
                <path d="M100 150 H90 Z" />
                <path d="M100 155 H85 Z" stroke="orange" />
                <path d="M100 160 H90 Z" />
                <path d="M100 165 H90 Z" />
                <path d="M100 170 H90 Z" />
                <path d="M100 175 H90 Z" />
              </svg>
            </div>
          </div> 
          <span class="p-3 w-full flex place-self-center">
            <!-- <span class="grow"></span> -->
            <span class="pr-1">2.8</span>
            <span class="text-white font-extralight text-sm place-self-center">μm</span>
          </span>
        </MetricThumbnail>
      </Card>

      <Card title="Vibration" show={show_controls} hasRing={true} >
        <MetricThumbnail state={true}>
          <span class="place-self-center">Ok</span>
          <svg width="100" height="100"  viewBox="0 0 100 100" stroke="white" stroke-width="1" class="absolute inset-0">
            <polyline points="
          		0,100
          		30,99
          		60,96
          		90,91
          		120,84
          		150,75
          		180,64
          	"></polyline>
          </svg>
        </MetricThumbnail>
      </Card>

      <Card title="Light Intensity" show={show_controls} hasRing={true} disabled={false}>
        <MetricThumbnail class="flex-col grow text-start p-3">
          <span class="text-xl font-mono">21%</span>
          <span class="text-white text-sm font-extralight">321 mJ/cm<sup>2</sup></span>
          <span></span>
        </MetricThumbnail>
      </Card>

      <Card title="Duration" show={show_controls} hasRing={true} disabled={false}>
        <MetricThumbnail>
          <div class="absolute right-0 w-full overflow-auto touch-pan-y">
            <div class="flex">
              <svg height="100px" width="100px" viewBox="0 0 100 100" stroke="white" stroke-width="1">
                <path d="M100 00 H85 Z" stroke="orange" />
                <path d="M100 05 H90 Z" />
                <path d="M100 10 H90 Z" />
                <path d="M100 15 H90 Z" />
                <path d="M100 20 H90 Z" />
                <path d="M100 25 H85 Z" stroke="orange" />
                <path d="M100 30 H90 Z" />
                <path d="M100 35 H90 Z" />
                <path d="M100 40 H90 Z" />
                <path d="M100 45 H90 Z" />
                <path d="M100 50 H85 Z" stroke="orange" />
                <path d="M100 55 H90 Z" />
                <path d="M100 60 H90 Z" />
                <path d="M100 65 H90 Z" />
                <path d="M100 70 H90 Z" />
                <path d="M100 75 H85 Z" stroke="orange" />
                <path d="M100 80 H90 Z" />
                <path d="M100 85 H90 Z" />
                <path d="M100 95 H90 Z" />
                <path d="M100 100 H90 Z" />
                <path d="M100 105 H85 Z" stroke="orange" />
                <path d="M100 110 H90 Z" />
                <path d="M100 115 H90 Z" />
                <path d="M100 120 H90 Z" />
                <path d="M100 125 H90 Z" />
                <path d="M100 130 H85 Z" stroke="orange" />
                <path d="M100 135 H90 Z" />
                <path d="M100 140 H90 Z" />
                <path d="M100 145 H90 Z" />
                <path d="M100 150 H90 Z" />
                <path d="M100 155 H85 Z" stroke="orange" />
                <path d="M100 160 H90 Z" />
                <path d="M100 165 H90 Z" />
                <path d="M100 170 H90 Z" />
                <path d="M100 175 H90 Z" />
              </svg>
            </div>
          </div>
          <div class="flex flex-col grow p-3">
            <span class="place-self-start text-xl font-mono">112s</span> 
            <span class="place-self-start flex-row text-sm text-white font-extralight">1m 32s</span>
          </div>
        </MetricThumbnail>
      </Card>

      <Card class={`${enlarged_terminal} overflow-hidden flex`} >
        <Terminal />
      </Card>

      <Card class="col-span-2 flex flex-col h-full text-white justify-between overflow-hidden" >
        <div class="flex grow h-full">
          <span class="place-self-center text-center text-2xl flex-grow font-extralight pt-1">00:22:19</span>
          <div class="flex flex-grow h-full active:bg-black place-self-center pt-1" on:click={() => {show_controls = false;  enlarged_terminal = "col-span-2 row-span-4";}}> 
            <Play class="place-self-center grow" />
          </div>
        </div>
        <Progress class="flex" />
      </Card>
    </div>
  </div>
</main>
