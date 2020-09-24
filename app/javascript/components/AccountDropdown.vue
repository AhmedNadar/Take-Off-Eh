<template>
  <div>
    <button
      class="block w-8 h-8 overflow-hidden border-2 border-gray-600 rounded-full focus:outline-none focus:border-white"
    >
      <img
        class="object-cover w-full h-full"
        src="https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=256&q=80"
        alt="Your avatar"
      />
    </button>
    <div class="w-48 py-2 mt-2 bg-white rounded-lg shadow-xl">
      <a
        href="#"
        class="block px-4 py-2 text-gray-800 hover:bg-indigo-500 hover:text-white"
        >Account settings</a
      >
      <a
        href="#"
        class="block px-4 py-2 text-gray-800 hover:bg-indigo-500 hover:text-white"
        >Support</a
      >
      <a
        href="#"
        class="block px-4 py-2 text-gray-800 hover:bg-indigo-500 hover:text-white"
        >Sign out</a
      >
    </div>
  </div>
</template>

<script>
export default {}
</script>
