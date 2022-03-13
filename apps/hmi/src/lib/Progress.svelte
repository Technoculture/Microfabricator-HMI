<script lang="ts">
  let className : string = "";
  export { className as class };

  export let percentage: Number = 20;

  let show_style = "";
  if(percentage >= 0) {
    show_style = "bg-green-200/40";
  }
</script>

<div class={`${className} ${show_style} shadow-inner`}>  
  <div style={`width:${percentage}%; height:8px`} class="bg-gradient-to-r from-green-500 to-green-600/80 shadow-inner"></div>
</div>
