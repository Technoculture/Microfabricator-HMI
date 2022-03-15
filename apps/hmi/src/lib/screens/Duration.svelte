<script lang="ts">
  import naked from "../../assets/mfab-naked.png";
  import Base from "./Base.svelte";
</script>

<Base>
  <div class="flex snap-center overflow-x-scroll scrollbar-hide snap-x snap-mandatory grow">
    <img src={naked} alt="" class="snap-center object-cover" />
    <img src={naked} alt="" class="snap-center object-cover" />  
    <img src={naked} alt="" class="snap-center object-cover" />
  </div>
</Base>
