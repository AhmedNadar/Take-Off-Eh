<template>
  <div>
    <label for="title" class="label">Job Title</label>
    <span class="mt-3 ml-1 required"></span>
    <input type="text" id="title" placeholder="Enter a job title" class="input" required>
  </div>
</template>

<script>
export default {
  name:'JobTitle',
  props: {
    job: {
      type: Object,
      required: true
    }
  }
}
</script>
