<template>
  <div>
    <label for="compensation-range" class="label">Regional Restrictions</label>
    <span class="required"></span>
    <div class="relative">
      <select id="compensation-range" class="select">
        <option :value="item" v-for="item in jobRegion" :key="item">
          {{ item }}
        </option>
      </select>
      <select-arrow></select-arrow>
    </div>
  </div>
</template>

<script>
import SelectArrow from "../icons/SelectArrow";

export default {
  components: { SelectArrow, },

  data () {
    return {
      jobRegion: [
        "Anywhere (100% Remote) Only", 
        "Toronto Down Town", 
        "North York", 
        "York", 
        "East York", 
        "Scraborough", 
        "Etobicoke"
      ]
    };
  },
  props: {
    job: {
      type: Object,
      required: true
    },
  }
}
</script>
