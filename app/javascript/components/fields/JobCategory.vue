<template>
  <div>
    <label for="compensation-range" class="label">Category</label>
    <span class="required"></span>
    <div class="relative">
      <select id="compensation-range" class="select">
        <option :value="item" v-for="item in jobCategory" :key="item">
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

  data(){
    return{
      jobCategory: [
        "Design", 
        "Programming", 
        "Customer Support", 
        "Copywriting", 
        "DevOps and Sysadmin", 
        "Sales and Marketing", 
        "Business, Management and Finance", 
        "Product",
        "Other Category",
      ],
    };
  },
  props: {
    job: {
      type: Object,
      required: true
    }
  }
}
</script>
