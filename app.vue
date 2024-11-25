<template>
  <div>
    <h1>Testing Page - AWS Secrets Manager</h1>
    NR_KEY: {{ NR_KEY }} <br />
    NR_APP_ID: {{ NR_APP_ID }} <br />
    {{ $config.public }}
  </div>
</template>
<script setup lang="ts">
const config = useRuntimeConfig();
console.log("config", config);

const NR_KEY = config.app.NR_KEY;
const NR_APP_ID = config.app.NR_APP_ID;
</script>
