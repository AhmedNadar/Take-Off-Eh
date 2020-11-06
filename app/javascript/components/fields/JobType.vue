<template>
  <div>
    <label for="compensation-type" class="label">Job Type</label>
    <span class="required"></span>
    <div class="relative">
      <select id="compensation-type" class="select">
        <option value="Full-time">Full-time</option>        
        <option value="Full-time">Part-time</option>
        <option value="Contract">Contract</option>
        <option value="Full-time">Freelance</option>
      </select>
      <select-arrow></select-arrow>

    </div>
  </div>
</template>

<script>
import SelectArrow from "../icons/SelectArrow";

export default {
  components: { SelectArrow, },

  props: {
    job: {
      type: Object,
      required: true
    }
  }
}
</script>