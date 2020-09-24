<template>
  <div id="app" class="antialiased text-gray-900">
    <div class="min-h-screen px-6 py-32 bg-gray-800">
      <AccountDropdown />
    </div>
  </div>
</template>

<script>
import AccountDropdown from './components/AccountDropdown'
export default {
  name: 'app',
  components: {
    AccountDropdown
  }
}
</script>

<style src="./assets/tailwind.css"></style>
