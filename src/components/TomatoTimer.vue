<template>
    <v-card>
        <v-card-title class="justify-center">{{ tabName }}</v-card-title>
        <v-card-text>
            <v-row>
                <v-col class="display-3 d-flex justify-center" cols="12">
                    {{ displayClock }}
                </v-col>
            </v-row>
        </v-card-text>
        <v-card-actions class="justify-center">
            <v-btn color="green" @click="startTimer">Start</v-btn>
            <v-btn color="red" @click="stopTimer">Stop</v-btn>
            <v-btn color="gray" @click="resetTimer">Reset</v-btn>
        </v-card-actions>
    </v-card>
</template>

<script>
export default {
    name: "TomatoTimer",
    props: {
        tabName: String,
        tomato: Object
    },
    watch: {
      tomato: {
          deep: true,
          immediate: true,
          handler: function(val) {
              if (!val) return
              this.assignTimer()
          }
      }
    },
    computed: {
      displayClock () {
          const min = this.currentMin < 10 ? ('0' + this.currentMin) : this.currentMin
          const sec = this.currentSec < 10 ? ('0' + this.currentSec) : this.currentSec
          return min + ' : ' + sec
      }
    },
    data () {
      return {
          currentMin: 0,
          currentSec: 0,
          timer : null
      }
    },
    created() {
        console.log('create tomato')
    },
    methods: {
        startTimer () {
            if (this.timer !== null) return
            console.log('start')
            let duration = this.currentMin * 60 + this.currentSec
            this.timer = setInterval(() => {
                this.currentMin = parseInt(duration / 60, 10)
                this.currentSec = parseInt(duration % 60, 10)

                if (--duration < 0) {
                    this.stopTimer()
                }
            }, 1000)
        },
        stopTimer () {
            console.log('stop')
            clearInterval(this.timer)
            this.timer = null
        },
        resetTimer () {
            console.log('reset')
            this.stopTimer()
            this.assignTimer()
        },
        assignTimer () {
            this.currentMin = this.tomato.min ? this.tomato.min : 0
            this.currentSec = this.tomato.sec ? this.tomato.sec : 0
        }
    }
}
</script>

<style scoped>

</style>
