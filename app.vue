<template>
  <div>
    <h1>Testing Page - AWS Secrets Manager</h1>
    NR_KEY: {{ NR_KEY }} <br />
    NR_APP_ID: {{ NR_APP_ID }}
  </div>
</template>
<script setup lang="ts">
const config = useRuntimeConfig();

const NR_KEY = config.private.NR_KEY;
const NR_APP_ID = config.private.NR_APP_ID;
</script>
