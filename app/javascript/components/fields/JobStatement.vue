<template>
  <div>
    <label for="company-statement" class="label">Company Statement</label>
    <span class="required"></span>
    <VueTrix
      v-model="job.company_statement"
      placeholder="Enter your company or organization’s mission statement. This will be displayed
on your company’s profile."
      localStorage
    />
  </div>
</template>

<script>
import VueTrix from 'vue-trix'
export default {
  components: {
    VueTrix
  },
  props: {
    job: {
      type: Object,
      required: true
    }
  }
}
</script>
