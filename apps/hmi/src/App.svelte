<script lang="ts">
  // Assets and Icons
  import naked from "./assets/mfab-naked.png";
  import Play from "./lib/Icons/Play.svelte";
  import Calculator from "./lib/Icons/Calculator.svelte";
  import InfoCircle from "./lib/Icons/InfoCircle.svelte";

  // Components
  import Card from './lib/Card.svelte';
  import Progress from "./lib/Progress.svelte";
  import MetricThumbnail from "./lib/MetricThumbnail.svelte";
  import Terminal from "./lib/Terminal.svelte";

  let show_controls: boolean = true;

  let enlarged_pic : string = "col-span-2 row-span-2";
  if(!show_controls) {
    enlarged_pic = "col-span-4 row-span-4";
  }

  // var protobuf = require("protobufjs/minimal");
  // var protobuf = require("protobufjs/light");

  // protobuf.load("4s.proto")
  //   .then(function(err, root){
  //   if (err)
  //     throw err;

  //   // Obtain a message type
  //   var message = root.lookupType("microfabricator.ClampRequest");

  //   // Exemplary payload
  //   var payload = { state: "OFF" };

  //   // Verify the payload
  //   var errMsg = message.create(payload);
  //   if(errMsg)
  //     throw Error(errMsg);
    
  //   // var msg = message.create(payload);

  //   console.log([payload, errMsg]);
  // });
</script>

