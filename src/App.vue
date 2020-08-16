<template>
  <v-app>
    <div>
    <v-app-bar
            app
            color="primary"
            dark
    >
      <v-toolbar-title>Tomato Timer</v-toolbar-title>

      <v-spacer></v-spacer>

      <v-btn
              color="pink"
              dark
              fab
              small
              @click="openDialog"
      >
        <v-icon>mdi-plus</v-icon>
      </v-btn>
    </v-app-bar>

    <v-main>
      <v-container>
        <div>
          <v-expansion-panels
            v-model="panel"
            hover
            multiple
          >
            <v-expansion-panel
              v-for="(tomato, index) in tomatos"
              :key="index"
            >
              <v-expansion-panel-header>{{ tomato.title }}</v-expansion-panel-header>
              <v-expansion-panel-content>
                <tomato-timer
                        :tomato="tomato"
                ></tomato-timer>
              </v-expansion-panel-content>
            </v-expansion-panel>

          </v-expansion-panels>
        </div>
      </v-container>
    </v-main>

    <v-footer
            absolute
            class="font-weight-medium"
    >
      <v-col
              class="text-center"
              cols="12"
      >
        {{ new Date().getFullYear() }} — <strong>Tomato Timer</strong>
      </v-col>
    </v-footer>
    </div>

    <new-tomato-dialog
            ref="dialog"
            @commitTomato="addNewTomato"
    ></new-tomato-dialog>

  </v-app>
</template>

<script>

import TomatoTimer from "./components/TomatoTimer";
import NewTomatoDialog from "./components/NewTomatoDialog";
export default {
  name: 'App',

  components: {
    NewTomatoDialog,
    TomatoTimer
  },

  data: () => ({
    panel: [],
    dialogOpen: false,
    tomatos: [
      { title: '事情的主題', content: '這是你對這件事的描述', clock: 25, closed: false }
    ]
  }),
  methods: {
    openDialog () {
      console.log('add one')
      this.dialogOpen = true
      this.$refs.dialog.openDialog()
    },
    addNewTomato (tomato) {
      console.log('create new one = ', tomato)
      this.tomatos.push(tomato)
    }
  }
};
</script>
