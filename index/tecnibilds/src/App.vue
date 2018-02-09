<style lang="scss">
</style>

<template>
    <div id="app">
        <v-app light>
            <v-toolbar dense dark>
                <v-btn icon to="/">
                    <v-avatar size="36px">
                        <img src="./assets/logo.png" alt="Tecnibilds">
                    </v-avatar>
                </v-btn>
                <v-toolbar-title v-text="appName"></v-toolbar-title>
                <v-spacer></v-spacer>
                <v-menu offset-y>
                    <v-toolbar-side-icon class="hidden-md-and-up" slot="activator"></v-toolbar-side-icon>
                    <v-list>
                        <v-list-tile v-for="menu in menus" :key="menu.title" :to="menu.to">
                            <v-list-tile-title>{{ menu.title }}</v-list-tile-title>
                        </v-list-tile>
                    </v-list>
                </v-menu>
                <v-toolbar-items class="hidden-sm-and-down" v-for="menu in menus" :key="menu.title" :to="menu.to">
                    <v-btn flat :to="menu.to">{{ menu.title }}</v-btn>
                </v-toolbar-items>
            </v-toolbar>
            <main>
                <v-content>
                    <v-slide-y-transition mode="out-in">
                        <router-view></router-view>
                    </v-slide-y-transition>
                </v-content>
            </main>
            <v-footer class="blue darken-2">
                <v-layout row wrap align-center>
                    <v-flex xs12>
                        <div class="white--text ml-3">
                            <span>{{appCompany}} &copy; 2017, </span>
                            Made with
                            <v-icon class="red--text">favorite</v-icon>
                            by <a class="white--text" href="mailto:joshua@tecnibilds.com.ve" target="_blank">Joshua
                            Martinez.</a>
                        </div>
                    </v-flex>
                </v-layout>
            </v-footer>
        </v-app>
    </div>
</template>

<script>
  import Meta from './mixins/meta'

  export default {
    mixins: [Meta],

    data () {
      return {
        appName: this.$configs.appName,
        appCompany: this.$configs.appCompany,
        appLogo: this.$configs.appLogo,
        menus: [
          {
            title: 'Servicios',
            to: '/services',
          },
          {
            title: 'Trabajo',
            to: '/work',
          },
          {
            title: 'About',
            to: '/about',
          },
          {
            title: 'Contacto',
            to: '/contact',
          },
        ]
      }
    },
    methods: {}
  }
</script>