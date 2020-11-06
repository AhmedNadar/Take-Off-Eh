<template>
  <div>
    <h3 class="mb-3 text-3xl font-black">About the job</h3>
    <div class="inline-flex mb-6">
      <p class="m-0 text-xs tracking-wide text-gray-600 uppercase">
        Required fields
      </p>
      <span class="mt-2 ml-1 required"></span>
    </div>

    <job-title :job="job" class="mb-6"></job-title>
    <job-description :job="job" class="mb-6"></job-description>
    
    <div class="grid grid-cols-1 gap-6 mb-6 lg:grid-cols-3">
      <apply-link :job="job" class="lg:col-span-2"></apply-link>
      <job-remote :job="job" class="lg:col-span-1"></job-remote>
    </div>

    <div class="grid grid-cols-1 gap-6 mb-10 lg:grid-cols-3">
      <job-category :job="job" class="lg:col-span-1"></job-category>
      <job-region :job="job" class="lg:col-span-1"></job-region>
      <job-type :job="job" class="mb-6 lg:col-span-1 "></job-type>      
    </div>

    <div class="grid grid-cols-1 gap-6 mb-10 lg:grid-cols-1">
      <job-statement :job="job" class="mb-6"></job-statement>
    </div>

    <a @click="next()" class="btn btn-red btn-lg">Continue</a>

  </div>
</template>

<script>
import JobTitle from '../fields/JobTitle'
import JobDescription from '../fields/JobDescription'
import JobRemote from '../fields/JobRemote'
import JobType from '../fields/JobType'
import JobCategory from '../fields/JobCategory'
import JobRegion from '../fields/JobRegion'
import ApplyLink from '../fields/ApplyLink'
import JobStatement from '../fields/JobStatement'


export default {
  components:{
    JobTitle,
    JobDescription,
    JobRemote,
    JobType,
    JobCategory,
    JobRegion,
    ApplyLink,
    JobStatement
  },
  props: {
    job: {
      type: Object,
      required: true,
    },
  },
  methods:{
    next(){
      this.$emit("nextStep");  
    }
  }
}
</script>