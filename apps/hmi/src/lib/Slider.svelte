<script>
  // import Slider from "@fouita/slider";
  let value = 20;
</script>

<div class="flex grow bg-gradient-to-tr from-slate-600 to-black">
  <div class="text-white text-2xl font-thin p-3 px-8 bg-black">{value}%</div>
  <!-- <div class="bg-orange-200/50 h-2 relative rounded-full overflow-hidden">
    <div class="absolute z-5 inset-0 bg-orange-400 w-12" />
  </div>
  <div class="absolute w-1 bg-orange-400 h-10" /> -->
  <input 
    type="range" 
    class="place-self-center mx-6 grow h-5 bg-black/40 appearance-none slider-thumb overflow-hidden rounded-md"
    min="0" max="100" value={value} step={5}
    />
</div>

<style>
  .slider-thumb::-webkit-slider-thumb {
    @apply appearance-none w-8 h-16 bg-orange-300 cursor-pointer;
  }
  
  .slider-thumb::-webkit-slider-thumb:hover {
    @apply bg-orange-500;
  }
</style>