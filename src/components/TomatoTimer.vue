<template>
    <v-card>
        <v-card-title class="justify-center">
            <v-icon class="pr-2" large>alarm</v-icon>
            {{ tabName }}
        </v-card-title>
        <v-card-text>
            <v-row>
                <v-col class="display-3 d-flex justify-center" cols="12">
                    {{ displayClock }}
                </v-col>
            </v-row>
        </v-card-text>
        <v-card-actions class="justify-space-around">
            <v-btn color="green" @click="startTimer">
                <v-icon class="pr-1">play_arrow</v-icon> Start
            </v-btn>
            <v-btn color="red" @click="stopTimer">
                <v-icon class="pr-1">stop</v-icon> Stop
            </v-btn>
            <v-btn color="gray" @click="resetTimer">
                <v-icon class="pr-1">loop</v-icon> Reset
            </v-btn>
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
            console.log('min = ', this.currentMin, ' sec = ', this.currentSec)
            let duration = this.currentMin * 60 + this.currentSec
            console.log('start and duration = ', duration)
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
            this.currentMin = Number(this.tomato.min ? this.tomato.min : 0)
            this.currentSec = Number(this.tomato.sec ? this.tomato.sec : 0)
        }
    }
}
</script>

<style scoped>

</style>
