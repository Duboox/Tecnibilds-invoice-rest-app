<style lang="scss">
    .media-click{
        cursor: pointer;
    }
</style>

<template>
    <v-content>
        <section>
            <v-container grid-list-xl>
                <v-layout row wrap align-center>
                    <v-flex md4 xs12 v-for="(item,i) in rPortfolios" :key="i">
                        <v-card class="mb-3">
                            <v-card-media @click="imageDialog(item.image, item.title)" :src="'/static/portfolios/' + item.image" height="400px" class="media-click">
                            </v-card-media>
                            <v-card-title primary-title>
                                <div>
                                    <h3 class="headline mb-0">{{ item.title }}</h3>
                                    <div>{{item.desc}}</div>
                                </div>
                            </v-card-title>
                        </v-card>
                    </v-flex>
                </v-layout>
            </v-container>
        </section>
        <image-dialog :title="dialog.title" :image="dialog.image" :active="dialog.active"></image-dialog>
    </v-content>
</template>

<script>
  import PortfoliosJson from './portfolios.json'
  import imageDialog from '../components/image-dialog.vue'
  export default {
    components: {
      'image-dialog': imageDialog,
    },
    data () {
      return {
        dialog: {
          image: '',
          title: '',
          active: false,
        },
        portfolios: PortfoliosJson,
      }
    },
    computed: {
      rPortfolios() {
        return this.portfolios.slice().reverse();
      }
    },
    methods:{
      imageDialog(image, title){
        this.dialog.image = image;
        this.dialog.title = title;
        this.dialog.active = true;
      }
    },
  }
</script>