<main>
  <div class="w-screen h-screen max-h-[480px] max-w-[800px] shadow-inner bg-gradient-to-br from-slate-50 via-blue-100 to-orange-100 select-none">
    <div class="grid gap-6 grid-cols-6 grid-rows-5 w-full h-full p-10 ">
      <Card class="row-span-4 col-span-2">
        <img src={naked} alt="" class="pt-12" />
      </Card>

      <Card title="Wafer Mask Distance" show={show_controls}>
        <MetricThumbnail>
          <div class="absolute left-0 w-full overflow-auto touch-pan-y">
            <div class="flex flex-col">
              <svg height="100px" width="100px" viewBox="0 0 100 100" stroke="white" stroke-width="1">
                <path d="M0 0 H15 Z" stroke="orange" />
                <path d="M0 5 H10 Z" />
                <path d="M0 10 H10 Z" />
                <path d="M0 15 H10 Z" />
                <path d="M0 20 H10 Z" />
                <path d="M0 25 H15 Z" stroke="orange" />
                <path d="M0 30 H10 Z" />
                <path d="M0 35 H10 Z" />
                <path d="M0 40 H10 Z" />
                <path d="M0 45 H10 Z" />
                <path d="M0 50 H15 Z" stroke="orange" />
                <path d="M0 55 H10 Z" />
                <path d="M0 60 H10 Z" />
                <path d="M0 65 H10 Z" />
                <path d="M0 70 H10 Z" />
                <path d="M0 75 H15 Z" stroke="orange" />
                <path d="M0 80 H10 Z" />
                <path d="M0 85 H10 Z" />
                <path d="M0 85 H10 Z" />
                <path d="M0 90 H10 Z" />
                <path d="M0 95 H15 Z" stroke="orange" />
                <path d="M0 100 H10 Z" />
                <path d="M0 105 H10 Z" />
                <path d="M0 115 H10 Z" />
                <path d="M0 120 H10 Z" />
                <path d="M0 125 H15 Z" stroke="orange" />
                <path d="M0 130 H10 Z" />
                <path d="M0 135 H10 Z" />
                <path d="M0 140 H10 Z" />
                <path d="M0 145 H10 Z" />
                <path d="M0 150 H15 Z" stroke="orange" />
                <path d="M0 155 H10 Z" />
                <path d="M0 160 H10 Z" />
                <path d="M0 165 H10 Z" />
                <path d="M0 170 H10 Z" />
              </svg>
            </div>
          </div>
          <span class="place-self-center w-full">
            2.8um
          </span>
        </MetricThumbnail>
      </Card>

      <Card title="Duration" show={show_controls}>
        <MetricThumbnail>
          <div class="absolute left-0 w-full overflow-auto touch-pan-y">
            <div class="flex flex-col">
              <svg height="100px" width="100px" viewBox="0 0 100 100" stroke="white" stroke-width="1">
                <path d="M0 0 H15 Z" stroke="orange" />
                <path d="M0 5 H10 Z" />
                <path d="M0 10 H10 Z" />
                <path d="M0 15 H10 Z" />
                <path d="M0 20 H10 Z" />
                <path d="M0 25 H15 Z" stroke="orange" />
                <path d="M0 30 H10 Z" />
                <path d="M0 35 H10 Z" />
                <path d="M0 40 H10 Z" />
                <path d="M0 45 H10 Z" />
                <path d="M0 50 H15 Z" stroke="orange" />
                <path d="M0 55 H10 Z" />
                <path d="M0 60 H10 Z" />
                <path d="M0 65 H10 Z" />
                <path d="M0 70 H10 Z" />
                <path d="M0 75 H15 Z" stroke="orange" />
                <path d="M0 80 H10 Z" />
                <path d="M0 85 H10 Z" />
                <path d="M0 85 H10 Z" />
                <path d="M0 90 H10 Z" />
                <path d="M0 95 H15 Z" stroke="orange" />
                <path d="M0 100 H10 Z" />
                <path d="M0 105 H10 Z" />
                <path d="M0 115 H10 Z" />
                <path d="M0 120 H10 Z" />
                <path d="M0 125 H15 Z" stroke="orange" />
                <path d="M0 130 H10 Z" />
                <path d="M0 135 H10 Z" />
                <path d="M0 140 H10 Z" />
                <path d="M0 145 H10 Z" />
                <path d="M0 150 H15 Z" stroke="orange" />
                <path d="M0 155 H10 Z" />
                <path d="M0 160 H10 Z" />
                <path d="M0 165 H10 Z" />
                <path d="M0 170 H10 Z" />
              </svg>
            </div>
          </div>
          <div class="flex flex-col grow p-2">
            <span class="place-self-end flex-row">1m 32s</span>
            <span class="place-self-end text-xl text-white">112s</span> 
          </div>
        </MetricThumbnail>
      </Card>

      <Card title="Clamp" show={show_controls}>
        <MetricThumbnail>
          <span class="place-self-center rounded-lg flex px-7 py-5 ring-1 ring-orange-400">OFF</span>
        </MetricThumbnail>
      </Card>

      <Card title="Vibration" show={show_controls}>
        <MetricThumbnail>
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

      <Card title="Access Module" show={show_controls}>
        <MetricThumbnail>
          <span class="place-self-center rounded-lg p-5 ring-1 ring-orange-400">Open</span>
        </MetricThumbnail>
      </Card>

      <Card title="Light Intensity" show={show_controls}>
        <MetricThumbnail>
          <span class="place-self-center">21%</span>
          <!-- <span>21mJ/cm2</span>
          <span></span> -->
        </MetricThumbnail>
      </Card>

      <Card class={`${enlarged_pic} overflow-hidden flex`}>
        <!-- <img src={family} alt="" class="object-cover mix-blend-normal" /> -->
        <Terminal />
      </Card>

      <Card class="flex overflow-hidden">
        <div class="flex flex-grow h-full active:bg-black/20">
        <InfoCircle class="text-white grow text-center place-self-center"/>
        </div>
      </Card>

      <Card class="flex overflow-hidden">
        <div class="flex flex-grow h-full active:bg-black/20">
          <Calculator class="text-white grow text-center place-self-center"/>
        </div>
      </Card>

      <Card class="col-span-2 flex text-white text-center font-extralight text-xl overflow-hidden">
        <div class="flex flex-grow h-full active:bg-black/20">
          <span class="flex-grow place-self-center">
            4S
          </span>
        </div>
        <div class="flex flex-grow h-full active:bg-black/20" >
          <span class="flex-grow place-self-center">
            365nm
          </span>
        </div>
      </Card>

      <Card class="col-span-2 flex flex-col h-full text-white justify-between overflow-hidden" >
        <div class="flex grow h-full">
          <span class="place-self-center text-center text-2xl flex-grow font-extralight pt-1">00:00:00</span>
          <div class="flex flex-grow h-full active:bg-black/20 place-self-center pt-1" on:click={() => {show_controls = false;  enlarged_pic = "col-span-4 row-span-4";}}> 
            <Play class="place-self-center grow" />
          </div>
        </div>
        <Progress class="flex" />
      </Card>
    </div>
  </div>
</main>
