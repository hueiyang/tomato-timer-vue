<template>
  <v-app>
    <v-app-bar
      app
      color="primary"
      dark
    >
      <v-row>
        <v-col class="d-flex justify-center align-center">
          <v-toolbar-title>Tomato Timer</v-toolbar-title>
        </v-col>
      </v-row>
    </v-app-bar>

    <v-main class="align-center">
      <v-container>
        <v-sheet>
          <v-row>
            <v-col cols="12">
              <v-tabs
                      centered
                      center-active
                      v-model="currentTab"
              >
                <v-tab
                        v-for="tab in tabs"
                        :key="tab.value"
                >
                  {{ tab.text }}
                </v-tab>
                <v-tabs-items
                        v-model="currentTab"
                >
                  <v-tab-item
                          v-for="tab in tabs"
                          :key="tab.value"
                  >
                    <v-row class="justify-center">
                      <v-col cols="12" sm="6">
                          <TomatoTimer
                                  :tab-name="tab.text"
                                  :tomato="tab.tomato"
                          ></TomatoTimer>
                      </v-col>
                    </v-row>
                  </v-tab-item>
                </v-tabs-items>
              </v-tabs>
            </v-col>
          </v-row>
        </v-sheet>
      </v-container>
    </v-main>

    <v-footer
      app
      absolute
      class="font-weight-medium"
    >
      <v-row>
        <v-col
          class="text-center"
          cols="12"
        >
          {{ new Date().getFullYear() }} — <strong>Tomato Timer</strong>
        </v-col>
      </v-row>
    </v-footer>

    <new-tomato-dialog
            ref="dialog"
            @commitTomato="addNewTomato"
    ></new-tomato-dialog>

  </v-app>
</template>

<script>
import NewTomatoDialog from "./components/NewTomatoDialog";
import TomatoTimer from "./components/TomatoTimer";

export default {
  name: 'App',

  components: {
    NewTomatoDialog,
    TomatoTimer
  },
  watch: {
    currentTab: function (val) {
      console.log(val)
      if (val === 3) {
        this.openDialog()
      }
    }
  },
  data: () => ({
    currentTab: 'tomato',
    tabs: [
      { text: 'Tomato', value: 'tomato', tomato:{ min: 25 } },
      { text: 'Short Break', value: 'short', tomato:{ min: 5 } },
      { text: 'Long Break', value: 'long', tomato:{ min: 10 } },
      { text: 'Custom', value: 'custom', tomato:{ min: 1 } }
    ],
    panel: [],
    dialogOpen: false
  }),
  methods: {
    openDialog () {
      console.log('add one')
      this.dialogOpen = true
      this.$refs.dialog.openDialog()
    },
    addNewTomato (tomato) {
      console.log('create new one = ', tomato)
      this.tabs[3].tomato = tomato
    }
  }
};
</script>
