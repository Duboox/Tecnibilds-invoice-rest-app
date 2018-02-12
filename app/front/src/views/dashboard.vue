<style lang="scss">
    .DashCharts {
        max-height: 200px;
    }
</style>

<template>
    <v-layout column wrap>
        <v-toolbar color="blue" dark>
            <v-toolbar-title>{{ pageTitle }}</v-toolbar-title>
            <v-spacer></v-spacer>
            <v-btn icon>
                <v-icon>more_vert</v-icon>
            </v-btn>
        </v-toolbar>
        <!-- Simple Cards -->
        <v-layout row justify-space-around class="mt-3" wrap>
            <v-flex xs12 md4 lg4 v-for="(card, i) in simpleCards" :key="i">
                <v-card class="ma-3">
                    <v-layout row>
                        <v-btn :color="card.color" fab dark>
                            <v-icon>{{ card.icon }}</v-icon>
                        </v-btn>
                        <v-layout column>
                            <v-flex xs10>
                                <div>
                                    <div class="headline">{{ card.title }}</div>
                                    <div class="caption grey--text">{{ card.subTitle }}</div>
                                </div>
                            </v-flex>
                        </v-layout>
                    </v-layout>
                </v-card>
            </v-flex>
        </v-layout>
        <!-- Charts Cards -->
        <v-layout row justify-space-around class="" wrap>
            <v-flex xs12 md4 lg4 v-for="(card, i) in chartCards" :key="i">
                <v-card class="ma-3">
                    <v-card-title>
                        <v-layout row>
                            <v-flex>
                                <div>
                                    <span class="headline">{{ card.title }}</span>
                                </div>
                                <div>
                                    <span class="caption grey--text">{{ card.subTitle }}</span>
                                </div>
                            </v-flex>
                            <v-flex class="text-xs-right">
                                <div>
                                    <v-btn icon>
                                        <v-icon>refresh</v-icon>
                                    </v-btn>
                                    <v-menu bottom left>
                                        <v-btn icon slot="activator">
                                            <v-icon>more_vert</v-icon>
                                        </v-btn>
                                        <v-list>
                                            <v-list-tile>
                                                <v-list-tile-title>asd</v-list-tile-title>
                                            </v-list-tile>
                                        </v-list>
                                    </v-menu>
                                </div>
                            </v-flex>
                        </v-layout>
                    </v-card-title>
                    <v-divider></v-divider>
                    <v-flex xs12>
                        <line-chart class="DashCharts" :data="card.lChart.data"
                                    :options="card.lChart.options"></line-chart>
                    </v-flex>
                </v-card>
            </v-flex>
        </v-layout>
        <!-- Post Card & CALENDAR ROW -->
        <v-layout row justify-space-around class="mt-3" wrap>
            <v-flex xs12 md6 lg6>
                <v-card class="ma-3">
                    <v-toolbar color="cyan" dark>
                        <v-toolbar-title>Posts recientes</v-toolbar-title>
                        <v-spacer></v-spacer>
                        <v-btn icon>
                            <v-icon>refresh</v-icon>
                        </v-btn>
                        <v-menu bottom left>
                            <v-btn icon slot="activator">
                                <v-icon>more_vert</v-icon>
                            </v-btn>
                            <v-list>
                                <v-list-tile>
                                    <v-list-tile-title>asd</v-list-tile-title>
                                </v-list-tile>
                            </v-list>
                        </v-menu>
                    </v-toolbar>
                    <v-list three-line>
                        <template v-for="item in posts">
                            <v-subheader v-if="item.header" v-text="item.header"></v-subheader>
                            <v-divider v-else-if="item.divider" v-bind:inset="item.inset"></v-divider>
                            <v-list-tile avatar v-else v-bind:key="item.title" @click="">
                                <v-list-tile-avatar>
                                    <img v-bind:src="item.avatar"/>
                                </v-list-tile-avatar>
                                <v-list-tile-content>
                                    <v-list-tile-title v-html="item.title"></v-list-tile-title>
                                    <v-list-tile-sub-title v-html="item.subtitle"></v-list-tile-sub-title>
                                </v-list-tile-content>
                            </v-list-tile>
                        </template>
                    </v-list>
                </v-card>
            </v-flex>
            <!-- Calendar -->
            <v-flex xs12 md6 lg6>
                <v-date-picker
                        full-width
                        class="ma-3"
                        color="green lighten-1"
                        v-model="datePicker"
                        :first-day-of-week="1"
                        locale="es-sp">
                </v-date-picker>
            </v-flex>
        </v-layout>
    </v-layout>
</template>

