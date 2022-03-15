<script lang="ts">
  import naked from "../../assets/mfab-naked.png";
  import slider2 from "../../assets/slider.png";
  import lefront from "../../assets/le-front.png";
  import Base from "./Base.svelte";
</script>

<Base>
  <div class="flex snap-center overflow-x-scroll scrollbar-hide snap-x snap-mandatory h-full">
    <img src={naked} alt="" class="snap-center object-cover" />
    <img src={slider2} alt="" class="snap-center object-cover pb-2" />  
    <img src={lefront} alt="" class="snap-center object-cover p-2" />  
  </div>
  <div class="absolute flex mt-52 p-4 w-full place-content-center font-thin">
    <span class="text-5xl text-slate-300 place-self-center">-</span>
    <span class="text-5xl text-slate-700 place-self-start">-</span>
    <span class="text-5xl text-slate-700 place-self-start">-</span>
  </div>
</Base>
