<template>
    <v-card flat>
        <v-card-title>
            {{ tomato.title }}
        </v-card-title>

        <v-card-subtitle>
            {{ tomato.clock }} 分鐘
        </v-card-subtitle>

        <v-card-text>
            {{ tomato.content }}
        </v-card-text>
    </v-card>
</template>

<script>
export default {
    name: "TomatoTimer",
    props: {
        tomato: Object
    }
}
</script>

<style scoped>

</style>
