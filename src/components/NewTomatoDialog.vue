<template>
    <v-dialog v-model="open" persistent max-width="300px">
        <v-card>
            <v-card-title class="headline">
                Defined Tomato Timer
            </v-card-title>
            <v-card-text>
                <v-container>
                    <v-row>
                        <v-col cols="6">
                            <v-text-field label="Minute" type="number" value="25" v-model="tomato.min" required></v-text-field>
                        </v-col>
                        <v-col cols="6">
                            <v-text-field label="Second*" type="number" value="25" v-model="tomato.sec" required></v-text-field>
                        </v-col>
                    </v-row>
                </v-container>
                <small>*indicates required field</small>
            </v-card-text>
            <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="blue darken-1" text @click="closeDialog">Close</v-btn>
                <v-btn color="blue darken-1" text @click="createNewTomato">Save</v-btn>
            </v-card-actions>
        </v-card>
    </v-dialog>
</template>

<script>
export default {
    name: "NewTomatoDialog",
    data: () => ({
        open: false,
        tomato: {
            min: 25,
            sec: 0
        },
        defaultTomato: {
            min: 25,
            sec: 0
        }
    }),
    methods: {
        openDialog () {
            this.open = true
        },
        createNewTomato () {
            console.log(this.tomato)
            this.$emit('commitTomato', this.tomato)
            this.tomato = Object.assign({}, this.defaultTomato)
            this.open = false
        },
        closeDialog () {
            this.tomato = Object.assign({}, this.defaultTomato)
            this.open = false
        }
    }
}
</script>

<style scoped>

</style>