<script>
  import {mapGetters, mapActions} from 'vuex';
  import LineChart from '../components/charts/LineChart'
  export default {
    components: {LineChart},
    data () {
      return {
        pageTitle: 'Inicio',
        datePicker: null,
        simpleCards: [
          {
            icon: 'account_circle',
            color: 'warning',
            title: '0 Usuarios',
            subTitle: '0 Nuevos en la última semana'
          },
          {
            icon: 'event',
            color: 'info',
            title: '600 Emails',
            subTitle: '2 Nuevos'
          },
          {
            icon: 'widgets',
            color: 'primary',
            title: '0 Ventas',
            subTitle: '0 Nuevas en la última semana'
          }
        ],
        chartCards: [
          {
            title: 'Ventas',
            subTitle: 'Calculado en los últimos 7 días',
              /* LINE CHART */
            lChart: {
              data: {
                labels: ['1', '2', '3', '4', '5', '6', '7'],
                datasets: [
                  {
                    label: 'Ventas',
                    backgroundColor: '#4FC5EA',
                    data: [10, 30, 62, 49, 50, 20, 89]
                  }
                ]
              },
              options: {
                maintainAspectRatio: false,
                responsive: true,
                legend: {display: false},
                hover: {
                  mode: 'nearest',
                  intersect: true
                },
                scales: {
                  xAxes: [{
                    display: true,
                    scaleLabel: {
                      display: false,
                      labelString: 'Month'
                    }
                  }],
                  yAxes: [{
                    display: true,
                    scaleLabel: {
                      display: false,
                      labelString: 'Value'
                    }
                  }]
                }
              },
            },
          },
          {
            title: 'Clientes',
            subTitle: 'Calculado en los últimos 10 días',
            lChart: {
              data: {
                labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'],
                datasets: [
                  {
                    label: 'Clientes',
                    backgroundColor: '#9C27B0',
                    data: [10, 11, 15, 25, 36, 57, 58, 60, 80, 85]
                  }
                ]
              },
              options: {
                maintainAspectRatio: false,
                responsive: true,
                legend: {display: false},
                hover: {
                  mode: 'nearest',
                  intersect: true
                },
                scales: {
                  xAxes: [{
                    display: true,
                    scaleLabel: {
                      display: false,
                      labelString: 'Month'
                    }
                  }],
                  yAxes: [{
                    display: true,
                    scaleLabel: {
                      display: false,
                      labelString: 'Value'
                    }
                  }]
                }
              },
            },
          },
          {
            title: 'Productos',
            subTitle: 'Calculado en los últimos 15 días',
            lChart: {
              data: {
                labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15'],
                datasets: [
                  {
                    label: 'Productos',
                    backgroundColor: '#FF9800',
                    data: [10, 30, 40, 38, 55, 67, 50, 70, 85, 90, 105, 120, 135, 145, 160]
                  }
                ]
              },
              options: {
                maintainAspectRatio: false,
                responsive: true,
                legend: {display: false},
                hover: {
                  mode: 'nearest',
                  intersect: true
                },
                scales: {
                  xAxes: [{
                    display: true,
                    scaleLabel: {
                      display: false,
                      labelString: 'Month'
                    }
                  }],
                  yAxes: [{
                    display: true,
                    scaleLabel: {
                      display: false,
                      labelString: 'Value'
                    }
                  }]
                }
              },
            },
          }
        ],
        posts: [
          {header: 'Today'},
          {
            avatar: 'http://127.0.0.1:8000/images/users/default.jpg',
            title: 'Brunch this weekend?',
            subtitle: "<span class='grey--text text--darken-2'>Ali Connors</span> — I'll be in your neighborhood doing errands this weekend. Do you want to hang out?"
          },
          {divider: true, inset: true},
          {
            avatar: 'http://127.0.0.1:8000/images/users/default.jpg',
            title: 'Summer BBQ <span class="grey--text text--lighten-1">4</span>',
            subtitle: "<span class='grey--text text--darken-2'>to Alex, Scott, Jennifer</span> — Wish I could come, but I'm out of town this weekend."
          },
          {divider: true, inset: true},
          {
            avatar: 'http://127.0.0.1:8000/images/users/default.jpg',
            title: 'Oui oui',
            subtitle: "<span class='grey--text text--darken-2'>Sandra Adams</span> — Do you have Paris recommendations? Have you ever been?"
          },
          {divider: true, inset: true},
          {
            avatar: 'http://127.0.0.1:8000/images/users/default.jpg',
            title: 'Birthday gift',
            subtitle: "<span class='grey--text text--darken-2'>Trevor Hansen</span> — Have any ideas about what we should get Heidi for her birthday?"
          },
          {divider: true, inset: true},
          {
            avatar: 'http://127.0.0.1:8000/images/users/default.jpg',
            title: 'Recipe to try',
            subtitle: "<span class='grey--text text--darken-2'>Britta Holt</span> — We should eat this: Grate, Squash, Corn, and tomatillo Tacos."
          },
        ],
      }
    },
    computed: {
      ...mapGetters({
        analytics: 'getAnalytics'
      }),
    },
    created() {
      let vm = this;
      vm.setAnalytics();
    },
    methods: {
      setAnalytics() {
        let vm = this;
        vm.$Progress.start();
        vm.$store.dispatch('setAnalytics')
            .then(response => {
              vm.$Progress.finish();
              vm.setDashboard();
            })
            .catch(error => {
              vm.$Progress.fail();
            })
      },
      setDashboard() {
        let vm = this;
        if (vm.analytics.users) {
          vm.simpleCards[0].title = vm.analytics.users.totalUsers + ' Usuarios';
          vm.simpleCards[0].subTitle = vm.analytics.users.newUsers + ' Nuevos en la última semana';
        }
        if (vm.analytics.sales) {
          vm.simpleCards[2].title = vm.analytics.sales.totalSales + ' Ventas';
          vm.simpleCards[2].subTitle = vm.analytics.sales.newSales + ' Nuevas en la última semana';
        }
      }
    }
  }
</script>


