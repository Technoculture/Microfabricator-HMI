<script lang="ts">
  let className : string = "";
  export { className as class };

  export let percentage: Number = 20;

  let show_style = "";
  if(percentage >= 0) {
    show_style = "bg-orange-200/40";
  }
</script>

<div class={`${className} ${show_style} shadow-inner`}>  
  <div style={`width:${percentage}%; height:8px`} class="bg-gradient-to-r from-orange-300 to-orange-500 shadow-inner"></div>
</div>
