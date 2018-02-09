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
                <v-toolbar-items>
                    <v-btn flat to="/portfolio">Portfolio</v-btn>
                </v-toolbar-items>
            </v-toolbar>
            <main>
                <router-view></router-view>
            </main>
        </v-app>
    </div>
</template>

<script>
    export default {
        data () {
            return {
                appName: 'Tecnibilds',
            }
        }
    }
</script>