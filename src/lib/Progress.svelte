<script lang="ts">
  let className : string = "";
  export { className as class };

  export let percentage: Number = 0;

  let show_style = "";
  if(percentage >= 0) {
    show_style = "bg-black/10";
  }
</script>

<div class={`${className} ${show_style}`}>  
  <div style={`width:${percentage}%; height:8px`} class="bg-green-400 shadow-inner"></div>
</div>
