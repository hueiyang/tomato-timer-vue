<template>
    <v-row justify="center">
        <v-dialog v-model="open" persistent max-width="600px">
            <v-card>
                <v-card-title>
                    <span class="headline">Create new Tomato</span>
                </v-card-title>
                <v-card-text>
                    <v-container>
                        <v-row>
                            <v-col cols="12">
                                <v-text-field label="Title*" v-model="tomato.title" required></v-text-field>
                            </v-col>
                            <v-col cols="12">
                                <v-text-field label="Content Description" v-model="tomato.content"></v-text-field>
                            </v-col>
                            <v-col cols="12">
                                <v-text-field label="Clock*" type="number" value="25" v-model="tomato.clock" required></v-text-field>
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
    </v-row>
</template>

<script>
export default {
    name: "NewTomatoDialog",
    data: () => ({
        open: false,
        defaultTomato: {
            title: '',
            content: '',
            clock: 25,
            closed: false
        },
        tomato: {
            title: '',
            content: '',
            clock: 25,
            closed: false
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
